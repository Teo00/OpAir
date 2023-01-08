import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../../controls"
import "../../others"
import "../../others/searchtags"

Item {
    id: content
    width: 1850
    height: 890

    property var dbData: [[1]]

    QtObject {

        id: internal

        function updateDb() {
            content.dbData = (innerSearchBar.text.length > 0) ? backend.search(5, pageSelectButton.currentPage, innerSearchBar.text) : [[1]]
            updateData()
        }

        function updateData() {

            if(dbData.length-1 >= 1){
                airplaneSearchTag1.visible = true
                airplaneSearchTag1.airplaneID = dbData[1][0]
                airplaneSearchTag1.name = dbData[1][1]
            }else {
                airplaneSearchTag1.visible = false
            }

            if(dbData.length-1 >= 2){
                airplaneSearchTag2.visible = true
                airplaneSearchTag2.airplaneID = dbData[2][0]
                airplaneSearchTag2.name = dbData[2][1]
            }else {
                airplaneSearchTag2.visible = false
            }

            if(dbData.length-1 >= 3){
                airplaneSearchTag3.visible = true
                airplaneSearchTag3.airplaneID = dbData[3][0]
                airplaneSearchTag3.name = dbData[3][1]
            }else {
                airplaneSearchTag3.visible = false
            }

            if(dbData.length-1 >= 4){
                airplaneSearchTag4.visible = true
                airplaneSearchTag4.airplaneID = dbData[4][0]
                airplaneSearchTag4.name = dbData[4][1]
            }else {
                airplaneSearchTag4.visible = false
            }

        }

    }

    InnerSearchBar {
        id: innerSearchBar
        x: 295
        y: 24
        width: 976
        height: 70
        customText: "Search airplanes by giving airplane model..."

        onTextChanged: {
            pageSelectButton.currentPage = 1
            internal.updateDb()
        }

    }

    CreateNewButton {
        id: createNewButton
        x: 1291
        y: 24

        onClicked: {
            backend.openWindow(1, 2, innerSearchBar.text)
        }
    }

    Column {
        id: column
        x: 297
        y: 113
        width: 1256
        height: 666
        spacing: 10

        AirplaneSearchTag {
            id: airplaneSearchTag1

            visible: false

        }


        AirplaneSearchTag {
            id: airplaneSearchTag2

            visible: false
        }

        AirplaneSearchTag {
            id: airplaneSearchTag3

            visible: false
        }

        AirplaneSearchTag {
            id: airplaneSearchTag4

            visible: false
        }
        Text {
            id: endLabel
            color: "#80ffffff"
            text: qsTr("End of results.")
            font.pixelSize: 24
            font.family: "Inter"
            visible: pageSelectButton.currentPage == pageSelectButton.lastPage
        }
    }

    PageSelectButton {
        id: pageSelectButton
        x: 1301
        y: 787

        lastPage: content.dbData[0][0]

        onPageChanged: internal.updateDb()
    }

    Connections {
        target: backend
    }


}


