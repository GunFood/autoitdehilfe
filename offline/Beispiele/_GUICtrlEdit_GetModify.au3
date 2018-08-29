#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	Local $hStatusBar, $idEdit, $hGui
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $aPartRightSide[4] = [120, 248, 378, -1]

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Ermittelt den Status des Änderungflags", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$hStatusBar = _GUICtrlStatusBar_Create($hGui, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 3, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt die Ränder
	_GUICtrlEdit_SetMargins($idEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Fügt den Text hinzu
	_GUICtrlEdit_AppendText($idEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($idEdit, 0, _GUICtrlEdit_GetLineCount($idEdit) * - 1)

	; Ermittelt den Status des Änderungflags
	_GUICtrlStatusBar_SetText($hStatusBar, "Änderungflags: " & _GUICtrlEdit_GetModify($idEdit), 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
