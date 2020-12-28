import Felgo 3.0
import QtQuick 2.0
import SVG 1.0

import "./controls"

App {
    width: 900
    height: 600

    Rectangle{
        anchors.fill: parent

        RoundedItem{
            width: 200
            height: 200
            anchors.centerIn: parent
            color: "green"
            opacity: 0.75
            radius: Radius{
                size: 40
                topLeft: true
            }
        }
    }

}
