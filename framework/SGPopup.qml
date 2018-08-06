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

Popup {
    id: container
    property alias axisXLabel: labelAxis_x.text
    property alias axisYLabel: labelAxis_y.text
    property alias axisY2Label: labelAxis_y2.text
    property alias inVariable1Color: labelAxis_y.color
    property alias inVariable2Color: labelAxis_y2.color
    property string chartType: ""
    property string chartTitle: ""
    property real startPositionX: 0
    property real startPositionY: 0
    property bool efficencyLabel: false;
    property int portNumber:0
    property bool powerMessageVisible: false;
    property bool graphVisible: false;
    property var selection: undefined
    property bool overlimitVisibility : false;
    property bool underlimitVisibility: false;

    modal: true
    focus: false
    dim: true

    transformOrigin : Popup.Center

    background: Rectangle {
        color: "transparent"
        border.color : "transparent"

        Image {
            id: popupBorder
            source: "./images/dialogBorder.svg"
            width: container.width; height: container.height

            MouseArea {
                id: mouseArea
                width: parent.width/7; height: width
                anchors.centerIn: popupBorder.Top
                anchors.right: popupBorder.right
                onClicked: { container.close() }
            }
        }
    }


    enter: Transition {
        // grow and fade_in
        ParallelAnimation {
            NumberAnimation { property: "scale"; from: 0.1; to: 1.0; easing.type: Easing.OutQuint; duration: 1000 }
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; easing.type: Easing.OutCubic; duration: 1000  }
            //NumberAnimation { property: "x"; from: startPositionX; to:parent.width/4-container.width/2; duration: 1000}
            //NumberAnimation { property: "y"; from: startPositionY; to:parent.height/4-container.height/2; duration: 1000}
        }
    }

    exit: Transition {
        // shrink and fade_out
        ParallelAnimation {
            NumberAnimation { property: "scale"; from: 1.0; to: 0.1; easing.type: Easing.OutQuint; duration: 500 }
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; easing.type: Easing.OutCubic; duration: 500 }
        }
    }
    contentItem:


        Rectangle {
        id:contentItem
        width: container.width/10; height: container.height/10
        color: "transparent"
        border.color : "transparent"

        Image {
            id: powerMessage
            width: container.width/1.3; height: container.height/1.3
            visible: powerMessageVisible
            anchors { centerIn: parent }
            source: "./images/Port_Power_Messages_Dialog.png"
        }
        Label {
            id: labelAxis_x
            width: 100; height: 50
            color: "black"
            fontSizeMode:Text.Fit
            font{ family:"helvetica"}
            anchors { bottom: contentItem.bottom; bottomMargin: -35; horizontalCenter: contentItem.horizontalCenter}
        }
        Label {
            id: labelAxis_y
            width: 100; height: 50
            color: "black"
            fontSizeMode:Text.Fit
            font{ family:"helvetica"}
            rotation: -90
            anchors { left: contentItem.left;
                verticalCenter: contentItem.verticalCenter;
            }
        }
        Label {
            id: labelAxis_y2
            width: 100; height: 50
            color: inVariable2Color
            fontSizeMode:Text.Fit
            font{ family:"helvetica" }
            rotation: 90
            anchors { right: contentItem.right ;
                verticalCenter: contentItem.verticalCenter ;
                verticalCenterOffset: labelAxis_y2.height;}
        }


        SGScopeView {
            id: graph
            visible: graphVisible
            efficencyVisible: efficencyLabel
            width: container.width/1.2 ; height: container.height/1.1
            anchors { centerIn: parent }
            chartType: container.chartType
            chartTitle: container.chartTitle
            portNumber: container.portNumber
            portTempRedZone: overlimitVisibility
            inputPowerRedZone: underlimitVisibility
        }
    }
}

