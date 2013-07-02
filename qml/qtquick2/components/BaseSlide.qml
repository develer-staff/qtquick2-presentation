import QtQuick 2.1

EmptySlide {
    id: slide
    property int numPage
    property int totalPages
    property alias title: title.text

    property alias _titleItem: title
    property alias _topRectItem: topRect
    property alias _bottomRectItem: bottomRect


    Rectangle {
        id: topRect
        height: 30
        width: parent.width
        color: slide.alternateBgColor
    }

    Rectangle {
        id: bottomRect
        anchors.bottom: parent.bottom
        height: 80
        width: parent.width
        color: slide.alternateBgColor

        Image {
            id: logo
            source: "../images/develer-logo-2011-perslide.png"
            width: 100
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            color: "#696969"
            font.pointSize: 16
            text: "Gianni Valdambrini - aleister@develer.com"
            anchors.verticalCenter: logo.verticalCenter
            anchors.left: logo.right
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenterOffset: 3
        }
    }

    Text {
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.bottom: bottomRect.top
        anchors.bottomMargin: 10
        font.pointSize: 16
        color: "#696969"
        text: numPage + " / " + totalPages
    }

    Text {
        id: title
        color: slide.titleColor
        font.pointSize: 24
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.left: parent.left
        anchors.leftMargin: 150
    }

    states: State {
        name: "offscreen"
        PropertyChanges { target: topRect; height: 0 }
        PropertyChanges { target: bottomRect; height: 0 }
    }

    transitions: transition
    offscreenTransition: transition

    Transition {
        id: transition
        from: ""
        to: "offscreen"
        reversible: true
        NumberAnimation { targets: [topRect, bottomRect]; property: "height"; duration: 250}
    }
}
