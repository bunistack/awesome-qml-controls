import QtQuick 2.12
import QtQuick.Controls 2.5
import AppUtil 1.0

Popup {
    id: root
    width: 320
    height: 330
    modal: true
    closePolicy: Popup.CloseOnEscape
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        radius: 8
    }

    property var callback
    property bool isCallbackSet: false

    property string source
    property string text: ""

    function run(messageText,imageSource,callable){

        if(callable !== null){
            callback = callable;
            isCallbackSet = true;
        }else{
            isCallbackSet = false;
        }

        source = imageSource;
        text = messageText;

        root.open();
    }

    Rectangle{
        anchors.fill: parent

        Column{
            anchors.fill: parent
            spacing: 10

            Text {
                text: "Error"
                width: parent.width
                height: 30
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "#323232"
                font.bold: true
                font.family: AppUtil.font1.name
                font.pixelSize: 25
            }

            Image {
                source: root.source
                width: parent.width
                height: 150
                fillMode: Image.PreserveAspectFit
                sourceSize.width: width
            }

            Text {
                text: root.text
                width: parent.width
                height: 50
                font.pixelSize: 15
                font.family: AppUtil.font1.name
                color: "#323232"
                wrapMode: Text.Wrap
                clip: true
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            MaterialButton{
                width: 200
                height: 50
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
