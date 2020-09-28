import QtQuick 2.7
import QtQuick.Controls 2.2
import AppUtil 1.0

Button{
    id: control
    width: 130
    height: 50
    font.family: AppUtil.font1.name
    font.pixelSize: 16

    property color backgroundColor: "#f0f0f0"
    property color animatedBackgroundColor: Qt.rgba(1,1,1,0.5)
    property color colorDown: colorUp
    property color colorUp: "white"
    property color shadowColorDown: Qt.rgba(100/255,100/255,100/255,0.8)
    property color shadowColorUp: Qt.rgba(100/255,100/255,100/255,0.5)

    property bool shadowEnabled: true
    property real btnRadius: 6

    contentItem: Text{
        text: control.text
        font: control.font
        color: control.down ? colorDown : colorUp
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: ShadowedRectangle {
        anchors.fill: parent
        shadowEnabled: shadowEnabled
        shadowColor: control.down ? shadowColorDown : shadowColorUp        
        radius: btnRadius
        color: backgroundColor

        Rectangle{
            id: animatedBackground
            anchors.centerIn: parent
            color: animatedBackgroundColor
            scale: 0
            width: parent.width > parent.height ? parent.width : parent.height
            height: width
            radius: width/2

            ParallelAnimation{
                id: btnBackgroundAnim

                NumberAnimation{
                    target: animatedBackground
                    property: "scale"
                    from: 0
                    duration: 300
                    to: 1
                }

                NumberAnimation{
                    target: animatedBackground
                    property: "opacity"
                    from: 1
                    duration: 300
                    to: 0
                }

                onStopped: {
                    animatedBackground.opacity = 1;
                    animatedBackground.scale = 0;
                }
            }

            //end of animated rectangle
        }

    }

    onClicked: {
        btnBackgroundAnim.start();
    }
}

