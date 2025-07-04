#include <QMainWindow>
#include "employe.h"
#include "serialcommunication.h"
QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void on_pushButton_4_clicked();         // Create
    void on_pushButton_3_clicked();         // Read
    void on_modifier_clicked();         // Update
    void on_pushButton_2_clicked();         // Delete
    void setupSerial();

private slots:



    void checkUidInDatabase(const QString &uid);
    void on_recherche_textChanged(const QString &arg1);


    void on_Pdf_clicked();

    void on_pushButton_clicked();

    void on_pushButton_5_clicked();



    void on_trier_currentTextChanged(const QString &arg1);

    void on_combo_stat_currentTextChanged(const QString &arg1);
    void handleUidFromArduino(const QString &uid);
    void handleUidAuthorized(const QString &uid);
    void addUidToEmployee();  // Slot pour ajouter un UID à un employé
    void loadEmployees();  // Charger les employés dans le ComboBox

private:
    Ui::MainWindow *ui;
    employe temploye;
    SerialCommunication *serialCom;        // Employee instance
    bool messageEnvoye = false;
    QString lastUid;
    bool isReadyForUid = true;
    bool connectToDatabase();


};
