#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hHandleBefore, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Löschen", 400, 300)

	; Standard ist 1 Abschnitt und kein Text
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	GUISetState(@SW_SHOW)

	$hHandleBefore = $hStatus
	MsgBox($MB_SYSTEMMODAL, "Information", "Das Control des folgenden Handles wird gelöscht: " & $hStatus)
	MsgBox($MB_SYSTEMMODAL, "Information", "Control gelöscht: " & _GUICtrlStatusBar_Destroy($hStatus) & @CRLF & _
			"Handle vor dem löschen: " & $hHandleBefore & @CRLF & _
			"Handle nach dem löschen: " & $hStatus)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
