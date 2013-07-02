import QtQuick 2.1

Rectangle {
    id: block
    property alias title: title.text
    property alias itemsModel: repeater.model
    property Gradient rectanglesGradient

    Text {
        id: title
        color: slide.titleColor
        font.pointSize: 20
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: rowDesktop.left
        anchors.leftMargin: 10
    }

    Grid {
        id: rowDesktop
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        rows: itemsModel.count / 3

        Repeater {
            id: repeater
            Rectangle {
                border.color: "#c0c0c0"
                border.width: 1
                width: 120
                height: 70
                gradient: block.rectanglesGradient

                Text {
                    color: "#696969"
                    font.pointSize: 14
                    text: model.text
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
