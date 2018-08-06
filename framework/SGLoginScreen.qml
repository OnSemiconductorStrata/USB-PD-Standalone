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
import QtCharts 2.2
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import tech.spyglass.ImplementationInterfaceBinding 1.0

Rectangle {

    visible: true
    property bool showLoginOnCompletion: false
    Component.onCompleted: {

        if (showLoginOnCompletion){
            showConnectionScreen.start();
        }
        usernameField.forceActiveFocus(); //allows the user to type their username without clicking
    }

   Label {
       width:text.fit
       height:50
        anchors { top: onLogo.bottom;
            topMargin: 10
            horizontalCenter: onLogo.horizontalCenter}
         z:2
        text: "ON Semiconductor"
        font.pointSize: mediumLargeFontSize
        font.family:"helvetica"
        color:"lightGrey"
    }

    property bool  onIdChange : {

        onPlatformIdChanged: {

            // TODO[Abe]: Why does this property get called on stack changes?

            // If Logged in and platform is detected id: spotlightAnimation

            if ( !login_detected ) {
                // Keep showing the login screen; so do nothing
            }
            else if(login_detected ) {
                var platformId = implementationInterfaceBinding.Id;

                // Show the platform specific GUI
                switch (platformId) {
                case ImplementationInterfaceBinding.NONE:
                    console.log("Not recognizing new platform");
                    // Hide the toolbar; Comes back on platform detect
                    frontToolBar.visible = false;
                    stack.pop()
                    handleLoginClick.start();
                    break;
                case ImplementationInterfaceBinding.USB_PD:
                case ImplementationInterfaceBinding.USB_PD_POWER_ONLY:
                    frontToolBar.visible = true
                    if(mainWindow.control_type === "standard") {
                        stack.pop();
                        stack.push([cBoardLayout, {immediate:false}]);
                        frontToolBar.state = "backButtonHidden"
                    }
                    else if (mainWindow.control_type === "advanced") {
                        stack.pop();
                        stack.push([advanced, {immediate:false}]);
                        frontToolBar.state = "backButtonShowing"
                    }
                    //console.log("Displaying USB-PD");
                    break;
                }
            }
            //console.log("stack depth:", stack.depth)
            return true;
        }
    }

    //-----------------------------------------------------------
    //Elements common to both the connection and login screens
    //-----------------------------------------------------------


    Image {
        id: onLogo
        width: 80; height: 80
        anchors{horizontalCenter: parent.horizontalCenter
            bottom:spyglassTextRect.top}
        source: "../images/icons/onLogoGrey.svg"
        mipmap: true;
    }
    Rectangle{
        id: spyglassTextRect
        width: 133; height: 31
        color: "#ffffff"
        anchors.horizontalCenterOffset: -7
        anchors { horizontalCenter: parent.horizontalCenter;
            verticalCenter: parent.verticalCenter;
            verticalCenterOffset: -72 }


    }

    //-----------------------------------------------------------
    //connection screen elements
    //-----------------------------------------------------------
    Text {
        id: searchingText
        x: 217; y: 213
        width: 147; height: 15
        color: "#aeaeae"
        text: qsTr("Searching for hardware")
        anchors { horizontalCenter: parent.horizontalCenter
            top: spyglassTextRect.bottom
            topMargin: 25}
        horizontalAlignment: Text.AlignHCenter
        font.family: "helvetica"
        font.pointSize: smallFontSize
        opacity: 0
    }
    BusyIndicator {
        id: busyIndicator
        x: 301; y: 264
        anchors {horizontalCenter: parent.horizontalCenter
            top: searchingText.bottom
            topMargin: 25}
        font { pixelSize: 8 }
        opacity:0
    }

    //-----------------------------------------------------------
    // login screen elements
    //-----------------------------------------------------------

    Rectangle {
        id: loginRectangle
        x: 225; y: 213
        width: 200; height: 149
        color: "#ffffff"
        border { color: "black"; width: 1 }
        anchors { horizontalCenter: parent.horizontalCenter;
            top: spyglassTextRect.bottom
            topMargin: 15}
        visible:false



        Rectangle {
            id: headerBackground
            x: 1; y: 1
            width: 198; height: 29
            color: "#aeaeae"
        }

        Text {
            id: loginHeaderText
            x: 1; y: 9
            width: 185; height: 15
            color: "#ffffff"
            text: qsTr("login to your account")
            font { bold: true }
            font.family: "helvetica"
            font.pointSize: smallFontSize
            anchors { horizontalCenterOffset: 1; horizontalCenter: parent.horizontalCenter }
            horizontalAlignment: Text.AlignHCenter
        }

        TextField {
            id: usernameField
            x: 8; y: 40
            width: 184; height: 38
            focus: true
            placeholderText: qsTr(" username")
            Material.accent: Material.Grey
            cursorPosition: 3
            font.family: "helvetica"
            font.pointSize: mediumFontSize

            //handle a return key click, which is the equivalent of the login button being clicked
            Keys.onReturnPressed:{
                if (usernameField.text=="" && passwordField.text==""){
                    failedLogin.start();
                }
                else{
                    login_detected = true;
                }
            }
        }

        TextField {
            id: passwordField
            x: 8; y: 75
            width: 184; height: 38
            activeFocusOnTab: true
            placeholderText: qsTr(" password")
            echoMode: TextInput.Password
            Material.accent: Material.Grey
            font.family: "helvetica"
            font.pointSize: mediumFontSize

            //handle a return key click, which is the equivalent of the login button being clicked
            Keys.onReturnPressed:{
                if (usernameField.text=="" && passwordField.text==""){
                    failedLogin.start();
                }
                else{
                    login_detected = true;
                }
            }
        }

        Rectangle{
            id:loginErrorRect
            x:8; y:111
            width: 184; height:48
            color:"red"
            opacity: 0.0

            Image{
                id:alertIcon
                source: "./images/whiteAlertIcon.svg"
                anchors{left:loginErrorRect.left; top:loginErrorRect.top; bottom:loginErrorRect.bottom
                    leftMargin: 5; topMargin:10; bottomMargin:10}
                fillMode:Image.PreserveAspectFit
                mipmap: true;
            }

            Text{
                id:loginErrorText
                font.family: "helvetica"
                font.bold:true
                font.pointSize: smallFontSize
                wrapMode: Label.WordWrap
                anchors {
                    left: alertIcon.right
                    right: loginErrorRect.right
                    verticalCenter: loginErrorRect.verticalCenter
                }
                horizontalAlignment:Text.AlignHCenter
                text: "Your username or password is incorrect"
                color: "white"
            }


        }

        Button {
            id: loginButton
            anchors{bottom:loginRectangle.bottom
                bottomMargin: 6
                left: loginRectangle.left
                leftMargin: 8}
            width: 184; height: 38
            text:"login"
            Material.elevation: 6
            Material.background: loginButton.down ? Qt.darker("#2eb457") : "#2eb457"

            contentItem: Text {
                text: loginButton.text
                font.family: "helvetica"
                opacity: enabled ? 1.0 : 0.3
                color: loginButton.down ? "white" : "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.pointSize: mediumFontSize
                font.bold:true
            }

            onClicked: {

                if (usernameField.text=="" && passwordField.text==""){
                    failedLogin.start();
                }
                else{   //valid login
                    login_detected = true;
                }
            }

        }
    }
    Button {
        id: guestLoginButton
        width: 150; height: 32
        anchors{ horizontalCenter: parent.horizontalCenter;
            top: spyglassTextRect.bottom
            //topMargin: 230    //margin to use when login box is present
            topMargin: 50}

        contentItem: Text {
            text:"continue"
            opacity: enabled ? 1.0 : 0.3
            //the color of the content determines the button's text color
            color: guestLoginButton.down ? Qt.darker("#2eb457") : "#2eb457"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            font.family: "helvetica"
            font.pointSize: mediumFontSize
            font.bold: true
        }
        background: Rectangle {
            color: "white"
            border{ width: 1; color: "black" }
        }
        onClicked: {
            login_detected = true;

        }
    }


    Timer {
        id: myTime
        interval: 5000; running: guestLoginButton.pressed | loginButton.pressed ; repeat: false
        onTriggered:{ stack.pop() }

    }

    SequentialAnimation{
        //animator to show that the login failed
        id:failedLogin

        NumberAnimation {
            target: loginRectangle
            property: "height"
            to: 200
            duration: 700
        }
        NumberAnimation{
            target:loginErrorRect
            property:"opacity"
            to: 1
            duration: 700
        }
    }

    SequentialAnimation{
        //animator to fade out the login elements and show the connection screen
        id:handleLoginClick
        running: false

        ParallelAnimation{
            NumberAnimation{
                target: guestLoginButton;
                property: "opacity";
                to: 0;
                duration: 1000
            }
            NumberAnimation{
                target: loginRectangle;
                property: "opacity";
                to: 0;
                duration: 1000
            }
        }
        ParallelAnimation{
            //reveal the connection screen elements
            NumberAnimation{
                target: searchingText;
                property: "opacity";
                to: 1;
                duration: 1000 }
            NumberAnimation{
                target: busyIndicator;
                property: "opacity";
                to: 1;
                duration: 1000 }
        }
    }

    ParallelAnimation{
        id:showConnectionScreen
        running:false
        NumberAnimation{
            target: guestLoginButton;
            property: "opacity";
            to: 0;
            duration: 1 }
        NumberAnimation{
            target: loginRectangle;
            property: "opacity";
            to: 0;
            duration: 1 }
        //reveal the connection screen elements
        NumberAnimation{
            target: searchingText;
            property: "opacity";
            to: 1;
            duration: 1 }
        NumberAnimation{
            target: busyIndicator;
            property: "opacity";
            to: 1;
            duration: 1 }
    }
}





