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
import QtGraphicalEffects 1.0
import tech.spyglass.ImplementationInterfaceBinding 1.0


Rectangle {
    id: connector
    width: parent.width; height: (parent.width * .75)
    color:"transparent"
    border{ color: "transparent"; width: 2 }
    radius: 10
    property int anchorbottom: 0
    anchors.bottom: if(anchorbottom) { parent.bottom }
    property bool isConnected: false
    signal activated()
    property alias connectanimation: connect
    property alias disconnectanimation: disconnect
    property int portNumber:0;
    property double leftUSBPlugInitialXPosition
    property double originalCableWidth


    Component.onCompleted:{
        //save off the initial x position of the plug, so we can restore it later when
        //the device is unplugged
        leftUSBPlugInitialXPosition = leftUSBPlug.x;
        originalCableWidth = connector.width/1.35;
        var state;
        if(visible){
            if (portNumber == 1) {
                state = implementationInterfaceBinding.getUSBCPortState(1);
                if(state === true)
                    connect.start();
            }
            else if (portNumber == 2) {
                state = implementationInterfaceBinding.getUSBCPortState(2);
                if(state === true)
                    connect.start();
            }
        }
    }

    Connections {
        target: implementationInterfaceBinding

        onUsbCPortStateChanged: {
            if( portNumber === port ) {
                (value == true)?connect.start():disconnect.start();
            }
        }
    }

    //[Prasanth] this property is needed, when the usb-c is connected before the app launch
    //[Prasanth] needs more organisation for this function
    onVisibleChanged: {
        if(visible){
            if (portNumber == 1) {
                var state = implementationInterfaceBinding.getUSBCPortState(1);
                if(state === true)
                    connect.start();
            }
            if (portNumber == 2) {
                var state = implementationInterfaceBinding.getUSBCPortState(2);
                if(state === true)
                    connect.start();
            }
        }
    }

    //Create a cable

    Canvas {
        id: cable
        x: leftUSBPlug.x + leftUSBPlug.width; y: leftUSBPlug.y
        width: connector.width/1.35; height: 100
        anchors{ left: leftUSBPlug.right; right: connector.right }
        property color strokeStyle: "black"
        property color fillStyle: "#b40000" // red
        property int lineWidth: 2
        property bool fill: true
        property bool stroke: true
        property real alpha: 1.0
        property real halfWidth: width/2
        //antialiasing: true

        onWidthChanged: requestPaint()
        onHalfWidthChanged: requestPaint()

        onPaint: {
            var ctx = cable.getContext('2d');
            ctx.fillStyle = Qt.rgba(1, 0, 0, 1);    //red

            //clear the viewport. This seems to be key to animating a redraw of the line
            //not driven by a change in the frame size
            ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);

            var halfConnectorHeight = leftUSBPlug.height/2
            var halfHeight = height/2
            var quarterWidth = halfWidth/2
            var eighthWidth = halfWidth/4
            var sixteenthWidth = halfWidth/8
            var thirtysecondWidth = halfWidth/16

            ctx.save();
            ctx.strokeStyle = cable.strokeStyle;
            ctx.fillStyle = cable.fillStyle;
            ctx.lineWidth = cable.lineWidth;

            //for debugging
            //ctx.fillRect(0, 0, width, height)
            //ctx.strokeRect(0,0, width, height)


            ctx.beginPath();
            ctx.moveTo(halfWidth, cable.top)
            ctx.lineTo(halfWidth, cable.bottom)


            ctx.moveTo(0,halfConnectorHeight);
            //a bit of rigidity from the cable on the left
            ctx.quadraticCurveTo(sixteenthWidth,halfConnectorHeight,eighthWidth,halfConnectorHeight*1.5);

            //bottom middle of the span
            if (! isConnected){
                ctx.quadraticCurveTo(halfWidth, height, width - eighthWidth,halfConnectorHeight*1.5)
            }
            else{
                ctx.quadraticCurveTo(halfWidth, height, width - quarterWidth,halfConnectorHeight*1.5)
            }

            //a bit of rigidity on the right
            if (! isConnected){
                ctx.quadraticCurveTo(width - sixteenthWidth,halfConnectorHeight,width,halfConnectorHeight);
                }
            else{
                ctx.quadraticCurveTo(width - quarterWidth,halfConnectorHeight*1.5,width,halfConnectorHeight);
            }

            ctx.stroke();
            ctx.restore();
        }

        SequentialAnimation {
            running: false
            id: connect


            NumberAnimation {
                target: leftUSBPlug
                property: "x";
                from: leftUSBPlug.x
                to: connector.x - connector.width/12
                easing.type: Easing.InQuad;
                duration: 500
            }

            //swing left
            PropertyAnimation {
                target: cable;
                property: "halfWidth";
                from:cable.width/2;
                to: cable.width/4;
                easing.type: Easing.OutQuad;
                duration: 500
            }

            //swing right
            PropertyAnimation {
                target: cable;
                property: "halfWidth";
                from:cable.width/4;
                to: 3* cable.width/4;
                easing.type: Easing.OutQuad;
                duration: 750
            }

            //swing back to center
            PropertyAnimation {
                target: cable;
                property: "halfWidth";
                from:3* cable.width/4;
                to: cable.width/2;
                easing.type: Easing.OutQuad;
                duration: 1000
            }
        }

        SequentialAnimation {
            id: disconnect
            running: false

            NumberAnimation {
                target: leftUSBPlug
                property: "x";
                from: leftUSBPlug.x
                to: connector.x + connector.width/4
                //to:leftUSBPlugInitialXPosition
                easing.type: Easing.OutQuad;
                duration: 500
            }

            //swing right
            PropertyAnimation {
                target: cable;
                property: "halfWidth";
                from:cable.width/2;
               // from:width/8
                to: 5* cable.width/8;
                //to: 5*width/16
                easing.type: Easing.OutQuad;
                duration: 500
            }

            //swing left
            PropertyAnimation {
                target: cable;
                property: "halfWidth";
                from:5*cable.width/8;
                to: 3*cable.width/8;
                //from: 5*width/16
                //to: 3*width/16
                easing.type: Easing.OutQuad;
                duration: 750
            }

            //swing back to center
            PropertyAnimation {
                target: cable;
                property: "halfWidth";
                from:3*cable.width/8;
                to: cable.width/2;
                //from: 3*width/16
                //to: width/4
                easing.type: Easing.OutQuad;
                duration: 1000
            }
        }
    }


    Image {
        id: leftUSBPlug
        width: connector.width/5; height: connector.height/4
        x:  connector.x + connector.width/3
        anchors{ verticalCenter: connector.verticalCenter }
        source: "./images/rightUSBPlug.svg"

        MouseArea {
            anchors { fill: parent }

            onClicked: {
                if (!isConnected){
                    isConnected = true;
                    connect.start();
                }
                else{
                    isConnected = false;
                    disconnect.start();
                }
            }
        }
    }

    DropShadow {
        anchors.fill: leftUSBPlug
        horizontalOffset: 1
        verticalOffset: 3
        radius: 12.0
        samples: 24
        color: "#60000000"
        source: leftUSBPlug
    }
}






