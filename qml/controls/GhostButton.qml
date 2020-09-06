import QtQuick 2.12
import QtQuick.Controls 2.5
import AppUtil 1.0

Button {
    id: control
    hoverEnabled: true
    focus: true
    font.pixelSize: 16
    font.family: AppUtil.font1.name

    property color outlineColor: "#ffe400"
    property color colorDown: Qt.lighter(colorUp, 1.75)
    property color colorUp: "#ffe400"
    property color colorHovered: colorDown
    property color backgroundColor: "#ffffff"
    property color backgroundHoverColor: backgroundColor

    property real radius: height/2
    property real outlineWidth: 2

    property bool isTransparent: true

    contentItem: Text{
        text: control.text
        font: control.font
        color: control.down ? colorDown : (control.hovered ? colorHovered : colorUp)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle{
        color: Qt.rgba(0,0,0,0)

        Rectangle{
            anchors.fill: parent
            border.width: outlineWidth
            border.color: outlineColor
            radius: control.radius
            color: control.hovered ? backgroundHoverColor : (isTransparent ? Qt.rgba(0,0,0,0) : backgroundColor)
        }
    }

    //end of button
}
