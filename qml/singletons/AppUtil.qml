pragma Singleton

import QtQuick 2.0

QtObject {

    /**************************************
     * function definitions start here
    **************************************/    

    /*********************************************
     * function definitions end here
    **********************************************/



    /*********************************************
     * property definitions start here
    **********************************************/

    //defines Application font
    property QtObject font1: FontLoader{
        source: "qrc:/assets/fonts/Nunito-Regular.ttf"
    }

    property var colors: ["#922040","#517E7E","#DC6E4F","#63BDCF","#EFC849","#1D2326","#301E34","#644D52","#55626F",
                          "#35558A","#3190BB","#66D2D5","#BBE4E5","#AED8C7","#7ACBA5","#FEEFA9","#FFFEA2","#FB4668",
                          "#FD6769","#FD9A9B","#FED297","#E6E1B1","#D1DABE","#E7E8D2","#CBDAEC","#D6D0F0","#CECECE",
                          "#ECF0F1","#00887A","#86B2A5"]

}
