import QtQuick 2.1
import "../components"

EmptySlide {
    id: slide
    property int numPage
    property int totalPages

    function userRequestedNextSlide1() {
        if (!flipable.flipped)
            flipable.flipped = true
        else
            userRequestedNextSlide()
    }

    Flipable {
        id: flipable
        property bool flipped: false

        anchors.fill: parent

        front: Rectangle {
            property alias imageScale: image.scale
            color: "black"
            anchors.fill: parent
            Image {
                id: image
                source: "../images/thats-all-folks.jpg"
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
            }
        }
        back: TextSlide {
            anchors.fill: parent
            numPage: slide.numPage
            totalPages: slide.totalPages
            state: slide.state
            title: qsTr("To summarize..")

            model: [
                {
                    'text': qsTr("Qt Quick is a tecnology which is very powerful despite some defect of youth and allows to create complex applications very quickly."),
                    'indentLevel': 0,
                    'showDot': true
                },

                {
                    'text': qsTr("Thanks to the codebase inherited from Qt, it offers many functionalities combined with great performance."),
                    'indentLevel': 0,
                    'showDot': true
                },

                {
                    'text': qsTr("Qt and Qt Quick are open source and with a very active community so it is easy to find answers in case of problems."),
                    'indentLevel': 0,
                    'showDot': true
                },

                {
                    'text': qsTr("Qt Quick is a great choice for Desktop and mobile platforms → Qt Everywhere"),
                    'indentLevel': 0,
                    'showDot': true
                }
            ]

            onGotoNextSlide: slide.gotoNextSlide()
            onGotoPrevSlide: slide.gotoPrevSlide()
        }

        transform: Rotation {
            id: rotation
            origin.x: flipable.width / 2
            origin.y: flipable.height / 2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: flipable.flipped ? 180 : 0

            Behavior on angle {
                 NumberAnimation { duration: 1000 }
            }
        }

        state: "offscreen"
        states: State {
            name: "offscreen"
            PropertyChanges { target: flipable.front; imageScale: .01 }
        }

        transitions: Transition {
            NumberAnimation { target: flipable.front; property: "imageScale"; duration: 400 }
        }
    }

    onStateChanged: flipable.state = state

}
