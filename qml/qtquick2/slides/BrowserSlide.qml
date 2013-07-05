import QtQuick 2.0
import QtWebKit 3.0

import "../components"


BaseSlide {
    id: slide
    title: "Webkit"

    Row {
        id: inputArea
        anchors.right: browserRect.right
        anchors.bottom: browserRect.top
        anchors.bottomMargin: 10
        spacing: 5

        Rectangle {
            radius: 5
            border.width: 1
            border.color: slide.disabledColor
            height: 30
            width: textInput.width

            TextInput {
                id: textInput
                width: 300
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                text: "http://www.qt-project.org"
                readOnly: inputArea.state !== ""
            }
        }

        CustomButton {
            id: button
            width: 80
            height: 30
            text: "Go!"
            onClicked: browserRect.url = textInput.text
        }
    }

    Rectangle {
        id: browserRect
        property alias url: webView.url
        width: 650
        height: 450
        anchors.top: slide._titleItem.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 1
        border.color: slide.disabledColor

        WebView {
            id: webView
            visible: browserRect.state == "" && loadProgress == 100
            anchors.fill: parent
            anchors.margins: 1
            clip: true
        }
    }

    onStateChanged: {
        browserRect.state = state
        inputArea.state = state
    }
}

