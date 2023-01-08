import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../others"

Item {
    id: item1

    width: 1850
    height: 865

    property var flightID: backend.getFlightID()

    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        NavigatorButton {
            id: flightIDBtn
            btnText: backend.getFlightCode()
            y: 35
            anchors.left: parent.left
            anchors.leftMargin: 40
            customFontSize: 38
            customWidth: 190
            customHeight: 70
            enabled: false
        }

        EditRecordButton {
            id: editRecordButton
            y: 35
            anchors.left: deleteRecordButton.right
            anchors.leftMargin: 16

        }

        DeleteRecordButton {
            id: deleteRecordButton
            y: 35
            anchors.left: flightIDBtn.right
            anchors.leftMargin: 106

        }

        Text {
            id: fromLabel
            y: 140
            width: 136
            height: 26

            text: "FROM"
            anchors.left: parent.left
            font.family: "Inter"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            color: "#80ffffff"
        }

        Text {
            id: toLabel
            x: 336
            y: 140
            width: 136
            height: 26
            color: "#80ffffff"
            text: "TO"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
        }

        Text {
            id: departureLabel
            y: 245
            width: 178
            height: 26
            color: "#80ffffff"
            text: "DEPARTURE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: gateLabel
            y: 445
            width: 106
            height: 26
            color: "#80ffffff"
            text: "GATE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 39
            font.family: "Inter"
        }

        Text {
            id: gateVar
            y: 485
            width: 80
            height: 26
            color: "#ffffff"
            text: backend.getGate()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 39
            font.family: "Inter"
        }

        Text {
            id: airplaneLabel
            y: 445
            width: 178
            height: 26
            color: "#80ffffff"
            text: "AIRPLANE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 335
            font.family: "Inter"
        }

        InnerSearchBar {
            id: innerSearchBar
            x: 1070
            y: 35
            width: 535
            height: 70
            anchors.right: newRecordButton.left
            anchors.rightMargin: 15

        }

        NewRecordButton {
            id: newRecordButton
            x: 1620
            y: 35
            onClicked: {
                backend.changeMode(3)
                mainWindow.close()
            }
        }

        PageSelectButton {
            id: pageSelectButton
            x: 1585
            y: 782
        }

        NavigatorButton {
            id: fromBtn
            x: 41
            y: 172
            width: 70
            customFontSize: 24
            dataID: backend.getFromID()
            btnText: backend.getFromShort()
            onClicked: {
                backend.openWindow(3, 1, backend.getFromID(), false)
            }
        }

        NavigatorButton {
            id: toBtn
            x: 336
            y: 172
            width: 70
            customFontSize: 24
            dataID: backend.getToID()
            btnText: backend.getToShort()
            onClicked: backend.openWindow(3, 1, backend.getToID(), false)
        }

        Text {
            id: arrivalLabel
            y: 345
            width: 178
            height: 26
            color: "#80ffffff"
            text: "ARRIVAL"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Text {
            id: arrivalVar
            y: 385
            width: 308
            height: 26
            color: "#ffffff"
            text: backend.getArrDate()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        NavigatorButton {
            id: airplaneBtn
            x: 336
            y: 477
            width: 120
            height: 50
            customFontSize: 24
            btnText: backend.getAirplaneID()
            onClicked: {
                backend.openWindow(5, 1, backend.getAirplaneID(), false)
            }

        }

        DoubleSwitch {
            id: doubleSwitch
            x: 615
            y: 35
        }

        Text {
            id: departureVar
            y: 285
            width: 308
            height: 26
            color: "#ffffff"
            text: backend.getDeptDate()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        StackView {
            id: rightContent
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 120
            anchors.bottomMargin: 105
            anchors.rightMargin: 15
            anchors.leftMargin: 615


            initialItem: Qt.resolvedUrl("flight/TicketsArea.qml")



        }
    }


    Connections {

        target: backend

    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
