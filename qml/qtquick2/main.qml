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
        if (event.key == Qt.Key_Space || event.key == Qt.Key_Right)
            stackView.next()
        else if (event.key == Qt.Key_Escape || event.key == Qt.Key_Backspace || event.key == Qt.Key_Left)
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
                    title: "Limitazioni di Qt"
                    model: ListModel {
                        ListElement {
                            text: "Quanto codice serve per...?"
                            indentLevel: 0
                            showDot: false
                        }

                        ListElement {
                            text: "Modificare la posizione di alcuni elementi"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Animare gli elementi della gui o integrare transizioni fra pagine"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Cambiare l'aspetto di una o più finestre a seconda di uno stato logico"
                            indentLevel: 1
                            showDot: true
                        }
                    }
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
                            text: "Il linguaggio dichiarativo, chiamato Qml ed estensione di Javascript."
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
                    }
                }
            }

            Component {
                TextSlide {
                    title: "Qt Quick"

                    model: ListModel {
                        ListElement {
                            text: "Qt Quick velocizza la realizzazione di GUI ed è quindi molto indicato per il fast prototyping di applicazioni:"
                            indentLevel: 0
                            showDot: true
                        }

                        ListElement {
                            text: "La sua natura dichiarativa (come HTML e CSS) rende il linguaggio più familiare ai non programmatori (designer in primis)"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Alcune sue caratteristiche (come i property bindings e la network transparency) rendono la logica dell'applicazione più lineare e semplice."
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "E' realizzato \“sopra\” le Qt in modo da sfruttarne i pregi ed ereditarne le funzionalità (es: accelerazione hardware, internazionalizzazione, risorse, ecc..)."
                            indentLevel: 0
                            showDot: true
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
                    title: "Qt Quick e l'embedded"

                    model: ListModel {
                        ListElement {
                            text: "Qt Quick è stato originariamente ideato per l'embedded, per questo alcune sue caratteristiche si sposano molto bene con questo mondo:"
                            indentLevel: 0
                            showDot: false
                        }

                        ListElement {
                            text: "Sfruttando l'accelerazione hardware messa a disposizione da OpenGL, Qt Quick è in grado di girare anche su piattaforme \"modeste\" con buoni risultati."
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Pur essendo basato su Javascript (interpretato), tutti egli effetti e animazioni sono realizzati direttamente in C++ (no overhead)."
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "In aggiunta, l'integrazione fra Qml e Qt/C++ è molto alta, ed è quindi facile scrivere parti della logica applicativa in C++ quando le prestazioni lo richiedano."
                            indentLevel: 2
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
                        text: "Grazie al lavoro di riscrittura dello stack grafico e all'adozione di un engine Javascript (attualmente, V8) più efficiente le prestazioni in alcuni casi risultano più che raddoppiate!"
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
                TextSlide {
                    title: "Qt Quick: i (principali) moduli"

                    model: ListModel {
                        ListElement {
                            text: "Quick / Qml"
                            indentLevel: 0
                            showDot: true
                        }
                        ListElement {
                            text: "Particles / Graphical Effects"
                            indentLevel: 0
                            showDot: true
                        }
                        ListElement {
                            text: "Local Storage / FolderListModel"
                            indentLevel: 0
                            showDot: true
                        }
                        ListElement {
                            text: "Multimedia"
                            indentLevel: 0
                            showDot: true
                        }
                        ListElement {
                            text: "Controls / Layouts"
                            indentLevel: 0
                            showDot: true
                        }
                        ListElement {
                            text: "Sensors"
                            indentLevel: 0
                            showDot: true
                        }
                    }
                }
            }

            Component {
                TextSlide {
                    title: "Quick / Qml"

                    model: ListModel {
                        ListElement {
                            text: "Il modulo QtQuick è il modulo \"base\", contenente gli elementi necessari per la costruzione di ogni interfaccia grafica:"
                            indentLevel: 0
                            showDot: false
                        }

                        ListElement {
                            text: "Elementi visuali molto semplici, ad esempio rettangoli, immagini e testo"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Elementi logici per gestire l'input dell'utente, come mousearea, drag&drop e campi per l'input di testo"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Viste ed elementi logici utilizzabili per il posizionamento, come liste, griglie e path"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Animazioni e transizioni fra stati"
                            indentLevel: 1
                            showDot: true
                        }

                        ListElement {
                            text: "Il modulo QtQml contiene elementi logici di utilità e modelli Qml utilizzabili con le viste del modulo QtQuick."
                            indentLevel: 0
                            showDot: true
                        }
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

