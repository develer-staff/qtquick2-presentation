import QtQuick 2.1
import "../components"


BaseSlide {
    id: slide
    title: "Qt Quick live demo"


    TextEdit {
        id: textEdit
        anchors.top: parent.top
        anchors.topMargin: 200
        anchors.left: parent.left
        anchors.leftMargin: 80
        color: "#696969"
        font.pointSize: 13
        text: "
import QtQuick 2.1

Image {
    source: '../images/better-logo.png'
    MouseArea {
        anchors.fill: parent
        drag {
            target: parent
            minimumX: 0
            maximumX: testArea.width - parent.width
            minimumY: 0
            maximumY: testArea.height - parent.height
        }
    }

    Behavior on x {
        NumberAnimation { duration: 200 }
    }
    Behavior on y {
        NumberAnimation { duration: 200 }
    }
}
"

        state: "offscreen"

        states: State {
            name: "offscreen"
            PropertyChanges { target:  textEdit; anchors.leftMargin: 0; opacity: 0; readOnly: true }
        }

        transitions: Transition {
            NumberAnimation { target: textEdit; properties: "anchors.leftMargin, opacity"; duration: 200 }
        }

    }

    CustomButton {
        anchors.bottom: testArea.top
        anchors.bottomMargin: 10
        anchors.right: testArea.right
        text: "Run!"

        MouseArea {
            anchors.fill: parent

            onClicked: {
                if (testArea.dynamicObject !== null)
                    testArea.dynamicObject.destroy()
                try {
                    testArea.dynamicObject = Qt.createQmlObject(textEdit.text, testArea)
                }
                catch (err) {
                    console.log("An error occurred")
                }
            }
        }
    }

    Rectangle {
        id: testArea
        property var dynamicObject: null

        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.top: parent.top
        anchors.topMargin: 200
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 90
        width: 400
        color: "whitesmoke"
        state: "offscreen"

        MouseArea {
            anchors.fill: parent
            enabled: testArea.dynamicObject !== null
            onClicked: {
                if (testArea.dynamicObject !== null) {
                    testArea.dynamicObject.x = Math.min(testArea.width - testArea.dynamicObject.width,
                                                        mouse.x - testArea.dynamicObject.width / 2)
                    testArea.dynamicObject.y = Math.min(testArea.height - testArea.dynamicObject.height,
                                                        mouse.y - testArea.dynamicObject.height / 2)
                }
            }
        }

        states: State {
            name: "offscreen"
            PropertyChanges { target: testArea; anchors.rightMargin: 0; opacity: 0 }
        }

        transitions: Transition {
            NumberAnimation { target: testArea; properties: "anchors.rightMargin, opacity"; duration: 200 }
        }
    }

    onStateChanged: {
        testArea.state = state
        textEdit.state = state
    }
}
