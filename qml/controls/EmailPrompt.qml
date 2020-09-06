import QtQuick 2.12
import QtQuick.Controls 2.5
import AppUtil 1.0

Popup {
    id: root
    width: 320
    height: 190
    modal: true
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        radius: 8
    }

    property var callback

    function run(callable){
        callback = callable;
        emailEdit.lineEdit.clear();
        root.open();
    }

    Rectangle{
        anchors.fill: parent

        Column{
            anchors.fill: parent
            spacing: 15

            Text {
                text: "Hey, we kindly need your email!"
                width: parent.width
                height: 40
                color: "#323232"
                verticalAlignment: Text.AlignVCenter
                leftPadding: 10
                font.pixelSize: 18
                font.bold: true
                font.family: AppUtil.font1.name
            }

            TextFieldStyle1{
                id: emailEdit
                width: 300
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                icon.source: "qrc:/assets/images/icons/email_grey.png"
                lineEdit.placeholderText: "Email"
                regex: "^([\\w]+\\.?)+@([\\w]+\\.)+([\\w]+\\.?)+\\w$"
            }

            Row{
                width: parent.width
                height: 40
                spacing: 10
                rightPadding: 5
                layoutDirection: Qt.RightToLeft

                MaterialButton{
                    width: 100
                    height: parent.height
                    text: "Submit"
                    font.family: AppUtil.font1.name
                    font.pixelSize: 16
                    colorUp: "white"
                    backgroundColor: "#323232"

                    onClicked: {
                        if(!emailEdit.textValid){
                            emailEdit.textValidityIndicator.visible = true;
                            return;
                        }

                        root.close();
                        callback(emailEdit.text);
                    }
                }

                MaterialButton{
                    width: 100
                    height: parent.height
                    text: "Close"
                    font.family: AppUtil.font1.name
                    font.pixelSize: 16
                    colorUp: "#323232"
                    backgroundColor: "white"

                    onClicked: {
                        root.close();
                    }
                }

                //end of row
            }

            //end of column
        }
    }

    //end of root
}
