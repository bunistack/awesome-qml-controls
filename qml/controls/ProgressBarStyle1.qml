import QtQuick 2.12
import QtQuick.Controls 2.5
import AppUtil 1.0

Rectangle {
    id: root

    property color indicatorColor: "#182238"

    property alias control: control
    property alias displayText: displayText.text

    signal timeout()

    Timer{
        id: operationsTimer
        interval: 20000
        onTriggered: timeout()
    }

    Column{
        anchors.fill: parent

        Text {
            id: displayText
            text: "Uploading"
            width: parent.width
            height: 30
            font.pixelSize: 14
            font.family: AppUtil.font1.name
            verticalAlignment: Text.AlignVCenter
            color: "#323232"
        }

        ProgressBar{
            id: control
            width: parent.width
            height: 5
            indeterminate: true

            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 6
                color: "#e6e6e6"
                radius: 3
            }

            contentItem: Item {
                implicitWidth: root.width
                implicitHeight: control.height
                clip: true

                Rectangle {
                    id: controlContentItem
                    x: control.indeterminate ? 0 : 0
                    width: control.indeterminate ? 30 : control.visualPosition * parent.width
                    height: parent.height
                    radius: 2
                    color: indicatorColor
                }
            }

            //end of ProgressBar
        }

        Text {
            id: progressText
            text: Math.round(control.value * 100) + "%"
            width: parent.width
            height: 30
            font.pixelSize: 14
            font.family: AppUtil.font1.name
            verticalAlignment: Text.AlignVCenter
        }

        //end of column
    }

    NumberAnimation {
        target: controlContentItem
        property: "x"
        duration: 2000
        easing.type: Easing.Linear
        from: 0
        to: root.width
        running: control.indeterminate
        loops: Animation.Infinite
    }

    //end of root
}
