import QtQuick 2.15
import QtQuick.Controls 2.15


TabBar {
    id: tabBar

    width: 430
    height: 70
    contentHeight: 70
    contentWidth: 220

    implicitWidth: 430
    implicitHeight: 70

    background: Rectangle {
        color: "#0dffffff"
        radius: 10
    }

    TabButton {

        id: leftTabBtn
        x: 0
        y: 0
        width: 220
        height: 70
        checked: true

        contentItem: Text {
            text: "Tickets"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            font.pixelSize: 26
            color: leftTabBtn.checked ? "#ffffff" : leftTabBtn.hovered ? "#e0ffffff" : "#4dffffff"

        }

        background: Rectangle {

            radius: 10
            color: leftTabBtn.checked ? "#262639" : "#00ffffff"

        }

    }

    TabButton {

        id: rightTabBtn

        x: 215
        y: 0
        width: 215
        height: 70
        checked: false

        contentItem: Text {
            text: "Crew"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            font.pixelSize: 26
            color: rightTabBtn.checked ? "#ffffff" : rightTabBtn.hovered ? "#e0ffffff" : "#4dffffff"

        }

        background: Rectangle {

            radius: 10

            color: rightTabBtn.checked ? "#262639" : "#00ffffff"

        }
    }

}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}
}
##^##*/
