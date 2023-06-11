#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <WinAPIError.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("ListBox: Setzt und ermittelt die momentane Auswahl (v" & @AutoItVersion & ")", 500, 296)
	Local $idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Strings hinzu
	_GUICtrlListBox_BeginUpdate($idListBox)
	For $iI = 0 To 9
		_GUICtrlListBox_AddString($idListBox, StringFormat("%03d : String", $iI))
	Next
	_GUICtrlListBox_EndUpdate($idListBox)

	; Wählt ein Item aus
	_GUICtrlListBox_SetCurSel($idListBox, 4)

	; Ermittelt das ausgewählte Item
	_WinAPI_ShowMsg("Momentane Auswahl: " & _GUICtrlListBox_GetCurSel($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
