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
import QtQuick.Controls 2.3

Item {

    property int verticalButtonDelta: 40    //distance betwen the routing buttons

    Component.onCompleted: {
        showTwoRedriverSourceAndSink(false);
        showPassiveSourceAndSink(false);
        showChargeOnlySourceAndSink(false);
    }

    //set the hidden elements of the UI correctly based on the two redriver
    //button being set on startup
    onVisibleChanged: {
         var theDataPath =  implementationInterfaceBinding.getDataPath();
        if (visible > 0)
            console.log("visibility changed message received",theDataPath)

        if (theDataPath === "redriver"){
            showTwoRedriverSourceAndSink(true);
            showPassiveSourceAndSink(false);
            showChargeOnlySourceAndSink(false);
        }
        else if (theDataPath === "passiveRoute"){
            showTwoRedriverSourceAndSink(false);
            showPassiveSourceAndSink(true);
            showChargeOnlySourceAndSink(false);
        }
        else if (theDataPath === "chargeOnlyRoute"){
            showTwoRedriverSourceAndSink(false);
            showPassiveSourceAndSink(false);
            showChargeOnlySourceAndSink(true);
        }
    }

    // Values are being Signalled from ImplementationInterfaceBinding.cpp
    Connections {
        target: implementationInterfaceBinding

        //  swap cable status
        onSwapCableStatusChanged: {
            //console.log("cable status changed. New value=",cableStatus)
            if(cableStatus == "Good") {
                statusMessage.color = "green";
                statusMessage.text = "Ready";
            }
            else if (cableStatus == "Unknown"){
                statusMessage.text = "";
                }
            else {
                statusMessage.color = "red";
                if(cableStatus == "USB_C_port_1")
                    statusMessage.text = "Please Flip the Connection on Port 1";
                if(cableStatus == "USB_C_port_2")
                    statusMessage.text = "Please Flip the Connection on Port 2";
                if(cableStatus == "Both")
                    statusMessage.text = "Please Flip the Connection on Both Ports";
            }

        }

        onPlatformResetDetected: {
            console.log("in reset");
            if(reset_status) {
                twoRedrivers.checked = false;
                oneRedriver.checked = true;
                passiveRoute.checked = false;
                showTwoRedriverSourceAndSink(false);
                showPassiveSourceAndSink(false);
                showChargeOnlySourceAndSink(false);
                statusMessage.color = "green";
                statusMessage.text = "Ready";
                console.log("reset detected with ",oneRedriver.checked);
            }
        }
    }

    Text {
        id: pageTitle
        text:"SuperSpeed Data Path"
        horizontalAlignment: Text.AlignHCenter
        font.family: "Helvetica"
        font.pointSize: extraLargeFontSize
        color: "grey"
        anchors{ left: parent.left;
            right: parent.right;
            top: parent.top;
            topMargin: parent.height/20
        }
    }

    Label{
        id: redriverConfigurationLabel
        anchors {bottom:twoRedrivers.top
                bottomMargin: 20
                horizontalCenter: parent.horizontalCenter
                }
        horizontalAlignment: Text.AlignRight
        font.family: "helvetica"
        font.pointSize: largeFontSize
        text:"Redriver configuration:"
    }

    function showTwoRedriverSourceAndSink(inShow){
        twoRedriverLaptop.visible = inShow;
        twoRedriversLeftArrows.visible = inShow;
        twoRedriversRightArrows.visible = inShow;
        twoRedriverHD.visible = inShow;
        twoRedriverSourceText.visible = inShow
        twoRedriversSinkText.visible = inShow
    }

    function showPassiveSourceAndSink(inShow){
        passiveLaptop.visible = inShow;
        passiveLeftArrows.visible = inShow;
        passiveRightArrows.visible = inShow;
        passiveHD.visible = inShow;
        passiveSourceText.visible = inShow
        passiveSinkText.visible = inShow
    }

    function showChargeOnlySourceAndSink(inShow){

    }

    ButtonGroup {
        id:dataPathGroup
        onClicked: {
            if (button.objectName == "twoRedrivers"){
                showTwoRedriverSourceAndSink(true);
                showPassiveSourceAndSink(false);
                showChargeOnlySourceAndSink(false);
                implementationInterfaceBinding.setRedriverConfiguration("redriver");

            }
            else if (button.objectName == "passiveRoute"){
                showTwoRedriverSourceAndSink(false);
                showPassiveSourceAndSink(true);
                showChargeOnlySourceAndSink(false);
                implementationInterfaceBinding.setRedriverConfiguration("passive");
            }
            else if (button.objectName == "chargeOnlyRoute"){
                showTwoRedriverSourceAndSink(false);
                showPassiveSourceAndSink(false);
                showChargeOnlySourceAndSink(true);
                implementationInterfaceBinding.setRedriverConfiguration("charge_only");
            }
        }
    }

    //--------------------------------------------------------------
    //  Two Redriver group
    //--------------------------------------------------------------
    Image {
        id:twoRedriverLaptop
        source: "./images/DataPath/laptop.svg"
        anchors.verticalCenter: twoRedrivers.verticalCenter
        anchors.right: twoRedriversLeftArrows.left
        anchors.rightMargin: 10

    }

    Text{
        id: twoRedriverSourceText
        text:"Data source"
        font.family: "helvetica"
        font.pointSize: mediumLargeFontSize
        color: "grey"
        anchors.horizontalCenter: twoRedriverLaptop.horizontalCenter
        anchors.top:twoRedriverLaptop.bottom
        anchors.topMargin: 5
    }

    Image {
        id: twoRedriversLeftArrows
        source: "./images/DataPath/arrows.svg"
        anchors.verticalCenter: twoRedrivers.verticalCenter
        anchors.right: twoRedrivers.left
        anchors.rightMargin: 10
        anchors.topMargin: 20
    }

    Button{
        id:twoRedrivers
        objectName: "twoRedrivers"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: passiveRoute.top
        anchors.bottomMargin: verticalButtonDelta
        width: parent.width/3
        height: parent.height/6
        ButtonGroup.group: dataPathGroup
        checkable:true
        checked:false
        background: Rectangle{color:"transparent"}

        Image{
            source: twoRedrivers.checked ? "./images/DataPath/TwoRepeaterRouteActive.svg" : "./images/DataPath/TwoRepeaterDataRouteInactive.svg"
            height: twoRedrivers.height
            width: twoRedrivers.width

            Text{
                text:"Flex Cable"
                color: twoRedrivers.checked ? "white" : "transparent"
                font.family: "helvetica"
                font.pointSize: mediumLargeFontSize
                anchors.centerIn:parent
            }

            Text{
                text:"Redriver"
                color: twoRedrivers.checked ? "darkslategrey" : "transparent"
                font.family: "helvetica"
                font.pointSize: mediumFontSize
                anchors{top:parent.top; topMargin:parent.height/16; left: parent.left; leftMargin: 3*parent.width/16}
            }
            Text{
                text:"Redriver"
                color: twoRedrivers.checked ? "darkslategrey" : "transparent"
                font.family: "helvetica"
                font.pointSize: mediumFontSize
                anchors{top:parent.top; topMargin:parent.height/16; right: parent.right; rightMargin: parent.width/8}
            }
            Text{
                text:"Redriver"
                color: twoRedrivers.checked ? "darkslategrey" : "transparent"
                font.family: "helvetica"
                font.pointSize: mediumFontSize
                anchors{bottom:parent.bottom; bottomMargin:parent.height/16; left: parent.left; leftMargin: 3*parent.width/16}
            }
            Text{
                text:"Redriver"
                color: twoRedrivers.checked ? "darkslategrey" : "transparent"
                font.family: "helvetica"
                font.pointSize: mediumFontSize
                anchors{bottom:parent.bottom; bottomMargin:parent.height/16; right: parent.right; rightMargin: parent.width/8}
            }
        }

        Connections {
            target: implementationInterfaceBinding
            onDataPathConfigurationChanged:{
                if( dataConfiguration === "redriver" ) {
                    twoRedrivers.checked = true
                }
            }
        }

    }

    Text{
        id:twoRedriverButtonLabel
        text:"With Redrivers"
        font.family: "helvetica"
        font.pointSize: mediumLargeFontSize
        color: twoRedrivers.checked ? "black" : "grey"
        anchors.horizontalCenter: twoRedrivers.horizontalCenter
        anchors.top:twoRedrivers.bottom
        anchors.topMargin: 5
    }

    Image {
        id: twoRedriversRightArrows
        source: "./images/DataPath/arrows.svg"
        anchors.verticalCenter: twoRedrivers.verticalCenter
        anchors.left: twoRedrivers.right
        anchors.leftMargin: 10
    }

    Image {
        id:twoRedriverHD
        source: "./images/DataPath/hardDrive.svg"
        anchors.verticalCenter: twoRedrivers.verticalCenter
        anchors.left: twoRedriversRightArrows.right
        anchors.leftMargin: 10
    }

    Text{
        id:twoRedriversSinkText
        text:"Data sink"
        font.family: "helvetica"
        font.pointSize: mediumLargeFontSize
        color:"grey"
        anchors.horizontalCenter: twoRedriverHD.horizontalCenter
        anchors.top:twoRedriverHD.bottom
        anchors.topMargin: 5
    }



    //--------------------------------------------------------------
    //  Passive group
    //--------------------------------------------------------------
    Image {
        id:passiveLaptop
        source: "./images/DataPath/laptop.svg"
        anchors.verticalCenter: passiveRoute.verticalCenter
        anchors.right: passiveLeftArrows.left
        anchors.rightMargin: 10
    }

    Text{
        id:passiveSourceText
        text:"Data source"
        font.family: "helvetica"
        font.pointSize: mediumLargeFontSize
        color:"grey"
        anchors.horizontalCenter: passiveLaptop.horizontalCenter
        anchors.top:passiveLaptop.bottom
        anchors.topMargin: 5
    }

    Image {
        id: passiveLeftArrows
        source: "./images/DataPath/arrows.svg"
        anchors.verticalCenter: passiveRoute.verticalCenter
        anchors.right: passiveRoute.left
        anchors.rightMargin: 10
    }

    Button{
        id:passiveRoute
        objectName: "passiveRoute"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:parent.verticalCenter
        width: parent.width/3
        height: parent.height/6
        ButtonGroup.group: dataPathGroup
        checkable:true
        background: Rectangle{color:"transparent"}

        Image{
            source: passiveRoute.checked ? "./images/DataPath/PassiveDataRouteActive.svg" : "./images/DataPath/PassiveDataRouteInactive.svg"
            height: passiveRoute.height
            width: passiveRoute.width

            Text{
                text:"Flex Cable"
                color: passiveRoute.checked ? "white" : "transparent"
                font.family: "helvetica"
                font.pointSize: mediumLargeFontSize
                anchors.centerIn:parent
            }
        }

        Connections {
            target: implementationInterfaceBinding
            onDataPathConfigurationChanged:{
                if( dataConfiguration === "passive" ) {
                    passiveRoute.checked = true
                }
            }
        }
    }

    Text{
        id:passiveButtonLabel
        text:"Passive"
        font.family: "helvetica"
        font.pointSize: mediumLargeFontSize
        color: passiveRoute.checked ? "black" : "grey"
        anchors.horizontalCenter: passiveRoute.horizontalCenter
        anchors.top:passiveRoute.bottom
        anchors.topMargin: 5
    }

    Image {
        id: passiveRightArrows
        source: "./images/DataPath/arrows.svg"
        anchors.verticalCenter: passiveRoute.verticalCenter
        anchors.left: passiveRoute.right
        anchors.leftMargin: 10
    }

    Image {
        id:passiveHD
        source: "./images/DataPath/hardDrive.svg"
        anchors.verticalCenter: passiveRoute.verticalCenter
        anchors.left: passiveRightArrows.right
        anchors.leftMargin: 10
    }

    Text{
        id:passiveSinkText
        text:"Data sink"
        font.family: "helvetica"
        font.pointSize: mediumPlusFontSize
        color:"grey"
        anchors.horizontalCenter: passiveHD.horizontalCenter
        anchors.top:passiveHD.bottom
        anchors.topMargin: 5
    }

    //--------------------------------------------------------------
    //  Charge Only group
    //--------------------------------------------------------------


    Button{
        id:chargeOnly
        objectName: "chargeOnlyRoute"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: passiveRoute.bottom
        anchors.topMargin: verticalButtonDelta
        width: parent.width/3
        height: parent.height/6
        ButtonGroup.group: dataPathGroup
        checkable:true
        checked: true
        background: Rectangle{
                border.color: chargeOnly.checked? "black" : "lightgrey"
                border.width: 2
                color: chargeOnly.checked? "lightgreen" : "lightgrey"
            }


        Image{
            id:chargeOnlyIcon
            source: chargeOnly.checked ? "./images/powerSymbolGreen.svg": "./images/powerSymbolGrey.svg"
            anchors.centerIn: parent
        }

        Connections {
            target: implementationInterfaceBinding
            onDataPathConfigurationChanged:{
                if( dataConfiguration === "charge_only" ) {
                    chargeOnly.checked = true
                }
            }
        }
    }

    Text{
        id:chargeOnlyButtonLabel
        text:"Charge only (no data)"
        font.family: "helvetica"
        font.pointSize: mediumLargeFontSize
        color: chargeOnly.checked ? "black" : "grey"
        anchors.horizontalCenter: chargeOnly.horizontalCenter
        anchors.top:chargeOnly.bottom
        anchors.topMargin: 5
    }


    //status and instructions
    Label{
        id:statusMessage
        font.family: "helvetica"
        font.pointSize: largeFontSize
        color:"red"
        text:""
        anchors{horizontalCenter: parent.horizontalCenter
                bottom:parent.bottom
                bottomMargin: parent.height/10
        }
    }
}
