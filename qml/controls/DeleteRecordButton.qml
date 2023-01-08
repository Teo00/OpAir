import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: deleteRecordBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"
    icon.color: "#ffffff"

    QtObject {
        id: internal

        property var dynamicColor: if(deleteRecordBtn.down) {
                                       deleteRecordBtn.down ? colorPressed : colorDefault
                                   }else {
                                       deleteRecordBtn.hovered ? colorHover : colorDefault
                                   }
    }


    width: 70
    height: 70

    implicitWidth: 70
    implicitHeight: 70

    onClicked: {
        backend.deleteRecord()
        backend.openWindow(0, 0, "", true)
        mainWindow.close()
    }

    background: Rectangle {

        id: innerBg
        color: "#24ff8383"
        radius: 10

        Shape {
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 2.5
                capStyle: ShapePath.RoundCap
                strokeColor: internal.dynamicColor
                PathSvg { path: "M 21.661 26.836 h 26.6667 m -16.6667 6.6666 v 10 m 6.667 -10 v 10 m -15 -16.6666 l 1.6667 20 c 0 0.8841 0.3512 1.7319 0.9763 2.3571 c 0.6251 0.6251 1.4729 0.9763 2.357 0.9763 h 13.3333 c 0.8841 0 1.7319 -0.3512 2.3571 -0.9763 c 0.6251 -0.6252 0.9763 -1.473 0.9763 -2.3571 l 1.6666 -20 m -16.6668 0 v -5 c 0 -0.442 0.1756 -0.8659 0.4882 -1.1785 c 0.3125 -0.3126 0.7364 -0.4882 1.1785 -0.4882 h 6.6666 c 0.4421 0 0.866 0.1756 1.1785 0.4882 c 0.3126 0.3126 0.4882 0.7365 0.4882 1.1785 v 5" }
            }
        }
    }

}




