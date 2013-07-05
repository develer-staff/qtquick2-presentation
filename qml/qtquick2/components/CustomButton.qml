import QtQuick 2.0


Rectangle {
    id: button

    property alias text:textItem.text
    signal clicked
    width: 120
    height: 40
    border.color: "#c0c0c0"
    border.width: 1
    gradient: Gradient {
        GradientStop { position: 0.0; color: "ghostwhite" }
        GradientStop { position: 0.33; color: "gainsboro" }
        GradientStop { position: 1.0; color: "#c0c0c0" }
    }
    radius: 20

    Text {
        id: textItem
        color: "#696969"
        font.pointSize: 14
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: button.clicked()
    }
}
