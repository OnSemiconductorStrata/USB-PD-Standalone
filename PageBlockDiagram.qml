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
import QtQuick.Layouts 1.3
import QtWebView 1.1
import QtQuick.Dialogs 1.3

Rectangle {
    id : container

    property string currentURL: "http:www.onsemi.com"
    property bool openInExternalBrowser: true

    Rectangle{
        id:viewOptionRectangle
        anchors.top: parent.top
        anchors.bottom: titleText.top
        anchors.bottomMargin:20
        anchors.left:parent.left
        anchors.right:parent.right
        color:"#A7B8D7"
        border.color: "green"
        border.width:4
        radius:10

        Text {
            id:viewOptionText
            text: "Select view option"
            horizontalAlignment: Text.AlignHCenter
            font.family: "Helvetica"
            font.pointSize: largeFontSize
            font.bold: true
            color: "white"
            anchors{ left: parent.left;
                leftMargin: 20
                verticalCenter: parent.verticalCenter
            }
        }

        ButtonGroup{
            id:viewOptionGroup
            exclusive:true
        }
        Button{
            id:datasheetButton
            text:"Datasheet"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:viewOptionText.right
            anchors.leftMargin: 20
            width: 200
            checkable: true
            checked:true

            font.capitalization: Font.MixedCase
            font.pointSize: mediumFontSize

            ButtonGroup.group: viewOptionGroup

            contentItem: Text {
                text: datasheetButton.text
                font: datasheetButton.font
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                //implicitWidth: datasheetButton.width
                //implicitHeight: datasheetButton.height
                color: datasheetButton.checked ? "green" : "grey"
                border.width: 2
                radius: 7
            }

            onClicked:{
                openInExternalBrowser = true;
            }
        }

        Button{
            id:websiteButton
            text:"Website"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:datasheetButton.right
            anchors.leftMargin: 20
            width: 200
            checkable: true
            checked:false
            ButtonGroup.group: viewOptionGroup
            font.capitalization: Font.MixedCase
            font.pointSize: mediumFontSize

            contentItem: Text {
                text: websiteButton.text
                font: websiteButton.font
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                color: websiteButton.checked ? "green" : "grey"
                border.width: 2
                radius: 7
            }

            onClicked:{
                openInExternalBrowser = false;
            }
        }
    }

    Text {
        id:titleText
        text: "USB-PD Dual 100W "
        horizontalAlignment: Text.AlignHCenter
        font.family: "Helvetica"
        font.pointSize: extraLargeFontSize
        color: "grey"
        anchors{ left: parent.left;
            right: parent.right;
            top: parent.top;
            topMargin: parent.height/10
        }

    }




    Image{
        id:blockDiagram
        source: "./images/Beta_Block Diagram.png"
        anchors{left:parent.left
            bottom: parent.bottom
            bottomMargin: 100}

        MouseArea {
            id: batteryProtectionmMouseArea
            x: 205
            y: 39
            width: 100
            height: 79
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVMFS5A140PLZ-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVMFS5A140PLZ"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: nvt211TempSensorMouseArea
            x: 381
            y: 193
            width: 100
            height: 51
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVT211-D.PDF");
                }
                else  {
                    currentURL = "https://www.onsemi.com/PowerSolutions/product.do?id=NVT211"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: remoteTempSensorMouseArea
            x: 386
            y: 328
            width: 82
            height: 37
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/MMBT3904WT1-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=MMBT3906W"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: ncv81599BuckBoostMouseArea1
            x: 539
            y: 59
            width: 100
            height: 80
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    //contact sales rep
                    contactRepPopup.open()
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NCP81239"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea1
            x: 483
            y: 59
            width: 39
            height: 28
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea2
            x: 484
            y: 108
            width: 38
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea3
            x: 658
            y: 59
            width: 37
            height: 28
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea4
            x: 658
            y: 108
            width: 37
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea5
            x: 485
            y: 399
            width: 37
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea6
            x: 483
            y: 450
            width: 37
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea7
            x: 658
            y: 399
            width: 37
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fetMouseArea8
            x: 658
            y: 450
            width: 37
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: ncv81599BuckBoostMouseArea2
            x: 539
            y: 399
            width: 100
            height: 81
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    //contact sales rep
                    contactRepPopup.open()
                }
                else  {
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NCP81239"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: ncv890100BuckRegulatorMouseArea
            x: 438
            y: 552
            width: 127
            height: 84
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NCV890100-D.PDF");
                }
                else{
                    currentURL = "https://www.onsemi.com/PowerSolutions/product.do?id=NCV890100 "
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: vbusDisconnectMouseArea1
            x: 872
            y: 106
            width: 97
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else{
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: vbusDisconnectMouseArea2
            x: 872
            y: 443
            width: 97
            height: 30
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/NVTFS5C453NL-D.PDF");
                }
                else{
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=NVTFS5C453NL"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fusb302tMouseArea1
            x: 785
            y: 169
            width: 100
            height: 63
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/FUSB302T-D.pdf");
                }
                else{
                    currentURL = "https://www.onsemi.com/PowerSolutions/product.do?id=FUSB302T"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: esdProtectionMouseArea1
            x: 928
            y: 175
            width: 100
            height: 55
            cursorShape: Qt.PointingHandCursor
            opacity: 0
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/FUSB252-D.pdf");
                }
                else{
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=FUSB252"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: esdProtectionMouseArea2
            x: 928
            y: 504
            width: 100
            height: 55
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/FUSB252-D.pdf");
                }
                else{
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=FUSB252"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: fusb302tMouseArea2
            x: 785
            y: 497
            width: 100
            height: 63
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (openInExternalBrowser){
                    Qt.openUrlExternally("http://www.onsemi.com/pub/Collateral/FUSB302T-D.pdf");
                }
                else{
                    currentURL = "http://www.onsemi.com/PowerSolutions/product.do?id=FUSB302T"
                    detailView.open()
                }
            }
        }

        MouseArea {
            id: applicationProcessorMouseArea
            x: 545
            y: 236
            width: 105
            height: 82
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            //uncommenting this will cause a crash on quit
            //                ProcessorToolTip{
            //                     visible: applicationProcessorMouseArea.containsMouse
            //                }

        }

    }

    Drawer{
        id: detailView
        x: parent.width
        y: 0
        height: parent.height - tabBar.height
        width: parent.width/2
        edge: Qt.RightEdge
        dragMargin: 0

        ColumnLayout{

            WebView {
                id: detailWebView
                Layout.preferredWidth: container.width/2
                Layout.preferredHeight: container.height - tabBar.height*2
                url: currentURL
                onLoadingChanged: {
                    //console.log("loaded webview with ", currentURL);
                    if (loadRequest.errorString){
                        //console.log("error loading URL");
                        console.error(loadRequest.errorString);
                    }
                }
            } //web view

            Button {
                id: closeButton
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: 184
                Layout.preferredHeight: 28
                text:"close"
                font{ pointSize: 13; bold: true }
                opacity: 1


                contentItem: Text {
                    text: closeButton.text
                    font: closeButton.font
                    opacity: enabled ? 1.0 : 0.3
                    color: closeButton.down ? "white" : "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    color: closeButton.down ? Qt.darker("#2eb457") : "#2eb457"
                    radius: 10
                }

                onClicked: {
                    detailView.close()
                }
            }
        } //ColumnLayout

    }   //drawer

    MessageDialog {
        id: contactRepPopup
        title: "Datasheet not available"
        icon: StandardIcon.Warning
        text: "Contact your sales representative for a datasheet for this part"
        onAccepted: {
            contactRepPopup.close()
        }
    }


}














