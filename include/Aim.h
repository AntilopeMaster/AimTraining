#ifndef AIM_H
#define AIM_H

#include <QObject>
#include <QQmlContext>
#include <QQmlListProperty>
#include <QSharedPointer>
#include <QPoint>
#include <QTimer>

class Aim : public QObject
{
    Q_OBJECT

    Q_PROPERTY ( QPoint target READ target NOTIFY targetChanged )
    Q_PROPERTY ( double aimTimer READ aimTimer NOTIFY aimTimerChanged )

public:
    explicit Aim ( QObject* parent = nullptr );

    Q_INVOKABLE void initialize ( const unsigned int& nb_targets );

    QPoint target();
    Q_INVOKABLE void setNextTarget();

    double aimTimer();
    void updateTimer();

signals:
    void targetChanged();
    void aimTimerChanged();

private:
    double m_aimTimer = 30.;
    QTimer m_updateTimer;

    std::vector<QPoint> m_puntos;
    unsigned int m_index = 0;
};

#endif // AIM_H
