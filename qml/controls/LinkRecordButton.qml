import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: linkRecordBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"

    QtObject {
        id: internal

        property var dynamicColor: if(linkRecordBtn.down) {
                                       linkRecordBtn.down ? colorPressed : colorDefault
                                   }else {
                                       linkRecordBtn.hovered ? colorHover : colorDefault
                                   }
    }

    width: 100
    height: 70
    implicitWidth: 48
    implicitHeight: 48

    background: Rectangle {

        id: innerBg
        color: "#1dffffff"
        radius: 10

        Shape {
            ShapePath {
                fillColor: internal.dynamicColor
                strokeWidth: 1
                capStyle: ShapePath.RoundCap
                strokeColor: internal.dynamicColor
                PathSvg { path: "M 65 32 l -5.7936 5.7912 c -0.3744 0.3744 -0.9792 0.3744 -1.3536 0 c -0.3744 -0.372 -0.3744 -0.9792 0 -1.3512 l 5.7936 -5.7936 c 2.82 -2.82 2.82 -7.4088 0 -10.2288 c -1.368 -1.3656 -3.1824 -2.1192 -5.1168 -2.1192 s -3.7488 0.7512 -5.1168 2.1192 l -5.7936 5.7912 c -2.82 2.82 -2.82 7.4088 0 10.2312 c 0.6912 0.6912 1.4976 1.2264 2.3928 1.5888 c 0.4896 0.1992 0.7272 0.756 0.528 1.248 c -0.4104 1.0128 -1.5432 0.408 -1.248 0.528 c -1.1352 -0.4584 -2.1552 -1.1376 -3.0288 -2.0112 c -3.5688 -3.564 -3.5688 -9.3696 0 -12.9384 l 5.7936 -5.7912 c 1.728 -1.728 4.0272 -2.6808 6.4704 -2.6808 s 4.7424 0.9504 6.4704 2.6808 c 3.5688 3.5664 3.5688 9.3696 0.0024 12.936 m -15.3432 -2.6376 c -0.492 -0.1992 -1.0488 0.0384 -1.248 0.528 c -0.1992 0.492 0.0384 1.0488 0.528 1.248 c 0.8976 0.3624 1.7016 0.8976 2.3928 1.5888 c 2.8224 2.8224 2.8224 7.4112 0 10.2312 l -5.7936 5.7912 c -1.3656 1.3656 -3.1824 2.1192 -5.1144 2.1192 s -3.7488 -0.7512 -5.1168 -2.1192 c -2.82 -2.82 -2.82 -7.4088 0 -10.2288 l 5.7936 -5.7936 c 0.3744 -0.372 0.3744 -0.9792 0 -1.3536 c -0.3744 -0.3744 -0.9792 -0.3744 -1.3536 0 l -5.7936 5.7936 c -3.5688 3.564 -3.5688 9.3696 0 12.9384 c 1.728 1.728 4.0272 2.6784 6.4704 2.6784 s 4.7424 -0.9504 6.4704 -2.6784 l 5.7936 -5.7912 c 3.5688 -3.5664 3.5688 -9.372 0 -12.9408 c -0.8736 -0.876 -1.8912 -1.5504 -3.0288 -2.0112" }
            }
        }
    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
