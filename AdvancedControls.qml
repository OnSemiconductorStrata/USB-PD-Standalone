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
import "framework"
import "advancedControls"

Rectangle {

    id:advancedControls
    objectName: "advancedControls"
    visible: !flipable.flipped //needed to keep tooltips from showing on other pages

    property int advancedScrollBarWidth: 10

    Component.onCompleted:{
        console.log("AdvancedControls created")
        implementationInterfaceBinding.sendPlatformRefresh();    //get new values for controls from the platform
        implementationInterfaceBinding.sendPlatformIdRequest();  //to get the current UUID to display
    }

    onVisibleChanged: {
        //clear the fault history list, so we don't append duplicates every time the advanced page is shown
        implementationInterfaceBinding.clearFaultHistoryList();
    }

    Connections {
        target: implementationInterfaceBinding

        onPlatformResetDetected: {
            //clear fault history so we don't get duplicate notifications on the refresh() call
            implementationInterfaceBinding.clearFaultHistoryList();
        }

    }



    GridLayout {
        id: grid
        columns: 3
        rows: 3
        anchors {fill:parent}
        columnSpacing: 0
        rowSpacing: 0

        property double colMulti : grid.width / grid.columns
        property double rowMulti : grid.height / grid.rows

        function prefWidth(item){
            return (colMulti * item.Layout.columnSpan)
        }
        function prefHeight(item){
            return rowMulti * item.Layout.rowSpan
        }


        Flickable{
            id: settingsScrollView
            clip: true
            contentHeight: 1280// this has to be set manually based on the height of the controlSettings
            //columns 0 and 1, both rows
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 3
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.fillHeight:true

            property int collapseAnimationSpeed:900

            ScrollBar.vertical: ScrollBar{
                id:testScrollBar
                parent:settingsScrollView
                width:advancedScrollBarWidth
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                height: settingsScrollView.availableHeight
                active: pressed
                contentItem: Rectangle{
                    width:advancedScrollBarWidth
                    radius: width / 2
                    color: disabledTextColor
                }
            }

            Rectangle{
                anchors.fill:parent
                color:advancedControlsBackgroundColor
            }

            AdvancedControlSettings{ id:controlSettings}
        }


        Rectangle {
            id:boardRect
            //columns 0 and 1, both rows
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Layout.fillWidth:true
            Layout.fillHeight:true
            z:1     //set the z level higher so connectors go behind the board
            color:advancedControlsBackgroundColor
            AdvancedBoard{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                //anchors.bottomMargin: parent.height/2
            }

            Text{
                id:usbPDText
                text:"USB-PD Dual"
                font.family: "helvetica"
                font.pointSize: extraLargeFontSize
                color:enabledTextColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.height/20
            }
            Text{
                text:"Advanced Controls"
                font.family: "helvetica"
                font.pointSize: largeFontSize
                color:enabledTextColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: usbPDText.bottom
                anchors.topMargin: usbPDText.height/4
            }
        } //board rectangle

        //----------------------------------------
        //  graphs
        //----------------------------------------
        Rectangle {
            id:graphs
            //column 2, 2 rows
            Layout.column: 2
            Layout.columnSpan: 1
            Layout.row: 0
            Layout.rowSpan: 2
            Layout.preferredWidth  : grid.prefWidth(this)
            Layout.preferredHeight : grid.prefHeight(this)
            Layout.fillWidth:true
            Layout.fillHeight:true

            color: advancedControlsBackgroundColor

            GridLayout{
                id: graphGrid
                columns: 2
                rows: 3
                anchors {fill:parent}
                columnSpacing: 0
                rowSpacing: 0

                property double colMulti : graphGrid.width / graphGrid.columns
                property double rowMulti : graphGrid.height / graphGrid.rows

                function prefWidth(item){
                    return colMulti * item.Layout.columnSpan
                }
                function prefHeight(item){
                    return rowMulti * item.Layout.rowSpan
                }

                Rectangle{
                    id:port1VoltageAndCurrentRect
                    Layout.column: 0
                    Layout.columnSpan: 1
                    Layout.row: 0
                    Layout.rowSpan: 1
                    Layout.preferredWidth  : graphGrid.prefWidth(this)
                    Layout.preferredHeight : graphGrid.prefHeight(this)
                    Layout.fillWidth:true
                    Layout.fillHeight:true
                    color:advancedControlsBackgroundColor

                    AdvancedGraph{
                        id:port1VoltageAndCurrentGraph
                        title: "PORT 1 VOLTAGE"
                        chartType: "Port Voltage"
                        maxYValue: 25
                        portNumber:1
                        anchors.top:parent.top
                        anchors.topMargin: -10
                        anchors.left:parent.left
                        anchors.leftMargin: -10
                        anchors.bottom:parent.bottom
                        anchors.bottomMargin: -10
                        anchors.right:parent.right
                        anchors.rightMargin: -7
                    }

                    Image{
                        id:port1VoltageIcon
                        source: "../images/icons/rightArrowGrey.svg"
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.leftMargin: 20
                        height:20
                        width:20
                    }
                }

                Rectangle{
                    id:port2VoltageAndCurrentRect
                    Layout.column: 1
                    Layout.columnSpan: 1
                    Layout.row: 0
                    Layout.rowSpan: 1
                    Layout.preferredWidth  : graphGrid.prefWidth(this)
                    Layout.preferredHeight : graphGrid.prefHeight(this)
                    Layout.fillWidth:true
                    Layout.fillHeight:true
                    color:advancedControlsBackgroundColor

                    AdvancedGraph{
                        id:port2VoltageAndCurrentGraph
                        title: "PORT 2 VOLTAGE"
                        chartType: "Port Voltage"
                        portNumber:2
                        maxYValue: 25
                        anchors.top:parent.top
                        anchors.topMargin: -10
                        anchors.left:parent.left
                        anchors.leftMargin: -10
                        anchors.bottom:parent.bottom
                        anchors.bottomMargin: -10
                        anchors.right:parent.right
                        anchors.rightMargin: -7
                    }

                    Image{
                        id:port2VoltageIcon
                        source: "../images/icons/rightArrowGrey.svg"
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.leftMargin: 20
                        height:20
                        width:20
                    }
                }


                Rectangle{
                    id:port1PowerRect
                    Layout.column: 0
                    Layout.columnSpan: 1
                    Layout.row: 1
                    Layout.rowSpan: 1
                    Layout.preferredWidth  : graphGrid.prefWidth(this)
                    Layout.preferredHeight : graphGrid.prefHeight(this)
                    Layout.fillWidth:true
                    Layout.fillHeight:true
                    color:advancedControlsBackgroundColor

                    AdvancedGraph{
                        id:port1PowerGraph
                        title: "PORT 1 POWER"
                        chartType: "Port Power"
                        portNumber:1
                        maxYValue: 120
                        yAxisTickCount: 7
                        anchors.top:parent.top
                        anchors.topMargin: -10
                        anchors.left:parent.left
                        anchors.leftMargin: -10
                        anchors.bottom:parent.bottom
                        anchors.bottomMargin: -10
                        anchors.right:parent.right
                        anchors.rightMargin: -7
                    }

                    Image{
                        id:port1PowerIcon
                        source: "../images/icons/voltageIconGrey.svg"
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.leftMargin: 20
                        height:20
                        width:20
                    }
                }

                Rectangle{
                    id:port2PowerRect
                    Layout.column: 1
                    Layout.columnSpan: 1
                    Layout.row: 1
                    Layout.rowSpan: 1
                    Layout.preferredWidth  : graphGrid.prefWidth(this)
                    Layout.preferredHeight : graphGrid.prefHeight(this)
                    Layout.fillWidth:true
                    Layout.fillHeight:true
                    color:advancedControlsBackgroundColor

                    AdvancedGraph{
                        id:port2PowerGraph
                        title: "PORT 2 POWER"
                        chartType: "Port Power"
                        portNumber:2
                        maxYValue: 120
                        yAxisTickCount: 7
                        anchors.top:parent.top
                        anchors.topMargin: -10
                        anchors.left:parent.left
                        anchors.leftMargin: -10
                        anchors.bottom:parent.bottom
                        anchors.bottomMargin: -10
                        anchors.right:parent.right
                        anchors.rightMargin: -7
                    }

                    Image{
                        id:port2PowerIcon
                        source: "../images/icons/voltageIconGrey.svg"
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.leftMargin: 20
                        height:20
                        width:20
                    }
                }
                Rectangle{
                    id:port1TemperatureRect
                    Layout.column: 0
                    Layout.columnSpan: 1
                    Layout.row: 2
                    Layout.rowSpan: 1
                    Layout.preferredWidth  : graphGrid.prefWidth(this)
                    Layout.preferredHeight : graphGrid.prefHeight(this)
                    Layout.fillWidth:true
                    Layout.fillHeight:true
                    color:advancedControlsBackgroundColor

                    AdvancedGraph{
                        id:port1TemperatureGraph
                        title: "PORT 1 TEMPERATURE"
                        chartType: "Port Temperature"
                        portNumber:1
                        maxYValue: 120
                        yAxisTickCount: 7
                        anchors.top:parent.top
                        anchors.topMargin: -10
                        anchors.left:parent.left
                        anchors.leftMargin: -10
                        anchors.bottom:parent.bottom
                        anchors.bottomMargin: -10
                        anchors.right:parent.right
                        anchors.rightMargin: -7
                    }

                    Image{
                        id:port1TemperatureIcon
                        source: "../images/icons/temperatureIconGrey.svg"
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.leftMargin: 10
                        height:20
                        width:20
                    }
                }

                Rectangle{
                    id:port2TemperatureRect
                    Layout.column: 1
                    Layout.columnSpan: 1
                    Layout.row: 2
                    Layout.rowSpan: 1
                    Layout.preferredWidth  : graphGrid.prefWidth(this)
                    Layout.preferredHeight : graphGrid.prefHeight(this)
                    Layout.fillWidth:true
                    Layout.fillHeight:true
                    color:advancedControlsBackgroundColor

                    AdvancedGraph{
                        id:port2TemperatureGraph
                        title: "PORT 2 TEMPERATURE"
                        chartType: "Port Temperature"
                        portNumber:2
                        maxYValue: 120
                        yAxisTickCount: 7
                        anchors.top:parent.top
                        anchors.topMargin: -10
                        anchors.left:parent.left
                        anchors.leftMargin: -10
                        anchors.bottom:parent.bottom
                        anchors.bottomMargin: -10
                        anchors.right:parent.right
                        anchors.rightMargin: -7
                    }

                    Image{
                        id:port2TemperatureIcon
                        source: "../images/icons/temperatureIconGrey.svg"
                        anchors.top:parent.top
                        anchors.left:parent.left
                        anchors.leftMargin: 10
                        height:20
                        width:20
                    }
                }

            }
        }

        //----------------------------------------------------
        //  Messages (faults and CC)
        //----------------------------------------------------
            Rectangle {
                id:message
                //row 3, columns 2 and 3
                Layout.column: 1
                Layout.columnSpan: 2
                Layout.row: 2
                Layout.rowSpan: 1
                Layout.preferredWidth  : grid.prefWidth(this)
                Layout.preferredHeight : grid.prefHeight(this)
                Layout.fillWidth:true
                Layout.fillHeight:true

                RowLayout{
                    anchors.fill:parent
                    spacing:-1
                    Rectangle{
                        id:activeFaults
                        Layout.preferredWidth:parent.width/3
                        Layout.preferredHeight:parent.height
                        color:advancedControlsBackgroundColor
                        border.color:advancedControlsBackgroundColor

                        Label{
                            id: activeFaultsLabel
                            text: "Active Faults"
                            font.family: "Helvetica"
                            font.pointSize: mediumFontSize
                            color: enabledTextColor
                            anchors.left:parent.left
                            anchors.top:parent.top
                            anchors.leftMargin: parent.width/20
                            anchors.topMargin: parent.height/20
                            }

                        Rectangle{
                           id:activeFaultsSeparator
                           anchors.left: parent.left
                           anchors.right: parent.right
                           anchors.leftMargin: parent.width/20
                           anchors.rightMargin: parent.width/20
                           anchors.top: activeFaultsLabel.bottom
                           anchors.topMargin: activeFaultsLabel.height
                           height: 1
                           color:"#CCCCCC"
                        }

                        Rectangle{
                            id:activeFaultsListBackground
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width/20
                            anchors.right: parent.right
                            anchors.rightMargin: parent.width/20
                            anchors.top: activeFaultsSeparator.bottom
                            anchors.topMargin: parent.height/20
                            anchors.bottom:parent.bottom
                            anchors.bottomMargin: parent.height/20
                            color: "#2B2B2B"
                        }

                        ListView {
                            id:activeFaultsListView
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width/20
                            anchors.right: parent.right
                            anchors.rightMargin: parent.width/20
                            anchors.top: activeFaultsSeparator.bottom
                            anchors.topMargin: parent.height/15
                            anchors.bottom:parent.bottom
                            anchors.bottomMargin: parent.height/15

                            ScrollBar.vertical: ScrollBar {
                                    active: true
                                    }

                            model:  implementationInterfaceBinding.activeFaultsList

                            delegate: Text {
                                text: modelData
                                color: "orangered"
                                font.pointSize: smallFontSize
                            }

                        }

                    } //Fault History box

                    Rectangle{
                        id: faultHistory
                        Layout.preferredWidth:parent.width/3
                        Layout.preferredHeight:parent.height
                        color:advancedControlsBackgroundColor
                        border.color:advancedControlsBackgroundColor



                        Label{
                            id: faultHistoryLabel
                            text: "Fault History"
                            font.family: "Helvetica"
                            font.pointSize: mediumFontSize
                            color: enabledTextColor
                            anchors.left:parent.left
                            anchors.top:parent.top
                            anchors.leftMargin: parent.width/20
                            anchors.topMargin: parent.height/20
                            }

                        Rectangle{
                           id: faultHistorySeparator
                           anchors.left: parent.left
                           anchors.right: parent.right
                           anchors.leftMargin: parent.width/20
                           anchors.rightMargin: parent.width/20
                           anchors.top: faultHistoryLabel.bottom
                           anchors.topMargin: faultHistoryLabel.height
                           height: 1
                           color:"#CCCCCC"
                        }

                        Rectangle{
                            id:faultHistoryListBackground
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width/20
                            anchors.right: parent.right
                            anchors.rightMargin: parent.width/20
                            anchors.top: faultHistorySeparator.bottom
                            anchors.topMargin: parent.height/20
                            anchors.bottom:parent.bottom
                            anchors.bottomMargin: parent.height/20
                            color: "#2B2B2B"
                        }



                        ListView {
                            id:faultHistoryListView
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width/20
                            anchors.right: parent.right
                            anchors.rightMargin: parent.width/20
                            anchors.top: faultHistorySeparator.bottom
                            anchors.topMargin: parent.height/15
                            anchors.bottom:parent.bottom
                            anchors.bottomMargin: parent.height/15

                            ScrollBar.vertical: ScrollBar {
                                    active: true
                                    }

                            model: implementationInterfaceBinding.faultHistoryList

                            delegate: Text {
                                text: modelData
                                color: enabledTextColor
                                font.pointSize: smallFontSize
                            }

                            onCountChanged: {
                                var newIndex = count - 1 // last index
                                positionViewAtEnd()
                                currentIndex = newIndex
                            }

                        }


                    }

                    Rectangle{
                        id: usbPdMessages
                        Layout.preferredWidth:parent.width/3 +1
                        Layout.preferredHeight:parent.height
                        color:advancedControlsBackgroundColor
                        border.color:advancedControlsBackgroundColor

                        Label{
                            id: usbPDMessagesLabel
                            text: "Board Info"
                            font.family: "Helvetica"
                            font.pointSize: mediumFontSize
                            color: enabledTextColor
                            anchors.left:parent.left
                            anchors.top:parent.top
                            anchors.leftMargin: parent.width/20
                            anchors.topMargin: parent.height/20
                            visible:true
                            }

                        Rectangle{
                           id: usbPDMessagesSeparator
                           anchors.left: parent.left
                           anchors.right: parent.right
                           anchors.leftMargin: parent.width/20
                           anchors.rightMargin: parent.width/20
                           anchors.top: usbPDMessagesLabel.bottom
                           anchors.topMargin: usbPDMessagesLabel.height
                           height: 1
                           color:"#CCCCCC"
                           visible:true
                        }

                        Rectangle{
                            id:usbPDListBackground
                            anchors.left: parent.left
                            anchors.leftMargin: parent.width/20
                            anchors.right: parent.right
                            anchors.rightMargin: parent.width/20
                            anchors.top: usbPDMessagesSeparator.bottom
                            anchors.topMargin: parent.height/20
                            anchors.bottom:parent.bottom
                            anchors.bottomMargin: parent.height/20
                            color: "#2B2B2B"
                            visible:true

                            Label{
                                id: boardNameTitleLabel
                                text: "Name:"
                                font.family: "Helvetica"
                                font.pointSize: mediumFontSize
                                color: enabledTextColor
                                anchors.left:parent.left
                                anchors.top:parent.top
                                anchors.topMargin: 5
                                anchors.leftMargin: 5
                                visible:true
                                }

                            Label{
                                id: boardNameLabel
                                text: implementationInterfaceBinding.verboseName
                                font.family: "Helvetica"
                                font.pointSize: smallFontSize
                                color: enabledTextColor
                                anchors.left:parent.left
                                anchors.top:boardNameTitleLabel.bottom
                                anchors.leftMargin: 20
                                anchors.topMargin: 5
                                visible:true
                                }

                            Label{
                                id: uniqueIDTitleLabel
                                text: "Version:"
                                font.family: "Helvetica"
                                font.pointSize: mediumFontSize
                                color: enabledTextColor
                                anchors.left:parent.left
                                anchors.top:boardNameLabel.bottom
                                anchors.topMargin: 10
                                anchors.leftMargin: 5
                                visible:true
                                }

                            Label{
                                id: uniqueIDLabel
                                text: {
                                    implementationInterfaceBinding.uniqueID.substring(0,implementationInterfaceBinding.uniqueID.length-56);
                                }
                                font.family: "Helvetica"
                                font.pointSize: smallFontSize
                                color: enabledTextColor
                                anchors.left:parent.left
                                anchors.top:uniqueIDTitleLabel.bottom
                                anchors.topMargin: 5
                                anchors.leftMargin: 20
                                visible:true
                                }

                            Label{
                                id: firmwareVersionTitleLabel
                                text: "Firmware version:"
                                font.family: "Helvetica"
                                font.pointSize: mediumFontSize
                                color: enabledTextColor
                                anchors.left:parent.left
                                anchors.top:uniqueIDLabel.bottom
                                anchors.topMargin: 10
                                anchors.leftMargin: 5
                                visible:true
                                }

                            Label{
                                id: firmwareVersionLabel
                                text: implementationInterfaceBinding.firmwareVersion
                                font.family: "Helvetica"
                                font.pointSize: smallFontSize
                                color: enabledTextColor
                                anchors.left:parent.left
                                anchors.top:firmwareVersionTitleLabel.bottom
                                anchors.topMargin: 5
                                anchors.leftMargin: 20
                                visible:true
                                }
                        }





                        Image {
                            id: infoIcon
                            anchors{ bottom: parent.bottom;
                                bottomMargin: 10
                                right: parent.right
                                rightMargin: 10}
                            height: 44; width:44
                            source:"./images/icons/infoIconWhite.svg"
                            opacity:.7

                            MouseArea {
                                id: imageMouse
                                anchors.fill: parent
                                hoverEnabled: true
                                //cursorShape: Qt.PointingHandCursor
                                onClicked: flipable.flipped = !flipable.flipped

                            }
                        }


                    }
                }
            }

    }   //grid layout



}
