import QtQuick 2.7
import VPlayApps 1.0
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import AppUtil 1.0

Rectangle {
    width: 320
    height: 70

    property alias icon: lineEditIcon
    property alias lineEdit: control
    property alias text: control.text
    property string regex: ""
    property bool passwordShowable: true
    property bool textValid: true

    function validateString(text){

        if(regex === ""){
            textValid = true;
            return;
        }

        var patt = new RegExp(regex);
        var result = patt.test(text);

        if(result){
            textValid = true;
        }else{
            textValid = false;

        }
    }

    function isEmpty(){

        var fieldText = text;

        var reg = "^( )+$";
        var patt = new RegExp(reg);

        if(fieldText===""){
            textValid = false;
            return true;
        }

        var result = patt.test(fieldText);

        if(result){
            textValid = false;
            return true;
        }else{
            textValid = true;
            return false;
        }
    }

    Column{
        anchors.fill: parent
        anchors.margins: 2

        Rectangle{
            id: labelContainer
            width: parent.width
            height: visible ? 20 : 0
            clip: true
            visible: lineEdit.text !== ""

            Text {
                id: labelText
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                text: lineEdit.placeholderText
                leftPadding: 10
                font.pixelSize: 14
                font.family: AppUtil.font1.name
                color: control.focus ? "#ffe400" : "#323232"
            }

            //end of labelContainer
        }

        Row{
            width: parent.width
            height: parent.height - labelContainer.height

            Rectangle{
                id: iconContainer
                width: enableWidth ? parent.height : 0
                height: parent.height

                property bool enableWidth: true

                Image {
                    id: lineEditIcon
                    width: 30
                    height: 30
                    anchors.centerIn: parent
                    source: "qrc:/assets/images/icons/password_grey.png"
                }
            }

            TextField{
                id: control
                width: (parent.width-iconContainer.width) - (showPassword.visible ? showPasswordCnt.width : 0)
                height: parent.height
                font.family: AppUtil.font1.name
                font.pixelSize: echoMode === TextField.Password && Theme.isAndroid && text !== "" ? 12 : 16
                leftPadding: 15
                clip: true
                selectionColor: "#fddd5c"
                selectedTextColor: "#353637"
                verticalAlignment: TextField.AlignVCenter
                echoMode: showPassword.passwordVisible ? TextField.Normal : TextField.Password

                background: Rectangle{
                    border.width: 0
                    clip: true

                }

                onTextChanged: {

                    validateString(control.text);
                    if(control.enabled){
                        textValid = true;
                    }
                }
                //end of textfield
            }

            Rectangle{
                id: showPasswordCnt
                height: parent.height
                width: showPassword.width + 10

                Image {
                    id: showPassword
                    width: 25
                    height: 25
                    anchors.centerIn: parent
                    source: passwordVisible ? "qrc:/assets/images/icons/hide_grey.png" : "qrc:/assets/images/icons/show_grey.png"

                    property bool passwordVisible: false
                }

                MouseArea{
                    anchors.fill: parent
                    enabled: passwordShowable
                    onClicked: {
                        if(showPassword.passwordVisible)
                            showPassword.passwordVisible = false;
                        else
                            showPassword.passwordVisible = true;
                    }
                }

                //end of showPasswordCnt
            }

            //end of row
        }

        //end of column
    }

    Rectangle{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: 1.5
        width: parent.width - 20
        radius: height/2
        color: control.focus ? "#ffe400" : "#323232"
    }

    //end of root
}
