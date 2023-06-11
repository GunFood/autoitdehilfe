#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Neues Item am Anfang hinzufügen (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $hItem
	For $x = 1 To Random(2, 10, 1)
		$ahItem = _GUICtrlTreeView_Add($idTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = 1 To Random(2, 10, 1)
			_GUICtrlTreeView_AddChild($idTreeView, $ahItem, StringFormat("[%02d] Neues Child", $y))
		Next
	Next
	_GUICtrlTreeView_AddFirst($idTreeView, $ahItem, "[00] Neues erstes Item")
	_GUICtrlTreeView_EndUpdate($idTreeView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
