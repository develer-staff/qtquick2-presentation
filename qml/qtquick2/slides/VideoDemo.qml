import QtQuick 2.1
import QtMultimedia 5.0
import QtQuick.Controls 1.0
import QtGraphicalEffects 1.0

import "../components"


BaseSlide {
    id: slide
    title: "Qt Quick: funzionalità multimediali"

    Rectangle {
        id: videoContainer
        property var effectObject: null
        property alias playbackState: video.playbackState

        width: 650
        height: 450
        color: "black"
        state: "offscreen"

        onStateChanged: {
            if (state == "offscreen" && video.playbackState == MediaPlayer.PlayingState)
                video.stop()
        }

        anchors.top: slide._titleItem.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            z: 1
            color: "mintcream"
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 60
            text: Math.round(video.position / 1000) + " / " + Math.round(video.duration / 1000)
            visible: video.playbackState == MediaPlayer.PlayingState || video.playbackState == MediaPlayer.PausedState
        }

        Video {
            id: video
            anchors.fill: parent
            source: "../rollin_safari.flv"
            autoLoad: true
        }

        MouseArea {
            id: videoMouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        }
    }

    Image {
        z: 2
        source: "../images/settings.png"
        width: 32
        height: 32
        anchors.bottom: videoContainer.bottom
        anchors.bottomMargin: 5
        anchors.left: videoContainer.left
        anchors.leftMargin: 5
        opacity: videoContainer.playbackState !== MediaPlayer.StoppedState ? 1 : 0

        Behavior on opacity {
            NumberAnimation { duration: 100}
        }

        MouseArea {
            anchors.fill: parent
            onClicked: buttonsContainer.state = buttonsContainer.state == "hidden" ? "" : "hidden"
        }
    }

    Item {
        id: buttonsContainer
        anchors.bottom: videoContainer.bottom
        anchors.left: videoContainer.left
        height: 210
        width: 180
        clip: true
        state: "hidden"
        z: 1

        Rectangle {
            id: rectBg
            anchors.fill: parent
            color: "black"
            opacity: 0.3
            MouseArea {
                anchors.fill: parent
                // blocks mouse events
            }
        }

        Column {
            spacing: 10

            Text {
                font.pointSize: 13
                text: "Effetto applicato"
            }

            anchors.top: rectBg.top
            anchors.topMargin: 10
            anchors.horizontalCenter: rectBg.horizontalCenter
            ExclusiveGroup { id: group }
            RadioButton {
                text: "Nessun effetto"
                exclusiveGroup: group
                checked: true
                onClicked: {
                    if (videoContainer.effectObject)
                        videoContainer.effectObject.destroy()
                }
            }

            RadioButton {
                text: "Black & white"
                exclusiveGroup: group
                onClicked:  {
                    if (videoContainer.effectObject)
                        videoContainer.effectObject.destroy()

                    videoContainer.effectObject = desaturateComponent.createObject(videoContainer)
                }

                Component {
                    id: desaturateComponent
                    Desaturate {
                        anchors.fill: video
                        source: video
                        desaturation: 1
                    }
                }
            }

            RadioButton {
                text: "Blur"
                exclusiveGroup: group
                onClicked:  {
                    if (videoContainer.effectObject)
                        videoContainer.effectObject.destroy()

                    videoContainer.effectObject = blurComponent.createObject(videoContainer)
                }

                Component {
                    id: blurComponent
                    FastBlur {
                        anchors.fill: video
                        source: video
                        radius: 32
                    }
                }
            }
        }

        states: State {
            name: "hidden"
            PropertyChanges { target: buttonsContainer; height: 0; width: 0 }
        }

        transitions: Transition {
            NumberAnimation { target: buttonsContainer; properties: "height, width"; duration: 200}
        }
    }


    onStateChanged: videoContainer.state = state
}

