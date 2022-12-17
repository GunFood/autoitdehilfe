#include <GUIConstantsEx.au3>
#include <GuiTreeView.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	GUICreate("TreeView: Item suchen (v" & @AutoItVersion & ")", 400, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $idTreeview = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlTreeView_SetUnicodeFormat($idTreeview, False)

	_GUICtrlTreeView_BeginUpdate($idTreeview)
	Local $aidItem[10]
	For $x = 0 To 3
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeview)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $y), $aidItem[$x])
		Next
	Next
	$aidItem[4] = GUICtrlCreateTreeViewItem(StringFormat("Suchst du nach mir?", $x), $idTreeview)
	For $x = 5 To 9
		$aidItem[$x] = GUICtrlCreateTreeViewItem(StringFormat("[%02d] Neues Item", $x), $idTreeview)
		For $y = 0 To 2
			GUICtrlCreateTreeViewItem(StringFormat("[%02d] NeuesItem", $y), $aidItem[$x])
		Next
	Next
	_GUICtrlTreeView_EndUpdate($idTreeview)

	Local $hItemFound = _GUICtrlTreeView_FindItem($idTreeview, "Suchst du nach mir?")
	If $hItemFound Then
		_GUICtrlTreeView_SelectItem($idTreeview, $hItemFound)
		MsgBox($MB_SYSTEMMODAL, "Information", "Item gefunden:" & @CRLF & "Handle: " & $hItemFound & @CRLF & "Text: " & _GUICtrlTreeView_GetText($idTreeview, $hItemFound))
	Else
		MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Information", "Nicht gefunden")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
