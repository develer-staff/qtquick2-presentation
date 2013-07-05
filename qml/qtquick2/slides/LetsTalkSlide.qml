import QtQuick 2.0

import "../components"

EmptySlide {
    id: slide

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

    Text {
        id: title
        color: slide.titleColor
        font.pointSize: 24
        text: "Let's talk"

        anchors {
            left: leftRect.right
            leftMargin: 50
            right: parent.right
            top: parent.top
            topMargin: parent.height / 5
        }
    }

    Column {
        id: office

        anchors.top: title.bottom
        anchors.topMargin: 100
        anchors.left: title.left
        spacing: 10

        Text {
            color: slide.disabledColor
            font.pointSize: 18
            text: "Office"
        }

        Text {
            color: slide.textColor
            font.pointSize: 18
            text: "+39 055 3984627"
        }
    }

    Column {
        id: email

        anchors.top: office.bottom
        anchors.topMargin: 20
        anchors.left: office.left
        spacing: 10

        Text {
            color: slide.disabledColor
            font.pointSize: 18
            text: "Email"
        }

        Text {
            color: slide.textColor
            font.pointSize: 18
            text: "aleister@develer.com"
        }
    }

    Column {
        id: web

        anchors.top: email.bottom
        anchors.topMargin: 20
        anchors.left: email.left
        spacing: 10

        Text {
            color: slide.disabledColor
            font.pointSize: 18
            text: "Web"
        }

        Text {
            color: slide.textColor
            font.pointSize: 18
            text: "www.develer.com"
        }
    }
}
