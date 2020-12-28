import QtQuick 2.12

Item {
    id: root

    property Radius radius: defaultRadius

    property color color: "white"

    Radius{
        id: defaultRadius
    }

    layer.enabled: true

    layer.effect: Canvas{

        onPaint: {
            var cxt = getContext("2d");
            cxt.reset();
            cxt.beginPath();

            //top left
            if(radius.allCorners || radius.topLeft){
                cxt.moveTo(radius.size,0);
                cxt.arc(radius.size, radius.size, radius.size, -Math.PI/2, Math.PI, true);
            }else{
                cxt.moveTo(0,0);
            }

            //bottom left
            if(radius.allCorners || radius.bottomLeft){
                cxt.lineTo(0, height - radius.size);
                cxt.arc(radius.size, height - radius.size, radius.size, Math.PI, Math.PI * 0.5, true);
            }else{
                cxt.lineTo(0, height);
            }

            //bottom right
            if(radius.allCorners || radius.bottomRight){
                cxt.lineTo(width - radius.size, height);
                cxt.arc(width - radius.size, height - radius.size, radius.size, Math.PI * 0.5, 0, true);
            }else{
                cxt.lineTo(width, height);
            }

            //top right
            if(radius.allCorners || radius.topRight){
                cxt.lineTo(width, radius.size);
                cxt.arc(width - radius.size, radius.size, radius.size, 0, -Math.PI * 0.5, true);
            }else{
                cxt.lineTo(width, 0);
            }

            cxt.closePath();

            cxt.fillStyle = root.color;
            cxt.fill();
        }
    }
}
