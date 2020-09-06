import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.12

Rectangle {
    id: root
    layer.enabled: shadowEnabled
    layer.effect: DropShadow{
        id: shadow
        cached: true
        radius: 8.0
        samples: 1+radius*2
        color: shadowColor
        verticalOffset: root.verticalOffset
        horizontalOffset: root.horizontalOffset
        spread: root.spread
    }

    property bool shadowEnabled: true
    property color shadowColor: Qt.rgba(100/255,100/255,100/255,0.3)

    property real spread: 0.0
    property real verticalOffset: 0
    property real horizontalOffset: 0

    //end of root
}
