import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "../controls"
import "../others"
import "../others/searchtags"

Item {
    id: item1

    width: 1850
    height: 865

    Component.onCompleted: {
        internal.updateDb()
    }

    property var dbData: [[1]]

    QtObject {

        id: internal

        function updateDb() {
            item1.dbData = backend.search(1, pageSelectButton.currentPage, backend.getCrewID())
            updateData()
        }

        function updateData() {

            // totalPage(index 0) + flight: [flightID, flightCode, fromShort, fromLong, toShort, toLong, deptDate, arrDate]

            if(dbData.length-1 >= 1){
                flightSearchTag1.visible = true
                flightSearchTag1.flightID = dbData[1][0]
                flightSearchTag1.flightCode = dbData[1][1]
                flightSearchTag1.deptShort = dbData[1][2]
                flightSearchTag1.deptLong = dbData[1][3]
                flightSearchTag1.arrShort = dbData[1][4]
                flightSearchTag1.arrLong = dbData[1][5]
                flightSearchTag1.deptDate = dbData[1][6]
                flightSearchTag1.arrDate = dbData[1][7]
            }else {
                flightSearchTag1.visible = false
            }

        }

    }

    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.fill: parent


        NavigatorButton {
            id: crewIDBtn
            btnText: backend.getCrewID()
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
            anchors.left: crewIDBtn.right
            anchors.leftMargin: 106
        }

        Text {
            id: nameLabel
            y: 145
            width: 64
            height: 26
            color: "#80ffffff"
            text: "NAME"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        NewRecordButton {
            id: newRecordButton
            x: 1620
            y: 35
        }

        PageSelectButton {
            id: pageSelectButton
            x: 1585
            y: 782

            lastPage: item1.dbData[0][0]

            onPageChanged: internal.updateDb()
        }

        Text {
            id: surnameLabel
            x: 254
            y: 145
            width: 104
            height: 26
            color: "#80ffffff"
            text: "SURNAME"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
        }

        Text {
            id: surnameVar
            x: 254
            y: 185
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getSurname()
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
        }

        Text {
            id: nameVar
            y: 185
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getName()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        FlightSearchTag {
            id: flightSearchTag1
            x: 615
            y: 117
            width: 1220
            height: 150
        }

        Text {
            id: typeLabel
            y: 241
            width: 64
            height: 26
            color: "#80ffffff"
            text: "CREW TYPE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Text {
            id: typeVar
            y: 281
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getType()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Text {
            id: licenseLabel
            y: 341
            width: 182
            height: 26
            color: "#80ffffff"
            text: "LICENSE NUMBER"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Text {
            id: licenseVar
            y: 381
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getLicense()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Text {
            id: contactNumber
            y: 437
            width: 182
            height: 26
            color: "#80ffffff"
            text: "CONTACT NUMBER"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Text {
            id: contactVar
            y: 477
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getPhone()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
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
