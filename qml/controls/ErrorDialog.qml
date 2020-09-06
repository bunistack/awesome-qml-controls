import QtQuick 2.12
import QtQuick.Controls 2.5
import AppUtil 1.0

Popup {
    id: root
    width: 320
    height: 170
    modal: true
    closePolicy: Popup.CloseOnEscape
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        radius: 8
    }

    property var callback
    property bool isCallbackSet: false

    property string text: ""

    function run(messageText, callable){

        if(callable !== null){
            callback = callable;
            isCallbackSet = true;
        }else{
            isCallbackSet = false;
        }

        text = messageText;

        root.open();
    }

    Rectangle{
        anchors.fill: parent

        Column{
            anchors.fill: parent
            spacing: 10

            Text {
                text: root.text
                width: parent.width
                height: 100
                font.pixelSize: 15
                font.family: AppUtil.font1.name
                color: "#323232"
                wrapMode: Text.Wrap
                clip: true
                elide: Text.ElideRight                
                verticalAlignment: Text.AlignVCenter
            }

            MaterialButton{
                id: button
                width: 200
                height: 40
                text: "OK"
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                colorUp: "#aa0000"
                backgroundColor: "white"
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {

                    root.close();

                    if(isCallbackSet){
                        callback();
                    }

                }

            }

            //end of column
        }

        //end of main Rectangle
    }

    //end of root
}
