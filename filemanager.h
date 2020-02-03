#ifndef FILEMANAGER_H
#define FILEMANAGER_H

#include <QObject>
#include <QDir>
#include <QFile>

class FileManager : public QObject
{
    Q_OBJECT
public:
    explicit FileManager(QObject *parent = nullptr);

    Q_INVOKABLE int folderCount(QString path){
        return QDir(path,"",0,QDir::AllDirs  | QDir::NoDotAndDotDot).count();
    }
    Q_INVOKABLE QString getText(QString path){
        QFile a(path);
        a.open(QFile::ReadOnly | QFile::Text);
        return a.readAll();
    }


signals:

};

#endif // FILEMANAGER_H
