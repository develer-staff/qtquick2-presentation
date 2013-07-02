import QtQuick 2.1
import "../components"


BaseSlide {
    title: "Qt: chi lo usa"

    Item {
        id: container
        state: "offscreen"

        Image {
            id: image1
            x: 40
            y: 200
            width: 358
            fillMode: Image.PreserveAspectFit
            source: "../images/aria_screenshot2.gif"
        }

        Image {
            id: image2
            x: 635
            y: 200
            width: 351
            fillMode: Image.PreserveAspectFit
            source: "../images/googleearth_screenshot.jpg"
        }

        Image {
            id: image3
            x: 300
            y: 255
            width: 408
            fillMode: Image.PreserveAspectFit
            source: "../images/mathematica_screenshot.jpg"
        }

        Image {
            id: image4
            x: 50
            y: 410
            width: 400
            fillMode: Image.PreserveAspectFit
            source: "../images/maxwellrender_1.jpg"
        }

        Image {
            id: image5
            x: 625
            y: 400
            width: 350
            fillMode: Image.PreserveAspectFit
            source: "../images/real_flow.jpg"
        }

        states: State {
            name: "offscreen"
            PropertyChanges { target: image1; x: 1048; y: 62 }
            PropertyChanges { target: image2; x: 1190; y: -33 }
            PropertyChanges { target: image3; x: 1048; y: 198 }
            PropertyChanges { target: image4; x: 1048; y: 408 }
            PropertyChanges { target: image5; x: 1048; y: 408 }
        }

        transitions: Transition {
            NumberAnimation { target: image1; properties: "x,y"; duration: 400; easing.type: Easing.InOutQuad }
            NumberAnimation { target: image2; properties: "x,y"; duration: 500; easing.type: Easing.InOutQuad }
            NumberAnimation { target: image3; properties: "x,y"; duration: 600; easing.type: Easing.InOutQuad }
            NumberAnimation { target: image4; properties: "x,y"; duration: 700; easing.type: Easing.InOutQuad }
            NumberAnimation { target: image5; properties: "x,y"; duration: 800; easing.type: Easing.InOutQuad }
        }
    }
    onStateChanged: container.state = state
}
