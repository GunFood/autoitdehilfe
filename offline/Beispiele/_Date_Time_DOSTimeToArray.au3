#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $aDate

	; Erstellen der GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Anzeigen der FAT Zeit
	$aDate = _Date_Time_DOSTimeToArray(0x944a) ; 18:34:20
	_MemoWrite("FAT Zeit .: " & StringFormat("%02d:%02d:%02d", $aDate[0], $aDate[1], $aDate[2]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example