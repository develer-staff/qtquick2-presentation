import QtQuick 2.1
import "../components"


BaseSlide {
    id: slide
    title: qsTr("Qt: users")

    Item {
        id: container
        state: "offscreen"

        Image {
            id: image1
            x: 40
            y: slide._titleItem.y + slide._titleItem.height + 10
            width: slide.width / 3
            fillMode: Image.PreserveAspectFit
            source: "../images/aria_screenshot2.gif"
        }

        Image {
            id: image2
            x: slide.width - width - 40
            y: slide._titleItem.y + slide._titleItem.height + 10
            width: slide.width / 3
            fillMode: Image.PreserveAspectFit
            source: "../images/googleearth_screenshot.jpg"
        }

        Image {
            id: image3
            x: (slide.width - width) / 2
            y: (image4.y + image1.y - 20) / 2
            width: slide.width / 3 + 10
            fillMode: Image.PreserveAspectFit
            source: "../images/mathematica_screenshot.jpg"
        }

        Image {
            id: image4
            x: 50
            y: slide.height - 100 - height - 10
            width: slide.width / 3
            fillMode: Image.PreserveAspectFit
            source: "../images/maxwellrender_1.jpg"
        }

        Image {
            id: image5
            x: slide.width - width - 50
            y: slide.height - 100 - height - 10
            width: slide.width / 3
            fillMode: Image.PreserveAspectFit
            source: "../images/real_flow.jpg"
        }

        states: State {
            name: "offscreen"
            PropertyChanges { target: image1; x: slide.width; y: 0 }
            PropertyChanges { target: image2; x: slide.width; y: 0 }
            PropertyChanges { target: image3; x: slide.width; y: slide.height / 4 }
            PropertyChanges { target: image4; x: slide.width; y: slide.height / 2 }
            PropertyChanges { target: image5; x: slide.width; y: slide.height / 2 }
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
