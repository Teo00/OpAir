import QtQuick 2.15
import QtQuick.Controls 2.15

ComboBox {
    id: control
    model: ["Unknown"]

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"

    property var itemID: []

    font.family: "Inter"
    font.pixelSize: 26


    delegate: ItemDelegate {

        id: itDelegate

        width: control.width
        contentItem: Text {
            text: control.textRole
                ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole])
                : modelData
            color: "#ffffff"
            font: control.font
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === index
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


    contentItem: Text {
        leftPadding: 5
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: control.pressed ? control.colorPressed : control.colorDefault
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        color: "#1affffff"
        implicitWidth: 120
        implicitHeight: 40
        radius: 10
    }

    popup: Popup {
        y: control.height + 10
        width: control.width
        implicitHeight: contentItem.implicitHeight
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
