#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

; Warnung: Verwenden Sie _GUICtrlTreeView_SetItemParam() nicht für Elemente, die mit GUICtrlCreateTreeViewItem erstellt wurden.
; Param ist die ControlID für Elemente, die mit der eingebauten Funktion

Example_Internal()

Func Example_Internal()
	GUICreate("TreeView: Ermittelt die Parameter des Parent (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($idTreeView, False)

	_GUICtrlTreeView_BeginUpdate($idTreeView)
	Local $idTVi_Item, $idTVi_Child, $iYItem = 0, $idFirstItem = 0
	For $x = 0 To 10
		$idTVi_Item = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeView)
		If $idFirstItem = 0 Then $idFirstItem = $idTVi_Item
		$iYItem += 1
		For $y = 0 To 2
			$idTVi_Child = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $iYItem), $idTVi_Item)
			$iYItem += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeView)

	_GUICtrlTreeView_SelectItem($idTreeView, $idTVi_Child)
	MsgBox($MB_SYSTEMMODAL, "Information", "Parent Parameter/ID: " & _GUICtrlTreeView_GetParentParam($idTreeView, $idTVi_Child) - $idFirstItem) ; Dies entspricht der Control-ID

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_Internal
