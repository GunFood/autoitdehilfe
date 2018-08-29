#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt das Unicode Format", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Setzt das Unicode Format
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode: " & _GUICtrlListView_GetUnicodeFormat($idListView))
	_GUICtrlListView_SetUnicodeFormat($idListView, True)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode: " & _GUICtrlListView_GetUnicodeFormat($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
