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
	Local $aPartRightSide[6] = [50, 130, 210, 290, 378, -1], $tRECT

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Setzt das formatierte Rechteck", 520, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 274, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGui, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($hStatusBar, 5, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($hStatusBar, "Rechteck:")
	GUISetState(@SW_SHOW)

	; Ermittelt das formatierte Rechteck des Edit-Controls
	$tRECT = _GUICtrlEdit_GetRECTEx($idEdit)
	; Rechteck verkleinern (zur Demonstration von _GUICtrlEdit_SetRECTNPEx)
	DllStructSetData($tRECT, "Left", DllStructGetData($tRECT, "Left") + 10)
	DllStructSetData($tRECT, "Top", DllStructGetData($tRECT, "Top") + 10)
	DllStructSetData($tRECT, "Right", DllStructGetData($tRECT, "Right") - 10)
	DllStructSetData($tRECT, "Bottom", DllStructGetData($tRECT, "Bottom") - 10)

	; Fügt den Text hinzu
	_GUICtrlEdit_AppendText($idEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($idEdit, 0, _GUICtrlEdit_GetLineCount($idEdit) * - 1)

	; Setzt das formatierte Rechteck in einem Mehrzeilen Edit-Control, ohne es neu zu zeichnen
	_GUICtrlEdit_SetRectNPEx($idEdit, $tRECT)

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
