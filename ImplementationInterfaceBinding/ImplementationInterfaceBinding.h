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
#ifndef UserInterfaceBinding_H
#define UserInterfaceBinding_H

#include <QObject>
#include <QString>
#include <QKeyEvent>
#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>
#include <QQmlListProperty>
#include <QVariant>
#include <QStringList>
#include <QString>
#include <QJsonArray>
#include <string>
#include <thread>
#include <map>
#include <functional>
#include <stdlib.h>
#include "../../../include/HostControllerClient.hpp"  // TODO [ian] FIX THIS ... locally referenced files
#include <QMap>

// To simulate the data
#define BOARD_DATA_SIMULATION 0

//aPort = Variable to store current
//vPort = Variable to store voltage

using FaultMessages = QStringList;            // typedefs

struct platform_Ports {

    float v_tport[2];
    float v_oport[2];
    float a_oport[2];
    float temperature[2];
    float power[2];
    float v_iport[2];
};


//void *simulateVoltageNotificationsThread(void *);

typedef std::function<void(QJsonObject)> DataSourceHandler; // data source handler accepting QJsonObject

class ImplementationInterfaceBinding : public QObject
{
    Q_OBJECT

    // QProperty for all ports 
    Q_PROPERTY(float outputVoltage NOTIFY portOutputVoltageChanged)
    Q_PROPERTY(float inputVoltage READ getInputVoltage NOTIFY portInputVoltageChanged)
    Q_PROPERTY(float targetVoltage NOTIFY portTargetVoltageChanged)
    Q_PROPERTY(float portTemperature NOTIFY portTemperatureChanged)
    Q_PROPERTY(float portCurrent NOTIFY portCurrentChanged)
    Q_PROPERTY(float portPower NOTIFY portPowerChanged)
    Q_PROPERTY(float inputPower NOTIFY portEfficiencyChanged)
    Q_PROPERTY(float outputPower NOTIFY portEfficiencyChanged)
    Q_PROPERTY(float portNegotiatedContract NOTIFY portNegotiatedContractChanged)
    Q_PROPERTY(float portMaximumPower NOTIFY portMaximumPowerChanged)

    //QProperty for fault messages
    Q_PROPERTY(int  minimum_voltage NOTIFY minimumVoltageChanged)

    Q_PROPERTY(int over_temperature NOTIFY overTemperatureChanged)

    //QProperty : To know Platform Reset
    Q_PROPERTY(bool reset_status NOTIFY platformResetDetected)

    //QProperty : To know Platform Status
    Q_PROPERTY(bool platformState READ getPlatformState NOTIFY platformStateChanged)

    //QProperty : Platform Id
    Q_PROPERTY(e_MappedPlatformId Id MEMBER platformId NOTIFY platformIdChanged)
    Q_PROPERTY(QString uniqueID MEMBER uniqueIdentifier NOTIFY platformIdChanged)
    Q_PROPERTY(QString firmwareVersion MEMBER firmwareVersionNumber NOTIFY platformIdChanged)
    Q_PROPERTY(QString verboseName MEMBER verbosePlatformName NOTIFY platformIdChanged)

    //QProperty : To know USB-PDp- Port Status
    Q_PROPERTY(bool usbCPort1State  NOTIFY usbCPortStateChanged)

    //QProperty to show the swap cable status
    Q_PROPERTY(QString swapCable NOTIFY swapCableStatusChanged)

    //QProperty to show the data path status
    Q_PROPERTY(QString dataPath READ getDataPath NOTIFY dataPathConfigurationChanged)

    //QProperty : To know USB-C port status
    //Q_PROPERTY(bool usbcPort1 READ getUsbCPort1  NOTIFY usbCPort1StateChanged)
    //Q_PROPERTY(bool usbcPort2 READ getUsbCPort2  NOTIFY usbCPort2StateChanged)

    //Qlist property to store all the active faults and fault history
    Q_PROPERTY(QStringList activeFaultsList READ activeFaults NOTIFY activeFaultsChanged)
    Q_PROPERTY(QStringList faultHistoryList READ faultHistory NOTIFY faultHistoryChanged)
public:

    // Enum for hardcode platforms;
    enum e_MappedPlatformId
    {
        NONE = 0,
        BUBU_INTERFACE,
        USB_PD,
        USB_PD_POWER_ONLY
    };

    Q_ENUM(e_MappedPlatformId)


    explicit ImplementationInterfaceBinding(QObject *parent = nullptr);
    virtual ~ImplementationInterfaceBinding();

    Q_INVOKABLE void setOutputVoltageVBUS(int port, int voltage);

    Q_INVOKABLE void setRedriverLoss(float lossValue);
    Q_INVOKABLE void setCableCompensation(int inPort, float inCurrent, float inMilliVolts);
    Q_INVOKABLE void setRedriverConfiguration(QString value);
    Q_INVOKABLE void sendPlatformRefresh();
    Q_INVOKABLE void sendPlatformReset();
    Q_INVOKABLE void sendPlatformIdRequest();
    Q_INVOKABLE bool getUSBCPortState(int port_number);
    Q_INVOKABLE QString getDataPath();
    Q_INVOKABLE void clearFaultHistoryList();

    // To set the maximum power request for a particular port in USB-PD platform
    Q_INVOKABLE void setMaximumPortPower(int port,int value);

    // To set the Minimum Input Voltage
    Q_INVOKABLE void setMinimumInputVoltage(int value);

    // To set the mode for fault protection for the board (shutdown/restart/none)
    Q_INVOKABLE void setFaultMode(QString faultModeAction);

    // To set input voltage foldback parameters (on/off, starting voltage, output wattage limit)
    Q_INVOKABLE void setVoltageFoldbackParameters(bool inEnabled,
                                                  float inVoltage,
                                                  int inWatts);

    //To set the temperature foldback parameters (on/off, starting temperature, output wattage limit)
    Q_INVOKABLE void setTemperatureFoldbackParameters(bool inEnabled,
                                                     float inTemperature,
                                                       int inWatts);

    //To set the input voltage that will trigger a fault when input falls below
    Q_INVOKABLE void setInputVoltageLimiting(float value);

    // To set the maximum temperature limit in platform
    Q_INVOKABLE void setMaximumTemperature(float value);

    //set the maximum current that can be drawn by a device connected to a port
    Q_INVOKABLE void setPortMaximumCurrent(int inPort,
                                           float inMaximumCurrent);

    //set the hysteresis for input voltage foldback
    Q_INVOKABLE void setInputVoltageHysteresis(float inHysteresis);

    //set the hysteresis for port temperature foldback
    Q_INVOKABLE void setTemperatureHysteresis(float inHysteresis);

    std::thread notification_thread_;
    void notificationsThreadHandle();
//Getter invoked when GUI tries to get the data
    float getoutputVoltagePort0();
    float getInputVoltage();
    float getoutputCurrentPort0();
    float getpowerPort0();
    float getPort0Temperature();
    bool getPlatformState();
    bool getUSBCPort1State();
    bool getUSBCPort2State();

    //e_MappedPlatformId getPlatformId();
    QStringList activeFaults() {return QStringList(active_faults_);}
    QStringList faultHistory() {return QStringList(fault_history_);}


    QJsonObject convertQstringtoJson(const QString string);
    ImplementationInterfaceBinding::e_MappedPlatformId convertPlatformIDStringToEnumeratedType(QString inId);
    QStringList getJsonObjectKeys(const QJsonObject json_obj);
    QVariantMap getJsonMapObject(const QJsonObject json_obj);
    QVariantMap validateJsonReply(const QVariantMap json_map);
    void handleUsbPowerNotification(const QVariantMap json_map);
    void handlePlatformIdNotification(const QVariantMap json_map);
    void handlePlatformStateNotification(const QVariantMap json_map);

    void handleUSBCportConnectNotification(const QVariantMap json_map);
    void handleUSBCportDisconnectNotification(const QVariantMap json_map);
    void handleUSBPDcableswapNotification(const QVariantMap json_map);
    void handleInputVoltageNotification(const QVariantMap json_map);
    void handleResetNotification(const QVariantMap payloadMap);
    void handleInputUnderVoltageNotification(const QVariantMap payloadMap);
    void handleInputUnderVoltageValueNotification(const QVariantMap payloadMap);
    void handleOverTemperatureNotification(const QVariantMap payloadMap);
    void handleNegotiatedContractNotification(const QVariantMap payloadMap);
    void handleMaximumPortPowerNotification(const QVariantMap payloadMap);
    void handleFaultProtectionNotification(const QVariantMap json_map);
    void handleDataConfigurationNotification(const QVariantMap json_map);
    void handleFoldbackLimitingNotification(const QVariantMap json_map);
    void handleMaximumTemperatureNotification (const QVariantMap payloadMap);
    void handlePortOverCurrentNotification(const QVariantMap payloadMap);
    void handlePortAdvertisedVoltagesNotification(const QVariantMap payloadMap);
    void handlePortCableCompensationNotification(const QVariantMap payloadMap);
    void handleInputVoltageFoldbackNotification(const QVariantMap payloadMap);
    void handleTemperatureFoldbackNotification(const QVariantMap payloadMap);
    void handleInputVoltageHysteresisNotification(const QVariantMap payloadMap);
    void handleTemperatureHysteresisNotification(const QVariantMap payloadMap);

//Constructing the string for fault messages
    QString constructFaultMessage(QString parameter,QString state,int value, QString units)
                                 {return QString(tr("%1 is %2 %3%4")).arg(parameter).arg(state).arg(value).arg(units);}
    QString constructFaultMessage(QString parameter,QString state,int value,QString units,int port_number)
                                 {return QString(tr("%1 is %2 %3%4 for port %5")).arg(parameter).arg(state).arg(value).arg(units).arg(port_number);}

//Notification Simulator
    friend void *simulateNotificationsThread(void *);
    //friend void *simulateCurrentNotificationsThread(void *);
    void handleNotification(QVariantMap current_map);
    void handleCloudNotification(QJsonObject json_obj);
    //void handleCurrentNotification(QVariantMap current_map);

//Signalling done when something needs to be notified
signals:
    void outputVoltagePort0Changed(const float outputVoltagePort0);
    void inputVoltagePort0Changed(const float inputVoltage);
    void outputCurrentPort0Changed(const float outputCurrentPort0);
    void port0TemperatureChanged(const float time);
    void powerPort0Changed(const float powerPort0);
    void platformIdChanged(const ImplementationInterfaceBinding::e_MappedPlatformId platformId,
                           QString UUID,
                           QString firmwareVersion,
                           QString verboseName);
    void swapCableStatusChanged(const QString cableStatus);
    void platformStateChanged(const bool platformState);
    void usbCPortStateChanged(int port, const bool value);
    void platformResetDetected(bool reset_status);
    // port metrics notification
    void portOutputVoltageChanged(int port, float value);
    void portInputVoltageChanged(int port, float inputVoltage);
    void portTargetVoltageChanged(int port, float value);
    void portDeviceIsPDChanged(int port, bool isPDDevice);
    void portTemperatureChanged(int port, float value);
    void portPowerChanged(int port, float value);
    void portCurrentChanged(int port, float value);
    void portEfficencyChanged(int port, float input_power,float output_power);
    void portNegotiatedContractChanged(int port,float voltage,float maxCurrent);
    void portNegotiatedVoltageChanged(int port, float voltage);
    void portNegotiatedCurrentChanged(int port, float current);
    void portCurrentMaximumPowerChanged(int port, int currentWatts);
    void portMaximumPowerChanged(int port, int commandedWatts);
    void faultProtectionChanged(QString protectionMode);
    void dataPathConfigurationChanged(QString dataConfiguration);
    void inputUnderVoltageChanged(float value);
    void maximumTemperatureChanged(float value);
    void portOverCurrentChanged(int port, float max_current);
    void portAdvertisedVoltagesChanged(int port,
                                   float voltage1,
                                   float voltage2,
                                   float voltage3,
                                   float voltage4,
                                   float voltage5,
                                   float voltage6,
                                   float voltage7,
                                   float amperage1,
                                   float amperage2,
                                   float amperage3,
                                   float amperage4,
                                   float amperage5,
                                   float amperage6,
                                   float amperage7);
    void portCableCompensationChanged(int port,
                                      float cableLoss,
                                      float biasVoltage);
    void inputVoltageFoldbackChanged(float inputVoltage,
                                     float inputVoltageFoldbackMinimumVoltage,
                                     float inputVoltageFoldbackPower,
                                     bool inputVoltageFoldbackEnabled,
                                     bool inputVoltageFoldbackActive);
    void temperatureFoldbackChanged(int port,
                                     float currentTemperature,
                                     float temperatureFoldbackMaximumTemperature,
                                     int temperatureFoldbackPower,
                                     bool temperatureFoldbackEnabled,
                                     bool temperatureFoldbackActive,
                                     int maxPower);
    void inputVoltageHysteresisChanged(float inputVoltageHysteresis);
    void temperatureHysteresisChanged(float temperatureHysteresis);
    void portAdvertisedMaxCurrentChanged(int port, float advertisedMaxCurrent);
    void portInputPowerChanged(int port, float inputPower,float inputVoltage, float inputAmperage);

    // fault messages notification
    void minimumVoltageChanged(bool state,int value);
    void overTemperatureChanged(bool state,int value);

    // fault message list notification
    void faultHistoryChanged();
    void activeFaultsChanged();

private:
    //Members private to class
    platform_Ports      Ports;
    e_MappedPlatformId  platformId = e_MappedPlatformId::NONE;
    bool                platformState,
                        usbCPort1State,
                        usbCPort2State;
    float               inputVoltage;
    bool                registrationSuccessful;
    bool                notification_thread_running_;
    float               port1Current,
                        port2Current,
                        port1InputCurrent,
                        port2InputCurrent;
    QString             dataPath;
    QString             uniqueIdentifier;
    QString             firmwareVersionNumber;
    QString             verbosePlatformName;

    std::map<std::string, DataSourceHandler > data_source_handlers_;

    // For load board data simulation only
    float               targetVoltage;

    // Fault message lists
    FaultMessages active_faults_;
    FaultMessages fault_history_;

public:
    Spyglass::HostControllerClient *hcc_object;

    bool registerDataSourceHandler(std::string source, DataSourceHandler handler);

};
Q_DECLARE_METATYPE(ImplementationInterfaceBinding::e_MappedPlatformId)

#endif // UserInterfaceBinding_H

