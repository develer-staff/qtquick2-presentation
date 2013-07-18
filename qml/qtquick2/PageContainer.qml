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
            title: qsTr("Recap - What is Qt? 1/3")
            model: [
                {
                    'text': qsTr("Qt is an application cross platform, which can be used to write the code once and deploy on many desktop and embedded OSes."),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("Qt is also a library and offers many component ready to use."),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("Qt is well-suited for embedded development and runs on every Linux with a decent C++ compiler."),
                    'indentLevel': 0,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("Recap - What is Qt? 2/3")
            model: [
                {
                    'text': qsTr("Qt is written in C++, however it uses extensively a code generator called moc to implement many high level functionalities not offered by the language."),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("It is possible to extend applications written in C++ by embedding script engines based on Javascript or Python."),
                    'indentLevel': 0,
                    'showDot': true,
                },
                {
                    'text': qsTr("To make the development easier Qt libraries are released with Qt Creator, a powerful but lightweight IDE for developing and designing applications."),
                    'indentLevel': 0,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("Recap - What is Qt? 3/3")
            spacing: 20

            model: [
                {
                    'text': qsTr("Qt offers many functionalities ready to use:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Internationalization and unicode support"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Multi-threading and multi-processing"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Model/view framework"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Networking and IPC mechanisms"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Browser (WebKit)"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Multimedia"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Xml and databases"),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("Qt licenses")
            model: [
                {
                    'text': qsTr("Qt is available under two licenses:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Open source (LGPL v. 2.1) → allows you to develop applications with dynamic linking without releasing the sources or pay licensing fees."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Commercial → the cost depends on developer and target platforms number, allows you to use Qt freely and includes support."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("For details: http://qt.digia.com/licensing"),
                    'indentLevel': 0,
                    'showDot': false
                }
            ]
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
            title: qsTr("Qt limits")
            model: [
                {
                    'text': qsTr("How much code is needed for...?"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Modify the position of some elements"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Animate gui elements or adding page transitions"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Update the appearance of one or more windows depends on a (logic) status"),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]
        }
    }


    Component {
        TextSlide {
            title: qsTr("Qt Quick")

            model: [
                {
                    'text': qsTr("Qt Quick is a set of tecnologies:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("The declarative language, called Qml and extension of Javascript."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("The runtime, which permits to access to functionalities and data structures of Qt/C++."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("QtCreator, that includes an advanced Qml editor, an UI designer and a debugger/profiler."),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("Qt Quick")

            model: [
                {
                    'text': qsTr("Qt Quick speeds up creating GUI so it is very indicated for fast prototyping of applications:"),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("Its declarative nature (as HTML and CSS) makes the language more familiar for non programmers"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Some of its characteristics, as property bindings, make the application logic linear and simpler."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("It is built on the top of Qt to exploit the advantages and inherits the functionalities (ex: hardware acceleration, internationalization, etc..)."),
                    'indentLevel': 0,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        LiveDemo {
        }
    }

    Component {
        TextSlide {
            title: qsTr("Qt Quick and embedded systems")

            model: [
                {
                    'text': qsTr("Qt Quick was originally designed for embedded systems, so:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Using hardware acceleration, Qt Quick can run on limited hardware with good performance."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Even if the language is based on Javascript, all the effects and animations are built in C++ (no overhead)."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("In addition, the integration between Qml and Qt/C++ is very tight so it is easy to write parts of applications in C++ if needed."),
                    'indentLevel': 2,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        BaseSlide {
            id: slide
            title: qsTr("Qt Quick v.2")

            Text {
                id: text
                font.pointSize: 18
                text: qsTr("For Qt5/Qt Quick2 a great part of the graphical stack was rewritten to optimize the performances and take advantage of the hardware acceleration.")
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
            title: qsTr("Qt Quick v.2")

            Text {
                id: text
                font.pointSize: 18
                text: qsTr("Thanks to this work and to the adoption of a more efficient Javascript engine (now, V8), performance is more than doubled in some cases!")
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
            title: qsTr("Qt Quick: (main) modules")

            model: [
                {
                    'text': qsTr("QtQuick / QtQml"),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("LocalStorage / XmlListModel / FolderListModel*"),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("Particles / GraphicalEffects"),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("Multimedia"),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("Controls / Layouts"),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("Sensors"),
                    'indentLevel': 0,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("QtQuick")

            model: [
                {
                    'text': qsTr("The QtQuick module is the base module and contains all the required elements to build every UI:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Simple visual elements as rectangles, images and texts"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Logical elements to handle user inputs as mousearea, gestures and input text fields"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Many types of views (lists, grid and path) based on models and logical elements which can be used to position visual elements"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Animations and state transitions"),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("QtQuick")

            model: [
                {
                    'text': qsTr("The QtQuick module also contains:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("A 2D canvas similar to the one offered by HTML5"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Shader elements to create graphical effects"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("An element to execute parallel code using a worker thread"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("The QtQuick module comes also with a C++ API to extend applications written in Qml using Qt/C++."),
                    'indentLevel': 0,
                    'showDot': false
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("QtQml")
            model: [
                {
                    'text': qsTr("The QtQml module contains some C++ classes that represent the Qml engine and:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Qml elements for common usage like timer, date, locale, etc.."),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Qml elements for building models to use together the QtQuick module views"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("In addition the C++ part of the module allows the user to use C++ objects as models for the QtQuick views."),
                    'indentLevel': 0,
                    'showDot': false
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("LocalStorage / XmlListModel / FolderListModel*")
            model: [
                {
                    'text': qsTr("LocalStorage offers an easy access to an SQLite database to store and retrieve persistent information from Qml."),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("XmlListModel is a module which permits to use the content of an xml file as a model and to use XPath queries to extract its content."),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("FolderListModel* allows to use the content of a directory as a model."),
                    'indentLevel': 0,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        DropDownSlide {
            title: qsTr("Particles / GraphicalEffects")

            model: [
                {
                    'text': qsTr("The Particles module implements a complete particles system, essential to develop videogames but useful also to create complex effects like fog."),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("The GraphicalEffects module contains many - ready to use - graphical effects built using shaders like:"),
                    'indentLevel': 0,
                    'showDot': true
                },
                {
                    'text': qsTr("blur"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("brightness & contrast"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("drop shadow"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("glow"),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("Multimedia")
            model: [
                {
                    'text': qsTr("The Multimedia module, which is based upon the specific functions provided by the underlying platform, contains many multimedia functionalities as:"),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("audio and video players"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("video recording"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("radio functionalities"),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]
        }
    }

    Component {
        VideoDemo {
        }
    }

    Component {
        TextSlide {
            id: slide
            title: qsTr("Controls")
            model: [
                {
                    'text': qsTr("Because QtQuick was designed for embedded platforms, having standard controls was not a must have feature."),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Things changed when people started using QtQuick also on the Desktop."),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]

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
            title: qsTr("Layouts")

            model: [
                {
                    'text': qsTr("As for the controls, making an UI easily resizable was not important at the beginning."),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("QtQuick module allows to position elements:"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("manually, specifying the coordinates of single elements"),
                    'indentLevel': 2,
                    'showDot': true
                },
                {
                    'text': qsTr("using the anchors system"),
                    'indentLevel': 2,
                    'showDot': true
                },
                {
                    'text': qsTr("The QtLayouts module offers some layouts to organize elements and to define how they have to resize when the ui size is changed."),
                    'indentLevel': 0,
                    'showDot': false
                }
            ]
        }
    }

    Component {
        TextSlide {
            title: qsTr("Sensors")
            model: [
                {
                    'text': qsTr("Successor of Qt Mobility, the Sensor module offers a simple way to access, from Qml and C++, to those hardware sensors so common on the modern mobile platforms."),
                    'indentLevel': 0,
                    'showDot': false
                },
                {
                    'text': qsTr("Accelerometer"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Gyroscope"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Compass"),
                    'indentLevel': 1,
                    'showDot': true
                },
                {
                    'text': qsTr("Rotation sensor"),
                    'indentLevel': 1,
                    'showDot': true
                }
            ]
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
