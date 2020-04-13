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
	Local $aPartRightSide[3] = [200, 378, -1], $aPos

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Ermittelt die Fensterkoordinaten des angegebenen Zeichens", 550, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL, $ES_NOHIDESEL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGui, $aPartRightSide)
	GUISetState(@SW_SHOW)

	; Setzt die Ränder
	_GUICtrlEdit_SetMargins($idEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Setzt den Text
	_GUICtrlEdit_SetText($idEdit, FileRead($sFile))

	; Ermittelt die Fensterkoordinaten des 300. Zeichens
	$iIndex = 100
	$aPos = _GUICtrlEdit_PosFromChar($idEdit, $iIndex)
	_GUICtrlEdit_SetSel($idEdit, $iIndex, $iIndex + 1)
	_GUICtrlStatusBar_SetText($hStatusBar, "X = " & $aPos[0])
	_GUICtrlStatusBar_SetText($hStatusBar, "Y = " & $aPos[1], 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
