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
            item1.dbData = backend.search(1, pageSelectButton.currentPage, innerSearchBar.text, backend.getAirportID())
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

            if(dbData.length-1 >= 2){
                flightSearchTag2.visible = true
                flightSearchTag2.flightID = dbData[2][0]
                flightSearchTag2.flightCode = dbData[2][1]
                flightSearchTag2.deptShort = dbData[2][2]
                flightSearchTag2.deptLong = dbData[2][3]
                flightSearchTag2.arrShort = dbData[2][4]
                flightSearchTag2.arrLong = dbData[2][5]
                flightSearchTag2.deptDate = dbData[1][6]
                flightSearchTag2.arrDate = dbData[1][7]
            }else {
                flightSearchTag2.visible = false
            }

            if(dbData.length-1 >= 3){
                flightSearchTag3.visible = true
                flightSearchTag3.flightID = dbData[3][0]
                flightSearchTag3.flightCode = dbData[3][1]
                flightSearchTag3.deptShort = dbData[3][2]
                flightSearchTag3.deptLong = dbData[3][3]
                flightSearchTag3.arrShort = dbData[3][4]
                flightSearchTag3.arrLong = dbData[3][5]
                flightSearchTag3.deptDate = dbData[1][6]
                flightSearchTag3.arrDate = dbData[1][7]
            }else {
                flightSearchTag3.visible = false
            }

            if(dbData.length-1 >= 4){
                flightSearchTag4.visible = true
                flightSearchTag4.flightID = dbData[4][0]
                flightSearchTag4.flightCode = dbData[4][1]
                flightSearchTag4.deptShort = dbData[4][2]
                flightSearchTag4.deptLong = dbData[4][3]
                flightSearchTag4.arrShort = dbData[4][4]
                flightSearchTag4.arrLong = dbData[4][5]
                flightSearchTag4.deptDate = dbData[1][6]
                flightSearchTag4.arrDate = dbData[1][7]
            }else {
                flightSearchTag4.visible = false
            }

        }

    }

    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.fill: parent


        NavigatorButton {
            id: airportIDBtn
            btnText: backend.getCode()
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
            anchors.left: airportIDBtn.right
            anchors.leftMargin: 106
        }

        Text {
            id: nameLabel
            y: 145
            width: 178
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

        InnerSearchBar {
            id: innerSearchBar
            x: 615
            y: 35
            width: 990
            height: 70
            anchors.right: newRecordButton.left
            anchors.rightMargin: 15
            onTextChanged: {
                pageSelectButton.currentPage = 1
                internal.updateDb()
            }
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
            id: shortNameLabel
            y: 238
            width: 216
            height: 26
            color: "#80ffffff"
            text: "SHORT NAME (CODE)"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Text {
            id: shortNameVar
            y: 278
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getCode()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 40
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

            isUsedOnMain: true
        }

        FlightSearchTag {
            id: flightSearchTag2
            x: 615
            y: 278
            width: 1220
            height: 150

            isUsedOnMain: true
        }

        FlightSearchTag {
            id: flightSearchTag3
            x: 615
            y: 443
            width: 1220
            height: 150

            isUsedOnMain: true
        }

        FlightSearchTag {
            id: flightSearchTag4
            x: 615
            y: 607
            width: 1220
            height: 150

            isUsedOnMain: true
        }
    }


    Connections {

        target: backend

    }

}




