import QtQuick 2.7
import QtQuick.Controls 2.2
import AppUtil 1.0


CheckBox {
    id: control
    text: "CheckBox"
    font.family: AppUtil.font1.name
    font.pixelSize: 16
    checked: false

    property color indicatorColor: "#323232"
    property real indicatorRadius: control.height/2
    property color indicatorImageColor: "#ffe400"
    property string indicatorImageSource: "qrc:/assets/images/icons/checkmark_white.png"
    property bool fillBackground: true

    indicator: Rectangle {
        implicitWidth: parent.height
        implicitHeight: parent.height
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        radius: indicatorRadius
        border.color: indicatorColor
        color: fillBackground ? control.checked ? indicatorColor : "white" : "white"

        ColoredImage {
            anchors.fill: parent
            anchors.margins: 4
            source: indicatorImageSource
            visible: control.checked
            color: indicatorImageColor
        }

    }

    contentItem: Text {
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#646464" : "#323232"
        verticalAlignment: Text.AlignVCenter
        leftPadding: indicator.width+ 20
    }
}
