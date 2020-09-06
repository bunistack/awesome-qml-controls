import QtQuick 2.12

import AppUtil 1.0

Row{
    leftPadding: 5

    property alias iconSource: image.source
    property alias label: label.text
    property alias text: text.text

    Image {
        id: image
        width: 25
        height: 25
        sourceSize.width: width
        sourceSize.height: height
        anchors.verticalCenter: parent.verticalCenter
    }

    Column{
        height: parent.height
        width: parent.width - 25
        leftPadding: 10

        Text {
            id: label
            verticalAlignment: Text.AlignVCenter
            font.family: AppUtil.font1.name
            font.pixelSize: 14
            color: "#323232"
            width: parent.width
            elide: Text.ElideRight
        }

        Text {
            id: text
            verticalAlignment: Text.AlignVCenter
            font.family: AppUtil.font1.name
            font.pixelSize: 14
            font.bold: true
            width: parent.width
            elide: Text.ElideRight
            rightPadding: 10
        }
    }
}
