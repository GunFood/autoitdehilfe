#include <IE.au3>
#include <MsgBoxConstants.au3>

;Erstellt eine Internet-Explorer-Instanz und lädt eine Internetseite, es wird nicht gewartet bis die Internetseite geladen wurde, sondern sofort mit der nächsten Zeile im Skript fortgefahren

$oIE = _IECreate("www.autoitscript.com", 0)
MsgBox($MB_SYSTEMMODAL, "_IENavigate()", "Diese Code-Zeile wird sofort ausgeführt")
