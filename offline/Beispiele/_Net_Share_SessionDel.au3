#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <NetShare.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $sServer

	; Erstellt eine GUI
	GUICreate("NetShare", 400, 300)

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Ermittelt die Server- und die Freigabe-Informatinen
	$sServer = InputBox("NetWork Demo", "Eingabe des Server-Namens:", "\\MyServer", "", 200, 130)
	If @error Then Exit

	; Löscht alle unsere Sitzungen auf dem Server
	_Net_Share_SessionDel($sServer, @ComputerName)
	_MemoWrite("Fehler ...................: " & @error)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example