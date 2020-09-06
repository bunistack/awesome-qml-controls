import QtQuick 2.0

Rectangle {
    id: root
    width: 80
    height: (7/8)*width
    color: Qt.rgba(0,0,0,0)    

    property color indicatorColor: "#323232"
    property alias size: root.width
    property int duration: 400
    property int animation: 0

    function changeAnimation(value){
        animation = value;
    }


    Row{
        id: row
        anchors.fill: parent
        spacing: (7/80) * root.width

        Repeater{
            id: repeater
            model: 4

            Rectangle{
                id: animatedRect
                y: root.height-height
                width: root.width/repeater.count-((repeater.count-1)*row.spacing)/repeater.count
                height: width
                color: indicatorColor
                radius: width/2

                Timer{
                    interval: 500
                    onTriggered:{
                        secondTimer.start();
                        animation === 0 ? animation1.start() : animation2.start();
                    }
                    running: true
                }

                Timer{
                    id: secondTimer
                    interval: (repeater.count*100) + (2*root.duration)
                    running: true
                    repeat: true
                    onTriggered: if(animation === 0)  animation1.start()
                }

                SequentialAnimation{
                    id: animation1

                    PauseAnimation {
                        duration: index===0 ? 0 : 100*index
                    }

                    NumberAnimation{
                        target: animatedRect
                        property: "y"
                        to: root.height/2
                        duration: root.duration
                    }

                    NumberAnimation{
                        target: animatedRect
                        property: "y"
                        to: root.height-animatedRect.height
                        duration: root.duration
                    }

                    //end of animation one
                }


                SequentialAnimation{
                    id: animation2
                    loops: Animation.Infinite

                    PauseAnimation {
                        duration: index===0 ? 0 : 100*index
                    }

                    NumberAnimation{
                        target: animatedRect
                        property: "height"
                        to: root.height
                        duration: root.duration
                    }

                    NumberAnimation{
                        target: animatedRect
                        property: "height"
                        to: animatedRect.width
                        duration: root.duration
                    }

                    //end of animation two
                }


                //end of Rectangle
            }

            //end of repeater
        }

        //end of row
    }

    //end of root
}
