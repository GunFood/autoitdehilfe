#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Aktualisiert die horizontale Scrollbar", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_NOTIFY, $LBS_SORT, $WS_HSCROLL, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; Fügt einen langen String hinzu
	_GUICtrlListBox_AddString($idListBox, "AutoIt v3 ist eine BASIC-artige Freeware-Skriptsprache. Sie wurde entwickelt, um die Windows-GUI zu automatisieren.")

	; Ermittelt von einer Listbox die scrollbare Breite
	MsgBox($MB_SYSTEMMODAL, "Information", "scrollbare Breite: " & _GUICtrlListBox_GetHorizontalExtent($idListBox))

	; Aktualisiert die horizontale Scrollbar basierend auf dem längsten String
	_GUICtrlListBox_UpdateHScroll($idListBox)

	; Ermittelt von einer Listbox die scrollbare Breite
	MsgBox($MB_SYSTEMMODAL, "Information", "scrollbare Breite: " & _GUICtrlListBox_GetHorizontalExtent($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
