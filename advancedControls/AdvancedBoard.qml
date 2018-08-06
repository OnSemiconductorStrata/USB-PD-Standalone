/*
Copyright 2014 ON Semiconductor.
All rights reserved. This software and/or documentation is licensed by ON Semiconductor under
limited terms and conditions. The terms and conditions pertaining to the software and/or documentation are available at
http://www.onsemi.com/site/pdf/ONSEMI_T&C.pdf (“ON Semiconductor Standard Terms and Conditions of Sale, Section 8 Software”).
Do not use this software and/or documentation unless you have carefully read and you agree to the limited terms and conditions.
By using this software and/or documentation, you agree to the limited terms and conditions.

GNU LESSER GENERAL PUBLIC LICENSE
Version 3, 29 June 2007
Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.
This version of the GNU Lesser General Public License incorporates
the terms and conditions of version 3 of the GNU General Public
License, supplemented by the additional permissions listed below.
0. Additional Definitions.
As used herein, "this License" refers to version 3 of the GNU Lesser
General Public License, and the "GNU GPL" refers to version 3 of the GNU
General Public License.
"The Library" refers to a covered work governed by this License,
other than an Application or a Combined Work as defined below.
An "Application" is any work that makes use of an interface provided
by the Library, but which is not otherwise based on the Library.
Defining a subclass of a class defined by the Library is deemed a mode
of using an interface provided by the Library.
A "Combined Work" is a work produced by combining or linking an
Application with the Library. The particular version of the Library
with which the Combined Work was made is also called the "Linked
Version".
The "Minimal Corresponding Source" for a Combined Work means the
Corresponding Source for the Combined Work, excluding any source code
for portions of the Combined Work that, considered in isolation, are
based on the Application, and not on the Linked Version.
The "Corresponding Application Code" for a Combined Work means the
object code and/or source code for the Application, including any data
and utility programs needed for reproducing the Combined Work from the
Application, but excluding the System Libraries of the Combined Work.
1. Exception to Section 3 of the GNU GPL.
You may convey a covered work under sections 3 and 4 of this License
without being bound by section 3 of the GNU GPL.
2. Conveying Modified Versions.
If you modify a copy of the Library, and, in your modifications, a
facility refers to a function or data to be supplied by an Application
that uses the facility (other than as an argument passed when the
facility is invoked), then you may convey a copy of the modified
version:
a) under this License, provided that you make a good faith effort to
ensure that, in the event an Application does not supply the
function or data, the facility still operates, and performs
whatever part of its purpose remains meaningful, or
b) under the GNU GPL, with none of the additional permissions of
this License applicable to that copy.
3. Object Code Incorporating Material from Library Header Files.
The object code form of an Application may incorporate material from
a header file that is part of the Library. You may convey such object
code under terms of your choice, provided that, if the incorporated
material is not limited to numerical parameters, data structure
layouts and accessors, or small macros, inline functions and templates
(ten or fewer lines in length), you do both of the following:
a) Give prominent notice with each copy of the object code that the
Library is used in it and that the Library and its use are
covered by this License.
b) Accompany the object code with a copy of the GNU GPL and this license
document.
4. Combined Works.
You may convey a Combined Work under terms of your choice that,
taken together, effectively do not restrict modification of the
portions of the Library contained in the Combined Work and reverse
engineering for debugging such modifications, if you also do each of
the following:
a) Give prominent notice with each copy of the Combined Work that
the Library is used in it and that the Library and its use are
covered by this License.
b) Accompany the Combined Work with a copy of the GNU GPL and this license
document.
c) For a Combined Work that displays copyright notices during
execution, include the copyright notice for the Library among
these notices, as well as a reference directing the user to the
copies of the GNU GPL and this license document.
d) Do one of the following:
0) Convey the Minimal Corresponding Source under the terms of this
License, and the Corresponding Application Code in a form
suitable for, and under terms that permit, the user to
recombine or relink the Application with a modified version of
the Linked Version to produce a modified Combined Work, in the
manner specified by section 6 of the GNU GPL for conveying
Corresponding Source.
1) Use a suitable shared library mechanism for linking with the
Library. A suitable mechanism is one that (a) uses at run time
a copy of the Library already present on the user's computer
system, and (b) will operate properly with a modified version
of the Library that is interface-compatible with the Linked
Version.
e) Provide Installation Information, but only if you would otherwise
be required to provide such information under section 6 of the
GNU GPL, and only to the extent that such information is
necessary to install and execute a modified version of the
Combined Work produced by recombining or relinking the
Application with a modified version of the Linked Version. (If
you use option 4d0, the Installation Information must accompany
the Minimal Corresponding Source and Corresponding Application
Code. If you use option 4d1, you must provide the Installation
Information in the manner specified by section 6 of the GNU GPL
for conveying Corresponding Source.)
5. Combined Libraries.
You may place library facilities that are a work based on the
Library side by side in a single library together with other library
facilities that are not Applications and are not covered by this
License, and convey such a combined library under terms of your
choice, if you do both of the following:
a) Accompany the combined library with a copy of the same work based
on the Library, uncombined with any other library facilities,
conveyed under the terms of this License.
b) Give prominent notice with the combined library that part of it
is a work based on the Library, and explaining where to find the
accompanying uncombined form of the same work.
6. Revised Versions of the GNU Lesser General Public License.
The Free Software Foundation may publish revised and/or new versions
of the GNU Lesser General Public License from time to time. Such new
versions will be similar in spirit to the present version, but may
differ in detail to address new problems or concerns.
Each version is given a distinguishing version number. If the
Library as you received it specifies that a certain numbered version
of the GNU Lesser General Public License "or any later version"
applies to it, you have the option of following the terms and
conditions either of that published version or of any later version
published by the Free Software Foundation. If the Library as you
received it does not specify a version number of the GNU Lesser
General Public License, you may choose any version of the GNU Lesser
General Public License ever published by the Free Software Foundation.
If the Library as you received it specifies that a proxy can decide
whether future versions of the GNU Lesser General Public License shall
apply, that proxy's public statement of acceptance of any version is
permanent authorization for you to choose that version for the
Library.
*/
import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3
import tech.spyglass.ImplementationInterfaceBinding 1.0
import QtCharts 2.2 //only needed while the whole popup is at the bottom of this file
import "../framework"

Rectangle {
    id: device
    width: parent.width; height: parent.width * 1.5

    property alias deviceLayout: deviceLayout

    //  Getting realtime data for input voltage
    property double inputVoltage: implementationInterfaceBinding.inputVoltage;
    property double portCurrent: 0;

    Connections {
        target: implementationInterfaceBinding

        onPortCurrentChanged: {
            device.portCurrent = value;
        }
    }
    anchors {horizontalCenter: parent.horizontalCenter; bottom: parent.bottom; top:parent.top
            topMargin:parent.height/4}
    color:advancedControlsBackgroundColor


    //a grid for the the device, including the input plug
    //deviceGrid
    GridLayout {
        id: deviceGrid
        columns: 6
        rows: 1
        columnSpacing: 0
        rowSpacing: 0
        anchors { fill:parent}

        property double deviceColMulti : deviceGrid.width / deviceGrid.columns
        property double deviceRowMulti : deviceGrid.height / deviceGrid.rows

        function devicePrefWidth(item){
            return deviceColMulti * item.Layout.columnSpan
        }
        function devicePrefHeight(item){
            return deviceRowMulti * item.Layout.rowSpan
        }

        Rectangle {
            id:deviceLayout
            Layout.column: 1
            Layout.columnSpan: 4
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth : deviceGrid.devicePrefWidth(this)
            Layout.preferredHeight : deviceGrid.devicePrefHeight(this)
            color:"transparent"
            z:1 //in front of the plugOutline
            Material.elevation: 6

            Image {
                id:deviceOutline
                width:parent.width ; height: parent.width*1.5
                anchors{ horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: 0
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 0 }
                source: "../images/borderWhite.svg"
                opacity:.9

            }

            Rectangle{
                id:onLogoRect
                width:60
                height:60
                anchors{ left:parent.left
                    leftMargin: parent.width *.05
                    verticalCenter: parent.verticalCenter}
                color:"transparent"

                Rectangle{
                    color:advancedControlsBackgroundColor
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width*.75; height: parent.width

                    SGToolTip{
                        id:theToolTip
                        backgroundColor: enabledTextColor
                        textColor: advancedControlsBackgroundColor
                    }
                }

                Image {
                    id:onLogo
                    opacity:.9
                    width: parent.width; height: parent.width
                    source:"../images/icons/onLogoGreen.svg"

                }

                ScaleAnimator {
                    id: increaseOnMouseEnter
                    target: onLogo;
                    easing.type: Easing.InQuad;
                    from: 1;
                    to: 1.2;
                    duration: 200
                    running: false
                }

                ScaleAnimator {
                    id: decreaseOnMouseExit
                    target: onLogo;
                    easing.type: Easing.InQuad;
                    from: 1.2;
                    to: 1;
                    duration: 200
                    running: false
                }

                MouseArea {
                    id: imageMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onEntered:{
                        increaseOnMouseEnter.start()
                        theToolTip.show("Input Power",1000,2000)
                    }
                    onExited:{
                        decreaseOnMouseExit.start()
                        theToolTip.hide()
                    }
                    onClicked: { inputPowergraph.open() }
                }
            }

            //a grid for the icon, and ports
            GridLayout {
                id: deviceGridLayout
                columns: 4
                rows: 2
                columnSpacing: 0
                //rowSpacing: parent.height/16
                width: parent.width; height: parent.height *.75

                anchors { horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: 0
                    verticalCenter: parent.verticalCenter
                    verticalCenterOffset: 0 }

                property double deviceGridLayoutColMulti : deviceGridLayout.width / deviceGridLayout.columns
                property double deviceGridLayoutRowMulti : deviceGridLayout.height / deviceGridLayout.rows

                function deviceGridLayoutWidth(item){
                    return deviceGridLayoutColMulti * item.Layout.columnSpan
                }

                function deviceGridLayoutHeight(item){
                    return deviceGridLayoutRowMulti * item.Layout.rowSpan
                }



                Rectangle {
                    id:topPortRect
                    color:"transparent"
                    Layout.column: 1
                    Layout.columnSpan: 4
                    Layout.row: 0
                    Layout.rowSpan: 1
                    Layout.preferredWidth : deviceGridLayout.deviceGridLayoutWidth(this)
                    Layout.preferredHeight : deviceGridLayout.deviceGridLayoutHeight(this)
                    border.color: "transparent"

                    AdvancedPort {
                        id: portGroupPort1
                        width: parent.width; height:parent.height
                        text: "Port 1"
                        radius: 1
                        //color: "transparent"
                        portNumber: 1
                        inAdvancedMode: true
                    }
                }

                Rectangle {
                    id:bottomPortRect
                    color:"transparent"
                    Layout.column: 1
                    Layout.columnSpan: 4
                    Layout.row: 1
                    Layout.rowSpan: 1
                    Layout.preferredWidth : deviceGridLayout.deviceGridLayoutWidth(this)
                    Layout.preferredHeight : deviceGridLayout.deviceGridLayoutHeight(this)
                    border { color: "transparent" }

                    AdvancedPort {
                        id: portGroupPort2
                        width: parent.width; height:parent.height
                        text: "Port 2"
                        radius: 1
                        //color: "transparent"
                        portNumber: 2
                        inAdvancedMode: true
                    }
                }
            }
        }

        Rectangle {
            id:inputPlugColumn
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth : deviceGrid.devicePrefWidth(this)
            Layout.preferredHeight : deviceGrid.devicePrefHeight(this)
            color: "transparent"
            Image {
                id: plugOutline
                width:parent.width*.8
                height:parent.height/7
                anchors{ verticalCenter: parent.verticalCenter;
                    right:parent.right
                }
                source: "../images/leftPowerPlugWhite.svg"
            }



            Label {
                id: inputPlugName
                text: {
                    if (device.inputVoltage !=0){
                        text = (device.inputVoltage).toFixed(1)  + "V"
                    }
                    else{
                        text: "0 V"
                    }
                }
                width: inputPlugColumn.width-2
                horizontalAlignment: Text.AlignHCenter
                anchors {verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                    horizontalCenterOffset: parent.width/10
                        }
                font{ family: "Helvetica";
                    pointSize: (Qt.platform.os === "osx") ? mediumFontSize  : smallFontSize;
                }
                color:enabledTextColor

                Connections {
                    target: implementationInterfaceBinding

                    onPortInputPowerChanged: {
                        var voltage = Math.round(inputVoltage * 10) / 10 + " V" +"\n";
                        var wattage = (Math.round(inputPower * 10) / 10).toFixed(1) + " W";
                        //change 0 into 0.0 so numbers don't jump on screen too much
                        if (inputPower === 0){
                            wattage = "0.0 W"
                        }
                        inputPlugName.text = voltage + wattage;
                    }

                }


            }


        }

        Rectangle {
            id: connectors
            Layout.column: 5
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 1
            Layout.preferredWidth : deviceGrid.devicePrefWidth(this)
            Layout.preferredHeight : deviceGrid.devicePrefHeight(this)
            color:"transparent"

            Rectangle{
                id:port1ConnectorRect
                anchors.top:parent.top
                anchors.topMargin: parent.height/8
                anchors.bottom:parent.verticalCenter
                anchors.left:parent.left
                anchors.right:parent.right
                color:"transparent"

                AdvancedConnector{
                    id:port1Connector
                    portNumber: 1
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Rectangle{
                id:port2ConnectorRect
                anchors.top:parent.verticalCenter
                anchors.bottom:parent.bottom
                anchors.bottomMargin: parent.height/8 - 10
                anchors.left:parent.left
                anchors.right:parent.right
                color:"transparent"

                AdvancedConnector{
                    id:port2Connector
                    portNumber: 2
                    anchors.verticalCenter: parent.verticalCenter
                }

            }
        }
    }

    Popup {
        id:inputPowergraph
        width: device.height*1.5;
        height: device.height

        modal: true
        focus: false
        dim: true
        topPadding: 0
        rightPadding:0
        leftPadding: 0
        bottomPadding: 0


        property int count:0
        property bool isGraphOpen: false

        background: Rectangle {
            color: disabledTextColor
            border.color : "transparent"
        }


        onVisibleChanged: {
            if(visible){
                isGraphOpen = true;
            }
            //otherwise the graph is closing, so clear the series
            else {
    //            isGraphOpen = false;
    //            if(count != 0) {
    //                powerSeries.clear();
    //                voltageSeries.clear();
    //                chartView.count = 0;
    //                valueAxisX.max= 10;
    //            }

            }
        }

        ChartView {
            id: chartView
            title: "Input Power"
            height: parent.height
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            antialiasing: true
            theme: ChartView.ChartThemeDark


            ValueAxis{
                id: valueAxisY2
                min: 0
                max: 25
                labelFormat: "%.0f"
                labelsFont.family: "helvetica"
                labelsFont.pointSize:smallFontSize
                labelsColor: Qt.rgba(.5,.5,.5,1)
                titleText: "Input voltage (V)"
                titleFont.family:"helvetica"
                titleFont.pointSize: mediumFontSize
            }



            ValueAxis {
                id: valueAxisX
                labelFormat: "%.0f"
                labelsFont.family: "helvetica"
                labelsFont.pointSize:smallFontSize
                labelsColor: Qt.rgba(.5,.5,.5,1)
                titleText: "Time (s)"
                titleFont.family:"helvetica"
                titleFont.pointSize: mediumFontSize
                min: 0
                max: 10
            }


            ValueAxis{
                id: valueAxisY
                min: 0
                max: 1
                labelFormat: "%.0f"
                labelsFont.family: "helvetica"
                labelsFont.pointSize:smallFontSize
                labelsColor: Qt.rgba(.5,.5,.5,1)
                titleText: "Input Power (W)"
                titleFont.family:"helvetica"
                titleFont.pointSize: mediumFontSize
            }



            LineSeries {
                id: powerSeries
                axisX: valueAxisX
                axisY: valueAxisY
                name: "Power"
            }

            LineSeries {
                id: voltageSeries
                axisX: valueAxisX
                axisYRight: valueAxisY2
                name: "Voltage"
            }

            Connections {
                target: implementationInterfaceBinding

                onPortInputPowerChanged: {
                    if (inputPowergraph.isGraphOpen){
                        powerSeries.append(inputPowergraph.count/10,inputPower);
                        voltageSeries.append(inputPowergraph.count/10,inputVoltage);
                        //console.log("appending graph values ",count/20,inputPower,inputVoltage);
                        inputPowergraph.count++;
                    }

                    //clear the graph every 10 seconds to avoid excessive memory usage
                    if(inputPowergraph.count%100 == 0 && inputPowergraph.count!=0){
                        //console.log("clearing graph")
                        powerSeries.removePoints(0,100);
                        voltageSeries.removePoints(0,100);
                        inputPowergraph.count = 0;
                    }

                    //increase the power scale if we exceed its max Y value
                    if(inputPower > valueAxisY.max) {
                        valueAxisY.max = inputPower+1;
                    }
                    //increase the voltage scale if it has exceeded its max value
                    if(inputVoltage > valueAxisY2.max) {
                        valueAxisY2.max = inputVoltage+1;
                    }

                }
            }
        }   //chartView

        Image{
            id:closeButton
            anchors.top:parent.top
            anchors.right:parent.right
            height:20
            width:20
            source: "../images/icons/closeIcon.svg"

            MouseArea{
                anchors.fill:parent
                onClicked: inputPowergraph.close()
            }
        }

    }


//    AdvancedInputPowerPopup{
//        id:inputPowergraph
//        width: device.height*1.5;
//        height: device.height
//    }
}
