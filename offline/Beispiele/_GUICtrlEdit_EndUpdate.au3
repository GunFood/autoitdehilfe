#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	Local $hStatusBar, $idEdit, $hGui
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Aktualisierung wieder aktivieren", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$hStatusBar = _GUICtrlStatusBar_Create($hGui, -1)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_BeginUpdate($idEdit)
	_GUICtrlEdit_SetText($idEdit, FileRead($sFile))
	_GUICtrlEdit_EndUpdate($idEdit)

	_GUICtrlStatusBar_SetIcon($hStatusBar, 0, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($hStatusBar, @TAB & "Zeilen: " & _GUICtrlEdit_GetLineCount($idEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
