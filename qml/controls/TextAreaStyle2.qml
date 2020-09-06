import QtQuick 2.7
import QtQuick.Controls 2.2
import AppUtil 1.0
import Clipboard 1.0

TextArea {
    id: control
    wrapMode: TextArea.Wrap
    font.pixelSize: 13
    color: "#353637"
    topPadding: labelContainer.visible ? labelContainer.height : 5
    bottomPadding: bottomPanel.visible ? bottomPanel.height : 5
    font.family: AppUtil.font1.name
    selectionColor: "#fddd5c"
    selectedTextColor: "#353637"

    property int maximumLength: 10000
    property bool bottomPanelVisible: true
    property bool labelContainerVisible: true

    signal actionButtonClicked(int index)

    onActionButtonClicked: {
        switch(index){
        case 0:
            control.clear();
            break;
        case 1:
            clipboard.setText(text)
            break;
        case 2:
            control.append(clipboard.getText())
            break;
        default:
            break;
        }
    }

    onTextChanged: {

        if(length > maximumLength){
            var txt = text;
            txt = txt.slice(0,maximumLength);
            text = txt;
            cursorPosition = length;
        }
    }

    function reset(){
        clear();
    }

    background: Rectangle {
        anchors.fill: parent

        Rectangle{
            id: labelContainer
            width: parent.width
            height: visible ? 30 : 0
            visible: labelContainerVisible ? text !== "" : false
            color: Qt.rgba(0,0,0,0)
            anchors.top: parent.top

            Text {
                text: control.placeholderText
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                font.family: AppUtil.font1.name
                font.pixelSize: 14
                font.bold: true
                color: control.focus ? "#ffe400" : "#323232"
                leftPadding: 8
            }
        }

        Row{
            id: bottomPanel
            width: parent.width
            height: visible ? 30 : 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            visible: bottomPanelVisible
            layoutDirection: Qt.RightToLeft
            rightPadding: 10
            spacing: 30

            CircularProgressBar{
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                fillBackgroundOnClicked: false
                primaryLineWidth: 3
                secondaryLineWidth: 3
                primaryColor: "#f0f0f0"
                secondaryColor: "#ffe400"
                textVisible: false
                minimumValue: 0
                maximumValue: control.maximumLength
                currentValue: control.length
            }

            Row{
                width: childrenRect.width
                height: parent.height
                spacing: 10

                Repeater{
                    model: [
                        "qrc:/assets/images/icons/pastel/clear_pastel.png",
                        "qrc:/assets/images/icons/pastel/copy_pastel.png",
                        "qrc:/assets/images/icons/pastel/paste_pastel.png"
                    ]

                    Image {
                        source: modelData
                        width: 25
                        height: 25
                        anchors.verticalCenter: parent.verticalCenter
                        sourceSize: Qt.size(width,height)

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: actionButtonClicked(index)
                        }
                    }
                }
            }
        }

        Rectangle{
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: 1.5
            width: parent.width - 20
            radius: height/2
            color: control.focus ? "#ffe400" : "#323232"
        }

        //end of background
    }

    Clipboard{
        id: clipboard
    }

    //end of root
}
