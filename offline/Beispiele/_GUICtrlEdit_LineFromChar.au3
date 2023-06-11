#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $idEdit, $hGui, $iRandom
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Ermittelt die Zeile, welche den angegebenen Zeichenindex enthält", 600, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 594, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGui)
	GUISetState(@SW_SHOW)

	; Setzt den Text
	_GUICtrlEdit_SetText($idEdit, FileRead($sFile))

	; Ermittelt den Index der Zeile, welche den festgelegten Zeichenindex enthält
	$iRandom = Random(0, _GUICtrlEdit_GetTextLen($idEdit) - 1, 1)
	_GUICtrlEdit_SetSel($idEdit, $iRandom - 1, $iRandom)
	_GUICtrlStatusBar_SetText($hStatusBar, "Das " & $iRandom & ". Zeichen befindet sich in Zeile " & _GUICtrlEdit_LineFromChar($idEdit, $iRandom))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
