#AutoIt3Wrapper_UseX64=Y
#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example_External()

Func Example_External()
	Local $hGUI = GUICreate("(UDF) TreeView: Ermittelt die Parameter des Parent (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $hTreeView = _GUICtrlTreeView_Create($hGUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($hTreeView, False)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	Local $hItem, $hChild, $iParam = 0
	For $x = 0 To 10
		$hItem = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x))
		_GUICtrlTreeView_SetItemParam($hTreeView, $hItem, $iParam)
		$iParam += 1
		For $y = 0 To 2
			$hChild = _GUICtrlTreeView_AddChild($hTreeView, $hItem, StringFormat("[%02d] Neues Item", $iParam))
			_GUICtrlTreeView_SetItemParam($hTreeView, $hChild, $iParam)
			$iParam += 1
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	_GUICtrlTreeView_SelectItem($hTreeView, $hChild)
	MsgBox($MB_SYSTEMMODAL, "Information", "Parent Parameter: " & _GUICtrlTreeView_GetParentParam($hTreeView, $hChild))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_External
