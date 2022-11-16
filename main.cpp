#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "include/utils.hpp"

#include "include/Aim.h"

int main ( int argc, char* argv[] )
{
    QCoreApplication::setAttribute ( Qt::AA_EnableHighDpiScaling );

    Aim aim;

    QGuiApplication app ( argc, argv );

    QQmlApplicationEngine engine;

//    aim.initialize ( *engine.rootContext() );

    engine.rootContext()->setContextProperty ( "aim", &aim );

    engine.load ( QUrl ( QStringLiteral ( "qrc:/qml/main.qml" ) ) );


    if ( engine.rootObjects().isEmpty() )
    {
        return -1;
    }

    return app.exec();
}
