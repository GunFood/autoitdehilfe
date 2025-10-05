#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("TreeView: Ermittelt das Parent Handle (v" & @AutoItVersion & ")", 450, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $hTreeView = _GUICtrlTreeView_Create($hGUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($hTreeView, False)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	Local $hItem, $hChild
	For $x = 0 To 20
		$hItem = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		For $y = 0 To 2
			$hChild = _GUICtrlTreeView_AddChild($hTreeView, $hItem, StringFormat("[%02d] Neues Item", $y))
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	_GUICtrlTreeView_SelectItem($hTreeView, $hChild)
	MsgBox($MB_SYSTEMMODAL, "Information", "Parent Handle: " & _GUICtrlTreeView_GetParentHandle($hTreeView, $hChild))
	_GUICtrlTreeView_SelectItem($hTreeView, _GUICtrlTreeView_GetParentHandle($hTreeView, $hChild))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
