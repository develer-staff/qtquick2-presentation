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
            title: "Per concludere.."

            model: ListModel {
                ListElement {
                    text: "Qt Quick è una tecnologia che, seppur con con qualche difetto di gioventù, è molto potente e permette di realizzare applicazioni complesse a grande velocità."
                    indentLevel: 0
                    showDot: true
                }

                ListElement {
                    text: "Grazie alla base di codice ereditata da Qt, offre un gran numero di funzionalità combinate con ottime performance."
                    indentLevel: 0
                    showDot: true
                }

                ListElement {
                    text: "Dove le prestazioni di Qml / Javascript non siano sufficienti è possibile scrivere la logica applicativa o i componenti grafici in C++."
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Qt Quick è oggi un'ottima scelta anche su Desktop e presto lo sarà anche per iOS/Android → Qt Everywhere"
                    indentLevel: 0
                    showDot: true
                }
            }

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
