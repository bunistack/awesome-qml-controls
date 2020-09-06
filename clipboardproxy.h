#ifndef CLIPBOARDPROXY_H
#define CLIPBOARDPROXY_H

#include <QObject>
#include <QClipboard>
#include <QGuiApplication>

class ClipboardProxy : public QObject
{
    Q_OBJECT
public:
    explicit ClipboardProxy(QObject *parent = nullptr);

    Q_INVOKABLE void setText(QString text);

    Q_INVOKABLE QString getText();

signals:

private:
    QClipboard *clipboard;

};

#endif // CLIPBOARDPROXY_H
