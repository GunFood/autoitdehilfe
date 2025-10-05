#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $aInfo

	; Erstellt eine GUI
	GUICreate("_Net_Share_StatisticsGetSvr", 400, 300)

	; Erstellt ein Memo-Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Erstellt die Server-Statistiken
	$aInfo = _Net_Share_StatisticsGetSvr(@ComputerName)
	_MemoWrite("Start der Statistik .........................: " & $aInfo[0])
	_MemoWrite("Zeit der Dateiöffnung .......................: " & $aInfo[1])
	_MemoWrite("Zeit der Geräteöffnung ......................: " & $aInfo[2])
	_MemoWrite("Gespeicherte Druckaufträge ..................: " & $aInfo[3])
	_MemoWrite("Start der Sitzung ...........................: " & $aInfo[4])
	_MemoWrite("Sitzung unterbrochen ........................: " & $aInfo[5])
	_MemoWrite("Sitzungsfehler ..............................: " & $aInfo[6])
	_MemoWrite("Passwort-Verletzungen .......................: " & $aInfo[7])
	_MemoWrite("Rechte-Fehler ...............................: " & $aInfo[8])
	_MemoWrite("Server-System-Fehler ........................: " & $aInfo[9])
	_MemoWrite("Über das Netzwerk gesendete Bytes ...........: " & $aInfo[10])
	_MemoWrite("Über das Netzwerk empfangene Bytes ..........: " & $aInfo[11])
	_MemoWrite("Durchschnittliche Antwortzeit des Servers ...: " & $aInfo[12])
	_MemoWrite('"Req Buffer"-Fehler .........................: ' & $aInfo[13])
	_MemoWrite('"Big Buffer"-Fehler .........................: ' & $aInfo[14])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example