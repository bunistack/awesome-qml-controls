import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: control    

    property alias icon: controlIcon
    property alias padding: controlRow.padding
    property alias buttonText: controlText

    signal clicked()

    Row{
        id: controlRow
        anchors.fill: parent
        spacing: 10

        Image {
            id: controlIcon
            width: 30
            height: 30
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: controlText
            height: parent.height
            width: parent.width - controlIcon.width - parent.spacing
            wrapMode: Text.Wrap
            verticalAlignment: Text.AlignVCenter
            font.underline: controlMouseArea.containsMouse
            text: "button"
            color: "#323232"
        }
    }

    MouseArea{
        id: controlMouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            control.clicked()
        }
    }

    //end of button
}
