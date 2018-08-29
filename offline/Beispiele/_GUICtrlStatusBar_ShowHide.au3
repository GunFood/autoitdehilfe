#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGui = GUICreate("StatusBar: Zeigen/verstecken", 400, 300)

	; Standard ist 1 Abschnitt und kein Text
	$hStatus = _GUICtrlStatusBar_Create($hGui)
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)

	GUISetState(@SW_SHOW)

	; Abschnitte setzen
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 3", 2)


	_GUICtrlStatusBar_ShowHide($hStatus, @SW_HIDE)
	MsgBox($MB_SYSTEMMODAL, "Information", "Versteckt die StatusBar")
	Sleep(1000)

	_GUICtrlStatusBar_ShowHide($hStatus, @SW_SHOW)
	MsgBox($MB_SYSTEMMODAL, "Information", "Zeigt die StatusBar")
	Sleep(1000)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
