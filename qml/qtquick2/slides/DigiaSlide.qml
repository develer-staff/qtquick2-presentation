import QtQuick 2.0

TextSlide {
    title: qsTr("Digia and the \"freemium\" business model")

    model: [
        {
            'text': qsTr("In addition to the functionalities offered by the standard Qt, Digia offers many features for premium users under the commercial license."),
            'indentLevel': 0,
            'showDot': false
        }
    ]

    Item {
        id: container
        state: "offscreen"

        Image {
            id: charts
            source: "../images/qtcharts.png"
            x: 100
            y: 280
        }

        Image {
            id: cloud
            source: "../images/qtcloud.png"
            x: 550
            y: 280
        }

        Image {
            id: controls
            source: "../images/qtcontrolsenterprise.png"
            x: 100
            y: 480
        }

        Image {
            id: qtcreator
            source: "../images/qtcreatorenterprise.png"
            x: 510
            y: 480
        }

        states: State {
            name: "offscreen"
            PropertyChanges { target: charts; scale: 0 }
            PropertyChanges { target: cloud; scale: 0 }
            PropertyChanges { target: controls; scale: 0 }
            PropertyChanges { target: qtcreator; scale: 0 }
        }

        transitions: [
            Transition {
                from: "offscreen"
                to: ""
                ParallelAnimation {
                    id: anim
                    NumberAnimation { target: charts; property: "scale"; duration: 400; easing.type: Easing.OutBack }

                    SequentialAnimation {
                        PauseAnimation { duration: 200 }
                        NumberAnimation { target: qtcreator; property: "scale"; duration: 400; easing.type: Easing.OutBack }
                    }

                    SequentialAnimation {
                        PauseAnimation { duration: 400 }
                        NumberAnimation { target: controls; property: "scale"; duration: 400; easing.type: Easing.OutBack }
                    }
                    SequentialAnimation {
                        PauseAnimation { duration: 600 }
                        NumberAnimation { target: cloud; property: "scale"; duration: 400; easing.type: Easing.OutBack }
                    }

                }
            },
            Transition {
                from: ""
                to: "offscreen"
                NumberAnimation { targets: [charts, qtcreator, controls, cloud]; property: "scale"; duration: 400; easing.type: Easing.InOutQuad }
            }
        ]

    }

    onStateChanged: container.state = state
}
