#include <mysql.h>
#include <iostream>
#include <conio.h>
#include <string>

using namespace std;
bool flaga = false;
int qstate;

MYSQL* conn;
MYSQL_ROW row;
MYSQL_RES* res;

void zapytanie();
string logowanie();
void szefMenu();
void ksiegowyMenu();
void pracownikMenu();
void dodajPrace();
void wyswietlRaport();

int main()
{
	conn = mysql_init(0);
	conn = mysql_real_connect(conn, "localhost", "root", "zaq1@WSX", "io", 3306, NULL, 0);

	//wyswietlRaport();
	//zapytanie();
	string user = logowanie();
	_getch();
	system("cls");
	int userType;

	if (user == "Szef") userType = 1;
	if (user == "Ksiegowy") userType = 2;
	if (user == "Pracownik") userType = 3;

	while (!flaga) {
		switch (userType) {
		case 1:
			system("cls");
			szefMenu();
			_getch();
			break;
		case 2:
			system("cls");
			ksiegowyMenu();
			_getch();
			break;
		case 3:
			//pracownikMenu();
			break;
		}
	}

	//dodajPrace();




	return 0;
}

void zapytanie() {
	if (conn) {
		string query = "SELECT * FROM uzytkowniksystemu";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			cout << "ID  Name   Haslo   Rola" << endl;
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				printf("%s %s   %s   %s\n", row[0], row[1], row[2], row[3]);
			}
		}
		else
		{
			cout << "Bledne zapytanie: " << mysql_error(conn) << endl;
		}
	}

}

string logowanie() {
	string nazwa;
	string haslo;
	string rola = "niezalogowany";

	cout << "Nazwa uzytkownika: ";
	cin >> nazwa;
	cout << "Haslo: ";
	cin >> haslo;

	if (conn) {
		string query = "SELECT * FROM uzytkowniksystemu WHERE Nazwa='" + nazwa + "'";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				if (row[1] == nazwa) {
					if (row[2] == haslo) {
						rola = row[3];
						cout << "zalogowany jako: " + rola << endl;
					}
					else {
						return 0;
					}
				}
				//printf("%s %s   %s   %s\n", row[0], row[1], row[2], row[3]);
			}
		}
	}



	return rola;
}

void dodajPrace() {
	if (conn) {
		string query = "SELECT * FROM Pacjent";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << row[0] << ". " << row[1] << " " << row[2] << endl;

			}
		}
	}
	int id_pacjenta;
	cout << "Wybierz pacjenta: ";
	cin >> id_pacjenta;
	system("cls");
	if (conn) {
		string query = "SELECT * FROM typNaprawy";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << row[0] << ". " << row[1] << endl;

			}
		}
	}
	int typ_naprawy;
	cout << "Wybierz typ naprawy: ";
	cin >> typ_naprawy;

	string data;
	cout << "Wprowadź datę realizacji(YYYY-MM-DD): ";
	cin >> data;

	float czasTrwania;
	cout << "Przewidywany czas trwania zabiegu: ";
	cin >> czasTrwania;

	float koszt = czasTrwania * 120;

	int naprawa_id;
	string aaa;
	//int p;

	//system("cls");
	if (conn) {
		string query = "SELECT MAX(Zabieg_ID) FROM Naprawa";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{

			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				aaa = row[0];
				//cout << "################################## "<< aaa;
			}
			//res = mysql_store_result(conn);
			//naprawa_id = mysql_num_fields(res);
			//aaa = row[0];
		}
	}
	naprawa_id = atoi(aaa.c_str());
	naprawa_id++;
	//cout << naprawa_id << endl << aaa;
	//_getch();

	if (conn) {
		//string query = "INSERT INTO Naprawa(Zabieg_ID, Pacjent_ID, TypNaprawy_ID, Data, CzasTrwania, Koszt) VALUES(" + naprawa_id + ',' + id_pacjenta + ',' + typ_naprawy + ',' + data + ',';
		//query += czasTrwania + ',';
		//query += koszt + ')';
		cout << endl;
		string query = "INSERT INTO Naprawa VALUES(";
		query += to_string(naprawa_id);
		query += ",";
		query += to_string(id_pacjenta);
		query += ",";
		query += to_string(typ_naprawy);
		query += ",";
		query += "'";
		query += data;
		query += "',";
		query += to_string(czasTrwania);
		query += ",";
		query += to_string(koszt);
		query += ")";
		


		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		cout << query << endl;
		cout << "Dodano nowy rekord";
	}

}

void usunPrace() {
	if (conn) {
		string query = "select nap.Zabieg_ID, tn.Nazwa, pac.Imie, pac.Nazwisko, nap.Data, nap.CzasTrwania as 'CzasTrwania[h]', nap.koszt as 'koszt[pln]' FROM Naprawa nap, TypNaprawy tn, Pacjent pac WHERE tn.TypNaprawy_ID=nap.TypNaprawy_ID AND pac.Pacjent_ID=nap.Pacjent_ID;";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << row[0] << ". " << row[1] << " " << row[2] << " " << row[3] << " " << row[4] << " " << row[5] << " " << row[6] << endl;

			}
		}
	}


	int id_naprawy;
	cout << "Wybierz naprawe, ktora chcesz usunac: ";
	cin >> id_naprawy;


	if (conn) {
		//string query = "INSERT INTO Naprawa(Zabieg_ID, Pacjent_ID, TypNaprawy_ID, Data, CzasTrwania, Koszt) VALUES(" + naprawa_id + ',' + id_pacjenta + ',' + typ_naprawy + ',' + data + ',';
		//query += czasTrwania + ',';
		//query += koszt + ')';
		string query = "DELETE FROM Naprawa WHERE Zabieg_ID=";
		query += to_string(id_naprawy);
		//select nap.Zabieg_ID, tn.Nazwa, pac.Imie, pac.Nazwisko, nap.Data, nap.CzasTrwania as 'CzasTrwania[h]', nap.koszt as 'koszt[pln]' FROM Naprawa nap, TypNaprawy tn, Pacjent pac WHERE tn.TypNaprawy_ID=nap.TypNaprawy_ID AND pac.Pacjent_ID=nap.Pacjent_ID;


		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		cout << query << endl;
		cout << "Pomyslnie usunieto rekord";
	}

}

void wyswietlPrace() {
	if (conn) {
		string query = "select nap.Zabieg_ID, tn.Nazwa, pac.Imie, pac.Nazwisko, nap.Data, nap.CzasTrwania as 'CzasTrwania[h]', nap.koszt as 'koszt[pln]' FROM Naprawa nap, TypNaprawy tn, Pacjent pac WHERE tn.TypNaprawy_ID=nap.TypNaprawy_ID AND pac.Pacjent_ID=nap.Pacjent_ID;";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << row[0] << ". " << row[1] << " " << row[2] << " " << row[3] << " " << row[4] << " " << row[5] << " " << row[6] << endl;

			}
		}
	}
}

void modyfikujPrace() {


	if (conn) {
		string query = "select nap.Zabieg_ID, tn.Nazwa, pac.Imie, pac.Nazwisko, nap.Data, nap.CzasTrwania as 'CzasTrwania[h]', nap.koszt as 'koszt[pln]' FROM Naprawa nap, TypNaprawy tn, Pacjent pac WHERE tn.TypNaprawy_ID=nap.TypNaprawy_ID AND pac.Pacjent_ID=nap.Pacjent_ID;";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << row[0] << ". " << row[1] << " " << row[2] << " " << row[3] << " " << row[4] << " " << row[5] << " " << row[6] << endl;

			}
		}
	}
	int nr_naprawy;
	cout << "Wprowadz numer naprawy ktory chcesz zaktualizowac: ";
	cin >> nr_naprawy;

	if (conn) {
		string query = "SELECT * FROM Pacjent";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << row[0] << ". " << row[1] << " " << row[2] << endl;

			}
		}
	}
	int id_pacjenta;
	cout << "Wybierz pacjenta: ";
	cin >> id_pacjenta;
	system("cls");
	if (conn) {
		string query = "SELECT * FROM typNaprawy";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << row[0] << ". " << row[1] << endl;

			}
		}
	}
	int typ_naprawy;
	cout << "Wybierz typ naprawy: ";
	cin >> typ_naprawy;

	string data;
	cout << "Wprowadź datę realizacji(YYYY-MM-DD): ";
	cin >> data;

	float czasTrwania;
	cout << "Przewidywany czas trwania zabiegu: ";
	cin >> czasTrwania;

	float koszt = czasTrwania * 120;

	//int naprawa_id;
	//string aaa;
	////int p;

	////system("cls");
	//if (conn) {
	//	string query = "SELECT MAX(Zabieg_ID) FROM Naprawa";
	//	const char* q = query.c_str();
	//	qstate = mysql_query(conn, q);
	//	if (!qstate)
	//	{

	//		res = mysql_store_result(conn);
	//		while (row = mysql_fetch_row(res))
	//		{
	//			aaa = row[0];
	//			//cout << "################################## "<< aaa;
	//		}
	//		//res = mysql_store_result(conn);
	//		//naprawa_id = mysql_num_fields(res);
	//		//aaa = row[0];
	//	}
	//}
	//naprawa_id = atoi(aaa.c_str());
	//naprawa_id++;
	////cout << naprawa_id << endl << aaa;
	////_getch();

		//UPDATE table_name
	//SET column1 = value1, column2 = value2, ...
	//	WHERE Zabieg_ID=zmienna;

	if (conn) {
		//string query = "INSERT INTO Naprawa(Zabieg_ID, Pacjent_ID, TypNaprawy_ID, Data, CzasTrwania, Koszt) VALUES(" + naprawa_id + ',' + id_pacjenta + ',' + typ_naprawy + ',' + data + ',';
		//query += czasTrwania + ',';
		//query += koszt + ')';
		cout << endl;
		string query = "UPDATE Naprawa SET ";
		query += "Pacjent_ID=";
		query += to_string(id_pacjenta);
		query += ",";
		query += "TypNaprawy_ID=";
		query += to_string(typ_naprawy);
		query += ",";
		query += "Data=";
		query += "'" + data + "'";
		query += ",";
		query += "CzasTrwania=";
		query += to_string(czasTrwania);
		query += ",";
		query += "Koszt=";
		query += to_string(koszt);
		query += " WHERE Zabieg_ID=";
		query += to_string(nr_naprawy);



		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		cout << query << endl;
		cout << "Dodano nowy rekord";
	}
}

void szefMenu() {

	cout << "1. Dodaj prace" << endl << "2. Modyfikuj" << endl << "3. Usun" << endl << "4. Wyswietl aktualne prace" << endl << "5. Zakoncz" << endl << endl;

	int zap;
	cout << "Wybierz opcje: ";
	cin >> zap;

	switch (zap) {
		case 1:
			dodajPrace();
			break;
		case 2:
			modyfikujPrace();
			break;
		case 3:
			usunPrace();
			break;
		case 4:
			wyswietlPrace();
			break;
		case 5:
			flaga = true;
			break;
		default: break;
	}

	//if (conn) {

	//	string query = "SELECT * FROM uzytkowniksystemu";
	//	const char* q = query.c_str();
	//	qstate = mysql_query(conn, q);
	//	if (!qstate)
	//	{
	//		res = mysql_store_result(conn);
	//		while (row = mysql_fetch_row(res))
	//		{


	//		}
	//	}
	//}

}

/// ////////////////////////////////////////////
void wyswietlRaport() {
	//SELECT DATEDIFF(MAX(Data),MIN(Data)) from Naprawa;
	//SELECT SUM(Koszt) as 'Koszt[PLN]' from Naprawa;
	//SELECT (SUM(Koszt)/(DATEDIFF(MAX(Data),MIN(Data))))*30 from Naprawa;
	if (conn) {
		string query = "SELECT ROUND((SUM(Koszt)/(DATEDIFF(MAX(Data),MIN(Data))))*30,2) from Naprawa;";
		const char* q = query.c_str();
		qstate = mysql_query(conn, q);
		if (!qstate)
		{
			res = mysql_store_result(conn);
			while (row = mysql_fetch_row(res))
			{
				cout << "Miesieczny sredni przychod: " << row[0] << " PLN" << endl; //<< ". " << row[1] << " " << row[2] << " " << row[3] << " " << row[4] << " " << row[5] << " " << row[6] << endl;

			}
		}
	}
}

void ksiegowyMenu() {
	cout << "1. Wyswietl raport" << endl << "2. Zakoncz" << endl << endl;

	int zap;
	cout << "Wybierz opcje: ";
	cin >> zap;

	switch (zap) {
	case 1:
		wyswietlRaport();
		break;
	case 2:
		flaga = true;
		break;
	default: break;
	}

}

///////////////////////////////////////////
//void Pracownik() {
//
//}
