#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"

	; Erstellt eine GUI
	Local $hGUI = GUICreate("Edit: Setzt und ermittelt das formatierte Rechteck (v" & @AutoItVersion & ")", 500, 300)
	Local $idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	Local $aPartRightSide[6] = [50, 75, 75, 75, 75, -1]
	Local $hStatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 5, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($hStatusBar, "Rechteck:")
	GUISetState(@SW_SHOW)

	; Ermittelt das formatierte Rechteck
	Local $tRECT = _GUICtrlEdit_GetRECTEx($idEdit)
	DllStructSetData($tRECT, "Left", DllStructGetData($tRECT, "Left") + 10)
	DllStructSetData($tRECT, "Top", DllStructGetData($tRECT, "Top") + 10)
	DllStructSetData($tRECT, "Right", DllStructGetData($tRECT, "Right") - 10)
	DllStructSetData($tRECT, "Bottom", DllStructGetData($tRECT, "Bottom") - 10)

	; Setzt das formatierte Rechteck
	_GUICtrlEdit_SetRECTEx($idEdit, $tRECT)

	; Fügt den Text hinzu
	_GUICtrlEdit_AppendText($idEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($idEdit, 0, _GUICtrlEdit_GetLineCount($idEdit) * -1)

	; Ermittelt das formatierte Rechteck
	$tRECT = _GUICtrlEdit_GetRECTEx($idEdit)
	_GUICtrlStatusBar_SetText($hStatusBar, "Links: " & DllStructGetData($tRECT, "Left"), 1)
	_GUICtrlStatusBar_SetText($hStatusBar, "Oben: " & DllStructGetData($tRECT, "Top"), 2)
	_GUICtrlStatusBar_SetText($hStatusBar, "Rechts: " & DllStructGetData($tRECT, "Right"), 3)
	_GUICtrlStatusBar_SetText($hStatusBar, "Unten: " & DllStructGetData($tRECT, "Bottom"), 4)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
