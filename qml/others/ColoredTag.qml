import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    id: it

    width: textVar.width + 40
    height: 50

    property bool pilot: false
    property bool copilot: false
    property bool cabinhead: false
    property bool cabincrew: true
    property string customText: "UNKNOWN"


    QtObject {
        id: internal

        property var dynamicColor: if(pilot) {
                                       "#808DFF"
                                   }else if(copilot) {
                                       "#6FB9FD"
                                   }else if(cabinhead) {
                                       "#ECB299"
                                   }else if(cabincrew) {
                                       "#E6EBB2"
                                   }else {
                                       "#000000"
                                   }
    }

    Rectangle {
        gradient: Gradient {
                GradientStop { position: 0.0; color: internal.dynamicColor }
                GradientStop { position: 1.0; color: "#1a030313" }
        }
        radius: 10
        anchors.fill: parent
        opacity: 0.10

    }

    Text {
        id: textVar
        text: it.customText
        anchors.verticalCenter: parent.verticalCenter
        font.family: "Inter"
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: internal.dynamicColor
    }
}


