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
#include "ImplementationInterfaceBinding.h"
#include "../../../include/zhelpers.hpp"
#include <QRegularExpression>

using namespace std;
using namespace Spyglass;

/*!
 * Constructor initialization
 * Initialize port voltages and current to NULL
 * Tie the respective signal and slots using connect
 */

ImplementationInterfaceBinding::ImplementationInterfaceBinding(QObject *parent) : QObject(parent) {

    hcc_object = new (HostControllerClient);
    Ports.a_oport[0]='\0';
    Ports.a_oport[1]='\0';
    Ports.v_oport[0]='\0';
    Ports.v_oport[1]='\0';
    Ports.v_tport[0]='\0';
    Ports.v_tport[1]='\0';
    Ports.temperature[0]='\0';
    Ports.temperature[0]='\0';
    Ports.power[0]='\0';
    Ports.power[1]='\0';
    usbCPort1State = false;
    usbCPort2State = false;
    inputVoltage =0;

#ifdef QT_NO_DEBUG
    // Release should not assume anything
    platformState = false;
    platformId = NONE;
#else
    // Debug builds should not need a platform board
   platformState = true;
   platformId = NONE;
#endif

    notification_thread_= std::thread(&ImplementationInterfaceBinding::notificationsThreadHandle,this);

#if BOARD_DATA_SIMULATION
    // Simulation for load board data only
    targetVoltage = 5;
#endif



}

ImplementationInterfaceBinding::~ImplementationInterfaceBinding() {

    hcc_object->notificationSocket->close();
    hcc_object->sendCmdSocket->close();
    zmq_term(hcc_object->context);
    delete(hcc_object);
    notification_thread_.detach();
}

void ImplementationInterfaceBinding::setOutputVoltageVBUS(int port, int voltage)
{
    qDebug("ImplementationInterfaceBinding::setOutputVoltageVBUS(%d, %d)", port, voltage);

    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_usb_pd_output_voltage");
    QJsonObject payloadObject;
    payloadObject.insert("port", port);
    payloadObject.insert("Volts", voltage);
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(port == 1) {
        if(hcc_object->sendCmd(strJson.toStdString()))
            qDebug() << "Radio button send";
        else
            qDebug() << "Radio button send failed";
    }
    if(port == 2) {
        if(hcc_object->sendCmd(strJson.toStdString()))
            qDebug() << "Radio button send";
        else
            qDebug() << "Radio button send failed";
    }


#if BOARD_DATA_SIMULATION
    // For load board data simulation only
    targetVoltage = voltage;
#endif
}

void ImplementationInterfaceBinding::setRedriverLoss(float lossValue)
{
    //qDebug("ImplementationInterfaceBinding::setRedriverLoss(%f)", lossValue);
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_redriver_signal_loss");
    QJsonObject payloadObject;
    payloadObject.insert("loss_value", lossValue);
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    hcc_object->sendCmd(strJson.toStdString());

}

void ImplementationInterfaceBinding::setRedriverConfiguration(QString value)
{
    //qDebug("ImplementationInterfaceBinding::setRedriverConfiguration(%d)", value);
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_data_configuration");
    QJsonObject payloadObject;
    payloadObject.insert("value", value);
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Command sent with value" << doc;
    else
        qDebug() << "Command send failed";
}

void ImplementationInterfaceBinding::setCableCompensation(int inPort, float inCurrent, float inMilliVolts)
//Note that the UI deals in millivolts, but the platform deals in volts
{
    //qDebug("ImplementationInterfaceBinding::setCableCompensation(%d)", inCurrent);
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "set_cable_loss_compensation");
    QJsonObject payloadObject;
    payloadObject.insert("port",inPort);
    payloadObject.insert("output_current",inCurrent);
    payloadObject.insert("bias_voltage",inMilliVolts/1000);

    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Command sent with value" << doc;
    else
        qDebug() << "Command send failed";
}

//this triggers the platform to send all of the current values it holds for controls
//as separate notifications
void ImplementationInterfaceBinding::sendPlatformRefresh()
{
    //qDebug("ImplementationInterfaceBinding::sendPlatformRefresh()");
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_platform_refresh");
    QJsonObject payloadObject;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Command sent with value" << doc;
    else
        qDebug() << "Command send failed";
}

//this returns the platform to an initial state, ready to process any built-in command.
void ImplementationInterfaceBinding::sendPlatformReset()
{
    //qDebug("ImplementationInterfaceBinding::sendPlatformRefresh()");
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "platform_reset");
    QJsonObject payloadObject;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Command sent with value" << doc;
    else
        qDebug() << "Command send failed";
}

//Ask the board to identify itself
void ImplementationInterfaceBinding::sendPlatformIdRequest()
{
    qDebug("ImplementationInterfaceBinding::sendPlatformIdRequest()");
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_platform_id");
    QJsonObject payloadObject;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Command sent with value" << doc;
    else
        qDebug() << "Command send failed";
}

bool ImplementationInterfaceBinding::getUSBCPortState(int port_number)
{
    switch(port_number){
    case 1: return usbCPort1State;
            break;
    case 2: return usbCPort2State;
            break;
    default: return true;
    }
    return false;
}

// dictates platform behavior upon any type of fault (input voltage low, temp high, too much current drawn, etc.)
void ImplementationInterfaceBinding::setFaultMode(QString faultModeAction)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_protection_action");
    QJsonObject payloadObject;
    payloadObject.insert("action", faultModeAction);
    qDebug() << "fault mode action "<<faultModeAction;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Sent command with value" << doc;
    else
        qDebug() << "Command send failed";
}

//set all the parameters for temperature foldback
void ImplementationInterfaceBinding::setTemperatureFoldbackParameters(bool inEnabled,
                                                              float inTemperature,
                                                              int inWatts)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_temperature_foldback");
    QJsonObject payloadObject;
    payloadObject.insert("enabled", inEnabled);
    payloadObject.insert("temperature", inTemperature);
    payloadObject.insert("power", inWatts);
    //qDebug() << "temperature foldback action "<<inEnabled << inTemperature<< inWatts;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Sent command with value" << doc;
    else
        qDebug() << "Command send failed";
}

//the platform uses one command to set the status of voltage foldback,
//the voltage to start limiting at, and the number of watts to limit ouput to
//The UI sets these values independently, so they have to be bundled here.
void ImplementationInterfaceBinding::setVoltageFoldbackParameters(bool inEnabled,
                                                              float inVoltage,
                                                              int inWatts)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_voltage_foldback");
    QJsonObject payloadObject;
    payloadObject.insert("enabled", inEnabled);
    payloadObject.insert("voltage", inVoltage);
    payloadObject.insert("power", (float)inWatts);
    qDebug() << "voltage foldback action "<<inEnabled << inVoltage<< inWatts;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Sent command with value" << doc;
    else
        qDebug() << "Command send failed";
}

void ImplementationInterfaceBinding::setInputVoltageHysteresis(float inHysteresis){

    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "set_input_voltage_hysteresis");
    QJsonObject payloadObject;
    payloadObject.insert("value", inHysteresis);
    qDebug() << "input hysteresis action "<< inHysteresis;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Sent command with value" << doc;
    else
        qDebug() << "Command send failed";
}

void ImplementationInterfaceBinding::setTemperatureHysteresis(float inHysteresis){

    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "set_temperature_hysteresis");
    QJsonObject payloadObject;
    payloadObject.insert("value", inHysteresis);
    qDebug() << "temperature hysteresis action "<< inHysteresis;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Sent command with value" << doc;
    else
        qDebug() << "Command send failed";
}

//this sets the starting input voltage that will generate a fault
void ImplementationInterfaceBinding::setInputVoltageLimiting(float value)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_set_minimum_voltage");
    QJsonObject payloadObject;
    payloadObject.insert("value", value);
    qDebug() << "voltage limit "<<value;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Send command with value" << doc;
    else
        qDebug() << "Command send failed";
}

void ImplementationInterfaceBinding::setPortMaximumCurrent(int inPort,
                                                           float inMaximumCurrent)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_over_current_protection");
    QJsonObject payloadObject;
    payloadObject.insert("port", inPort);
    payloadObject.insert("enabled", true);
    payloadObject.insert("maximum_current", inMaximumCurrent);
    qDebug() << "maximum current "<<inMaximumCurrent;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Radio button send with value" << doc;
    else
        qDebug() << "Radio button send failed";
}

void ImplementationInterfaceBinding::setMaximumTemperature(float value)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_set_maximum_temperature");
    QJsonObject payloadObject;
    payloadObject.insert("value", value);
    qDebug() << "temp limit "<<value;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Radio button send with value" << doc;
    else
        qDebug() << "Radio button send failed";
}

void ImplementationInterfaceBinding::setMaximumPortPower(int port,int value)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_usb_pd_maximum_power");
    QJsonObject payloadObject;
    payloadObject.insert("port",port);
    payloadObject.insert("watts", value);
    //qDebug() << "maximum power "<<value;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Radio button send with value" << doc;
    else
        qDebug() << "Radio button send failed";
}

void ImplementationInterfaceBinding::setMinimumInputVoltage(int value)
{
    QJsonObject cmdMessageObject;
    cmdMessageObject.insert("cmd", "request_set_minimum_voltage");
    QJsonObject payloadObject;
    payloadObject.insert("value",value);
    qDebug() << "Setting minimum input voltage: " << value;
    cmdMessageObject.insert("payload",payloadObject);
    QJsonDocument doc(cmdMessageObject);
    QString strJson(doc.toJson(QJsonDocument::Compact));

    if(hcc_object->sendCmd(strJson.toStdString()))
        qDebug() << "Sent cmd with value" << doc;
    else
        qDebug() << "Send failed";
}

/*!
 * Getter and Setter methods, used for retriving/writing something to/from platform
 * Retreived/set value is indidcated by function name.
 * For instance getVoltagePort0 gets voltage of port 0 from
 * the platform
 */

/*! \brief gets the cached voltage of port 0
 */

float ImplementationInterfaceBinding::getoutputVoltagePort0() {

    qDebug() << "getting port 0 voltage";
    return Ports.v_oport[0];
}

/*! \brief gets the cached voltage of port 1
 */
float ImplementationInterfaceBinding::getInputVoltage() {

    return inputVoltage;
}

/*! \brief gets the cached current of port 0
 */
float ImplementationInterfaceBinding::getoutputCurrentPort0() {

    return Ports.a_oport[0];
}


float ImplementationInterfaceBinding::getPort0Temperature() {

    return Ports.temperature[0];
}

float ImplementationInterfaceBinding::getpowerPort0() {

    return Ports.power[0];
}



/*!
 * \brief get platform connection state
 */
bool ImplementationInterfaceBinding::getPlatformState() {

    return platformState;
}

/*!
 * \brief get USB PD port 1 connection state
 */
bool ImplementationInterfaceBinding::getUSBCPort1State() {
    //usbCPortState[0] = usbCPort1State;
//    usbCPortState[1] = usbCPort2State;
    return usbCPort1State;
}

/*!
 * \brief get USB PD port 2 connection state
 */
bool ImplementationInterfaceBinding::getUSBCPort2State() {

    return usbCPort2State;
}

/*!
 * \brief get data path state
 */
QString ImplementationInterfaceBinding::getDataPath() {

    return dataPath;
}

void ImplementationInterfaceBinding::clearFaultHistoryList() {

    fault_history_.clear();
}

/*!
 * End of Getter and Setter Methods
 */


bool ImplementationInterfaceBinding::registerDataSourceHandler(std::string source, DataSourceHandler handler)
{
    qDebug("ImplementationInterfaceBinding::registerDataSourceHanlder:"
              "source=%s", source.c_str());

    auto search = data_source_handlers_.find(source);
    if( search != data_source_handlers_.end()) {
        qCritical("ImplementationInterfaceBinding::registerDataSourceHanlder:"
                  " ERROR: handler already exits for %s !!", source.c_str ());
        return false;
    }

    data_source_handlers_.emplace(std::make_pair(source, handler));

    // notify Host Controller Service of the data source connection
    //    {
    //        "db::cmd":"connect_data_source",
    //        "db::payload":{
    //            "type":"documents"
    //        }
    //    }
    //
    QJsonObject cmd;
    QJsonObject payload;

    cmd.insert("db::cmd", "connect_data_source");
    payload.insert("type", source.c_str());
    cmd.insert("db::payload", payload);
    QJsonDocument doc(cmd);
    QString strJson(doc.toJson(QJsonDocument::Compact));

    if(hcc_object->sendCmd(strJson.toStdString()))
        qCritical() << "db command send success";
    else
        qCritical() << "db command send failure";
    return true;
}

/*!
 * Notification handlers
 * if there is any change in the newly received voltage from the
 * platform notify it to UI by emitting respective signals
 */

void ImplementationInterfaceBinding::handleNotification(QVariantMap current_map)
{
    QVariantMap payloadMap;

    //what kind of notifications are we getting back? I'll omit the steady stream of power notifications
    //if (current_map["value"] != "request_usb_power_notification"){
    //    qDebug() << "notification received! "<< current_map["value"].toString()<<" " <<current_map["payload"];
    //}

    if(current_map.contains("value")) {
        if(current_map["value"] == "request_usb_power_notification") {
            payloadMap = current_map["payload"].toMap();
            handleUsbPowerNotification(payloadMap);
        } else if(current_map["value"] == "platform_id") {
            //qDebug() << "Received platform id notification"<<payloadMap;
            payloadMap = current_map["payload"].toMap();
            handlePlatformIdNotification(payloadMap);

        } else if (current_map["value"] == "platform_connection_change_notification"){
            payloadMap=current_map["payload"].toMap();
            handlePlatformStateNotification(payloadMap);
        } else if (current_map["value"] == "usb_pd_port_connect"){
            payloadMap=current_map["payload"].toMap();
            handleUSBCportConnectNotification(payloadMap);
        } else if (current_map["value"] == "usb_pd_port_disconnect"){
            payloadMap=current_map["payload"].toMap();
            handleUSBCportDisconnectNotification(payloadMap);
        } else if (current_map["value"] == "usb_pd_cable_swap_notification"){
            payloadMap=current_map["payload"].toMap();
            handleUSBPDcableswapNotification(payloadMap);
        } else if (current_map["value"] == "request_input_voltage_notification"){
            payloadMap=current_map["payload"].toMap();
            handleInputVoltageNotification(payloadMap);
        } else if (current_map["value"] == "request_reset_notification"){
            payloadMap=current_map["payload"].toMap();
            handleResetNotification(payloadMap);
        } else if (current_map["value"] == "input_under_voltage_notification"){
             qDebug() << "Received under voltage notification";
            payloadMap=current_map["payload"].toMap();
            handleInputUnderVoltageNotification(payloadMap);
        } else if (current_map["value"] == "over_temperature_notification"){
            payloadMap=current_map["payload"].toMap();
            handleOverTemperatureNotification(payloadMap);
        } else if (current_map["value"] == "usb_pd_negotiated_contract_notification"){
            payloadMap=current_map["payload"].toMap();
            handleNegotiatedContractNotification(payloadMap);
        }else if (current_map["value"] == "usb_pd_maximum_power"){
            payloadMap=current_map["payload"].toMap();
            handleMaximumPortPowerNotification(payloadMap);
        }else if (current_map["value"] == "usb_pd_protection_action"){
            payloadMap=current_map["payload"].toMap();
            handleFaultProtectionNotification(payloadMap);
        }else if (current_map["value"] == "request_data_configuration"){
            payloadMap=current_map["payload"].toMap();
            handleDataConfigurationNotification(payloadMap);
        }else if ((current_map["value"] == "foldback_input_voltage_limiting_event") ||
                 (current_map["value"] == "foldback_input_voltage_limiting_refresh")){
            payloadMap=current_map["payload"].toMap();
            handleInputVoltageFoldbackNotification(payloadMap);
        }else if ((current_map["value"] == "foldback_temperature_limiting_event")||
                  (current_map["value"] == "foldback_temperature_limiting_refresh")){
            payloadMap=current_map["payload"].toMap();
            handleTemperatureFoldbackNotification(payloadMap);
        }else if (current_map["value"] == "set_input_under_voltage_notification"){
            payloadMap=current_map["payload"].toMap();
            handleInputUnderVoltageValueNotification(payloadMap);
        }else if (current_map["value"] == "set_maximum_temperature_notification"){
            payloadMap=current_map["payload"].toMap();
            handleMaximumTemperatureNotification(payloadMap);
        }else if (current_map["value"] == "request_over_current_protection_notification"){
            payloadMap=current_map["payload"].toMap();
            handlePortOverCurrentNotification(payloadMap);
         }else if (current_map["value"] == "usb_pd_advertised_voltages_notification"){
            payloadMap=current_map["payload"].toMap();
            handlePortAdvertisedVoltagesNotification(payloadMap);
         }else if (current_map["value"] == "get_cable_loss_compensation"){
            payloadMap=current_map["payload"].toMap();
            handlePortCableCompensationNotification(payloadMap);
         }else if (current_map["value"] == "input_voltage_hysteresis"){
            payloadMap=current_map["payload"].toMap();
            handleInputVoltageHysteresisNotification(payloadMap);
         }else if (current_map["value"] == "temperature_hysteresis"){
            payloadMap=current_map["payload"].toMap();
            handleTemperatureHysteresisNotification(payloadMap);
         }else if (current_map["value"] == "system_stats"){
            payloadMap=current_map["payload"].toMap();
            //handleSystemStatsNotification(payloadMap);
            }


        else {
            qDebug() << "Unsupported value field Received";
            qDebug() << "Received JSON = " <<current_map;
        }
    }
}


void ImplementationInterfaceBinding::handleCloudNotification(QJsonObject json_obj)
{
    if( json_obj.contains("cloud::notification") == false ) {
        qCritical("ImplementationInterfaceBinding::handleCloudNotification"
                  " ERROR: cloud_sync argument does not exist!!");
        return;
    }

    // data source type: document_set, chat, marketing et al
    QJsonObject payload = json_obj["cloud::notification"].toObject();
    string type = payload.value("type").toString().toStdString();

    auto handler = data_source_handlers_.find(type);
    if( handler == data_source_handlers_.end()) {
        qCritical("ImplementationInterfaceBinding::handleNotification"
                  " ERROR: no handler exits for %s !!", type.c_str ());
        return;
    }

    handler->second(payload);  // dispatch handler for notification

}

/*!
 * \brief :
 *          @params: payloadMap map of usb_pd_power notification
 *                   parses and notifies the corresponding signal
 */
void ImplementationInterfaceBinding::handleUsbPowerNotification(const QVariantMap payloadMap) {

    // TODO [ian] needs error checking on json object parsing
    //qDebug() << payloadMap;
    int port = payloadMap["port"].toInt();
#if !BOARD_DATA_SIMULATION
    float output_voltage = payloadMap["output_voltage"].toFloat();
    emit portOutputVoltageChanged(port, output_voltage);
    //qDebug() << "handle output_voltage: "<<output_voltage;

//    float target_voltage = payloadMap["target_volts"].toFloat();
//    emit portTargetVoltageChanged(port, target_voltage);

    float current = payloadMap["output_current"].toFloat();
    float input_amperage = payloadMap["input_current"].toFloat();
    //qDebug() << "output amperage notification: "<<current;

    if(port == 1) {
        port1Current = current;
        port1InputCurrent = input_amperage;
    }
    if(port == 2) {
        port2Current = current;
        port2InputCurrent = input_amperage;
    }

    if(usbCPort2State && usbCPort2State)
        emit portCurrentChanged(port, port2Current+port1Current);
    else if(usbCPort1State && !usbCPort2State)
        emit portCurrentChanged(port, port1Current);
    else if(!usbCPort1State && usbCPort2State)
        emit portCurrentChanged(port, port2Current);

    float power = output_voltage*current;
    emit portPowerChanged(port, power);

    QString deviceType = payloadMap["device"].toString();
    bool isPDDevice = false;
    if (deviceType == "PD"){
        isPDDevice = true;
        }
    //if (port == 2)
    //    qDebug() << "port "<<port<<" pd device: "<<deviceType<<" sending "<<isPDDevice;
    emit portDeviceIsPDChanged(port, isPDDevice);

    float advertisedMaxCurrent = payloadMap["advertised_maximum_current"].toFloat();
    emit portAdvertisedMaxCurrentChanged(port, advertisedMaxCurrent);

    float temperature = payloadMap["temperature"].toFloat();
    //qDebug() << "Port "<<port<<" temperature:"<<temperature;
    emit portTemperatureChanged(port, temperature);

    float input_voltage = payloadMap["input_voltage"].toFloat();

    emit portEfficencyChanged(port, input_voltage*current, power);
    emit portInputVoltageChanged(1, input_voltage);
    //since input power is coming in the messages for both port 1 and 2, it is emitted twice as often as all the other
    //metrics. To solve that problem, only emit the port power if we have an update from port 1
    if (port == 1){
        emit portInputPowerChanged(1, (port1InputCurrent + port2InputCurrent)*input_voltage, input_voltage, input_amperage);
    }

    float negotiated_voltage = payloadMap["negotiated_voltage"].toFloat();
    //qDebug() << "handle negotiated_voltage: "<<negotiated_voltage;
    emit portNegotiatedVoltageChanged(port, negotiated_voltage);

    float negotiated_current = payloadMap["negotiated_current"].toFloat();
    emit portNegotiatedCurrentChanged(port, negotiated_current);

    float maximum_power = payloadMap["maximum_power"].toFloat();
    emit portCurrentMaximumPowerChanged(port, maximum_power);
    //qDebug() << "handle current max power: "<<maximum_power;
#else
// For load board data simulation only
    float output_voltage = targetVoltage +  static_cast <float> ((rand()%10)/10);
    emit portOutputVoltageChanged(port, output_voltage);

    float target_voltage = targetVoltage; //payloadMap["target_volts"].toFloat();
    emit portTargetVoltageChanged(port, target_voltage);

    float current = 2.5;//payloadMap["current"].toFloat();
    emit portCurrentChanged(port, current);

    float power = current*output_voltage;//payloadMap["power"].toFloat();
    emit portPowerChanged(port, power);

    float temperature = 27;//payloadMap["temperature"].toFloat();
    emit portTemperatureChanged(port, temperature);

    float input_voltage = payloadMap["input"].toFloat();
    emit portInputVoltageChanged(port, input_voltage, input_amperage);

#endif

}

/*!
 * \brief Remap the ugly id to a beautiful and simple integer
 */
ImplementationInterfaceBinding::e_MappedPlatformId ImplementationInterfaceBinding::convertPlatformIDStringToEnumeratedType(QString inId){

    e_MappedPlatformId theId;

#ifdef QT_NO_DEBUG
     theId = NONE;
#else
    // For testing purposes show USB-PD as default
     theId = USB_PD;
#endif

    if (inId.startsWith("P2.2017.1"))
        theId = ImplementationInterfaceBinding::e_MappedPlatformId::USB_PD;
    else if (inId == "P2.2018.0.0.0.0.00000000-0000-0000-0000-000000000000")
        theId = ImplementationInterfaceBinding::e_MappedPlatformId::USB_PD;
    else if (inId.startsWith("SEC.2018.004"))
        theId = ImplementationInterfaceBinding::e_MappedPlatformId::USB_PD_POWER_ONLY;
    else
        theId = ImplementationInterfaceBinding::e_MappedPlatformId::NONE;


    return theId;

}

void ImplementationInterfaceBinding::handlePlatformIdNotification(const QVariantMap payloadMap) {

    if (payloadMap.contains("platform_id")){

        QString verboseName = payloadMap["verbose_name"].toString();
        QString platformIdTemp = payloadMap["platform_id"].toString();
        QString firmwareVersion = payloadMap["firmware_version"].toString();
        qDebug() << "Received platformId = " << platformIdTemp;
        //convert the string from the message into an enumerated type
        e_MappedPlatformId thePlatformId = convertPlatformIDStringToEnumeratedType(platformIdTemp);
         //qDebug() << "Enumerated platformId = " << thePlatformId;

        // Emit signal if changed
        qDebug()<<"enumerated platformId = "<<thePlatformId<<" current platformId= "<<platformId;
        if(thePlatformId != platformId) {

            platformState=true;
            emit platformStateChanged(platformState);
            //qDebug() << "handlePlatformIdNotification id is "<<platformId;
            platformId = thePlatformId;
            uniqueIdentifier = platformIdTemp;
            firmwareVersionNumber = firmwareVersion;
            verbosePlatformName = verboseName;
            //qDebug() << "handlePlatformIdNotification id updated to "<<platformId;
            emit platformIdChanged(thePlatformId, platformIdTemp,firmwareVersion,verboseName);
            //qDebug() << "PlatformIdChanged notification sent";
        }
        else{
             qDebug() << "no notification sent, platform id matches current platform id";
        }
    }
}

void ImplementationInterfaceBinding::handlePlatformStateNotification(const QVariantMap payloadMap) {

    QString status = payloadMap["status"].toString();
//    qDebug() << "Status =" << payloadMap;
    if (status.compare("connected") == 0){

        bool platformStateTemp = true;
// TODO[Prasanth]: Needs code cleaning
        if(platformStateTemp != platformState) {

            platformState = platformStateTemp;
            emit platformStateChanged(platformState);
            qDebug() << "platformStateChanged notification";
        }
    } else if (status.compare("disconnected") == 0) {

        bool platformStateTemp = false;
// TODO[Prasanth]: Needs code cleaning
        if(platformStateTemp != platformState) {

            platformState = platformStateTemp;
            // Also reset platformId
            platformId = e_MappedPlatformId::NONE;
            emit platformStateChanged(platformState);
            emit platformIdChanged(platformId,"","","");
            qDebug() << "platformStateChanged notification";
        }
    } else {

//        qDebug() << "Unsupported PlatformState ";
    }
}

void ImplementationInterfaceBinding::handleUSBCportConnectNotification(const QVariantMap payloadMap) {
    QString usbCPortId = payloadMap["port_id"].toString();
    QString connection_state = payloadMap["connection_state"].toString();

    if (connection_state.compare("connected") == 0) {
        if (usbCPortId.compare("USB_C_port_1") == 0) {

            usbCPort1State =  true;
            qDebug() << "port 1 connected";
            emit usbCPortStateChanged(1,usbCPort1State);
        }
        else if(usbCPortId.compare("USB_C_port_2") == 0) {
            usbCPort2State =  true;
            qDebug() << "port 2 connected";
            emit usbCPortStateChanged(2,usbCPort2State);
        }
        else {
            qDebug() << "Unsupported Connection USBC connection state";
        }
    }
}





void ImplementationInterfaceBinding::handleInputVoltageFoldbackNotification(const QVariantMap payloadMap){

    float inputVoltage = payloadMap["input_voltage"].toFloat();
    float inputVoltageFoldbackMinimumVoltage = payloadMap["foldback_minimum_voltage"].toFloat();
    float inputVoltageFoldbackPower = payloadMap["foldback_minimum_voltage_power"].toFloat();
    bool inputVoltageFoldbackEnabled = payloadMap["input_voltage_foldback_enabled"].toBool();
    bool inputVoltageFoldbackActive = payloadMap["input_voltage_foldback_active"].toBool();

    //qDebug() << "voltage foldback message received "<<payloadMap;
    //qDebug() << "foldback minimum voltage set to  "<<inputVoltageFoldbackMinimumVoltage;
    emit inputVoltageFoldbackChanged(inputVoltage,
                                 inputVoltageFoldbackMinimumVoltage,
                                 inputVoltageFoldbackPower,
                                 inputVoltageFoldbackEnabled,
                                 inputVoltageFoldbackActive);

    // Generates the message to be printed in the UI
    QString state;
    if (inputVoltageFoldbackActive){
        state = "activated at";
    }
      else{
        state = "deactivated at";
    }

    QString message = constructFaultMessage("voltage foldback",state,inputVoltageFoldbackMinimumVoltage,"V");

    // fault occurs and the message is added to the active fault list
    //but ony add the message if there isn't already a voltage foldback fault in the list
    if(inputVoltageFoldbackActive) {        
        QStringList currentInputVoltageFoldbackFaults = active_faults_.filter("voltage foldback");
        if (currentInputVoltageFoldbackFaults.count() == 0){    //there isn't curently any voltage foldback
            active_faults_.append(message);
        }
        else if (currentInputVoltageFoldbackFaults.count() != 0){               //there is an active voltage foldback
            active_faults_.removeOne(currentInputVoltageFoldbackFaults[0]);     //so remove it
            active_faults_.append(message);                                     //and add the new foldback message
        }
    }

    // fault is corrected and the message is removed from the active fault list
    else if(!inputVoltageFoldbackActive) {
        QStringList message_to_remove = active_faults_.filter("voltage foldback");
        if (active_faults_.count() >=1 && message_to_remove.count() > 0 && active_faults_.contains(message_to_remove[0])) {
            active_faults_.removeOne(message_to_remove[0]);
        }
    }

    // both fault occurence and correction are added to the fault history list
    fault_history_.append(message);
    //qDebug() << "fault history added voltage message: "<<message;
    emit activeFaultsChanged();
    emit faultHistoryChanged();

}

void ImplementationInterfaceBinding::handleTemperatureFoldbackNotification(const QVariantMap payloadMap){

    int port = payloadMap["port"].toInt();
    float currentTemperature = payloadMap["current_temperature"].toFloat();
    float temperatureFoldbackMaximumTemperature = payloadMap["foldback_maximum_temperature"].toInt();
    int temperatureFoldbackPower = payloadMap["foldback_maximum_temperature_power"].toInt();    //power level set by temp foldback
    bool temperatureFoldbackEnabled = payloadMap["temperature_foldback_enabled"].toBool();
    bool temperatureFoldbackActive = payloadMap["temperature_foldback_active"].toBool();
    int maxPower = payloadMap["maximum_power"].toInt();                                         //current max power, which could be lower than foldback power

    //qDebug() << "TemperatureFoldback changed. enabled="<<temperatureFoldbackEnabled;
    emit temperatureFoldbackChanged(port,
                                 currentTemperature,
                                 temperatureFoldbackMaximumTemperature,
                                 temperatureFoldbackPower,
                                 temperatureFoldbackEnabled,
                                 temperatureFoldbackActive,
                                  maxPower);

    // Generates the message to be printed in the UI
    QString state;


    if (temperatureFoldbackActive){
        state = "active";

    }
      else{
        state = "inactive";
    }

    QString message = constructFaultMessage("temp. foldback",state,temperatureFoldbackMaximumTemperature,"°C",port);


    // fault occurs and the message is added to the active fault list
    if(temperatureFoldbackActive) {
        QString thePortNumber = QString::number(port);
        QString thePattern = "^temp.*";
        thePattern.append(thePortNumber);
        thePattern.append("$");
        QRegularExpression theFaultPattern (thePattern);
        //qDebug() << "looking to add fault with pattern"<<theFaultPattern.pattern();

        QStringList currentTemperatureFoldbackFaults = active_faults_.filter(theFaultPattern);
        if (currentTemperatureFoldbackFaults.count() == 0){ //no active foldback for this port
            active_faults_.append(message);
        }
        else if(currentTemperatureFoldbackFaults.count() != 0){             //there's already an active foldback for this port
            active_faults_.removeOne(currentTemperatureFoldbackFaults[0]);  //so remove it (there can only be one)
            active_faults_.append(message);                                 //and add the foldback with the new temperature
        }
    }

    // fault is corrected and the message is removed from the active fault list
    else if(!temperatureFoldbackActive) {
        QString thePortNumber = QString::number(port);
        QString thePattern = "^temp.*";
        thePattern.append(thePortNumber);
        thePattern.append("$");
        QRegularExpression theFaultPattern (thePattern);

        QStringList message_to_remove = active_faults_.filter(theFaultPattern);
        if (active_faults_.count() >=1 && message_to_remove.count() > 0 && active_faults_.contains(message_to_remove[0])) {
            active_faults_.removeOne(message_to_remove[0]);
        }
    }

    // both fault occurence and correction are added to the fault history list
    fault_history_.append(message);
    //qDebug() << "fault history added temperature message: "<<message;
    emit activeFaultsChanged();
    emit faultHistoryChanged();

}

void ImplementationInterfaceBinding::handlePortCableCompensationNotification(const QVariantMap json_map) {
    int port = json_map["port"].toInt();
    float cableLoss = json_map["output_current"].toFloat();
    float biasVoltage = json_map["bias_voltage"].toFloat() * 1000;      //switch from volts to millivolts
    //qDebug() << "cable loss notification received. amps="<<cableLoss;
    emit portCableCompensationChanged(port, cableLoss, biasVoltage);
}

void ImplementationInterfaceBinding::handlePortAdvertisedVoltagesNotification(const QVariantMap payloadMap) {

    //qDebug() << "port voltage notification"<<payloadMap;

    int port = payloadMap["port"].toInt();
    int numberOfSettings = payloadMap["number_of_settings"].toInt();

    float voltage1, voltage2, voltage3, voltage4, voltage5, voltage6, voltage7;
    voltage1 = voltage2= voltage3= voltage4= voltage5= voltage6= voltage7=0;
    float amperage1, amperage2, amperage3, amperage4, amperage5, amperage6, amperage7;
    amperage1 = amperage2= amperage3= amperage4= amperage5= amperage6= amperage7=0;

    QJsonArray settingsArray = payloadMap["settings"].toJsonArray();
    if (numberOfSettings >=7){
        voltage7 = settingsArray.at(6)["voltage"].toDouble();
        amperage7 = settingsArray.at(6)["maximum_current"].toDouble();
    }
    if (numberOfSettings >=6){
        voltage6 = settingsArray.at(5)["voltage"].toDouble();
        amperage6 = settingsArray.at(5)["maximum_current"].toDouble();
    }
    if (numberOfSettings >=5){
        voltage5 = settingsArray.at(4)["voltage"].toDouble();
        amperage5 = settingsArray.at(4)["maximum_current"].toDouble();
    }
    if (numberOfSettings >=4){
        voltage4 = settingsArray.at(3)["voltage"].toDouble();
        amperage4 = settingsArray.at(3)["maximum_current"].toDouble();
    }
    if (numberOfSettings >=3){
        voltage3 = settingsArray.at(2)["voltage"].toDouble();
        amperage3 = settingsArray.at(2)["maximum_current"].toDouble();
    }
    if (numberOfSettings >=2){
        voltage2 = settingsArray.at(1)["voltage"].toDouble();
        amperage2 = settingsArray.at(1)["maximum_current"].toDouble();
    }
    if (numberOfSettings >=1){
        voltage1 = settingsArray.at(0)["voltage"].toDouble();
        amperage1 = settingsArray.at(0)["maximum_current"].toDouble();
    }

    emit portAdvertisedVoltagesChanged(port,
                                   voltage1,
                                   voltage2,
                                   voltage3,
                                   voltage4,
                                   voltage5,
                                   voltage6,
                                   voltage7,
                                       amperage1,
                                       amperage2,
                                       amperage3,
                                       amperage4,
                                       amperage5,
                                       amperage6,
                                       amperage7);
}

void ImplementationInterfaceBinding::handlePortOverCurrentNotification(const QVariantMap json_map) {
    int port = json_map["port"].toInt();
    float max_current = json_map["current_limit"].toFloat();
    //qDebug() << "port over current notification received. value="<<dataConfiguration;
    emit portOverCurrentChanged(port, max_current);
}


void ImplementationInterfaceBinding::handleDataConfigurationNotification(const QVariantMap json_map) {
    QString dataConfiguration = json_map["value"].toString();
    //qDebug() << "Data path config notification received. value="<<dataConfiguration;
    dataPath = dataConfiguration;
    emit dataPathConfigurationChanged(dataPath);
}

void ImplementationInterfaceBinding::handleFaultProtectionNotification(const QVariantMap json_map) {
    QString protectionAction = json_map["action"].toString();
    emit faultProtectionChanged(protectionAction);
}


void ImplementationInterfaceBinding::handleUSBCportDisconnectNotification(const QVariantMap payloadMap) {
    QString usbCPortId = payloadMap["port_id"].toString();
    QString connection_state = payloadMap["connection_state"].toString();

    if (connection_state.compare("disconnected") == 0) {
        if (usbCPortId.compare("USB_C_port_1") == 0) {
            usbCPort1State =  false;
            emit usbCPortStateChanged(1,usbCPort1State);
        }
        else if(usbCPortId.compare("USB_C_port_2") == 0) {
            usbCPort2State =  false;
            emit usbCPortStateChanged(2,usbCPort2State);
        }
        else {
            qDebug() << "Unsupported Connection USBC connection state";
        }
    }
}

void ImplementationInterfaceBinding::handleUSBPDcableswapNotification(const QVariantMap json_map) {
    QString swapCable = json_map["swap_cable"].toString();
    emit swapCableStatusChanged(swapCable);
    //qDebug() << "cable notification "<<swapCable;
}

void ImplementationInterfaceBinding::handleInputVoltageNotification(const QVariantMap json_map) {
    float input_voltage = json_map["input"].toFloat();
    inputVoltage = input_voltage;
    emit portInputVoltageChanged(1, inputVoltage);
}

void ImplementationInterfaceBinding::handleResetNotification(const QVariantMap payloadMap) {
    bool status = payloadMap["reset_status"].toBool();
    if(status) {
        emit platformResetDetected(status);
        //asking for platform ID is the key to getting the platform to respond after a hard reset.
        sendPlatformIdRequest();

        //after resetting, hardware settings may have changed, so ask for a new set.
        sendPlatformRefresh();
    }
}

void ImplementationInterfaceBinding::handleInputVoltageHysteresisNotification(const QVariantMap payloadMap){
    float inputVoltageHysteresis = payloadMap["value"].toFloat();

    emit inputVoltageHysteresisChanged(inputVoltageHysteresis);
}

void ImplementationInterfaceBinding::handleTemperatureHysteresisNotification(const QVariantMap payloadMap){
    float temperatureHysteresis = payloadMap["value"].toFloat();

    emit temperatureHysteresisChanged(temperatureHysteresis);
}

void ImplementationInterfaceBinding::handleInputUnderVoltageValueNotification (const QVariantMap payloadMap) {

    QString state = payloadMap["state"].toString();
    float value = payloadMap["minimum_voltage"].toFloat();

    emit inputUnderVoltageChanged(value);

}

void ImplementationInterfaceBinding::handleMaximumTemperatureNotification (const QVariantMap payloadMap) {

    float value = payloadMap["maximum_temperature"].toFloat();
    emit maximumTemperatureChanged(value);
}

void ImplementationInterfaceBinding::handleInputUnderVoltageNotification(const QVariantMap payloadMap) {

    QString state = payloadMap["state"].toString();
    int value = payloadMap["minimum_voltage"].toInt();

    // Generates the message to be printed in the UI
    QString message = constructFaultMessage("input voltage",state,value,"V");

    // fault occurs and the message is added to the active fault list
    //but only add the fault to the list if there's not another fault of the same time there already
    if(state == "below") {
        QStringList currentInputVoltageFaults = active_faults_.filter("input voltage");
        if (currentInputVoltageFaults.count() == 0){
            active_faults_.append(message);
        }
    }

    // fault is corrected and the message is removed from the active fault list
    //NB QStringList.contains() returns true if the parameter passed in is an empty list!
    else if(state == "above") {
        QStringList message_to_remove = active_faults_.filter("input voltage");
        if (active_faults_.count() >=1 && message_to_remove.count() >0 && active_faults_.contains(message_to_remove[0])) {
            active_faults_.removeOne(message_to_remove[0]);
        }
    }

    // both fault occurence and correction are added to the fault history list
    fault_history_.append(message);
    //qDebug() << "fault history added voltage message: "<<message;
    emit activeFaultsChanged();
    emit faultHistoryChanged();
}

void ImplementationInterfaceBinding::handleOverTemperatureNotification(const QVariantMap payloadMap)
{
    QString state = payloadMap["state"].toString();
    int value = payloadMap["temperature_limit"].toInt();

    int port_number;
    QString usbCPortId = payloadMap["port"].toString();

    // assign port number
    // [prasanth] firmware sends fault occurence for two ports [two messages] irrespective
    // of how many ports are connected to the platform
    if(usbCPortId.compare("USB_C_port_1") == 0){
       port_number = 1;
    }
    else if(usbCPortId.compare("USB_C_port_2") == 0){
      port_number = 2;
    }
    else {
        //whoops! What port is this?
        qDebug() << "Over temperature notification received for unknown port";
        return;
    }
    // Generates the message to be printed in the UI
    QString message = constructFaultMessage("temperature",state,value,"°C",port_number);
    qDebug() << "New temperature notification is:"<<message;

    // fault occurs and the message is added to the active fault list
    // but don't add a new fault if there's already one in the list for that port
     //use a regular expression that matches "temperature" at the start and the port number at the end
    if(state == "above") {
        QString thePortNumber = QString::number(port_number);
        QString thePattern = "^temperature.*";
        thePattern.append(thePortNumber);
        thePattern.append("$");
        QRegularExpression theFaultPattern (thePattern);
        qDebug() << "looking to add fault with pattern"<<theFaultPattern.pattern();
        QStringList currentInputTemperatureFaults = active_faults_.filter(theFaultPattern);
        if (currentInputTemperatureFaults.count() == 0){
            active_faults_.append(message);
        }
    }

    // fault is corrected and the message is removed from the active fault list
    //use a regular expression that matches "temperature" at the start and the port number at the end
    else if(state == "below") {
        QString thePortNumber = QString::number(port_number);
        QString thePattern = "^temperature.*";
        thePattern.append(thePortNumber);
        thePattern.append("$");
        QRegularExpression theFaultPattern (thePattern);
        QStringList message_to_remove = active_faults_.filter(theFaultPattern);
        if(active_faults_.count() >= 1 && message_to_remove.count() >0 && active_faults_.contains(message_to_remove[0])) {
            active_faults_.removeOne(message_to_remove[0]);
        }
    }

    // both fault occurence and correction are added to the fault history list
    fault_history_.append(message);
    emit activeFaultsChanged();
    emit faultHistoryChanged();
}

void ImplementationInterfaceBinding::handleNegotiatedContractNotification(const QVariantMap payloadMap){

    int port_number = payloadMap["port"].toInt();
    int voltage = payloadMap["voltage"].toInt();
    int maxCurrent = payloadMap["maximum_current"].toInt();

    //current is sent in milliamps. Convert to amps here
    maxCurrent = maxCurrent/1000.0;

    emit portNegotiatedContractChanged(port_number, voltage, maxCurrent);
}

void ImplementationInterfaceBinding::handleMaximumPortPowerNotification(const QVariantMap payloadMap){

    //qDebug() << payloadMap;

    int port_number = payloadMap["port"].toInt();
    //int currentWatts = payloadMap["current_max_power"].toInt(); //max power including input and temp limiting
    //int defaultWatts = payloadMap["default_max_power"].toInt();        //max power without any adjustment for limiting
    int commandedWatts = payloadMap["commanded_max_power"].toInt();        //max power without any adjustment for limiting

    //qDebug() << "new max port power notification received: "<<port_number<<" "<<commandedWatts;

    emit portMaximumPowerChanged(port_number, commandedWatts);
}
/*!
 * End of notification handlers
 */


/*!
 * JSON Parser's
 */

//Convert JSON object to JSON map "to handle it like HASH Map"
QVariantMap ImplementationInterfaceBinding::getJsonMapObject(const QJsonObject json_obj)
{

    QVariantMap json_map=json_obj.toVariantMap();
    return json_map;
}

//Validate Response from platform
QVariantMap ImplementationInterfaceBinding::validateJsonReply(const QVariantMap json_map)
{
    QVariantMap current_map;
    if(json_map.contains("ack")) {
        current_map=json_map["ack"].toMap();

        //qDebug() << "Acknowledgement Received for cmd = " << current_map ["cmd"].toString();
        //qDebug() << "Validity = " << current_map ["response_verbose"].toString();
        //qDebug() << "Port existence = " << current_map["return_value"].toString();
        if(current_map["return_value"].toBool() == true) {
            registrationSuccessful = true;
        }
        else {
            registrationSuccessful = false;
        }
        return current_map;
    }
    else if(json_map.contains("notification")) {
        current_map = json_map["notification"].toMap();
        return current_map;
    }
    else {
//        qCritical("ERROR: invalid 'ack' reply !!!!");
        if( json_map.isEmpty() ) {
//            qCritical("ERROR: Platform Reply is empty");
        }
    }
    current_map.clear();
    return current_map;
}

/*!
 * End of JSON Parsers
 */

/*!
 *     Simulate JSON Messages and notify on changes
 */

void ImplementationInterfaceBinding::notificationsThreadHandle()
{
    qDebug () << "Thread Created for notification ";
    notification_thread_running_ = true;

    while(notification_thread_running_) {
#if USE_DEBUG_JSON
        // FIXME debugging/testing only. REMOVE BEFORE COMMIT
        QString raw = R"(
                      {
                         "cloud_sync":"document_set",
                         "type" : "schematic",
                         "documents":[
                            {"data":"*******","filename":"schematic1.png"},
                      {"data":"******1","filename":"schematic1.png"},
                      {"data":"******2","filename":"schematic2.png"},
                      {"data":"******3","filename":"schematic3.png"},
                      {"data":"******4","filename":"schematic4.png"},
                      {"data":"******5","filename":"schematic5.png"},
                      {"data":"******6","filename":"schematic6.png"}

                         ]
                      })";

        QJsonDocument doc = QJsonDocument::fromJson(raw.toUtf8());
        handleCloudNotification(doc.object());
        // end FIXME

        sleep(5);
#endif

        // receive data from host controller client
        std::string response= hcc_object->receiveNotification();
//        qDebug()<<"recv :",response;
        QString q_response = QString::fromStdString(response);
//        qDebug()<< "[Impl Recv]: "<<q_response;
        QJsonDocument doc= QJsonDocument::fromJson(q_response.toUtf8());
        QJsonObject json_obj=doc.object();

        // todo: [prasanth] needs better way to determine the handler
        // handler for cloud
        if(json_obj.contains("cloud::notification")) {
            //qWarning() << "Notification Handler: Cloud";
            handleCloudNotification(json_obj);
        }
        else {
            // handler for platform
            QVariantMap json_map = getJsonMapObject(json_obj);
            json_map = getJsonMapObject(json_obj);
            QVariantMap current_map = validateJsonReply(json_map);
            if(current_map.contains("payload")) {
                handleNotification(current_map);
            }
        }
    }
}

