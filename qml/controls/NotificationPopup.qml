import QtQuick 2.12
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import AppUtil 1.0

ShadowedRectangle{
    id: root
    visible: false
    width: childrenRect.width
    height: 40
    radius: height/2

    property string text
    property string source
    property alias iconEnabled: notificationIcon.visible

    function open(notificationText, imageSource){
        opacityAnimation.stop();
        visible = true;
        opacity = 1;

        text = notificationText;
        source = imageSource;

        timer.start();
    }

    Timer{
        id: timer
        interval: 2000

        onTriggered: {
            opacityAnimation.start();
        }
    }

    Row{
        width: childrenRect.width
        height: parent.height
        leftPadding: 10
        spacing: 10

        Image {
            id: notificationIcon
            source: root.source
            width: visible ? 25 : 0
            height: width
            sourceSize: Qt.size(width,height)
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            height: parent.height
            width: contentWidth + 20
            text: root.text
            color: "#323232"
            font.family: AppUtil.font1.name
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
        }

    }


    NumberAnimation{
        id: opacityAnimation
        target: root
        properties: "opacity"
        to: 0
        duration: 2000

        onStopped: {
            visible = false;
        }
    }

}
