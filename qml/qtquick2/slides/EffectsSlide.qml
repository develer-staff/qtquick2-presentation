import QtQuick 2.1

import "../components"


BaseSlide {
    id: slide

    // The curtain effect and the related code is taken from Qt5 cinematic experience.
    QtObject {
        id: priv
        property bool poleOut: false
        // How curly the curtain is when opened
        property int endCurly: 80
        // 0 = pole in, 1 = pole out
        property real polePosition: 0
        property bool showingStarted: false

        property int textAreaHeight: slide.height - slide._topRectItem.height - slide._bottomRectItem.height - 50
    }

    function show() {
        priv.showingStarted = true;
        hideCurtainAnimation.stop();
        hidePoleAnimation.stop();
        if (priv.poleOut) {
            showCurtainAnimation.restart();
        } else {
            showPoleAnimation.restart();
        }
    }

    function hide() {
        priv.showingStarted = false;
        showCurtainAnimation.stop();
        showPoleAnimation.stop();
        if (priv.poleOut) {
            hideCurtainAnimation.restart();
        } else {
            hidePoleAnimation.restart();
        }
    }

    // Pole show/hide animations
    SequentialAnimation {
        id: showPoleAnimation
        NumberAnimation { target: priv; property: "polePosition"; to: 1; duration: 600; easing.type: Easing.InOutQuad }
        PropertyAction { target: priv; property: "poleOut"; value: true }
        ScriptAction { script: showCurtainAnimation.restart(); }
    }
    SequentialAnimation {
        id: hidePoleAnimation
        PropertyAction { target: priv; property: "poleOut"; value: false }
        NumberAnimation { target: priv; property: "polePosition"; to: 0; duration: 600; easing.type: Easing.InOutQuad }
    }

    // Curtain show/hide animations
    SequentialAnimation {
        id: showCurtainAnimation
        NumberAnimation { target: curtainEffect; property: "rightHeight"; to: priv.textAreaHeight -8; duration: 1200; easing.type: Easing.OutBack }
    }
    SequentialAnimation {
        id: hideCurtainAnimation
        NumberAnimation { target: curtainEffect; property: "rightHeight"; to: 0; duration: 600; easing.type: Easing.OutCirc }
        ScriptAction { script: hidePoleAnimation.restart(); }
    }

    Item {
        id: viewItem
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 100
        height: priv.textAreaHeight + priv.endCurly - 16
        anchors.top: parent.top
        anchors.topMargin: 100

        Rectangle {
            id: backgroundItem
            anchors.fill: parent

            border.color: slide.disabledColor
            border.width: 3
            gradient: Gradient {
                GradientStop { position: 0.0; color: "ghostwhite" }
                GradientStop { position: 0.33; color: "gainsboro" }
                GradientStop { position: 1.0; color: "gray" }
            }
            opacity: 0.5
        }

        Item {
            anchors.fill: backgroundItem
            anchors.margins: 40

            Text {
                id: title
                anchors.top: parent.top
                anchors.topMargin: 20
                color: slide.titleColor
                font.pointSize: 24
                text: "Particles / GraphicalEffects"
            }

            ListView {
                id: listView
                anchors.left: title.left
                anchors.top: title.bottom
                anchors.topMargin: 50
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                interactive: false
                spacing: 30

                model: ListModel {
                    ListElement {
                        text: "Il modulo Particles implementa un completo sistema particellare, indispensabile per la realizzazione di videogiochi ma utile anche per la realizzazione di effetti complessi come la nebbia."
                        indentLevel: 0
                        showDot: true
                    }

                    ListElement {
                        text: "Il modulo GraphicalEffects racchiude invece al suo interno numerosi effetti pronti all'uso e realizzati tramite gli shaders come:"
                        indentLevel: 0
                        showDot: true
                    }

                    ListElement {
                        text: "blur"
                        indentLevel: 1
                        showDot: true
                    }

                    ListElement {
                        text: "brightness & contrast"
                        indentLevel: 1
                        showDot: true
                    }

                    ListElement {
                        text: "drop shadow"
                        indentLevel: 1
                        showDot: true
                    }

                    ListElement {
                        text: "glow"
                        indentLevel: 1
                        showDot: true
                    }
                }

                delegate: Item {
                    id: delegateItem
                    height: delegateText.height
                    width: listView.width
                    property bool showDot: model.showDot !== undefined ? model.showDot : true
                    property int indentLevel: model.indentLevel !== undefined ? model.indentLevel : 0
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
                }
            }
        }
    }

    CurtainEffect {
        id: curtainEffect
        anchors.fill: viewItem
        source: ShaderEffectSource { sourceItem: viewItem; hideSource: true }
        rightHeight: 0
        leftHeight: rightHeight
        Behavior on leftHeight {
            SpringAnimation { spring: .4; damping: .05; mass: .5 }
        }
        // Hide smoothly when curtain closes
        opacity: 0.004 * rightHeight
    }

    onStateChanged: {
        if (state == "offscreen")
            hide()
        else
            show()
    }
}
