#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $aInfo

	; Erstellt eine GUI
	GUICreate("NetShare", 500, 650)

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Ermittelt die Verbindungsstatistik der Workstation
	$aInfo = _Net_Share_StatisticsGetWrk(@ComputerName)
	_MemoWrite("===================== NetStatisticsGetWrk =====================")
	_MemoWrite("Aufzeichnung begonnen .....................: " & $aInfo[0])
	_MemoWrite("Bytes empfangen ...........................: " & $aInfo[1])
	_MemoWrite("SMBs empfangen ............................: " & $aInfo[2])
	_MemoWrite("Paging-I/O-Bytes ..........................: " & $aInfo[3])
	_MemoWrite("Non-paging-I/O-Bytes ......................: " & $aInfo[4])
	_MemoWrite("Cache-I/O-Bytes ...........................: " & $aInfo[5])
	_MemoWrite("Disk-I/O-Bytes ............................: " & $aInfo[6])
	_MemoWrite("Bytes gesendet ............................: " & $aInfo[7])
	_MemoWrite("SMBs gesendet .............................: " & $aInfo[8])
	_MemoWrite("Paging-I/O-Bytes ..........................: " & $aInfo[9])
	_MemoWrite("Non-paging-I/O-Bytes ......................: " & $aInfo[10])
	_MemoWrite("Cache-I/O-Bytes ...........................: " & $aInfo[11])
	_MemoWrite("Disk-I/O-Bytes ............................: " & $aInfo[12])
	_MemoWrite("Fehlgeschlagene Operationen begonnen ......: " & $aInfo[13])
	_MemoWrite("Fehlgeschlagene Operationen abgeschlossen .: " & $aInfo[14])
	_MemoWrite("Lesevorgänge ..............................: " & $aInfo[15])
	_MemoWrite("Lesevorgänge mit wahlfreiem Zugriff........: " & $aInfo[16])
	_MemoWrite("Leseanfragen gesendet .....................: " & $aInfo[17])
	_MemoWrite("Leseanfragen (groß) .......................: " & $aInfo[18])
	_MemoWrite("Leseanfragen (klein) ......................: " & $aInfo[19])
	_MemoWrite("Schreibvorgänge ...........................: " & $aInfo[20])
	_MemoWrite("Schreibvorgänge mit wahlfreiem Zugriff.....: " & $aInfo[21])
	_MemoWrite("Schreibanfragen gesendet ..................: " & $aInfo[22])
	_MemoWrite("Schreibanfragen (groß) ....................: " & $aInfo[23])
	_MemoWrite("Schreibanfragen (klein) ...................: " & $aInfo[24])
	_MemoWrite("Verweigerte Raw-Lesevorgänge ..............: " & $aInfo[25])
	_MemoWrite("Verweigerte Raw-Schreibvorgänge ...........: " & $aInfo[26])
	_MemoWrite("Netzwerkfehler ............................: " & $aInfo[27])
	_MemoWrite("Verbindungssitzungen eingerichtet .........: " & $aInfo[28])
	_MemoWrite("Gescheiterte Sitzungen ....................: " & $aInfo[29])
	_MemoWrite("Missglückte Verbindungen ..................: " & $aInfo[30])
	_MemoWrite("PCNET Verbindungen ........................: " & $aInfo[31])
	_MemoWrite("NetShare 20 Verbindungen ..................: " & $aInfo[32])
	_MemoWrite("NetShare 21 Verbindungen ..................: " & $aInfo[33])
	_MemoWrite("WinNT Verbindungen ........................: " & $aInfo[34])
	_MemoWrite("Verbindungsabbrüche .......................: " & $aInfo[35])
	_MemoWrite("Sitzungen abgelaufen ......................: " & $aInfo[36])
	_MemoWrite("Verbindungen hergestellt ..................: " & $aInfo[37])
	_MemoWrite("Verbindungen fehlgeschlagen ...............: " & $aInfo[38])
	_MemoWrite("Unvollständige Anfragen ...................: " & $aInfo[39])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
