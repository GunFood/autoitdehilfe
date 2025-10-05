#include <DirConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Aktualisierung aktivieren", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Dateien hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	_GUICtrlListBox_ResetContent($idListBox)
	_GUICtrlListBox_InitStorage($idListBox, 100, 4096)
	_GUICtrlListBox_Dir($idListBox, @WindowsDir & "\win*.exe")
	_GUICtrlListBox_AddFile($idListBox, @WindowsDir & "\notepad.exe")
	_GUICtrlListBox_Dir($idListBox, "", $DDL_DRIVES)
	_GUICtrlListBox_Dir($idListBox, "", $DDL_DRIVES, False)
	_GUICtrlListBox_EndUpdate($idListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
