import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: greenTick
    property color colorBackground: "#7bd864"

    property bool isEnabled: false

    property bool isButton: true

    implicitWidth: 32
    implicitHeight: 32

    width: 32
    height: 32

    onClicked: {
        isEnabled = !isEnabled
    }

    background: Rectangle {
        color: "#00ffffff"
        radius: 10
        border.color: "#10ffffff"
        border.width: isButton ? 2 : 0
    }

    Shape {
        ShapePath {
            strokeWidth: 0.65
            fillColor: isEnabled ? "#7bd864" : "#ee1021"
            strokeColor: isEnabled ? "#7bd864" : "#ee1021"

            PathSvg { path: isEnabled
                            ? "M 11.7 24.7 c 0.2592 0.2592 0.6034 0.3899 0.9456 0.3899 c 0.3401 0 0.6822 -0.1285 0.9456 -0.3899 l 17.0429 -17.0471 c 0.5226 -0.5226 0.5226 -1.3666 0 -1.889 c -0.5226 -0.5226 -1.3666 -0.5226 -1.889 0 l -16.0994 16.0974 l -8.1554 -8.1492 c -0.5226 -0.5204 -1.3686 -0.5204 -1.889 0 c -0.5226 0.5226 -0.5226 1.3686 0 1.889 l 9.099 9.099 z"
                            : "M 29.8 2.3 c -0.6504 -0.6528 -1.7112 -0.6528 -2.3664 0 l -11.304 11.3064 l -11.3016 -11.3064 c -0.6528 -0.6528 -1.7136 -0.6528 -2.3664 0 s -0.6528 1.7136 0 2.3664 l 11.3016 11.3064 l -11.304 11.3064 c -0.6528 0.6504 -0.6528 1.7112 0 2.3664 c 0.3264 0.3264 0.7536 0.4872 1.1808 0.4872 c 0.4296 0 0.8568 -0.1608 1.1832 -0.4872 l 11.3064 -11.3064 l 11.304 11.3064 c 0.3288 0.3264 0.7536 0.4872 1.1856 0.4872 c 0.4272 0 0.852 -0.1608 1.1808 -0.4872 c 0.6552 -0.6552 0.6552 -1.716 0 -2.3664 l -11.3064 -11.3064 l 11.3064 -11.3064 c 0.6576 -0.6528 0.6576 -1.7136 0 -2.3664 z"
            }
        }
    }
}



