import QtQuick 2.11

Item {
    id: root
    width: size
    height: size    
    visible: running

    property real indicatorSize: 8
    property int indicatorCount: 7
    property color indicatorColor: "#ffe400"
    property real size: 50

    property bool running: true
    property int delayTime: durationTime / 12
    property int durationTime: 1500

    Repeater{
        model: indicatorCount

        Rectangle{
            id: hand
            width: parent.width/2
            height: 1
            x: parent.width/2
            y: parent.height/2
            color: "transparent"
            transformOrigin: Item.Left
            rotation: -90

            Rectangle{
                id: indicator
                width: indicatorSize
                height: indicatorSize
                anchors.right: parent.right
                color: indicatorColor
                radius: width/2
                anchors.verticalCenter: parent.verticalCenter

            }

            Timer{
                running: root.running
                interval: (indicatorCount * delayTime) + durationTime
                onTriggered: sequentialAnimation.start();
                repeat: true
                triggeredOnStart: true
            }

            SequentialAnimation{
                id: sequentialAnimation

                PauseAnimation {
                    duration: index * delayTime
                }

                NumberAnimation {
                    target: hand
                    property: "rotation"
                    duration: durationTime
                    easing.type: Easing.InOutQuad
                    from: -90
                    to: 270
                }
            }

            //end of hand
        }

        //end of Repeater
    }

    //end of root
}
