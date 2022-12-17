#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Löschen (v" & @AutoItVersion & ")", 400, 300)

	; Standard ist 1 Abschnitt und kein Text
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)

	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 2)

	GUISetState(@SW_SHOW)

	Local $hHandleBefore = $hStatus
	MsgBox($MB_SYSTEMMODAL, "Information", "Das Control des folgenden Handles wird gelöscht: " & $hStatus)
	MsgBox($MB_SYSTEMMODAL, "Information", "Control gelöscht: " & _GUICtrlStatusBar_Destroy($hStatus) & @CRLF & _
			"Handle vor dem löschen: " & $hHandleBefore & @CRLF & _
			"Handle nach dem löschen: " & $hStatus)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
