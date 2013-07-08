#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
//    viewer.setMainQmlFile(QLatin1String("qml/SafeBox/StartEncryptionFace.qml"));
    viewer.setMainQmlFile(QLatin1String("qml/SafeBox/MainCategories.qml"));
    viewer.showExpanded();

    return app->exec();
}
