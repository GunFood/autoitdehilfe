#include <DateTimeConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI ermittelt das Datum", 200, 200, 800, 200)
	Local $idDate = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)

	; Um ein bestimmtes Standardformat auszuwählen
	Local $sStyle = "yyyy/MM/dd HH:mm:ss"
	GUICtrlSendMsg($idDate, $DTM_SETFORMATW, 0, $sStyle)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	While GUIGetMsg() <> $GUI_EVENT_CLOSE
	WEnd

	MsgBox($MB_SYSTEMMODAL, "Zeit", GUICtrlRead($idDate))
EndFunc   ;==>Example
