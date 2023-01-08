import QtQuick 2.15
import QtQuick.Controls 2.15

ComboBox {
    id: control
    model: ["Unknown"]

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"

    property var itemID: []

    property string placeholderText: ""
    property string typedText: customTextBox.text

    width: 200
    height: 50

    font.family: "Inter"
    font.pixelSize: 26

    editable: true

    delegate: ItemDelegate {

        id: itDelegate

        width: control.width
        contentItem: Text {
            id: contentItem
            text: control.textRole
                ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole])
                : modelData
            color: "#ffffff"
            font: control.font
            elide: Text.ElideRight
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: 3

        }
        highlighted: control.highlightedIndex === index
        onClicked: {
            customTextBox.text = contentItem.text
        }

        background: Rectangle {
            color: itDelegate.highlighted ? "#00ffffff" : "#1affffff"
        }
    }

    //down arrow
    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = control.pressed ? control.colorPressed : control.colorDefault
            context.fill();
        }
    }


    contentItem: TextField {

        id: customTextBox


        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.rightMargin: 45
        anchors.leftMargin: 5
        font.pixelSize: 26
        font.family: "Inter"
        placeholderTextColor: "#ffffff"
        placeholderText: placeholderText

        background: Rectangle {

            color: "#00ffffff"
            border.color: "#0dffffff"
            border.width: 2
            radius: 10

        }


        text: control.displayText
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: control.pressed ? control.colorPressed : control.colorDefault
    }

    background: Rectangle {
        color: "#1affffff"
        radius: 10
        anchors.fill: parent
    }

    popup: Popup {
        y: control.height + 10
        width: control.width - 20
        implicitHeight: control.height*5
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            color: "#1C1C2A"
            radius: 10
        }
    }
}
