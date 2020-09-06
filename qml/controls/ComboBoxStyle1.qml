import QtQuick 2.12
import QtQuick.Controls 2.2
import AppUtil 1.0

ComboBox {
    id: control
    width: 320
    height: 70
    font.family: AppUtil.font1.name
    font.pixelSize: 15

    property alias iconSource: icon.source    

    contentItem: Row{
        clip: true
        spacing: 10
        leftPadding: 10

        Image{
            id: icon
            width: 25
            height: 25
            source: ""
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            text: control.displayText
            font: control.font
            color: "black"
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            anchors.verticalCenter: parent.verticalCenter
        }

        //end of contentItem
    }

    delegate: ItemDelegate {
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter

        contentItem: Text {
            text: modelData
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        highlighted: control.highlightedIndex === index
    }

    background: ShadowedRectangle {
        anchors.fill: parent
        radius: 6
        clip: true
        shadowColor: control.focus ? Qt.rgba(255/255,228/255,0/255,1) : Qt.rgba(100/255,100/255,100/255,0.3)

        //end of background
    }

    popup: Popup {
        y: control.height - 1
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

        background: ShadowedRectangle {
            anchors.fill: parent
            radius: 6
        }

        //end of Popup
    }

    //end of root
}
