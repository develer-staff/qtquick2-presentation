import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0

import "slides"
import "components"

Item {
    id: root
    width: fullscreen ? Screen.width : 1024
    height: fullscreen ? Screen.height : 768

    focus: true

    function userRequestedNextSlide() {
        for (var i = 5; i > 0; i--) { // a kind of virtual functions
            var method = stackView.currentItem.item['userRequestedNextSlide' + i]
            if (method) {
                method()
                return
            }
        }

        stackView.currentItem.item.userRequestedNextSlide()
    }

    function userRequestedPrevSlide() {
        for (var i = 5; i > 0; i--) { // a kind of virtual functions
            var method = stackView.currentItem.item['userRequestedPrevSlide' + i]
            if (method) {
                method()
                return
            }
        }

        stackView.currentItem.item.userRequestedPrevSlide()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.userRequestedNextSlide()
        onPressAndHold: root.userRequestedPrevSlide()
    }

    Keys.onPressed: {
        if (event.key == Qt.Key_Space || event.key == Qt.Key_Right)
            root.userRequestedNextSlide()
        else if (event.key == Qt.Key_Backspace || event.key == Qt.Key_Left)
            root.userRequestedPrevSlide()
        else if (event.key == Qt.Key_Escape)
            Qt.quit()
        else
            return

        event.accepted = true
    }

    StackView {
        id: stackView
        property var pages
        property int startingIndex: 0
        property int currentIndex: 0

        anchors.fill: parent

        function next() {
            root.forceActiveFocus() // restore the root item keyboard focus (maybe stolen from a child slide)
            currentIndex += 1
            push({item: pageComponent, properties: {sourceComponent: pages[currentIndex]}})
        }

        function prev() {
            root.forceActiveFocus() // restore the root item keyboard focus (maybe stolen from a child slide)
            currentIndex -= 1
            pop()
        }

        Component {
            id: pageComponent
            Loader {
                id: page
                property int index: Stack.index

                onLoaded: {
                    if (item.totalPages !== undefined)
                        item.totalPages = stackView.pages.length
                }

                Connections {
                    target: item
                    onGotoNextSlide: stackView.next()
                    onGotoPrevSlide: stackView.prev()
                }

                Stack.onStatusChanged: {
                    if (Stack.status == Stack.Activating && item) {
                        if (item.numPage !== undefined)
                            item.numPage = Stack.index + 1

                        if (item.totalPages !== undefined)
                            item.totalPages = stackView.pages.length

                        item.state = ""
                    }
                }

            }
        }

        Component.onCompleted: {
            pages = pageContainer.data
            stackView.push({item: pageComponent, properties: {sourceComponent: pages[0]}})

            for (var i = 0; i < startingIndex; i++)
                next()
        }

        PageContainer {
            id: pageContainer
        }

        delegate: StackViewDelegate {
            function transitionFinished(properties) {
                properties.exitItem.opacity = 1
            }

            property Component pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                }
            }
        }
    }
}

