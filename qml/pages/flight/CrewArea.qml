import QtQuick 2.15
import "../../controls"
import "../../others"

Item {
    width: 1220
    height: 640


    Rectangle {
        id: tempBg
        x: 0
        y: 0
        width: 1220
        height: 640
        color: "#030313"

        TicketEnvelope {
            id: ticketEnvelope1
            x: 0
            y: 0
            width: 1220
            height: 200
            dashed: false

            NavigatorButton {
                id: crewBtn1
                x: 47
                width: 155
                anchors.top: crewTypeVar1.bottom
                anchors.topMargin: 10
                btnText: "123456"
                customFontSize: 28
            }

            Text {
                id: crewNameVar1
                x: 47
                width: 157
                height: 26
                color: "#ffffff"
                text: "Name Surname"
                anchors.top: crewBtn1.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 10
                font.family: "Inter"
            }

            Text {
                id: contactLabel1
                x: 716
                y: 67
                width: 196
                height: 26
                color: "#80ffffff"
                text: "CONTACT NUMBER"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            Text {
                id: licenseLabel1
                y: 67
                width: 180
                height: 26
                color: "#80ffffff"
                text: "LICENSE NUMBER"
                anchors.left: contactLabel1.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 60
                font.family: "Inter"
            }

            ColoredTag {
                id: crewTypeVar1
                x: 47
                y: 32
                customText: "UNKNOWN"
            }

            Text {
                id: contactVar1
                y: 82
                width: 157
                height: 26
                color: "#ffffff"
                text: "UNKNOWN"
                anchors.left: contactLabel1.left
                anchors.top: contactLabel1.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Inter"
                anchors.topMargin: 10
            }

            Text {
                id: licenseVar1
                y: 104
                width: 157
                height: 26
                color: "#ffffff"
                text: "UNKNOWN"
                anchors.left: licenseLabel1.left
                anchors.top: licenseLabel1.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Inter"
                anchors.topMargin: 10
            }
        }

        TicketEnvelope {
            id: ticketEnvelope2
            x: 0
            y: 220
            width: 1220
            height: 200
            dashed: false
            NavigatorButton {
                id: crewBtn2
                x: 47
                width: 155
                anchors.top: crewTypeVar2.bottom
                btnText: "123456"
                customFontSize: 28
                anchors.topMargin: 10
            }

            Text {
                id: crewNameVar2
                x: 47
                width: 157
                height: 26
                color: "#ffffff"
                text: "Name Surname"
                anchors.top: crewBtn2.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
                anchors.topMargin: 10
            }

            Text {
                id: contactLabel2
                x: 716
                y: 67
                width: 196
                height: 26
                color: "#80ffffff"
                text: "CONTACT NUMBER"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            Text {
                id: licenseLabel2
                y: 67
                width: 180
                height: 26
                color: "#80ffffff"
                text: "LICENSE NUMBER"
                anchors.left: contactLabel2.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 60
                font.family: "Inter"
            }

            ColoredTag {
                id: crewTypeVar2
                x: 47
                y: 32
                customText: "UNKNOWN"
            }

            Text {
                id: contactVar2
                y: 82
                width: 157
                height: 26
                color: "#ffffff"
                text: "UNKNOWN"
                anchors.left: contactLabel2.left
                anchors.top: contactLabel2.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Inter"
                anchors.topMargin: 10
            }

            Text {
                id: licenseVar2
                y: 104
                width: 157
                height: 26
                color: "#ffffff"
                text: "UNKNOWN"
                anchors.left: licenseLabel2.left
                anchors.top: licenseLabel2.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Inter"
                anchors.topMargin: 10
            }
        }

        TicketEnvelope {
            id: ticketEnvelope3
            x: 0
            y: 440
            width: 1220
            height: 200
            dashed: false
            NavigatorButton {
                id: crewBtn3
                x: 47
                width: 155
                anchors.top: crewTypeVar3.bottom
                btnText: "123456"
                customFontSize: 28
                anchors.topMargin: 10
            }

            Text {
                id: crewNameVar3
                x: 47
                width: 157
                height: 26
                color: "#ffffff"
                text: "Name Surname"
                anchors.top: crewBtn3.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
                anchors.topMargin: 10
            }

            Text {
                id: contactLabel3
                x: 716
                y: 67
                width: 196
                height: 26
                color: "#80ffffff"
                text: "CONTACT NUMBER"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            Text {
                id: licenseLabel3
                y: 67
                width: 180
                height: 26
                color: "#80ffffff"
                text: "LICENSE NUMBER"
                anchors.left: contactLabel3.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 60
                font.family: "Inter"
            }

            ColoredTag {
                id: crewTypeVar3
                x: 47
                y: 32
                customText: "UNKNOWN"
            }

            Text {
                id: contactVar3
                y: 82
                width: 157
                height: 26
                color: "#ffffff"
                text: "UNKNOWN"
                anchors.left: contactLabel3.left
                anchors.top: contactLabel3.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Inter"
                anchors.topMargin: 10
            }

            Text {
                id: licenseVar3
                y: 104
                width: 157
                height: 26
                color: "#ffffff"
                text: "UNKNOWN"
                anchors.left: licenseLabel3.left
                anchors.top: licenseLabel3.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Inter"
                anchors.topMargin: 10
            }
        }
    }

}


