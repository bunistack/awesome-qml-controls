# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

QT += svg xml

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = com.yourcompany.wizardEVAP.Awesomeqmlcontrols
PRODUCT_VERSION_NAME = 1.0.0
PRODUCT_VERSION_CODE = 1

qmlFolder.source = qml
#DEPLOYMENTFOLDERS += qmlFolder # comment for publishing

assetsFolder.source = assets
#DEPLOYMENTFOLDERS += assetsFolder

RESOURCES += resources.qrc

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    clipboardproxy.cpp

android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle

    equals(ANDROID_TARGET_ARCH,x86) {

        #svg support
        ANDROID_EXTRA_LIBS = \
            C:/Felgo/Felgo/android_x86/lib/libQt5Svg.so \
            C:/Felgo/Felgo/android_x86/lib/libQt5Xml.so
    }

    equals(ANDROID_TARGET_ARCH,armeabi-v7a) {

        #svg support
        ANDROID_EXTRA_LIBS = \
            C:/Felgo/Felgo/android_armv7/lib/libQt5Svg.so \
            C:/Felgo/Felgo/android_armv7/lib/libQt5Xml.so
    }

    equals(ANDROID_TARGET_ARCH, arm64-v8a)  {

        #support for svg
        ANDROID_EXTRA_LIBS = \
            C:/Felgo/Felgo/android_arm64_v8a/lib/libQt5Svg.so \
            C:/Felgo/Felgo/android_arm64_v8a/lib/libQt5Xml.so
    }
}

ios {
    QMAKE_INFO_PLIST = ios/Project-Info.plist
    OTHER_FILES += $$QMAKE_INFO_PLIST
}

# set application icons for win and macx
win32 {
    RC_FILE += win/app_icon.rc
}
macx {
    ICON = macx/app_icon.icns
}

HEADERS += \
    clipboardproxy.h
