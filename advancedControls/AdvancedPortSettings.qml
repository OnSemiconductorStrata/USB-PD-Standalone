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

//-----------------------------------------------
//  Port  settings
//-----------------------------------------------
Rectangle{
    id:portSettings
    clip: true
    property int fullHeight:340 //default height settings overridden by AdvancedControlSettings
    property int collapsedHeight:70

    property string portName:"Port n"
    property int portNumber:0
    property real minimumVoltage: 0
    property real minimumAdvertisedVoltage: 5.0
    property real maximumAdvertisedVoltage: 20.0

    property color enabledTextFieldBackgroundColor: "#838484"
    property color disabledTextFieldBackgroundColor: "#33FFFFFF"

    property color enabledTextFieldTextColor: "white"
    property color disabledTextFieldTextColor: "grey"

    property double outputVoltage: 0;
    property double targetVoltage: 0;
    property double portCurrent: 0;
    property double portTemperature: 0;
    property double portPower: 0;
    property double portNegotiatedContractVoltage:0;
    property double portNegotiatedContractAmperage:0;
    property string portMaximumPower:"";

    property double voltage1: 0;
    property double voltage2: 0;
    property double voltage3: 0;
    property double voltage4: 0;
    property double voltage5: 0;
    property double voltage6: 0;
    property double voltage7: 0;

    // Values are being Signalled from ImplementationInterfaceBinding.cpp
    Connections {
        target: implementationInterfaceBinding

        // output voltage
        onPortOutputVoltageChanged: {
            if( portNumber === port ) {
                portSettings.outputVoltage = value;
            }
        }

        // target voltage
        onPortTargetVoltageChanged: {

            if( portNumber === port ) {
                portSettings.targetVoltage = value;
            }
        }

        // port current
        onPortCurrentChanged: {
            if( portNumber === port ) {
                portSettings.portCurrent = value;
            }
        }

        // port temperature
        onPortTemperatureChanged: {
            if( portNumber === port ) {
                portSettings.portTemperature = value;
            }
        }

        // port power
        onPortPowerChanged: {
            if( portNumber === port ) {
                portSettings.portPower = value;
            }
        }

        onPortNegotiatedContractChanged:{
            if( portNumber === port ) {
                portSettings.portNegotiatedContractVoltage = voltage;
                portSettings.portNegotiatedContractAmperage = maxCurrent;
            }
        }

        onPortNegotiatedVoltageChanged:{
            if( portNumber === port ) {
                portSettings.portNegotiatedContractVoltage = voltage;
            }
        }

        onPortNegotiatedCurrentChanged:{
            if( portNumber === port ) {
                portSettings.portNegotiatedContractAmperage = current;
            }
        }

        onPortMaximumPowerChanged:{
            if( portNumber === port ) {
                portSettings.portMaximumPower = parseInt(commandedWatts);
            }
        }

        onPortAdvertisedVoltagesChanged:{
            if (portNumber === port){
                portSettings.voltage1 = voltage1;
                portSettings.voltage2 = voltage2;
                portSettings.voltage3 = voltage3;
                portSettings.voltage4 = voltage4;
                portSettings.voltage5 = voltage5;
                portSettings.voltage6 = voltage6;
                portSettings.voltage7 = voltage7;
            }
        }


    }

    Layout.preferredWidth  : grid.prefWidth(this)
    Layout.preferredHeight : portSettings.fullHeight
    color: advancedControlsBackgroundColor

    Component.onCompleted: {
        voltage1Group.sliderValue = (voltage1 > 0) ?voltage1 : minimumVoltage;
        voltage2Group.sliderValue = (voltage2 > 0) ?voltage2 : minimumVoltage;
        voltage3Group.sliderValue = (voltage3 > 0) ?voltage3 : minimumVoltage;
        voltage4Group.sliderValue = (voltage4 > 0) ?voltage4 : minimumVoltage;
        voltage5Group.sliderValue = (voltage5 > 0) ?voltage5 : minimumVoltage;
        voltage6Group.sliderValue = (voltage6 > 0) ?voltage6 : minimumVoltage;
        voltage7Group.sliderValue = (voltage7 > 0) ?voltage7 : minimumVoltage;
    }

    NumberAnimation{
        id: collapsePortSettings
        target: portSettings;
        property: "Layout.preferredHeight";
        to: portSettings.collapsedHeight;
        duration: settingsScrollView.collapseAnimationSpeed;
    }

    NumberAnimation {
        id: expandPortSettings
        target: portSettings
        property: "Layout.preferredHeight";
        to: portSettings.fullHeight;
        duration: settingsScrollView.collapseAnimationSpeed;
    }

    Button{
        id: portSettingsDisclosureButton
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.topMargin: 20
        height: 20
        width: 20
        checkable: true
        checked: true
        background: Rectangle {
            color: advancedControlsBackgroundColor
        }


        Image{
            id:portDisclosureButtonImage
            anchors.left:parent.left
            anchors.leftMargin: 3
            anchors.top:parent.top
            height:10
            width:14
            source:"../images/icons/showLessIcon.svg"

            transform: Rotation {
                id: rotatePortButtonImage
                origin.x: portDisclosureButtonImage.width/2;
                origin.y: portDisclosureButtonImage.height/2;
                axis { x: 0; y: 0; z: 1 }
            }

            NumberAnimation {
                id:collapsePortDisclosureIcon
                running: false
                loops: 1
                target: rotatePortButtonImage;
                property: "angle";
                from: 0; to: 180;
                duration: 1000;
            }

            NumberAnimation {
                id:expandPortDisclosureIcon
                running: false
                loops: 1
                target: rotatePortButtonImage;
                property: "angle";
                from: 180; to: 0;
                duration: 1000;
            }
        }

        onClicked:{
            if (checked == true){
                expandPortSettings.start();
                expandPortDisclosureIcon.start();
            }
            else{
                collapsePortSettings.start();
                collapsePortDisclosureIcon.start();
            }
        }

    }

    Label{
        id: portSettingsLabel
        text: parent.portName + " Settings"
        font.family: "Helvetica"
        font.pointSize: mediumFontSize
        color: enabledTextColor
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
    }

    Rectangle{
        id: portSettingsSeparator
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: parent.width/20
        anchors.rightMargin: parent.width/20
        anchors.top: portSettingsLabel.bottom
        anchors.topMargin: 15
        height: 1
        color:"#CCCCCC"
    }

    Text{
        id:portMaxPowerText
        text:"Maximum power output:"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        horizontalAlignment: Text.AlignRight
        color: "#D8D8D8"
        anchors.right:parent.right
        anchors.rightMargin: parent.width*.6
        anchors.top: portSettingsSeparator.bottom
        anchors.topMargin: 10
    }

    PopUpMenu{
        id: portMaxPowerCombo
        model: ["15","27", "36", "45","60","100"]
        backgroundColor: popupMenuBackgroundColor
        anchors.left:portMaxPowerText.right
        anchors.leftMargin: 10
        anchors.verticalCenter: portMaxPowerText.verticalCenter

        currentIndex:(portSettings.portMaximumPower != "") ?
                         portMaxPowerCombo.find(portSettings.portMaximumPower) : -1

        onActivated: {
            implementationInterfaceBinding.setMaximumPortPower(portNumber,parseInt(portMaxPowerCombo.currentText))

            //if port power is being set lower than a foldback power,
            //then show an alert to the user, since this will mean that foldback won't reduce power as expected
            var minFoldbackPower = getMinFoldbackPower();
            //console.log("max power for port=",portMaxPowerCombo.currentText,"min foldback power is",minFoldbackPower);
            if (portMaxPowerCombo.currentText < minFoldbackPower){
                showalertMessage(portSettings.x + portMaxPowerCombo.x + portMaxPowerCombo.width,
                                 portSettings.y + portMaxPowerCombo.y,
                                 "Port power set lower than foldback power", "red");
            }
        }

        Connections {
            target: implementationInterfaceBinding
            onPortMaximumPowerChanged:{
                if( portNumber === port ) {
                    //console.log ("setting port watts to ",commandedWatts)
                    //console.log ("popup index is ",portMaxPowerCombo.find(parseInt(commandedWatts)))
                    var theIndex = portMaxPowerCombo.find(parseInt(commandedWatts))
                    if (theIndex !== -1){
                        portMaxPowerCombo.currentIndex = portMaxPowerCombo.find(parseInt(commandedWatts))
                    }
                    //console.log ("popup value changed to ", portMaxPowerCombo.currentIndex)
                }
            }
        }

    }


    Text{
        id:portMaxPowerUnitText
        text:"W"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        color: "#D8D8D8"
        anchors.left:portMaxPowerCombo.right
        anchors.leftMargin: 5
        anchors.verticalCenter: portMaxPowerText.verticalCenter

    }

    //---------------------------------
    //  Max current GroupBox
    //---------------------------------
    Rectangle{
        id:maxCurrentGroup
        color:advancedControlsGroupBoxFillColor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.top: portMaxPowerText.bottom
        anchors.topMargin: (Qt.platform.os === "osx") ? 10  : 10;
        height: 65

        Text{
            id:maxCurrentText
            text:"Peak current limit:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: "#D8D8D8"
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.6
            anchors.top: maxCurrentGroup.top
            anchors.topMargin: 10
        }
        Rectangle{
            id: maxCurrentTextInputRect
            color: textEditFieldBackgroundColor
            anchors.left:maxCurrentText.right
            anchors.leftMargin: 10
            anchors.verticalCenter: maxCurrentText.verticalCenter
            anchors.verticalCenterOffset: (Qt.platform.os === "osx") ? 0  : 3;
            height:15
            width:25

            TextField{
                id:maxCurrentTextInput
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.topMargin: 5

                horizontalAlignment: Qt.AlignLeft

                font.family: "helvetica"
                font.pointSize: smallFontSize
                color:enabled ? enabledTextColor : disabledTextColor
                text: maxCurrentSlider.value
                validator: DoubleValidator {bottom:3; top:8.5; decimals:1}
                background: Rectangle {
                    color:"transparent"
                }
                selectByMouse: true
                onEditingFinished:{
                    maxCurrentSlider.value= text
                    implementationInterfaceBinding.setPortMaximumCurrent(portNumber, Math.round (maxCurrentSlider.value *10)/10)
                }
            }
        }

        Text{
            id:maxCurrentUnitText
            text:"A"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: "#D8D8D8"
            anchors.left:maxCurrentTextInputRect.right
            anchors.leftMargin: 5
            anchors.verticalCenter: maxCurrentText.verticalCenter

        }

        AdvancedSlider{
            id:maxCurrentSlider
            anchors.left:maxCurrentUnitText.right
            anchors.leftMargin: 5
            anchors.right:parent.right
            anchors.rightMargin: 30
            anchors.verticalCenter: maxCurrentText.verticalCenter
            height:10
            from: 3
            to:8.5
            value:0
            stepSize: .1

            onPressedChanged: {
                if (!pressed){
                    implementationInterfaceBinding.setPortMaximumCurrent(portNumber, Math.round (maxCurrentSlider.value *10)/10)
                }
            }

            onValueChanged: {
                maxCurrentTextInput.text = Math.round (maxCurrentSlider.value *10)/10
            }

            Connections {
                target: implementationInterfaceBinding
                onPortOverCurrentChanged:{
                    if( portNumber === port ) {
                        maxCurrentSlider.value = max_current
                    }
                }
            }

        }

        Text{
            id:overCurrentProtectionText
            text:"Over current protection:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.6
            anchors.top: maxCurrentText.bottom
            anchors.topMargin: 15
        }

        Text{
            id:overCurrentProtectionSettingText
            text:"none"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignLeft
            color: enabledTextColor
            anchors.left:overCurrentProtectionText.right
            anchors.leftMargin: 10
            anchors.verticalCenter: overCurrentProtectionText.verticalCenter

            Connections {
                target: implementationInterfaceBinding
                onFaultProtectionChanged:{
                    if (protectionMode == "shutdown")
                        overCurrentProtectionSettingText.text = "Shutdown"
                    else if (protectionMode == "retry")
                        overCurrentProtectionSettingText.text = "Retry"
                    else if (protectionMode == "nothing")
                        overCurrentProtectionSettingText.text = "None"
                }

            }
        }
    }


    Rectangle{
        id:cableCompensationGroup
        color:advancedControlsGroupBoxFillColor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.top: maxCurrentGroup.bottom
        anchors.topMargin: (Qt.platform.os === "osx") ? 10  : 10;
        height: 75

        Text{
            id:portCableCompensationHeader
            text:"Cable Compensation"
            font.family: "helvetica"
            font.pointSize: mediumFontSize
            color: enabledTextColor
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: (Qt.platform.os === "osx") ? 5  : 0;
        }

        Text{
            id:portCableCompensationText
            text:"For every increment of:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.6
            anchors.top: portCableCompensationHeader.bottom
            anchors.topMargin: (Qt.platform.os === "osx") ? 5  : 5;

        }

        Rectangle{
            id: portCableCompensationTextInputRect
            color: textEditFieldBackgroundColor
            anchors.left:portCableCompensationText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: portCableCompensationText.verticalCenter
            height:15
            width:30

            TextField{
                id:portCableCompensationTextInput
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.topMargin: 5

                horizontalAlignment: Qt.AlignLeft

                font.family: "helvetica"
                font.pointSize: smallFontSize
                color:enabled ? enabledTextColor : disabledTextColor
                text: portCableCompensationSlider.value
                validator: DoubleValidator {bottom:.25; top:2; decimals:2}
                background: Rectangle {
                    color:"transparent"
                }
                selectByMouse: true
                onEditingFinished:{
                    portCableCompensationSlider.value= text
                    implementationInterfaceBinding.setCableCompensation(portNumber, portCableCompensationSlider.value, voltageCompensationSlider.value)
                }
            }
        }


        Text{
            id:portCableCompensationUnitText
            text:"A"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabledTextColor
            anchors.left:portCableCompensationTextInputRect.right
            anchors.leftMargin: 5
            anchors.verticalCenter: portCableCompensationText.verticalCenter

        }

        AdvancedSlider{
            id:portCableCompensationSlider
            anchors.left:portCableCompensationUnitText.right
            anchors.leftMargin: 5
            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: portCableCompensationText.verticalCenter
            height:10
            from: .25
            to:2
            value:.25
            stepSize: 0.1

            onValueChanged: {
                portCableCompensationTextInput.text = Math.round (portCableCompensationSlider.value *100)/100
            }
            onPressedChanged: {
                if (!pressed){
                    implementationInterfaceBinding.setCableCompensation(portNumber, portCableCompensationSlider.value, voltageCompensationSlider.value)

                }
            }
            Connections {
                target: implementationInterfaceBinding
                onPortCableCompensationChanged:{
                    if( portNumber === port ) {
                        //console.log("updating bias step notification with value ",cableLoss)
                        portCableCompensationSlider.value = cableLoss
                    }
                }
            }
        }

        Text{
            id:voltageCompensationText
            text:"Bias output by:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.6
            anchors.top: portCableCompensationText.bottom
            anchors.topMargin: (Qt.platform.os === "osx") ? 10  : 10;
        }
        Rectangle{
            id: voltageCompensationTextInputRect
            color: textEditFieldBackgroundColor
            anchors.left:voltageCompensationText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: voltageCompensationText.verticalCenter
            height:15
            width:30

            TextField{
                id:voltageCompensationTextInput
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.topMargin: 5

                horizontalAlignment: Qt.AlignLeft

                font.family: "helvetica"
                font.pointSize: smallFontSize
                color:enabled ? enabledTextColor : disabledTextColor
                text: voltageCompensationSlider.value
                validator: IntValidator {bottom:0; top:200;}
                background: Rectangle {
                    color:"transparent"
                }
                selectByMouse: true
                onEditingFinished:{
                    voltageCompensationSlider.value= text
                    implementationInterfaceBinding.setCableCompensation(portNumber, portCableCompensationSlider.value, voltageCompensationSlider.value)
                }
            }
        }

        Text{
            id:voltageCompensationUnitText
            text:"mV"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabledTextColor
            anchors.left:voltageCompensationTextInputRect.right
            anchors.leftMargin: 5
            anchors.verticalCenter: voltageCompensationText.verticalCenter

        }

        AdvancedSlider{
            id:voltageCompensationSlider
            anchors.left:voltageCompensationUnitText.right
            anchors.leftMargin: 5
            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: voltageCompensationText.verticalCenter
            height:10
            from: 0
            to:200
            value:0
            stepSize: 50.0

            onValueChanged: {
                voltageCompensationTextInput.text = voltageCompensationSlider.value
            }
            onPressedChanged: {
                if (!pressed){
                    implementationInterfaceBinding.setCableCompensation(portNumber, portCableCompensationSlider.value, voltageCompensationSlider.value)

                }
            }
            Connections {
                target: implementationInterfaceBinding
                onPortCableCompensationChanged:{
                    if( portNumber === port ) {
                        //console.log("updating voltage compensation from notification with value ",biasVoltage)
                        voltageCompensationSlider.value =  Math.round (biasVoltage);
                        voltageCompensationTextInput.text = voltageCompensationSlider.value
                    }
                }
            }
        }
    }





    //-----------------------------------------------
    //  advertized voltages group
    //-----------------------------------------------
    Rectangle{
        id:portAdvertizedVoltagesGroup
        color:advancedControlsBackgroundColor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.top: cableCompensationGroup.bottom
        anchors.topMargin: 10
        height: 180

        Text{
            id:portAdvertizedVoltagesLabel
            text:"Source capabilities:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.6
            anchors.top: parent.top
            anchors.topMargin: 0
        }


        AdvancedAdvertisedVoltageGroup{
            id: voltage1Group
            groupPortNumber: portNumber
            groupVoltageNumber: 1
            anchors.left:portAdvertizedVoltagesLabel.right
            anchors.leftMargin: 5
            anchors.verticalCenter: portAdvertizedVoltagesLabel.verticalCenter
            anchors.right:parent.right
            anchors.rightMargin: 10
        }

        AdvancedAdvertisedVoltageGroup{
            id: voltage2Group
            groupPortNumber: portNumber
            groupVoltageNumber: 2
            anchors.left:portAdvertizedVoltagesLabel.right
            anchors.leftMargin: 5

            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.top:voltage1Group.bottom
            anchors.topMargin: 5
        }

        AdvancedAdvertisedVoltageGroup{
            id: voltage3Group
            groupPortNumber: portNumber
            groupVoltageNumber: 3
            anchors.left:portAdvertizedVoltagesLabel.right
            anchors.leftMargin: 5

            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.top:voltage2Group.bottom
            anchors.topMargin: 5
        }

        AdvancedAdvertisedVoltageGroup{
            id: voltage4Group
            groupPortNumber: portNumber
            groupVoltageNumber: 4
            anchors.left:portAdvertizedVoltagesLabel.right
            anchors.leftMargin: 5

            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.top:voltage3Group.bottom
            anchors.topMargin: 5
        }

        AdvancedAdvertisedVoltageGroup{
            id: voltage5Group
            groupPortNumber: portNumber
            groupVoltageNumber: 5
            anchors.left:portAdvertizedVoltagesLabel.right
            anchors.leftMargin: 5

            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.top:voltage4Group.bottom
            anchors.topMargin: 5
        }

        AdvancedAdvertisedVoltageGroup{
            id: voltage6Group
            groupPortNumber: portNumber
            groupVoltageNumber: 6
            anchors.left:portAdvertizedVoltagesLabel.right
            anchors.leftMargin: 5

            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.top:voltage5Group.bottom
            anchors.topMargin: 5
        }

        AdvancedAdvertisedVoltageGroup{
            id: voltage7Group
            groupPortNumber: portNumber
            groupVoltageNumber: 7
            anchors.left:portAdvertizedVoltagesLabel.right
            anchors.leftMargin: 5

            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.top:voltage6Group.bottom
            anchors.topMargin: 5
        }


    }
}
