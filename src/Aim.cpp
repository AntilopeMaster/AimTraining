#include "include/Aim.h"
#include <QtQml>

Aim::Aim ( QObject* parent ) : QObject ( parent )
{
    connect ( &m_updateTimer, &QTimer::timeout, this, &Aim::updateTimer );
    m_updateTimer.setInterval ( 10 );

    qRegisterMetaType<QPoint>();

    m_puntos.push_back ( QPoint ( 0, 0 ) );
}

void Aim::initialize ( const  unsigned int& nb_targets )
{
    m_puntos.clear();

    for ( unsigned int i = 0 ; i < nb_targets; ++i )
    {
        m_puntos.push_back ( QPoint ( rand() % 1920, rand() % 1080 ) );
    }

    emit targetChanged();

    m_updateTimer.start();
}

QPoint Aim::target()
{
    qDebug() << m_puntos[m_index];
    return m_puntos[m_index];
}

void Aim::setNextTarget()
{
    if ( m_index < m_puntos.size() - 1 )
    {
        ++m_index;
        emit targetChanged();
    }
    else
    {
        m_updateTimer.stop();
    }
}

double Aim::aimTimer()
{
    return m_aimTimer;
}

void Aim::updateTimer()
{
    m_aimTimer -= 0.01;
    emit aimTimerChanged();
}

