import QtQuick 2.1
import "../components"

BaseSlide {
    id: slide
    property var model
    property alias spacing: listView.spacing

    function _fillModel() {
        if (slide.state == "offscreen") {
            listView.model.clear()
            return
        }

        for (var i = 0; i < model.count; i++)
            listView.model.append(model.get(i))
    }

    ListView {
        id: listView
        anchors.left: _titleItem.left
        anchors.leftMargin: 20
        anchors.top: _titleItem.bottom
        anchors.topMargin: 40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 120
        interactive: false
        spacing: 30

        model: ListModel {}

        delegate: Item {
            id: delegateItem
            height: delegateText.height
            width: listView.width
            state: "hidden"
            property bool showDot: model.showDot !== undefined ? model.showDot : true
            property bool indentLevel: model.indentLevel !== undefined ? model.indentLevel : 0
            property int indent: 30

            Rectangle {
                id: delegateDot
                color: slide.textColor
                width: 5
                height: 5
                anchors.top: delegateText.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: delegateItem.indentLevel * delegateItem.indent
                visible: delegateItem.showDot
            }

            Text {
                id: delegateText
                font.pointSize: 18
                text: model.text
                wrapMode: Text.WordWrap
                color: slide.textColor
                anchors.left: delegateItem.showDot ? delegateDot.right : parent.left
                anchors.leftMargin: 10 + (delegateItem.showDot ? 0 : delegateItem.indentLevel * delegateItem.indent)
                anchors.right: parent.right
                anchors.top: parent.top
            }

            states: State {
                name: "hidden"
                PropertyChanges { target: delegateItem; scale: 0.9 }
                PropertyChanges { target: delegateText; anchors.topMargin: 30 }
                PropertyChanges { target: delegateItem; opacity: 0 }
            }

            transitions: Transition {
                PropertyAnimation { target: delegateItem; property: "opacity"; duration: 200 }
                PropertyAnimation { target: delegateText; property: "anchors.topMargin"; duration: 200 }

                SequentialAnimation {
                    PauseAnimation { duration: 100}
                    PropertyAnimation { target: delegateItem; property: "scale"; duration: 200 }
                }
            }
        }

        add: Transition {
            id: addTransition
            SequentialAnimation {
                PauseAnimation { duration: addTransition.ViewTransition.index * 200 }
                PropertyAction { property: "state"; value: "" }
            }
        }
    }

    transitions: transition

    Transition {
        id: transition
        from: "offscreen"
        to: ""
        reversible: true

        ScriptAction { script: slide._fillModel()}
        NumberAnimation { targets: [_topRectItem, _bottomRectItem]; property: "height"; duration: 200 }
    }


    offscreenTransition: transition
}
