import QtQuick 2.12
import AppUtil 1.0

ShadowedRectangle{
    id: root
    width: 320
    height: 50
    radius: 8
    verticalOffset: 2
    horizontalOffset: -2
    shadowColor: Qt.rgba(100/255,100/255,100/255,0.3)

    property alias icon: image
    property alias label: label
    property alias text: text

    property real iconSize: 25

    signal clicked()

    Row{
        anchors.fill: parent
        leftPadding: 15

        Image {
            id: image
            width: iconSize
            height: iconSize
            sourceSize.width: width
            sourceSize.height: height
            anchors.verticalCenter: parent.verticalCenter
        }

        Column{
            height: parent.height
            width: parent.width - 25
            leftPadding: 20

            Text {
                id: label
                verticalAlignment: Text.AlignVCenter
                font.family: AppUtil.font1.name
                font.pixelSize: 14
                color: "#323232"
                width: parent.width
                height: parent.height/2
                elide: Text.ElideRight
            }

            Text {
                id: text
                verticalAlignment: Text.AlignVCenter
                font.family: AppUtil.font1.name
                font.pixelSize: 14
                font.bold: true
                width: parent.width
                height: parent.height/2
                elide: Text.ElideRight
                rightPadding: 10
                wrapMode: Text.Wrap
            }
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }
    //end of root
}
