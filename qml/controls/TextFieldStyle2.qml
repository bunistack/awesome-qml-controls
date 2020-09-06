import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import AppUtil 1.0

Rectangle {
    id: root
    width: 320
    height: 70

    property alias icon: lineEditIcon
    property alias lineEdit: control

    property alias text: control.text

    property string regex: ""

    property bool textValid: false
    property alias textValidityIndicator: validityIndicatorCnt
    property bool validityIndicatorEnabled: true

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

    function showTextValidityIndicator(){
        textValidityIndicator.visible = true;
    }

    function hideTextValidityIndicator(){
        textValidityIndicator.visible = false;
    }

    function reset(){
        lineEdit.clear();
        hideTextValidityIndicator();
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
                leftPadding: iconContainer.width + lineEdit.leftPadding
                font.pixelSize: 14
                font.family: AppUtil.font1.name
                color: "#ffe400"
            }

            //end of labelContainer
        }

        Row{
            width: parent.width
            height: parent.height - labelContainer.height

            Rectangle{
                id: iconContainer
                width: parent.height
                height: parent.height

                Image {
                    id: lineEditIcon
                    width: 30
                    height: 30
                    anchors.centerIn: parent
                }
            }

            TextField{
                id: control
                width: (parent.width - iconContainer.width - validityIndicatorCnt.width)
                height: parent.height
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                leftPadding: 15
                clip: true
                selectionColor: "#fddd5c"
                selectedTextColor: "#353637"
                verticalAlignment: TextField.AlignVCenter

                background: Rectangle{
                    border.width: 0
                    clip: true
                }

                onTextChanged: {

                    validateString(control.text);
                    if(!validityIndicatorCnt.visible && validityIndicatorEnabled && control.enabled){
                        validityIndicatorCnt.visible = true;
                    }
                }
                //end of textfield
            }

            Rectangle{
                id: validityIndicatorCnt
                visible: false
                height: parent.height
                width: visible ? validityIndicator.width + 10 : 0

                Image {
                    id: validityIndicator
                    width: 25
                    height: 25
                    anchors.centerIn: parent
                    source: textValid ? "qrc:/assets/images/icons/checkmark_grey.png" : "qrc:/assets/images/icons/error_grey.png"
                }
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
}
