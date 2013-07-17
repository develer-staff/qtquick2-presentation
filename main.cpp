#include <QtGui/QGuiApplication>
#include <QFontDatabase>
#include <QStringList>
#include <QFont>
#include <QTranslator>
#include <QDebug>

#include "qtquick2applicationviewer.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QTranslator translator;
    translator.load(":/common/qtquick2-bem_it.qm");
    app.installTranslator(&translator);

    int id = QFontDatabase::addApplicationFont(":/common/Granat-Regular.otf");
    QStringList families = QFontDatabase::applicationFontFamilies(id);
    QGuiApplication::setFont(QFont(families.at(0)));

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/qtquick2/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
