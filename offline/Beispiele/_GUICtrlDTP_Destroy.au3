#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hHandleBefore, $hDTP

	; Erstellt eine GUI
	$hGui = GUICreate("DateTimePick: Zerstören (UDF)", 400, 300)
	$hDTP = _GUICtrlDTP_Create($hGui, 2, 6, 190)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Zerstört das Handle des Controls: " & $hDTP)
	$hHandleBefore = $hDTP
	MsgBox($MB_SYSTEMMODAL, "Information", "Control zerstört: " & _GUICtrlDTP_Destroy($hDTP) & @CRLF & _
			"Handle vor dem zerstören: " & $hHandleBefore & @CRLF & _
			"Handle nach dem zerstören: " & $hDTP)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
