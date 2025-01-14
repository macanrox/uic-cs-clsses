#ifndef REGISTER_H
#define REGISTER_H
#include "welcome.h"
#include "mainwindow.h"

#include <QDialog>

namespace Ui {
	class Register;
}

class Register : public QDialog
{
	Q_OBJECT

public:
	explicit Register(QWidget *parent = 0);
	~Register();

	private slots:
	void on_pushButton_clicked();

private:
	Ui::Register *ui;
};

#endif // REGISTER_H
