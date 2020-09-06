#include "clipboardproxy.h"

ClipboardProxy::ClipboardProxy(QObject *parent) : QObject(parent)
{
    clipboard = QGuiApplication::clipboard();
}

void ClipboardProxy::setText(QString text)
{
    clipboard->setText(text);
}

QString ClipboardProxy::getText()
{
    return clipboard->text();
}
