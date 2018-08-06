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
#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#endif

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView/QtWebView>
#include <QtWebEngine>
#include <QtWidgets/QApplication>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlEngine>
#include <QtCore/QDir>
#include "QtDebug"
#include "QtOpenGL"
#include <QGLContext>
#include <QProcess>

#include "DocumentManager.h"
#include "DataCollector.h"
#include "ImplementationInterfaceBinding/ImplementationInterfaceBinding.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_DisableWindowContextHelpButton);  //remove the ? button from Windows message box dialogs
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);

    // Starting services this build?
    // [prasanth] : Important note: Start HCS before launching the UI
    // So the service callback works properly
    #define START_SERVICES
    #ifdef START_SERVICES

        #ifdef Q_OS_WIN
        // We are at the build folder as root
        #define HOST_ROOT_PATH      (app.applicationDirPath())
        #define HCS_PATH            HOST_ROOT_PATH + "/HCS/HCS.exe"
        #define HCS_CONFIG_PATH     HOST_ROOT_PATH + "/HCS/host_controller_service.config"
        #endif

        #ifdef Q_OS_MACOS
        // We are pretty deep in the directory. Ex. ui/build-xxx-Release/spyglass.app/Contents/MacOs
        #define HOST_ROOT_PATH      (app.applicationDirPath() + "/../../../../../")
        #define HCS_PATH            HOST_ROOT_PATH + "HostControllerService/build/hcs"
        #define HCS_CONFIG_PATH     HOST_ROOT_PATH + "HostControllerService/files/conf/host_controller_service.config"
        #endif

        #ifdef Q_OS_LINUX
        // We are at the build folder
        #define HOST_ROOT_PATH      (app.applicationDirPath() + "/../../")
        #define HCS_PATH            HOST_ROOT_PATH + "HostControllerService/build/hcs"
        #define HCS_CONFIG_PATH     HOST_ROOT_PATH + "HostControllerService/files/conf/host_controller_service.config"
        #endif

        /* This is the same across all platforms
        */

        // Ensure HCS exists
        QFileInfo hcs_file(HCS_PATH);
        bool hcs_started = false;

        // Create a QProcess
        QProcess *hcsProcess = new QProcess(nullptr);

        if(hcs_file.exists()) {
            hcs_started = true;

            // Start HCS before handling events for QT
            qDebug() << "Starting HCS: " << HCS_PATH;
            QString hcsPath = HCS_PATH;

            // Argument list for HCS
            QStringList arguments;
            arguments << "-f" << HCS_CONFIG_PATH;

            // Start HCS
//            hcsProcess->setProcessChannelMode(QProcess::ForwardedChannels);
            hcsProcess->start(hcsPath,arguments, QIODevice::ReadWrite);
        }
        else {
            hcs_started = false;
            qDebug() << "Failed to start HCS: Does not exist";
        }

    #endif

    qmlRegisterType<ImplementationInterfaceBinding>("tech.spyglass.ImplementationInterfaceBinding",1,0,"ImplementationInterfaceBinding");
    qmlRegisterType<Document>("tech.spyglass.Document", 1, 0, "Document");
    qmlRegisterType<DocumentManager>("tech.spyglass.DocumentManager", 1, 0, "DocumentManager");
    qmlRegisterType<DataCollector>("tech.spyglass.DataCollector",1,0,"DataCollector");
    ImplementationInterfaceBinding *implementationInterfaceBinding = new ImplementationInterfaceBinding();

    DocumentManager* documentManager = new DocumentManager(implementationInterfaceBinding);
    DataCollector* dataCollector = new DataCollector(implementationInterfaceBinding);
    QtWebEngine::initialize();
    QtWebView::initialize();

    QQmlApplicationEngine engine;
    engine.rootContext ()->setContextProperty ("implementationInterfaceBinding", implementationInterfaceBinding);
    engine.rootContext ()->setContextProperty ("documentManager", documentManager);
    engine.rootContext ()->setContextProperty ("dataCollector", dataCollector);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    //needed to allow e_MappedPlatformId to be used as a signal parameter
    qRegisterMetaType<ImplementationInterfaceBinding::e_MappedPlatformId>("ImplementationInterfaceBinding::e_MappedPlatformId");

    // Call QT and stay here until the application quits.
    int appResult = app.exec();

#ifdef START_SERVICES
    if (hcs_started) {
        // Do some last minute clean-up; Terminate HCS
        qDebug() << "Killing HCS";
        hcsProcess->kill();
    }

#endif
    return appResult;
}
