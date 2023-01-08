import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {

    id: customTextBox

    property string customText: "UNKNOWN"
    property int customSize: 26

    width: 220
    height: 50
    color: "#ffffff"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font.pixelSize: customSize
    font.family: "Inter"
    placeholderTextColor: "#ffffff"
    placeholderText: customText





    background: Rectangle {

        color: "#00ffffff"
        border.color: "#0dffffff"
        border.width: 2
        radius: 10

    }


}


