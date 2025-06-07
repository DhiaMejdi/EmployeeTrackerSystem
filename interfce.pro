QT += core gui widgets sql charts multimedia printsupport network

CONFIG += c++17
QT += serialport

# Modules optionnels : on teste leur disponibilité pour éviter les erreurs
contains(QT_CONFIG, serialport) {
    QT += serialport
    message("✅ QtSerialPort module activé.")
} else {
    message("❌ QtSerialPort non disponible.")
}

contains(QT_CONFIG, texttospeech) {
    QT += texttospeech
    message("✅ QtTextToSpeech module activé.")
} else {
    message("❌ QtTextToSpeech non disponible.")
}

win32:contains(QT_CONFIG, axcontainer) {
    QT += axcontainer
    message("✅ ActiveQt (axcontainer) activé.")
} else:win32 {
    message("❌ axcontainer non disponible ou incompatible avec le compilateur.")
}

SOURCES += \
    chat.cpp \
    connection.cpp \
    employe.cpp \
    login.cpp \
    main.cpp \
    mainwindow.cpp \
    serialcommunication.cpp


HEADERS += \
    chat.h \
    connection.h \
    employe.h \
    login.h \
    mainwindow.h \
    serialcommunication.h

FORMS += \
    chat.ui \
    login.ui \
    mainwindow.ui

RESOURCES += \
    res.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
