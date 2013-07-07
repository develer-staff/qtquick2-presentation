import QtQuick 2.1

import "slides"
import "components"

Item {
    id: pageContainer
    Component {
        Intro {
        }
    }

    Component {
        TextSlide {
            title: "Recap - Cosa è Qt? 1/3"
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
            title: "Recap - Cosa è Qt? 2/3"
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
                    text: "Al fine di facilitare lo sviluppo le librerie sono rilasciate assieme a Qt Creator, un IDE potente ma leggero per lo sviluppo e design delle applicazioni."
                    indentLevel: 0
                    showDot: true
                }
            }
        }
    }

    Component {
        TextSlide {
            title: "Recap - Cosa è Qt? 3/3"
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
                    text: "Model/view framework"
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
                    text: "La sua natura dichiarativa (come HTML e CSS) rende il linguaggio più familiare ai non programmatori"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Alcune sue caratteristiche, come i property bindings, rendono la logica dell'applicazione più lineare e semplice."
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "E' realizzato \“sopra\” le Qt in modo da sfruttarne i pregi ed ereditarne le funzionalità (es: accelerazione hardware, internazionalizzazione, ecc..)."
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
                    text: "Qt Quick è stato originariamente ideato per l'embedded, per questo:"
                    indentLevel: 0
                    showDot: false
                }

                ListElement {
                    text: "Sfruttando l'accelerazione hardware, Qt Quick è in grado di girare su piattaforme \"modeste\" con buoni risultati."
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Pur essendo basato su Javascript, tutti gli effetti e animazioni sono realizzati direttamente in C++ (no overhead)."
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "In aggiunta, l'integrazione fra Qml e Qt/C++ è molto alta ed è quindi facile scrivere parti dell'applicazione in C++ se necessario."
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

                states: State {
                    name: "offscreen"
                    PropertyChanges { target: text; opacity: 0 }
                }

                transitions: Transition {
                    NumberAnimation { target: text; property: "opacity"; duration: 200 }
                }
            }

            Image {
                id: image
                anchors.bottom: slide._bottomRectItem.top
                anchors.bottomMargin: -40
                anchors.horizontalCenter: parent.horizontalCenter
                source: "images/v1_vs_v2.png"
                scale: .8

                states: State {
                    name: "offscreen"
                    PropertyChanges { target: image; opacity: 0 }
                }

                transitions: Transition {
                    NumberAnimation { target: image; property: "opacity"; duration: 200 }
                }
            }

            onStateChanged:  {
                text.state = state
                image.state = state
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
                text: "Grazie a questo lavoro e all'adozione di un engine Javascript più efficiente (attualmente, V8) le prestazioni in alcuni casi risultano più che raddoppiate!"
                wrapMode: Text.WordWrap
                color: slide.textColor
                anchors.top: slide._topRectItem.bottom
                anchors.topMargin: 180
                anchors.left: parent.left
                anchors.leftMargin: 100
                anchors.right: parent.right
                anchors.rightMargin: 100
                z: 1

                states: State {
                    name: "offscreen"
                    PropertyChanges { target: text; opacity: 0 }
                }

                transitions: Transition {
                    NumberAnimation { target: text; property: "opacity"; duration: 200 }
                }
            }

            Image {
                id: image
                anchors.bottom: slide._bottomRectItem.top
                anchors.bottomMargin: 130
                anchors.horizontalCenter: parent.horizontalCenter
                source: "images/benchmarks.png"

                states: State {
                    name: "offscreen"
                    PropertyChanges { target: image; opacity: 0 }
                }

                transitions: Transition {
                    NumberAnimation { target: image; property: "opacity"; duration: 200 }
                }
            }

            onStateChanged:  {
                text.state = state
                image.state = state
            }
        }
    }

    Component {
        TextSlide {
            title: "Qt Quick: i (principali) moduli"

            model: ListModel {
                ListElement {
                    text: "QtQuick / QtQml"
                    indentLevel: 0
                    showDot: true
                }
                ListElement {
                    text: "LocalStorage / XmlListModel / FolderListModel*"
                    indentLevel: 0
                    showDot: true
                }

                ListElement {
                    text: "Particles / GraphicalEffects"
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
            title: "QtQuick"

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
                    text: "Elementi logici per gestire l'input dell'utente, come mousearea, gestures e campi per l'input di testo"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Vari tipi di view (liste, griglie, path) basate su modelli ed elementi logici utilizzabili per il posizionamento"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Animazioni e transizioni fra stati"
                    indentLevel: 1
                    showDot: true
                }
            }
        }
    }

    Component {
        TextSlide {
            title: "QtQuick"

            model: ListModel {
                ListElement {
                    text: "Il modulo QtQuick contiene anche:"
                    indentLevel: 0
                    showDot: false
                }

                ListElement {
                    text: "Un canvas per il disegno 2D simile a quello di HTML5"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Elementi per l'integrazione di shaders per effetti grafici"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Un elemento per l'esecuzione di codice in un worker thread"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Il modulo QtQuick comprende anche un'API C++ per estendere applicazioni Qml tramite codice Qt/C++."
                    indentLevel: 0
                    showDot: false
                }
            }
        }
    }

    Component {
        TextSlide {
            title: "QtQml"
            model: ListModel {

                ListElement {
                    text: "Il modulo QtQml comprende una serie di classi C++ che rappresentano l'engine di Qml stesso e:"
                    indentLevel: 0
                    showDot: false
                }

                ListElement {
                    text: "Elementi (Qml) di comune utilità per timer, date, locale, ecc.."
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "Elementi (Qml) per la creazione di modelli da usare con le viste del modulo QtQuick"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "In aggiunta la parte C++ del modulo permette anche l'utilizzo di oggetti C++ come modelli per le viste di QtQuick."
                    indentLevel: 0
                    showDot: false
                }
            }
        }
    }

    Component {
        TextSlide {
            title: "LocalStorage / XmlListModel / FolderListModel*"
            model: ListModel {
                ListElement {
                    text: "LocalStorage offre un facile accesso ad un database SQLite per la memorizzazione di informazioni persistenti direttamente da Qml."
                    indentLevel: 0
                    showDot: true
                }

                ListElement {
                    text: "XmlListModel è un modulo che permette di utilizzare il contenuto di un file xml come modello e di utilizzare query XPath per estrarre il contenuto selettivamente."
                    indentLevel: 0
                    showDot: true
                }

                ListElement {
                    text: "FolderListModel* permette di utilizzare il contenuto di una directory come modello."
                    indentLevel: 0
                    showDot: true
                }
            }
        }
    }

    Component {
        EffectsSlide {
        }
    }

    Component {
        TextSlide {
            title: "Multimedia"
            model: ListModel {
                ListElement {
                    text: "Il modulo Multimedia, appoggiandosi a backend specifici per i vari sistemi operativi supportati da Qt, integra al suo interno numerose funzionalità multimediali come:"
                    indentLevel: 0
                    showDot: false
                }

                ListElement {
                    text: "riproduzione di audio e video"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "registrazione di video"
                    indentLevel: 1
                    showDot: true
                }
                ListElement {
                    text: "funzionalità radio"
                    indentLevel: 1
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
        TextSlide {
            id: slide
            title: "Controls"
            model: ListModel {
                ListElement {
                    text: "Poiché QtQuick è stato ideato per embedded, avere un set di controlli standard non era molto importante."
                    indentLevel: 0
                    showDot: false
                }
                ListElement {
                    text: "Le cose sono cambiate quando si è visto che QtQuick poteva essere utile anche per Desktop."
                    indentLevel: 1
                    showDot: true
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: slide._bottomRectItem.top
                anchors.bottomMargin: 10
                spacing: 10
                Image {
                    source: "images/DesktopComponentsMac1.png"
                    width: 410
                    fillMode: Image.PreserveAspectFit
                }
                Image {
                    source: "images/DesktopComponentsWin.png"
                    width: 410
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }

    Component {
        TextSlide {
            title: "Layouts"

            model: ListModel {
                ListElement {
                    text: "Come per i controlli, poter progettare una gui facilmente ridimensionabile non era inizialmente importante."
                    indentLevel: 0
                    showDot: false
                }

                ListElement {
                    text: "Il modulo QtQuick permette di posizionare gli elementi:"
                    indentLevel: 1
                    showDot: true
                }

                ListElement {
                    text: "manualmente, specificando le coordinate dei singoli elementi"
                    indentLevel: 2
                    showDot: true
                }

                ListElement {
                    text: "tramite sistema di ancore"
                    indentLevel: 2
                    showDot: true
                }

                ListElement {
                    text: "Il modulo QtLayouts mette a disposizione vari layout per disporre gli elementi e definire come devono espandersi al variare delle dimensioni dell'interfaccia."
                    indentLevel: 0
                    showDot: false
                }
            }
        }
    }

    Component {
        TextSlide {
            title: "Sensors"
            model: ListModel {
                ListElement {
                    text: "Erede di Qt Mobility, il modulo Sensors fornisce un modo semplice di accedere, sia da Qml che da C++, ai sensori hardware tipici delle più moderne piattaforme mobili."
                    indentLevel: 0
                    showDot: false
                }
                ListElement {
                    text: "Accelerometro"
                    indentLevel: 1
                    showDot: true
                }
                ListElement {
                    text: "Giroscopio"
                    indentLevel: 1
                    showDot: true
                }
                ListElement {
                    text: "Bussola"
                    indentLevel: 1
                    showDot: true
                }
                ListElement {
                    text: "Sensore di rotazione"
                    indentLevel: 1
                    showDot: true
                }
            }
        }
    }

    Component {
        BrowserSlide {

        }
    }

    Component {
        EndSlide {

        }
    }

    Component {
        LetsTalkSlide {

        }
    }
}
