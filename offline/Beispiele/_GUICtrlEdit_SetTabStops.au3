#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $idEdit, $hGui
	Local $aPartRightSide[3] = [190, 378, -1], $aTabStops[3] = [10, 30, 50]

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Setzt Tabstops", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGui, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 2, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt die Ränder
	_GUICtrlEdit_SetMargins($idEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Setzt den Text
	_GUICtrlEdit_SetText($idEdit, @TAB & "1." & @TAB & "2." & @TAB & "3.")

	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt Tabstops")

	; Setzt Tabstops
	_GUICtrlEdit_SetTabStops($idEdit, $aTabStops)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
