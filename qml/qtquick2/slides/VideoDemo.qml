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
        width: 650
        height: 450
        radius: 10
        color: "black"
        state: "offscreen"

        onStateChanged: {
            if (state == "offscreen" && video.playbackState == MediaPlayer.PlayingState)
                video.stop()
        }

        property var effectObject: null

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

        Component {
            id: desaturateComponent
            Desaturate {
                anchors.fill: video
                source: video
                desaturation: 1
            }
        }

        Component {
            id: blurComponent
            FastBlur {
                anchors.fill: video
                source: video
                radius: 32
            }
        }

        Item {
            id: buttonsContainer
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 42
            clip: true
            state: video.playbackState !== MediaPlayer.PlayingState ? "hidden" : ""

            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: slide.alternateBgColor }
                    GradientStop { position: 0.66; color: "gainsboro" }
                    GradientStop { position: 1.0; color: "mintcream" }
                }
                Row {
                    spacing: 10
                    anchors.centerIn: parent
                    ExclusiveGroup { id: group }
                    RadioButton {
                        text: "No effect"
                        exclusiveGroup: group
                        checked: true
                        onClicked: {
                            if (videoContainer.effectObject)
                                videoContainer.effectObject.destroy()
                        }
                    }

                    RadioButton {
                        text: "Desaturate"
                        exclusiveGroup: group
                        onClicked:  {
                            if (videoContainer.effectObject)
                                videoContainer.effectObject.destroy()

                            videoContainer.effectObject = desaturateComponent.createObject(videoContainer)
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
                    }
                }
            }

            states: State {
                name: "hidden"
                PropertyChanges { target: buttonsContainer; height: 0 }
            }
            transitions: Transition {
                NumberAnimation { target: buttonsContainer; property: "height"; duration: 200}
            }
        }
    }
    onStateChanged: videoContainer.state = state
}

