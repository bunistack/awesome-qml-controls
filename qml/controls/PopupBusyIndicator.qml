import QtQuick 2.7
import QtQuick.Controls 2.2
import AppUtil 1.0

Popup{
    id: root
    width: 180
    height: 60
    clip: true
    padding: 2
    modal: true
    closePolicy: Popup.NoAutoClose

    onClosed: {
        if(running) running = false;
        timeoutTimer.stop();
    }

    background: Rectangle{        
        radius: 6
    }

    property alias timeoutInterval: timeoutTimer.interval
    property alias text: indicatorText.text
    property alias fontsize: indicatorText.font.pixelSize
    property alias running: control.running

    signal timeout()

    onTimeout: close();

    function run(indicatorText){
        text = indicatorText;
        running = true;
        timeoutTimer.restart();
        root.open();
    }

    Timer{
        id: timeoutTimer
        interval: 20000
        onTriggered: timeout()
    }

    Rectangle{
        anchors.fill: parent

        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height
            width: childrenRect.width
            spacing: 10

            Spinner{
                id: control
                running: false
                size: root.height - 15
                anchors.verticalCenter: parent.verticalCenter
            }

            Text{
                id: indicatorText
                text: "Loading"
                font.family: AppUtil.font1.name
                width: contentWidth + 10
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
            }

            //end of row
        }

    }

    //end of root
}
