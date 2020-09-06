import Felgo 3.0
import QtQuick 2.0
import SVG 1.0

import "./controls"

App {
    width: 900
    height: 600

    Rectangle{
        anchors.fill: parent

        GhostButton{
            width: 150
            height: 40
            anchors.centerIn: parent
            text: "Open"
            backgroundColor: "#ffe400"

            onClicked: colorChooser.run(1)
        }

    }

}
