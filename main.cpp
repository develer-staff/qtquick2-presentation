#include <QtGui/QGuiApplication>
#include <QFontDatabase>
#include <QStringList>
#include <QFont>

#include "qtquick2applicationviewer.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    int id = QFontDatabase::addApplicationFont("Granat-Regular.otf");
    QStringList families = QFontDatabase::applicationFontFamilies(id);
    QGuiApplication::setFont(QFont(families.at(0)));

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/qtquick2/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
