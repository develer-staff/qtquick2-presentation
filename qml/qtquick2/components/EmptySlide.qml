import QtQuick 2.1

Rectangle {
    id: slide
    signal gotoNextSlide()
    signal gotoPrevSlide()

    property Transition offscreenTransition

    property color textColor: "#004586"
    property color titleColor: "#FF950E"
    property color disabledColor: "#C0C0C0"
    property color alternateBgColor: "#ECECEC"

    state: "offscreen"


    QtObject {
        id: privateProps
        property int exitDirection: noUserRequest
        property int noUserRequest: -1
        property int requestNextSlide: 1
        property int requestPrevSlide: 2
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            privateProps.exitDirection = privateProps.requestNextSlide
            slide.state = "offscreen"

            if (!offscreenTransition)
                gotoNextSlide()
        }

        onPressAndHold: {
            privateProps.exitDirection = privateProps.requestPrevSlide
            slide.state = "offscreen"

            if (!offscreenTransition)
                gotoPrevSlide()
        }
    }

    Connections {
        target: offscreenTransition
        onRunningChanged: {
            if (!offscreenTransition.running && privateProps.exitDirection != privateProps.noUserRequest) {
                if (privateProps.exitDirection == privateProps.requestNextSlide)
                    gotoNextSlide()
                else
                    gotoPrevSlide()
                privateProps.exitDirection = privateProps.noUserRequest
            }
        }
    }
}

