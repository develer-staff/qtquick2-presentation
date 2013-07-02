import QtQuick 2.1
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
        Text {
            id: talkAuthor
            color: slide.titleColor
            font.pointSize: 26
            text: "Gianni Valdambrini"
            anchors.top: parent.top
        }
        Text {
            id: talkAuthor2
            anchors.top: talkAuthor.bottom
            color: slide.disabledColor
            font.pointSize: 16
            text: "Qt Certified Specialist"
        }

        Text {
            id: talkTitle
            color: slide.textColor
            font.pointSize: 26
            text: "Qt Quick2: the evolution"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -10
        }

        Text {
            id: talkDate
            color: slide.disabledColor
            font.pointSize: 20
            text: "Firenze, 8 Luglio 2013"

            anchors.bottom: parent.bottom
        }
    }

    states: [
        State {
            name: "offscreen"
            PropertyChanges { target: talkAuthor; font.pointSize: 60; opacity: 0 }
            PropertyChanges { target: talkAuthor2; font.pointSize: 40; opacity: 0 }

            AnchorChanges { target: talkAuthor; anchors.top: undefined; anchors.verticalCenter: parent.verticalCenter; }
            AnchorChanges { target: talkAuthor2; anchors.top: undefined; anchors.verticalCenter: parent.verticalCenter}

            PropertyChanges { target: talkTitle; font.pointSize: 70; opacity: 0 }
            PropertyChanges { target: talkDate; font.pointSize: 40; opacity: 0 }
        }
    ]

    Transition {
        id: transition
        from: ""
        to: "offscreen"
//        reversible: true

        SequentialAnimation {
            ParallelAnimation {
                NumberAnimation { targets: [talkAuthor, talkAuthor2]; properties: "font.pointSize, opacity"; duration: 250}
                AnchorAnimation { targets: [talkAuthor, talkAuthor2]; duration: 250}
            }
            NumberAnimation { target: talkTitle; properties: "font.pointSize, opacity"; duration: 250}
            NumberAnimation { target: talkDate; properties: "font.pointSize, opacity"; duration: 250}
        }
    }

    offscreenTransition: transition
    transitions: transition
}

