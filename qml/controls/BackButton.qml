import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: backBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"
    width: 124
    height: 48
    icon.color: "#ffffff"

    implicitWidth: 148
    implicitHeight: 48

    QtObject {
        id: internal

        property var dynamicColor: if(backBtn.down) {
                                       backBtn.down ? colorPressed : colorDefault
                                   }else {
                                       backBtn.hovered ? colorHover : colorDefault
                                   }
    }

    Text {
        id: text1
        x: 47
        y: 8
        color: internal.dynamicColor
        text: "Back"
        font.pointSize: 20
        font.family: "Inter"
        textFormat: Text.RichText
    }

    background: Shape {
        ShapePath {
            fillColor: internal.dynamicColor
            strokeWidth: 3
            strokeColor: internal.dynamicColor
            PathSvg { path: "M 26 14 L 13 26 Z M 13 26 L 26 38 Z" }
        }
    }

    onClicked: {
        backend.openWindow(0, 0, 0, true)
        mainWindow.close()

    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:4}
}
##^##*/
