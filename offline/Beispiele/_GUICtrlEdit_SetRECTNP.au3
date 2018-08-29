#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $idEdit, $hGui
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $aPartRightSide[6] = [50, 130, 210, 290, 378, -1], $aRect

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Setzt das formatierte Rechteck in einem Mehrzeilen Edit-Control", 600, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGui, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 5, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($hStatusBar, "Rect")
	GUISetState(@SW_SHOW)

	; Ermittelt das formatierte Rechteck
	$aRect = _GUICtrlEdit_GetRECT($idEdit)
	$aRect[0] += 10
	$aRect[1] += 10
	$aRect[2] -= 10
	$aRect[3] -= 10

	; Fügt den Text hinzu
	_GUICtrlEdit_AppendText($idEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($idEdit, 0, _GUICtrlEdit_GetLineCount($idEdit) * - 1)

	; Setzt das formatierte Rechteck in einem Mehrzeilen Edit-Control
	_GUICtrlEdit_SetRECTNP($idEdit, $aRect)

	; Ermittelt das formatierte Rechteck
	$aRect = _GUICtrlEdit_GetRECT($idEdit)
	_GUICtrlStatusBar_SetText($hStatusBar, "Left: " & $aRect[0], 1)
	_GUICtrlStatusBar_SetText($hStatusBar, "Topt: " & $aRect[1], 2)
	_GUICtrlStatusBar_SetText($hStatusBar, "Right: " & $aRect[2], 3)
	_GUICtrlStatusBar_SetText($hStatusBar, "Bottom: " & $aRect[3], 4)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
