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
	Local $aPartRightSide[2] = [378, -1], $iRandom

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Ermittelt den Index des ersten Zeichens in der festgelegten Zeile", 550, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 544, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGui, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 1, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt die Ränder
	_GUICtrlEdit_SetMargins($idEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Setzt den Text
	_GUICtrlEdit_SetText($idEdit, FileRead($sFile))

	; Zeilenindex
	$iRandom = Random(0, _GUICtrlEdit_GetLineCount($idEdit) - 1, 1)
	_GUICtrlStatusBar_SetText($hStatusBar, "Zeichenindex: " & _GUICtrlEdit_LineIndex($idEdit, $iRandom) & " von Zeile: " & $iRandom)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
