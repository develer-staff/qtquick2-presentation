import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0

import "slides"
import "components"

Item {
    width: 1024 // Screen.width
    height: 768 // Screen.height

    focus: true

    Keys.onPressed: {
        if (event.key == Qt.Key_Space)
            stackView.next()
        else if (event.key == Qt.Key_Escape || event.key == Qt.Key_Backspace)
            stackView.prev()
        else if (event.key == Qt.Key_Enter || event.key == Qt.Key_Return) {
            if (stackView.currentItem.item.advance)
                stackView.currentItem.item.advance()
        }
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
            currentIndex += 1
            push({item: pageComponent, properties: {sourceComponent: pages[currentIndex]}})
        }

        function prev() {
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

        Item {
            id: pageContainer
            Component {
                id: slide1
                Intro {
                }
            }

            Component {
                TextSlide {
                    title: "Recap - Cosa è Qt?"
                    model: ListModel {
                        ListElement {
                            text: "Qt è un framework cross platform, con cui potete scrivere il codice un'unica volta ed effettuare il deploy su vari sistemi desktop ed embedded."
                            indentLevel: 0
                            showDot: true
                        }

                        ListElement {
                            text: "Qt è anche una libreria, mettendo a disposizione un ampio set di componenti già pronti all'uso."
                            indentLevel: 0
                            showDot: true
                        }

                        ListElement {
                            text: "Qt è particolarmente adatto per lo sviluppo su dispositivi embedded, e gira su ogni Linux con un compilatore C++ “decente”."
                            indentLevel: 0
                            showDot: true
                        }
                    }
                }
            }

            Component {
                TextSlide {
                    title: "Recap - Cosa è Qt?"
                    model: ListModel {
                        ListElement {
                            text: "Qt è scritto in C++, tuttavia fa uso estensivo di un generatore di codice chiamato moc per implementare alcune funzionalità di alto livello non previste dal linguaggio."
                            indentLevel: 0
                            showDot: true
                        }

                        ListElement {
                            text: "E' possibile estendere le applicazioni scritte in C++ tramite embedding di linguaggi di scripting (basati su Javascript o Python)."
                            indentLevel: 0
                            showDot: true
                        }

                        ListElement {
                            text: "Al fine di facilitare lo sviluppo le librerie sono rilasciate assieme a Qt Creator, un IDE potente ma leggero IDE per lo sviluppo e design delle applicazioni."
                            indentLevel: 0
                            showDot: true
                        }
                    }
                }
            }

            Component {
                TextSlide {
                    title: "Recap - Cosa è Qt?"
                    spacing: 20

                    model: ListModel {
                        ListElement {
                            text: "Qt mette a disposizione del programmatore un gran numero di funzionalità pronte all'uso:"
                            indentLevel: 0
                            showDot: false
                        }

                        ListElement {
                            text: "Internazionalizzazione e supporto unicode"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Multi-threading e multi-processing"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Networking e meccanismi di IPC"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Browser (WebKit)"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Multimedia"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Xml e database"
                            indentLevel: 1
                            showDot: true
                        }
                    }
                }
            }

            Component {
                TextSlide {
                    title: "Le licenze di Qt"
                    model: ListModel {
                        ListElement {
                            text: "Qt è disponibile con due licenze:"
                            indentLevel: 0
                            showDot: false
                        }

                        ListElement {
                            text: "Open source (LGPL v. 2.1) → permette di sviluppare applicazioni con linking dinamico alle Qt senza dover rilasciare il codice o pagare costi di licenza."
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Commerciale → per sviluppatore e con costo dipendente dal numero di piattaforme “target”, permette di usare in piena libertà Qt ed è comprensivo di supporto."
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Per approfondire: http://qt.digia.com/licensing"
                            indentLevel: 0
                            showDot: false
                        }
                    }
                }
            }

            Component {
                QtPlatforms {
                }
            }

            Component {
                UsersSlide {
                }
            }

            Component {
                TextSlide {
                    title: "Qt Quick"

                    model: ListModel {
                        ListElement {
                            text: "Qt Quick è un insieme di tecnologie:"
                            indentLevel: 0
                            showDot: false
                        }
                        ListElement {
                            text: "Il linguaggio dichiarativo, chiamato Qml ed estensione di JavaScript."
                            indentLevel: 1
                            showDot: true
                        }
                        ListElement {
                            text: "Il runtime, che permette l'accesso a funzionalità e strutture dati di Qt/C++."
                            indentLevel: 1
                            showDot: true
                        }
                        ListElement {
                            text: "QtCreator, che integra un editor avanzato di Qml, un designer grafico di UI e un debugger/profiler."
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Qt Quick velocizza la realizzazione di GUI ed è quindi molto indicato per il fast prototyping di applicazioni."
                            indentLevel: 0
                            showDot: false
                        }
                    }
                }
            }

            Component {
                LiveDemo {
                }
            }

            Component {
                TextSlide {
                    title: "Qt Quick facilities"

                    model: ListModel {
                        ListElement {
                            text: "Integrazione con database Sqlite"
                            indentLevel: 0
                            showDot: true
                        }
                        ListElement {
                            text: "WebKit e funzionalità multimediali avanzate"
                            indentLevel: 0
                            showDot: true
                        }
                        ListElement {
                            text: "Alta integrazione con il mondo Qt"
                            indentLevel: 0
                            showDot: true
                        }
                    }
                }
            }

            Component {
                BaseSlide {
                    id: slide
                    title: "Qt Quick v.2"

                    Text {
                        id: text
                        font.pointSize: 18
                        text: "Con Qt5/Qt Quick2 è stato riscritto buona parte dello stack grafico per ottimizzare le prestazioni e sfruttare appieno l'accelerazione hardware."
                        wrapMode: Text.WordWrap
                        color: slide.textColor
                        anchors.top: slide._topRectItem.bottom
                        anchors.topMargin: 180
                        anchors.left: parent.left
                        anchors.leftMargin: 100
                        anchors.right: parent.right
                        anchors.rightMargin: 100
                        z: 1
                    }

                    Image {
                        anchors.bottom: slide._bottomRectItem.top
                        anchors.bottomMargin: -40
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "images/v1_vs_v2.png"
                        scale: .8
                    }
                }
            }

            Component {
                BaseSlide {
                    id: slide
                    title: "Qt Quick v.2"

                    Text {
                        id: text
                        font.pointSize: 18
                        text: "Grazie al lavoro di riscrittura dello stack grafico e all'adozione di un engine Javascript più efficiente le prestazioni in alcuni casi risultano più che raddoppiate!"
                        wrapMode: Text.WordWrap
                        color: slide.textColor
                        anchors.top: slide._topRectItem.bottom
                        anchors.topMargin: 180
                        anchors.left: parent.left
                        anchors.leftMargin: 100
                        anchors.right: parent.right
                        anchors.rightMargin: 100
                        z: 1
                    }

                    Image {
                        anchors.top: text.bottom
                        anchors.topMargin: 50
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "images/benchmarks.png"
                    }
                }
            }

            Component {
                VideoDemo {
                }
            }

            Component {
                BaseSlide {
                    title: "Qt Quick: effetti grafici"
                }
            }

            Component {
                BaseSlide {
                    title: "Qt Quick: effetti grafici"
                }
            }

            Component {
                BaseSlide {
                    title: "Qt Quick controls"
                }
            }

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

