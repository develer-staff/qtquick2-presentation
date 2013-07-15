import QtQuick 2.1
import "../components"

EmptySlide {
    id: slide


    function userRequestedPrevSlide1() {
        // Avoid going to the void
    }

    Rectangle {
        id: leftRect
        color: slide.alternateBgColor
        width: parent.width / 3
        height: parent.height
    }

    Image {
        id: logoDeveler
        anchors.horizontalCenter: leftRect.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height / 5
        source: "../images/develer-logo.png"
        width: 160
        fillMode: Image.PreserveAspectFit
        smooth: true
    }

    Item {
        anchors {
            left: leftRect.right
            leftMargin: 50
            right: parent.right
            top: parent.top
            topMargin: parent.height / 5
            bottom: parent.bottom
            bottomMargin: 40
        }

        Column {
            id: columnAuthor
            spacing: 10
            anchors.top: parent.top

            Text {
                id: talkAuthor
                color: slide.titleColor
                font.pointSize: 24
                text: "Gianni Valdambrini"

            }
            Text {
                id: talkAuthor2
                color: slide.disabledColor
                font.pointSize: 16
                text: qsTr("Qt Certified Specialist")
            }
        }

        Text {
            id: talkTitle
            color: slide.textColor
            font.pointSize: 24
            text: qsTr("Qt Quick2: the evolution")
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -10
        }

        Text {
            id: talkRepository
            anchors.top: talkTitle.bottom
            anchors.topMargin: 10
            color: slide.disabledColor
            font.pointSize: 16
            text: "[https://github.com/gvaldambrini/qtquick2-bem]"
        }

        Text {
            id: talkDate
            color: slide.disabledColor
            font.pointSize: 20
            text: qsTr("Firenze, 8 Luglio 2013")

            anchors.bottom: parent.bottom
        }
    }

    states: [
        State {
            name: "offscreen"
            PropertyChanges { target: talkAuthor; font.pointSize: 60; opacity: 0 }
            PropertyChanges { target: talkAuthor2; font.pointSize: 40; opacity: 0 }

            AnchorChanges { target: columnAuthor; anchors.top: undefined; anchors.verticalCenter: parent.verticalCenter; }

            PropertyChanges { target: talkTitle; font.pointSize: 70; opacity: 0 }
            PropertyChanges { target: talkRepository; font.pointSize: 40; opacity: 0 }

            PropertyChanges { target: talkDate; font.pointSize: 40; opacity: 0 }
        }
    ]

    Transition {
        id: transition
        from: ""
        to: "offscreen"

        SequentialAnimation {
            ParallelAnimation {
                NumberAnimation { targets: [talkAuthor, talkAuthor2]; properties: "font.pointSize, opacity"; duration: 250}
                AnchorAnimation { targets: columnAuthor; duration: 250}
            }
            NumberAnimation { targets: [talkTitle, talkRepository]; properties: "font.pointSize, opacity"; duration: 250}

            NumberAnimation { target: talkDate; properties: "font.pointSize, opacity"; duration: 250}
        }
    }

    offscreenTransition: transition
    transitions: transition
}

