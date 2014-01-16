#include <QtGui/QGuiApplication>
#include <QFontDatabase>
#include <QStringList>
#include <QFont>
#include <QTranslator>
#include <QDebug>
#include <QQmlEngine>
#include <QQmlContext>

#include "qtquick2applicationviewer.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    bool fullscreen = false;

    foreach (const QString &arg, app.arguments()) {
        if (arg.startsWith("--language")) {
            QString lang = arg.split("=").at(1).trimmed();
            QTranslator *translator = new QTranslator(&app);
            if (!translator->load(":/common/qtquick2-presentation_" + lang + ".qm"))
                qDebug() << "Unable to load translation file for language:" << lang;

            app.installTranslator(translator);
        }
        else if (arg == "--fullscreen")
            fullscreen = true;
    }

    int id = QFontDatabase::addApplicationFont(":/common/Granat-Regular.otf");
    QStringList families = QFontDatabase::applicationFontFamilies(id);
    QGuiApplication::setFont(QFont(families.at(0)));

    QtQuick2ApplicationViewer viewer;
    viewer.engine()->rootContext()->setContextProperty("fullscreen", fullscreen);
    viewer.setMainQmlFile(QStringLiteral("qml/qtquick2/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
