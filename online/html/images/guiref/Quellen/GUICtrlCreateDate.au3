#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>

GUICreate("Meine GUI ermittelt das Datum", 400, 200, 800, 200)
$date = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)
$n = GUICtrlCreateDate("", 220, 10, 100, 20, $DTS_TIMEFORMAT)
GUISetState()

; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
Do
	$msg = GUIGetMsg()
Until $msg = $GUI_EVENT_CLOSE

MsgBox(0, "Datum", GUICtrlRead($date))
GUIDelete()


