#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Setzt und ermittelt die horizontale Ausdehnung (v" & @AutoItVersion & ")", 600, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState(@SW_SHOW)

	; Einen langen String hinzufügen
	_GUICtrlListBox_AddString($idListBox, "AutoIt v3 Ist ein Freeware, BASIC-ähnliche Script-Sprache um die Windows-GUI zu automatisieren.")

	; Zeigt die horizontale Ausdehnung
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontale Ausdehnung: " & _GUICtrlListBox_GetHorizontalExtent($idListBox))

	_GUICtrlListBox_SetHorizontalExtent($idListBox, 500)

	; Zeigt die aktuelle horizontale Ausdehnung
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontale Ausdehnung: " & _GUICtrlListBox_GetHorizontalExtent($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
