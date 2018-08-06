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
import tech.spyglass.ImplementationInterfaceBinding 1.0

Rectangle{
    id: boardSettings
    Layout.preferredWidth  : grid.prefWidth(this)
    Layout.preferredHeight : boardSettings.fullHeight
    color: advancedControlsBackgroundColor
    clip: true

    //default height values, overridden by AdvancedControlSettings
    property int fullHeight:400
    property int collapsedHeight:55

    NumberAnimation{
        id: collapseBoardSettings
        target: boardSettings;
        property: "Layout.preferredHeight";
        to: boardSettings.collapsedHeight;
        duration: settingsScrollView.collapseAnimationSpeed;
    }

    NumberAnimation {
        id: expandBoardSettings
        target: boardSettings
        property: "Layout.preferredHeight";
        to: boardSettings.fullHeight;
        duration: settingsScrollView.collapseAnimationSpeed;
    }


    Button{
        id: boardSettingsDisclosureButton
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.topMargin: 20
        height: 20
        width: 20
        checkable: true
        checked: true
        background: Rectangle {
            color:advancedControlsBackgroundColor
        }


        Image{
            id:boardSettingsDisclosureButtonImage
            anchors.left:parent.left
            anchors.leftMargin: 3
            anchors.top:parent.top
            height:10
            width:14
            source:"../images/icons/showLessIcon.svg"

            transform: Rotation {
                id: rotateBoardSettingsButtonImage
                origin.x: boardSettingsDisclosureButtonImage.width/2;
                origin.y: boardSettingsDisclosureButtonImage.height/2;
                axis { x: 0; y: 0; z: 1 }
            }

            NumberAnimation {
                id:collapseBoardSettingsDisclosureIcon
                running: false
                loops: 1
                target: rotateBoardSettingsButtonImage;
                property: "angle";
                from: 0; to: 180;
                duration: 1000;
            }

            NumberAnimation {
                id:expandBoardSettingsDisclosureIcon
                running: false
                loops: 1
                target: rotateBoardSettingsButtonImage;
                property: "angle";
                from: 180; to: 0;
                duration: 1000;
            }
        }


        onClicked:{
            if (checked == true){
                expandBoardSettings.start();
                expandBoardSettingsDisclosureIcon.start()
            }
            else{
                collapseBoardSettings.start();
                collapseBoardSettingsDisclosureIcon.start()
            }
        }

    }

    Label{
        id: boardSettingsLabel
        text: "System Settings"
        font.family: "Helvetica"
        font.pointSize: mediumFontSize
        color: enabledTextColor
        anchors.left:parent.left
        anchors.top:parent.top
        anchors.leftMargin: 20
        anchors.topMargin: 20
    }

    Rectangle{
        id: boardSettingsSeparator
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: parent.width/20
        anchors.rightMargin: parent.width/20
        anchors.top: boardSettingsLabel.bottom
        anchors.topMargin: 15
        height: 1
        color:"#CCCCCC"
    }

    Label{
        id:dataConfigurationLabel
        text:"Data Configuration:"
        font.family: "helvetica"
        font.pointSize: mediumFontSize
        color: enabledTextColor

        horizontalAlignment: Text.AlignRight
        anchors.right:parent.right
        anchors.rightMargin: parent.width*.63

        anchors.top: boardSettingsSeparator.bottom
        anchors.topMargin: 10
        visible: implementationInterfaceBinding.Id == ImplementationInterfaceBinding.USB_PD;
    }

    ButtonGroup { id: dataConfigurationGroup
        exclusive: true
    }

    LeftSegmentedButton{
        id:chargeOnlyButton
        anchors.left: dataConfigurationLabel.right
        anchors.leftMargin: 5
        anchors.verticalCenter: dataConfigurationLabel.verticalCenter
        text: "Charge only"
        font.capitalization: Font.MixedCase
        font.pointSize: smallFontSize
        checkedColor: "#767676"
        unCheckedColor: advancedButtonBackgroundColor
        checkedTextColor: enabledTextColor
        uncheckedTextColor: unselectedButtonSegmentTextColor
        ButtonGroup.group: dataConfigurationGroup
        height: 25
        width:90
        visible: implementationInterfaceBinding.Id == ImplementationInterfaceBinding.USB_PD;
        onClicked: {
            implementationInterfaceBinding.setRedriverConfiguration("charge_only")
        }
        Connections {
            target: implementationInterfaceBinding
            onDataPathConfigurationChanged:{
                if( dataConfiguration === "charge_only" ) {
                    chargeOnlyButton.checked = true
                }
            }
            onSwapCableStatusChanged: {
                if(cableStatus == "Good" && chargeOnlyButton.checked && boardSettings.visible) {
                    showalertMessage (chargeOnlyButton.x + chargeOnlyButton.width, chargeOnlyButton.y, "Ready","green")
                }
//                else if (cableStatus == "Unknown" && chargeOnlyButton.checked){
//                   showalertMessage (chargeOnlyButton.x + chargeOnlyButton.width, chargeOnlyButton.y, "unknown status","red")
//                }
                else if (chargeOnlyButton.checked){
                    if(cableStatus == "USB_C_port_1"){
                        showalertMessage (chargeOnlyButton.x + chargeOnlyButton.width, chargeOnlyButton.y, "Please Flip the Connection on Port 1","red")
                    }
                    if(cableStatus == "USB_C_port_2"){
                        showalertMessage (chargeOnlyButton.x + chargeOnlyButton.width, chargeOnlyButton.y, "Please Flip the Connection on Port 2","red")
                    }
                    if(cableStatus == "Both"){
                        showalertMessage (chargeOnlyButton.x + chargeOnlyButton.width, chargeOnlyButton.y, "Please Flip the Connection on Both Ports","red")
                    }
                }
            }
        }

    }
    MiddleSegmentedButton{
        id:passiveButton
        anchors.left: chargeOnlyButton.right
        anchors.leftMargin: 0
        anchors.verticalCenter: dataConfigurationLabel.verticalCenter
        text:"Passive"
        font.pointSize: smallFontSize
        font.capitalization: Font.MixedCase
        checkedColor: "#767676"
        unCheckedColor: "#4C4A48"
        checkedTextColor: enabledTextColor
        uncheckedTextColor: unselectedButtonSegmentTextColor
        ButtonGroup.group: dataConfigurationGroup
        height: 25
        width:65
        visible: implementationInterfaceBinding.Id == ImplementationInterfaceBinding.USB_PD;
        onClicked: {
            implementationInterfaceBinding.setRedriverConfiguration("passive")
        }
        Connections {
            target: implementationInterfaceBinding
            onDataPathConfigurationChanged:{
                if( dataConfiguration === "passive" ) {
                    passiveButton.checked = true
                }
            }
            onSwapCableStatusChanged: {
                if(cableStatus == "Good" && passiveButton.checked && boardSettings.visible) {
                    showalertMessage (passiveButton.x + passiveButton.width, passiveButton.y, "Ready","green")
                }
//                else if (cableStatus == "Unknown" && passiveButton.checked){
//                   showalertMessage (passiveButton.x + passiveButton.width, passiveButton.y, "unknown status","red")
//                }
                else if (passiveButton.checked && visible) {
                    if(cableStatus == "USB_C_port_1"){
                        showalertMessage (passiveButton.x + passiveButton.width, passiveButton.y, "Please Flip the Connection on Port 1","red")
                    }
                    if(cableStatus == "USB_C_port_2"){
                        showalertMessage (passiveButton.x + passiveButton.width, passiveButton.y, "Please Flip the Connection on Port 2","red")
                    }
                    if(cableStatus == "Both"){
                        showalertMessage (passiveButton.x + passiveButton.width, passiveButton.y, "Please Flip the Connection on Both Ports","red")
                    }
                }
            }
        }
    }
    RightSegmentedButton{
        id:redriverButton
        anchors.left: passiveButton.right
        anchors.leftMargin: 0
        anchors.verticalCenter: dataConfigurationLabel.verticalCenter
        text:"Redriver"
        font.capitalization: Font.MixedCase
        font.pointSize: smallFontSize
        checkedColor: "#767676"
        unCheckedColor: "#4C4A48"
        checkedTextColor: enabledTextColor
        uncheckedTextColor: unselectedButtonSegmentTextColor
        ButtonGroup.group: dataConfigurationGroup
        height: 25
        width:75
        visible: implementationInterfaceBinding.Id == ImplementationInterfaceBinding.USB_PD;
        onClicked: {
            implementationInterfaceBinding.setRedriverConfiguration("redriver")
        }
        Connections {
            target: implementationInterfaceBinding
            onDataPathConfigurationChanged:{
                if( dataConfiguration === "redriver" ) {
                    redriverButton.checked = true
                }
            }
            onSwapCableStatusChanged: {
                console.log("swap cable message received")
                if(cableStatus == "Good" && redriverButton.checked && boardSettings.visible) {
                    showalertMessage (redriverButton.x + redriverButton.width, redriverButton.y, "Ready", "green")
                }
//                else if (cableStatus == "Unknown" && redriverButton.checked){
//                   showalertMessage (redriverButton.x + redriverButton.width, redriverButton.y, "unknown status","red")
//                }

                else if (redriverButton.checked){
                    if(cableStatus == "USB_C_port_1"){
                        showalertMessage (redriverButton.x + redriverButton.width, redriverButton.y, "Please Flip the Connection on Port 1", "red")
                    }
                    if(cableStatus == "USB_C_port_2"){
                        showalertMessage (redriverButton.x + redriverButton.width, redriverButton.y, "Please Flip the Connection on Port 2", "red")
                    }
                    if(cableStatus == "Both"){
                        showalertMessage (redriverButton.x + redriverButton.width, redriverButton.y, "Please Flip the Connection on Both Ports", "red")
                    }
                }
            }
        }
    }




    Label{
        id:faultProtectionLabel
        text:"Fault Protection:"
        font.family: "helvetica"
        font.pointSize: mediumFontSize
        color: enabledTextColor

        horizontalAlignment: Text.AlignRight
        anchors.right:parent.right
        anchors.rightMargin: parent.width*.63

        anchors.top: boardSettingsSeparator.bottom
        anchors.topMargin: 40
    }

    ButtonGroup { id: faultProtectionGroup
        exclusive: true
    }

    LeftSegmentedButton{
        id:shutdownButton
        anchors.left: faultProtectionLabel.right
        anchors.leftMargin: 5
        anchors.verticalCenter: faultProtectionLabel.verticalCenter
        text: "Shutdown"
        font.capitalization: Font.MixedCase
        font.pointSize: smallFontSize
        checkedColor: "#767676"
        unCheckedColor: "#4C4A48"
        checkedTextColor: enabledTextColor
        uncheckedTextColor: unselectedButtonSegmentTextColor
        ButtonGroup.group: faultProtectionGroup
        height: 25
        width:90
        onClicked: {
            implementationInterfaceBinding.setFaultMode("shutdown")
        }
        Connections {
            target: implementationInterfaceBinding
            onFaultProtectionChanged:{
                if( protectionMode === "shutdown" ) {
                    shutdownButton.checked= true
                }
            }
        }

    }
    MiddleSegmentedButton{
        id:restartButton
        anchors.left: shutdownButton.right
        anchors.leftMargin: 0
        anchors.verticalCenter: faultProtectionLabel.verticalCenter
        text:"Retry"
        font.pointSize: smallFontSize
        font.capitalization: Font.MixedCase
        checkedColor: "#767676"
        unCheckedColor: "#4C4A48"
        checkedTextColor: enabledTextColor
        uncheckedTextColor: unselectedButtonSegmentTextColor
        ButtonGroup.group: faultProtectionGroup
        height: 25
        width:65
        onClicked: {
            implementationInterfaceBinding.setFaultMode("retry")
        }
        Connections {
            target: implementationInterfaceBinding
            onFaultProtectionChanged:{
                if( protectionMode === "retry" ) {
                    restartButton.checked= true
                }
            }
        }
    }
    RightSegmentedButton{
        id:noProtectionButton
        anchors.left: restartButton.right
        anchors.leftMargin: 0
        anchors.verticalCenter: faultProtectionLabel.verticalCenter
        text:"None"
        font.capitalization: Font.MixedCase
        font.pointSize: smallFontSize
        checkedColor: "#767676"
        unCheckedColor: "#4C4A48"
        checkedTextColor: enabledTextColor
        uncheckedTextColor: unselectedButtonSegmentTextColor
        ButtonGroup.group: faultProtectionGroup
        height: 25
        width:75
        onClicked: {
            implementationInterfaceBinding.setFaultMode("nothing")
        }

        Connections {
            target: implementationInterfaceBinding
            onFaultProtectionChanged:{
                if( protectionMode === "nothing" ) {
                    noProtectionButton.checked = true
                }
            }
        }
    }





    //--------------------------------------
    //     System faults
    //--------------------------------------

    Text{
        id:minimumInputVoltageText
        text:"Fault when input falls below:"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        horizontalAlignment: Text.AlignRight
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.right:parent.right
        anchors.rightMargin: parent.width*.5
        anchors.top: faultProtectionLabel.bottom
        anchors.topMargin: 10
    }

    Rectangle{
        id: minimumInputRect
        color: textEditFieldBackgroundColor
        anchors.left:minimumInputVoltageText.right
        anchors.leftMargin: 5
        anchors.verticalCenter: minimumInputVoltageText.verticalCenter
        height:15
        width:30

        TextField{
            id:minimumInputTextField
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.topMargin: 5

            horizontalAlignment: Qt.AlignLeft

            font.family: "helvetica"
            font.pointSize: smallFontSize
            color:enabled ? enabledTextColor : disabledTextColor
            text: minimumInputVoltageSlider.value
            validator: DoubleValidator {bottom:5; top:32; decimals:1}
            background: Rectangle {
                color:"transparent"
            }
            selectByMouse: true
            onEditingFinished:{
                minimumInputVoltageSlider.value= text
                implementationInterfaceBinding.setInputVoltageLimiting(Math.round(minimumInputVoltageSlider.value *10)/10)
              }
        }
    }


    Text{
        id:minimumInputUnitText
        text:"V"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.left:minimumInputRect.right
        anchors.leftMargin: 5
        anchors.verticalCenter: minimumInputVoltageText.verticalCenter

    }

    AdvancedSlider{
        id:minimumInputVoltageSlider
        anchors.left:minimumInputUnitText.right
        anchors.leftMargin: 5
        anchors.right:parent.right
        anchors.rightMargin: 25
        anchors.verticalCenter: minimumInputVoltageText.verticalCenter
        height:10
        from: 0
        to:32
        value:5
        stepSize: 0.0

        onPressedChanged: {
            if (!pressed){
                implementationInterfaceBinding.setInputVoltageLimiting(Math.round(minimumInputVoltageSlider.value *10)/10)
            }
        }

        onMoved: {
            minimumInputTextField.text = Math.round(minimumInputVoltageSlider.value *10)/10
        }

        Connections {
            target: implementationInterfaceBinding
            onInputUnderVoltageChanged:{
                minimumInputVoltageSlider.value = Math.round(value*10)/10
                minimumInputTextField.text = minimumInputVoltageSlider.value
            }
        }
    }

    //-----------------------------------------------------
    //      hysteresis
    //-----------------------------------------------
    Text{
        id:inputHysteresisText
        text:"Input voltage hysteresis:"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        horizontalAlignment: Text.AlignRight
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.right:parent.right
        anchors.rightMargin: parent.width*.5
        anchors.top: minimumInputVoltageText.bottom
        anchors.topMargin: 10
    }

    Rectangle{
         id: inputHysteresisRect
         color: enabled ? textEditFieldBackgroundColor : textEditFieldDisabledBackgroundColor
         anchors.left:inputHysteresisText.right
         anchors.leftMargin: 5
         anchors.verticalCenter: inputHysteresisText.verticalCenter
         height:15
         width:30

        TextField{
            id:inputHysteresisTextInput
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.topMargin: 5

            horizontalAlignment: Qt.AlignLeft

            font.family: "helvetica"
            font.pointSize: smallFontSize
            color:enabled ? enabledTextColor : disabledTextColor
            text: inputHysteresisVoltageSlider.value
            validator: DoubleValidator {bottom:5; top:32; decimals:1}
            background: Rectangle {
                color:"transparent"
            }
            selectByMouse: true
                onEditingFinished:{
                    startLimitingVoltageSlider.value= text
                    implementationInterfaceBinding.setInputVoltageHysteresis(inputHysteresisVoltageSlider.value)

                 }
        }
    }

    Text{
        id:inputHysteresisUnitText
        text:"V"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.left:inputHysteresisRect.right
        anchors.leftMargin: 5
        anchors.verticalCenter: inputHysteresisText.verticalCenter
    }

    AdvancedSlider{
        id:inputHysteresisVoltageSlider
        anchors.left:inputHysteresisUnitText.right
        anchors.leftMargin: 5
        anchors.verticalCenter: inputHysteresisText.verticalCenter
        anchors.right:parent.right
        anchors.rightMargin: 25
        from: .5
        to:10
        value:.5
        stepSize: 0.0

        onPressedChanged: {
            if (!pressed){
                implementationInterfaceBinding.setInputVoltageHysteresis(inputHysteresisVoltageSlider.value)
            }
        }

        onMoved: {
            inputHysteresisTextInput.text = Math.round(inputHysteresisVoltageSlider.value *10)/10
        }

        Connections {
            target: implementationInterfaceBinding
            onInputVoltageHysteresisChanged:{
                    inputHysteresisVoltageSlider.value = Math.round(inputVoltageHysteresis *10)/10
                    inputHysteresisTextInput.text = inputHysteresisVoltageSlider.value
                }
            }
    }

    Text{
        id:faultTempText
        text:"Fault when temperature reaches:"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        horizontalAlignment: Text.AlignRight
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.right:parent.right
        anchors.rightMargin: parent.width*.5
        anchors.top: inputHysteresisText.bottom
        anchors.topMargin: 10
    }

    Rectangle{
        id: faultTempRect
        color: textEditFieldBackgroundColor
        anchors.left:faultTempText.right
        anchors.leftMargin: 5
        anchors.verticalCenter: faultTempText.verticalCenter
        height:15
        width:30

        TextField{
            id:faultTempTextField
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.topMargin: 5

            horizontalAlignment: Qt.AlignLeft

            font.family: "helvetica"
            font.pointSize: smallFontSize
            color:enabled ? enabledTextColor : disabledTextColor
            text: faultTempSlider.value
            validator: DoubleValidator {bottom:25; top:100; decimals:0}
            background: Rectangle {
                color:"transparent"
            }
            selectByMouse: true
            onEditingFinished:{
                faultTempSlider.value= text
                implementationInterfaceBinding.setMaximumTemperature(faultTempSlider.value)
              }
        }
    }




    Text{
        id:faultTempUnitText
        text:"°C"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.left:faultTempRect.right
        anchors.leftMargin: 5
        anchors.verticalCenter: faultTempText.verticalCenter

    }

    AdvancedSlider{
        id:faultTempSlider
        anchors.left:faultTempUnitText.right
        anchors.leftMargin: 5
        anchors.right:parent.right
        anchors.rightMargin: 25
        anchors.verticalCenter: faultTempText.verticalCenter
        height:10
        from: 25
        to:200
        value:200
        stepSize: 1

        onPressedChanged: {
            if (!pressed){
                implementationInterfaceBinding.setMaximumTemperature(faultTempSlider.value)
            }
        }
        onMoved: {
            faultTempTextField.text = faultTempSlider.value

        }
        Connections {
            target: implementationInterfaceBinding
            onMaximumTemperatureChanged:{
                faultTempSlider.value = Math.round(value*10)/10
                faultTempTextField.text = faultTempSlider.value
            }
        }

    }

    Text{
        id:temperatureHysteresisText
        text:"Temperature hysteresis:"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        horizontalAlignment: Text.AlignRight
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.right:parent.right
        anchors.rightMargin: parent.width*.5
        anchors.top: faultTempText.bottom
        anchors.topMargin: 10
    }

    Rectangle{
         id: temperatureHysteresisRect
         color: enabled ? textEditFieldBackgroundColor : textEditFieldDisabledBackgroundColor
         anchors.left:temperatureHysteresisText.right
         anchors.leftMargin: 10
         anchors.verticalCenter: temperatureHysteresisText.verticalCenter
         height:15
         width:25

        TextField{
            id:temperatureHysteresisTextInput
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.topMargin: 5

            horizontalAlignment: Qt.AlignLeft

            font.family: "helvetica"
            font.pointSize: smallFontSize
            color:enabled ? enabledTextColor : disabledTextColor
            text: temperatureHysteresisDegreeSlider.value
            validator: DoubleValidator {bottom:2; top:32; decimals:0}
            background: Rectangle {
                color:"transparent"
            }
            selectByMouse: true
                onEditingFinished:{
                    temperatureHysteresisDegreeSlider.value= text
                    implementationInterfaceBinding.setTemperatureHysteresis(temperatureHysteresisDegreeSlider.value)
                   }
        }
    }

    Text{
        id:temperatureHysteresisUnitText
        text:"°C"
        font.family: "helvetica"
        font.pointSize: smallFontSize
        color: enabled ? enabledTextColor : disabledTextColor
        anchors.left:temperatureHysteresisRect.right
        anchors.leftMargin: 5
        anchors.verticalCenter: temperatureHysteresisText.verticalCenter
    }

    AdvancedSlider{
        id:temperatureHysteresisDegreeSlider
        anchors.left:temperatureHysteresisUnitText.right
        anchors.leftMargin: 5
        anchors.verticalCenter: temperatureHysteresisText.verticalCenter
        anchors.right:parent.right
        anchors.rightMargin: 25
        from: 2
        to:32
        value:2
        stepSize: 1

        onPressedChanged: {
            if (!pressed){
                implementationInterfaceBinding.setTemperatureHysteresis(temperatureHysteresisDegreeSlider.value)
            }
        }

        onMoved: {
            temperatureHysteresisTextInput.text = temperatureHysteresisDegreeSlider.value
        }

        Connections {
            target: implementationInterfaceBinding
            onTemperatureHysteresisChanged:{
                    temperatureHysteresisDegreeSlider.value = Math.round(temperatureHysteresis)
                    temperatureHysteresisTextInput.text = temperatureHysteresisDegreeSlider.value
                }
            }
    }

    //–––––––––––––––––––––––––––––––––––––––––––––––
    //          Input Foldback group
    //–––––––––––––––––––––––––––––––––––––––––––––––
    Rectangle{
        id:inputLimitingGroup
        color:advancedControlsGroupBoxFillColor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.top: temperatureHysteresisText.bottom
        anchors.topMargin: 15
        height: 100

        Component.onCompleted: {
            inputLimitingSwitch.toggle()
            inputLimitingGroup.setInputVoltageLimitingEnabled(inputLimitingSwitch.checked)
        }

        Text{
            id:inputLimitingText
            text:"Input Foldback"
            font.family: "helvetica"
            font.pointSize: mediumFontSize
            color: enabledTextColor
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
        }

        function setInputVoltageLimitingEnabled(inEnabled){
            //toggle enablement of the input limiting controls
            startLimitingText.enabled = inEnabled
            startLimitingVoltageRect.enabled = inEnabled
            startLimitingUnitText.enabled = inEnabled
            startLimitingVoltageSlider.enabled = inEnabled
            outputLimitText.enabled = inEnabled
            outputLimitPopup.enabled = inEnabled
            outputLimitUnitText.enabled = inEnabled
            removeLimitingText.enabled = inEnabled
            removeLimitingValueText.enabled = inEnabled
            removeLimitingtUnitText.enabled = inEnabled
        }

        Switch{
            id: inputLimitingSwitch
            anchors.left: inputLimitingText.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 5
            height: 15
            width:30
            checked:true
            //this is the background of the switch
            indicator: Rectangle {
                implicitWidth: 30
                implicitHeight: 15
                x: inputLimitingSwitch.leftPadding
                y: parent.height / 2 - height / 2
                radius: 7
                color: inputLimitingSwitch.checked ? "#0078D7"  : "black"
                border.color: inputLimitingSwitch.checked ? "#0078D7" : "white"

                //this is the thumb that moves
                Rectangle {
                    x: inputLimitingSwitch.checked ? parent.width - width : 0
                    y: parent.height / 2 - height / 2
                    width: 10
                    height: 10
                    radius: 5
                    color: "white"
                }
            }
            onToggled: {
                inputLimitingGroup.setInputVoltageLimitingEnabled(inputLimitingSwitch.checked)

                //if foldback is being toggled on, and foldback voltage is higher than a port voltage,
                //then show an alert to the user, since this will mean that foldback won't reduce power as expected
                var minPortPower = getMinPortPower();
                var minPowerPort = getPortWithMinimumPowerSetting();
                console.log("input foldback toggled to",inputLimitingSwitch.checked,"minPower=",minPortPower,"on port",minPowerPort);
                if ((inputLimitingSwitch.checked) &&
                    (outputLimitPopup.displayText > minPortPower)){
                    showalertMessage(inputLimitingGroup.x +inputLimitingSwitch.x - inputLimitingSwitch.width,
                                     inputLimitingGroup.y + inputLimitingSwitch.y,
                                     "Input foldback set higher than max power for port "+minPowerPort, "red");
                }

                implementationInterfaceBinding.setVoltageFoldbackParameters(inputLimitingSwitch.checked,
                                                                            Math.round(startLimitingVoltageSlider.value *10)/10,
                                                                            parseInt(outputLimitPopup.displayText))
            }
            Connections {
                target: implementationInterfaceBinding
                onInputVoltageFoldbackChanged:{
                    //console.log("input voltage foldback changed, setting enabled to ",inputVoltageFoldbackEnabled)
                    inputLimitingSwitch.checked = inputVoltageFoldbackEnabled
                    inputLimitingGroup.setInputVoltageLimitingEnabled(inputVoltageFoldbackEnabled)
                }
            }
        }

        //indicator for input voltage foldback being active
        Text{
            id:inputFoldbackActiveText
            text:"active"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : "transparent"   //only show text when enabled
            anchors.right:inputFoldbackActiveIndicator.left
            anchors.rightMargin: 5
            anchors.verticalCenter: inputLimitingSwitch.verticalCenter
            enabled:false

        }

        AdvancedActivityIndicator{
            id:inputFoldbackActiveIndicator
            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: inputLimitingSwitch.verticalCenter
            height:17
            checked: false

            Connections {
                target: implementationInterfaceBinding
                onInputVoltageFoldbackChanged:{
                    //console.log("input limiting activity indicator set to ",inputVoltageFoldbackActive)
                    inputFoldbackActiveIndicator.checked = inputVoltageFoldbackActive && inputVoltageFoldbackEnabled
                    inputFoldbackActiveText.enabled = inputVoltageFoldbackActive && inputVoltageFoldbackEnabled
                }
            }
        }




        Text{
            id:startLimitingText
            text:"When input falls below:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.55
            anchors.top: parent.top
            anchors.topMargin: 30

        }

        Rectangle{
             id: startLimitingVoltageRect
             color: enabled ? textEditFieldBackgroundColor : textEditFieldDisabledBackgroundColor
             anchors.left:startLimitingText.right
             anchors.leftMargin: 10
             anchors.verticalCenter: startLimitingText.verticalCenter
             height:15
             width:25

            TextField{
                id:startLimitingTextInput
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.topMargin: 5

                horizontalAlignment: Qt.AlignLeft

                font.family: "helvetica"
                font.pointSize: smallFontSize
                color:enabled ? enabledTextColor : disabledTextColor
                text: startLimitingVoltageSlider.value
                validator: DoubleValidator {bottom:5; top:32; decimals:1}
                background: Rectangle {
                    color:"transparent"
                }
                selectByMouse: true
                onEditingFinished:{
                    startLimitingVoltageSlider.value= text
                    implementationInterfaceBinding.setVoltageFoldbackParameters(inputLimitingSwitch.checked,
                                                                                Math.round(startLimitingVoltageSlider.value *10)/10,
                                                                                parseInt(outputLimitPopup.displayText))


                  }


            }
        }


        Text{
            id:startLimitingUnitText
            text:"V"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            //horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:startLimitingVoltageRect.right
            anchors.leftMargin: 5
            anchors.verticalCenter: startLimitingText.verticalCenter

        }

        AdvancedSlider{
            id:startLimitingVoltageSlider
            anchors.left:startLimitingUnitText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: startLimitingText.verticalCenter
            anchors.right:parent.right
            anchors.rightMargin: 5
            from: 5
            to:32
            value:5
            stepSize: 0.0

            onPressedChanged: {
                if (!pressed){
                    implementationInterfaceBinding.setVoltageFoldbackParameters(inputLimitingSwitch.checked,
                                                                                Math.round(startLimitingVoltageSlider.value *10)/10,
                                                                                parseInt(outputLimitPopup.displayText))

                }
            }

            onMoved: {
                startLimitingTextInput.text = Math.round(startLimitingVoltageSlider.value *10)/10
            }

            Connections {
                target: implementationInterfaceBinding
                onInputVoltageFoldbackChanged:{
                    //console.log("voltage foldback changed in voltage slider. new minimum is",inputVoltageFoldbackMinimumVoltage)
                    startLimitingVoltageSlider.value = Math.round(inputVoltageFoldbackMinimumVoltage *10)/10
                    startLimitingTextInput.text = startLimitingVoltageSlider.value
                    }
                }
        }

        Text{
            id:outputLimitText
            text:"Limit Board Output to:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.55
            anchors.top: parent.top
            anchors.topMargin: 55
        }

        PopUpMenu{
            id: outputLimitPopup
            model: ["15","27", "36", "45","60","100"]
            anchors.left:outputLimitText.right
            anchors.leftMargin: 10
            anchors.verticalCenter: outputLimitText.verticalCenter

            onActivated: {
                implementationInterfaceBinding.setVoltageFoldbackParameters(inputLimitingSwitch.checked,
                                                                            Math.round(startLimitingVoltageSlider.value *10)/10,
                                                                            parseInt(outputLimitPopup.displayText))

                //if foldback voltage is being set higher than a port voltage,
                //then show an alert to the user, since this will mean that foldback won't reduce power as expected
                var minPower = getMinPortPower();
                var minPowerPort = getPortWithMinimumPowerSetting();
                console.log("min power is",minPower,"on port",minPowerPort,"foldback power is set to ",outputLimitPopup.displayText);
                if (outputLimitPopup.displayText > minPower){
                    showalertMessage(inputLimitingGroup.x + inputLimitingGroup.width/2,
                                     inputLimitingGroup.y + inputLimitingGroup.height/2,
                                     "Input foldback set higher than max power for port "+minPowerPort, "red");
                }
            }

            Connections {
                target: implementationInterfaceBinding
                onInputVoltageFoldbackChanged:{
                    var theIndex = outputLimitPopup.find(parseInt(inputVoltageFoldbackPower))
                    if (theIndex !== -1){
                        outputLimitPopup.currentIndex = theIndex
                    }
                }
            }
        }


        Text{
            id:outputLimitUnitText
            text:"W"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:outputLimitPopup.right
            anchors.leftMargin: 5
            anchors.verticalCenter: outputLimitText.verticalCenter
        }


        Text{
            id:removeLimitingText
            text:"Remove limiting at:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.55
            anchors.top: parent.top
            anchors.topMargin: 80
        }
        Text{
            id:removeLimitingValueText
            text:Math.round((startLimitingVoltageSlider.value + inputHysteresisVoltageSlider.value) *10)/10
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:removeLimitingText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: removeLimitingText.verticalCenter
        }
        Text{
            id:removeLimitingtUnitText
            text:"V"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:removeLimitingValueText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: removeLimitingText.verticalCenter
        }


    }

    //------------------------------------
    //  temperature limit Group
    //---------------------------------
    Rectangle{
        id:temperatureLimitingGroup
        color:advancedControlsGroupBoxFillColor
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.top: inputLimitingGroup.bottom
        anchors.topMargin: 15
        height: 100

        Component.onCompleted: {
            temperatureLimitingSwitch.toggle()
            temperatureLimitingGroup.setTemperatureLimitingEnabled(temperatureLimitingSwitch.checked)
        }

        function setTemperatureLimitingEnabled(inEnabled){
            boardTemperatureText.enabled = inEnabled
            boardTemperatureRect.enabled = inEnabled
            boardTemperatureUnitText.enabled = inEnabled
            boardTemperatureSlider.enabled = inEnabled
            boardOutputLimitText.enabled = inEnabled
            boardOuputPopup.enabled = inEnabled
            boardOutputUnitText.enabled = inEnabled
            removeTemperatureFoldbackText.enabled = inEnabled
            removeTemperatureFoldbackValueText.enabled = inEnabled
            removeTemperatureFoldbackUnitText.enabled = inEnabled
        }

        Text{
            id:temperatureLimitingText
            text:"Temperature Foldback"
            font.family: "helvetica"
            font.pointSize: mediumFontSize
            color: enabledTextColor
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            anchors.topMargin: 5
        }

        Switch{
            id: temperatureLimitingSwitch
            anchors.left: temperatureLimitingText.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 5
            height: 15
            width:30
            checked:true
            //this is the background of the switch
            indicator: Rectangle {
                implicitWidth: 30
                implicitHeight: 15
                x: temperatureLimitingSwitch.leftPadding
                y: parent.height / 2 - height / 2
                radius: 7
                color: temperatureLimitingSwitch.checked ? "#0078D7"  : "black"
                border.color: temperatureLimitingSwitch.checked ? "#0078D7" : "white"

                //this is the thumb that moves
                Rectangle {
                    x: temperatureLimitingSwitch.checked ? parent.width - width : 0
                    y: parent.height / 2 - height / 2
                    width: 10
                    height: 10
                    radius: 5
                    color: "white"
                }
            }
            onToggled: {
                //toggle enablement of the input limiting controls
                temperatureLimitingGroup.setTemperatureLimitingEnabled(temperatureLimitingSwitch.checked)

                implementationInterfaceBinding.setTemperatureFoldbackParameters(temperatureLimitingSwitch.checked,
                                                                                Math.round(boardTemperatureSlider.value *10)/10,
                                                                                parseInt(boardOuputPopup.displayText))

                //if foldback voltage is being set higher than a port voltage,
                //then show an alert to the user, since this will mean that foldback won't reduce power as expected
                var minPortPower = getMinPortPower();
                var minPowerPort = getPortWithMinimumPowerSetting();
                if (temperatureLimitingSwitch.checked && (boardOuputPopup.displayText > minPortPower)){
                    showalertMessage(temperatureLimitingGroup.x + temperatureLimitingSwitch.x + temperatureLimitingSwitch.width,
                                     temperatureLimitingGroup.y + temperatureLimitingSwitch.y,
                                     "Temperature foldback set higher than max power for port "+minPowerPort, "red");
                }
            }

            Connections {
                target: implementationInterfaceBinding
                onTemperatureFoldbackChanged:{
                    temperatureLimitingSwitch.checked = temperatureFoldbackEnabled
                    temperatureLimitingGroup.setTemperatureLimitingEnabled(temperatureFoldbackEnabled)
                    }
                }

        }

        //indicator for input voltage foldback being active
        Text{
            id:temperatureFoldbackActiveText
            text:"active"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : "transparent"   //only show text when enabled
            anchors.right:temperatureFoldbackActiveIndicator.left
            anchors.rightMargin: 5
            anchors.verticalCenter: temperatureLimitingText.verticalCenter
            enabled:false
        }

        AdvancedActivityIndicator{
            id:temperatureFoldbackActiveIndicator
            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: temperatureLimitingText.verticalCenter
            height:17
            checked: false

            property bool portOneInTempFoldback: false;
            property bool portTwoInTempFoldback: false;

            Connections {
                target: implementationInterfaceBinding
                onTemperatureFoldbackChanged:{
                     //console.log("temperature foldback indicator set to ",temperatureFoldbackActive)
                    //either this is a notification of the port going into foldback, or coming out of foldback.
                    //if foldback is coming on, then the indicator should show that foldback is active.
                    //if foldback is turning off, check the other port to see if it is still active, and if so, keep the indictor on
                    if (port ==1){
                        if (temperatureFoldbackActive && temperatureFoldbackEnabled){
                            temperatureFoldbackActiveIndicator.portOneInTempFoldback = true;
                        }
                        else{
                            temperatureFoldbackActiveIndicator.portOneInTempFoldback = false;
                        }
                    }
                    else if (port == 2){
                        if (temperatureFoldbackActive && temperatureFoldbackEnabled){
                            temperatureFoldbackActiveIndicator.portTwoInTempFoldback = true;
                        }
                        else{
                            temperatureFoldbackActiveIndicator.portTwoInTempFoldback = false;
                        }
                    }

                    if (temperatureFoldbackActiveIndicator.portOneInTempFoldback || temperatureFoldbackActiveIndicator.portTwoInFoldback){
                        temperatureFoldbackActiveIndicator.checked = true;
                        temperatureFoldbackActiveText.enabled = true;
                        }
                    else{
                        temperatureFoldbackActiveIndicator.checked = false;
                        temperatureFoldbackActiveText.enabled = false;
                    }

                }
            }
        }

        Text{
            id:boardTemperatureText
            text:"When board temperature reaches:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.45
            anchors.top: parent.top
            anchors.topMargin: 30

        }

        Rectangle{
             id: boardTemperatureRect
             color: enabled ? textEditFieldBackgroundColor : textEditFieldDisabledBackgroundColor
             anchors.left:boardTemperatureText.right
             anchors.leftMargin: 10
             anchors.verticalCenter: boardTemperatureText.verticalCenter
             anchors.verticalCenterOffset: 0
             height:15
             width:25

            TextField{
                id:boardTemperatureTextInput
                anchors.fill: parent
                anchors.leftMargin: 2
                anchors.topMargin: 5

                horizontalAlignment: Qt.AlignLeft

                font.family: "helvetica"
                font.pointSize: smallFontSize
                color:enabled ? enabledTextColor : disabledTextColor
                text: boardTemperatureSlider.value
                validator: DoubleValidator {bottom:25; top:100; decimals:0}
                background: Rectangle {
                    color:"transparent"
                }
                selectByMouse: true
                onEditingFinished:{
                    boardTemperatureSlider.value= text
                    implementationInterfaceBinding.setTemperatureFoldbackParameters(temperatureLimitingSwitch.checked,
                                                                                    Math.round(boardTemperatureSlider.value *10)/10,
                                                                                    parseInt(boardOuputPopup.displayText))

                  }
            }
        }



        Text{
            id:boardTemperatureUnitText
            text:"°C"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:boardTemperatureRect.right
            anchors.leftMargin: 5
            anchors.verticalCenter: boardTemperatureText.verticalCenter

        }

        AdvancedSlider{
            id:boardTemperatureSlider
            anchors.left:boardTemperatureUnitText.right
            anchors.leftMargin: 5
            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: boardTemperatureText.verticalCenter
            height:10
            from: 25
            to:200
            value:200
            stepSize: 1.0

            onPressedChanged: {
                if (!pressed){
                    implementationInterfaceBinding.setTemperatureFoldbackParameters(temperatureLimitingSwitch.checked,
                                                                                    boardTemperatureSlider.value,
                                                                                    parseInt(boardOuputPopup.displayText))
                }
            }

            onMoved: {
                boardTemperatureTextInput.text = boardTemperatureSlider.value
            }

            Connections {
                target: implementationInterfaceBinding
                onTemperatureFoldbackChanged:{
                    boardTemperatureSlider.value = temperatureFoldbackMaximumTemperature
                    boardTemperatureTextInput.text = boardTemperatureSlider.value
                    }
                }
        }

        Text{
            id:boardOutputLimitText
            text:"Limit Board Output to:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.45
            anchors.top: parent.top
            anchors.topMargin: 55
        }

        PopUpMenu{
            id: boardOuputPopup
            model: ["15","27", "36", "45","60","100"]
            anchors.left:boardOutputLimitText.right
            anchors.leftMargin: 10
            anchors.verticalCenter: boardOutputLimitText.verticalCenter

            onActivated: {
                implementationInterfaceBinding.setTemperatureFoldbackParameters(temperatureLimitingSwitch.checked,
                                                                                Math.round(boardTemperatureSlider.value *10)/10,
                                                                                parseInt(boardOuputPopup.displayText))
                //if foldback voltage is being set higher than a port voltage,
                //then show an alert to the user, since this will mean that foldback won't reduce power as expected
                var minPortPower = getMinPortPower();
                var minPowerPort = getPortWithMinimumPowerSetting();
                if (boardOuputPopup.displayText > minPortPower){
                    showalertMessage(temperatureLimitingGroup.x + temperatureLimitingGroup.width/2,
                                     temperatureLimitingGroup.y + temperatureLimitingGroup.height/2,
                                     "Temperature foldback set higher than max power for port "+minPowerPort, "red");
                }
            }

            Connections {
                target: implementationInterfaceBinding
                onTemperatureFoldbackChanged:{
                    var theIndex = boardOuputPopup.find(parseInt(temperatureFoldbackPower))
                    if (theIndex !== -1){
                        boardOuputPopup.currentIndex =  theIndex
                    }

                }
            }
        }

        Text{
            id:boardOutputUnitText
            text:"W"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:boardOuputPopup.right
            anchors.leftMargin: 5
            anchors.verticalCenter: boardOutputLimitText.verticalCenter

        }

        Text{
            id:removeTemperatureFoldbackText
            text:"Remove limiting at:"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.right:parent.right
            anchors.rightMargin: parent.width*.45
            anchors.top: parent.top
            anchors.topMargin: 80
        }
        Text{
            id:removeTemperatureFoldbackValueText
            text:boardTemperatureSlider.value - temperatureHysteresisDegreeSlider.value
            font.family: "helvetica"
            font.pointSize: smallFontSize
            horizontalAlignment: Text.AlignRight
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:removeTemperatureFoldbackText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: removeTemperatureFoldbackText.verticalCenter
        }
        Text{
            id:removeTemperatureFoldbackUnitText
            text:"°C"
            font.family: "helvetica"
            font.pointSize: smallFontSize
            color: enabled ? enabledTextColor : disabledTextColor
            anchors.left:removeTemperatureFoldbackValueText.right
            anchors.leftMargin: 5
            anchors.verticalCenter: removeTemperatureFoldbackText.verticalCenter
        }


    }

    Button{
        id:boardResetButton
        text:"Reset Board"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        anchors.top: temperatureLimitingGroup.bottom
        anchors.topMargin: 15
        height:20

        contentItem: Text {
                text:"Reset Board"
                font.family: "helvetica"
                font.pointSize: smallFontSize
                color: enabled ? enabledTextColor : disabledTextColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitHeight: 20
                radius: 10
                color:advancedButtonBackgroundColor
            }

            onClicked:{
                //implementationInterfaceBinding.sendPlatformReset();
               resetWarningDialog.open()
            }

    }

    Dialog{
        id:resetWarningDialog
        x: (mainWindow.width - width) / 2
        modal: true

        enter: Transition {
            PropertyAnimation {target:resetWarningDialog; properties:"y"; from: -100; to: -25; duration: 500 }
        }
        exit:Transition{
            PropertyAnimation  {target:resetWarningDialog; properties:"y"; from: -25; to: -100; duration: 500 }
        }


        contentItem: Rectangle{
            id:dialogBackground
            anchors.fill:parent
            color:advancedControlsBackgroundColor
            implicitWidth: 300
            implicitHeight: 100

            Label {
                id:resetBoardText
                text: "Reset board?"
                font.family: "helvetica"
                font.pointSize: largeFontSize
                color: enabledTextColor
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.top:parent.top
                anchors.topMargin: parent.height/4
            }
            Label {
                text: "All settings will be lost"
                font.family: "helvetica"
                font.pointSize: smallFontSize
                color: "darkgrey"
                anchors.top: resetBoardText.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 20
            }

                Button{
                    id:cancelButton
                    anchors.right:okButton.left
                    anchors.bottom:parent.bottom
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    width:parent.width/4
                    height:30
                    background:Rectangle{
                        color:advancedButtonBackgroundColor
                    }

                    contentItem: Text {
                        text:"Cancel"
                        font.family: "helvetica"
                        font.pointSize: mediumFontSize
                        color: enabledTextColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                    onClicked:{
                        resetWarningDialog.close();
                    }


                }

                Button{
                    id:okButton
                    anchors.right:parent.right
                    anchors.bottom:parent.bottom
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    width:parent.width/4
                    height:30
                    background:Rectangle{
                        color:advancedButtonBackgroundColor
                        border.color:enabledTextColor
                        border.width: 1
                    }

                    contentItem: Text {
                        text:"OK"
                        font.family: "helvetica"
                        font.pointSize: mediumFontSize
                        color: enabledTextColor
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        elide: Text.ElideRight
                    }

                    onClicked:{
                        implementationInterfaceBinding.sendPlatformReset();
                        resetWarningDialog.close();
                    }



                }
        }

    }

}   //board settings rect


