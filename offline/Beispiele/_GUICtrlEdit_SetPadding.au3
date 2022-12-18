#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Beispiel für: _GUICtrlEdit_SetPadding", 400, 300)
	Local $idEdit = GUICtrlCreateEdit("Some text", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_SetPadding($idEdit, 30, 10)
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
