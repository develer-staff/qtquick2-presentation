import QtQuick 2.1
import "../components"


BaseSlide {
    id: slide
    title: qsTr("Qt: supported platforms")

    BlockRectangles {
        id: rectDesktop
        border.color: slide.alternateBgColor
        border.width: 2

        gradient: Gradient {
            GradientStop { position: 0.0; color: slide.alternateBgColor }
            GradientStop { position: 0.66; color: "gainsboro" }
            GradientStop { position: 1.0; color: "mintcream" }
        }

        rectanglesGradient: Gradient {
            GradientStop { position: 0.0; color: "ghostwhite" }
            GradientStop { position: 0.33; color: "gainsboro" }
            GradientStop { position: 1.0; color: "#c0c0c0" }
        }

        state: "offscreen"

        width: 400
        height: 160

        anchors.top: parent.top
        anchors.topMargin: 250
        anchors.left: parent.left
        anchors.leftMargin: (slide.width / 2 - width) * .66

        title: qsTr("Desktop")

        itemsModel: [
            { 'text': qsTr("Windows") },
            { 'text': qsTr("Linux/X11") },
            { 'text': qsTr("Mac OS X") }
        ]

        states: State {
            name: "offscreen"
            PropertyChanges { target: rectDesktop; anchors.leftMargin: 0; opacity: 0 }
        }

        transitions: Transition {
            NumberAnimation { target: rectDesktop; properties: "anchors.leftMargin, opacity"; duration: 200 }
        }
    }

    BlockRectangles {
        id: rectEmbedded
        border.color: slide.alternateBgColor
        border.width: 2

        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.lighter("darkseagreen") }
            GradientStop { position: 0.66; color: "mediumaquamarine" }
            GradientStop { position: 1.0; color: "mediumturquoise" }
        }

        rectanglesGradient: Gradient {
            GradientStop { position: 0.0; color: "lightcyan" }
            GradientStop { position: 0.33; color: "paleturquoise" }
            GradientStop { position: 1.0; color: "powderblue" }
        }

        width: 400
        height: 250

        anchors.top: parent.top
        anchors.topMargin: 250
        anchors.right: parent.right
        anchors.rightMargin: (slide.width / 2 - width) * .66

        title: qsTr("Embedded")
        state: "offscreen"

        itemsModel: [
             { 'text': qsTr("Embedded Linux") },
             { 'text': qsTr("Windows Embedded") },
             { 'text': qsTr("BlackBerry 10") },
             { 'text': qsTr("iOS") },
             { 'text': qsTr("Android") },
             { 'text': qsTr("Windows 8*") }
        ]

        states: State {
            name: "offscreen"
            PropertyChanges { target: rectEmbedded; anchors.rightMargin: 0; opacity: 0 }
        }

        transitions: Transition {
            NumberAnimation { target: rectEmbedded; properties: "anchors.rightMargin, opacity"; duration: 200 }
        }
    }


    Text {
        id: text
        font.pointSize: 18
        text: qsTr("In addition there are official ports for real time operating systems like QNX or VxWorks while other ports are mantained by the community.")
        color: slide.textColor
        anchors.top: parent.top
        anchors.topMargin: 550
        anchors.left: parent.left
        anchors.leftMargin: 100
        anchors.right: parent.right
        anchors.rightMargin: 100
        wrapMode: Text.WordWrap

        state: "offscreen"
        states: State {
            name: "offscreen"
            PropertyChanges { target: text ;anchors.topMargin: 600; opacity: 0 }
        }

        transitions: Transition {
            NumberAnimation { target: text; properties: "anchors.topMargin, opacity"; duration: 200 }
        }
    }

    onStateChanged: {
        rectDesktop.state = state
        rectEmbedded.state = state
        text.state = state
    }
}
