import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

TextField {

    property int customWidth: 990
    property int customHeight: 70
    property string customText: "Search..."

    id: innerSearchBar

    width: customWidth
    height: customHeight
    color: "#ffffff"
    placeholderTextColor: "#4dffffff"
    placeholderText: customText
    font.pointSize: 20
    font.family: "Inter"



    background: Rectangle {

        color: "#0dffffff"
        radius: 10

    }
}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
