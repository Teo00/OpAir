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
            content.dbData = (innerSearchBar.text.length > 0) ? backend.search(6, pageSelectButton.currentPage, innerSearchBar.text) : [[1]]
            updateData()
        }

        //crew : [[crewID, firstName, lastName, type]]

        function updateData() {

            if(dbData.length-1 >= 1){
                crewSearchTag1.visible = true
                crewSearchTag1.crewID = dbData[1][0]
                crewSearchTag1.name = dbData[1][1]
                crewSearchTag1.surname = dbData[1][2]
                crewSearchTag1.crewType = dbData[1][3]
            }else {
                crewSearchTag1.visible = false
            }

            if(dbData.length-1 >= 2){
                crewSearchTag2.visible = true
                crewSearchTag2.crewID = dbData[2][0]
                crewSearchTag2.name = dbData[2][1]
                crewSearchTag2.surname = dbData[2][2]
                crewSearchTag2.crewType = dbData[2][3]
            }else {
                crewSearchTag2.visible = false
            }

            if(dbData.length-1 >= 3){
                crewSearchTag3.visible = true
                crewSearchTag3.crewID = dbData[3][0]
                crewSearchTag3.name = dbData[3][1]
                crewSearchTag3.surname = dbData[3][2]
                crewSearchTag3.crewType = dbData[3][3]
            }else {
                crewSearchTag3.visible = false
            }

            if(dbData.length-1 >= 4){
                crewSearchTag4.visible = true
                crewSearchTag4.crewID = dbData[4][0]
                crewSearchTag4.name = dbData[4][1]
                crewSearchTag4.surname = dbData[4][2]
                crewSearchTag4.crewType = dbData[4][3]
            }else {
                crewSearchTag4.visible = false
            }

        }

    }

    InnerSearchBar {
        id: innerSearchBar
        x: 295
        y: 24
        width: 976
        height: 70
        customText: "Search crew by typing ID, name, surname or crew-type..."

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

        CrewSearchTag {
            id: crewSearchTag1

            visible: false

        }


        CrewSearchTag {
            id: crewSearchTag2

            visible: false
        }

        CrewSearchTag {
            id: crewSearchTag3

            visible: false
        }

        CrewSearchTag {
            id: crewSearchTag4

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


