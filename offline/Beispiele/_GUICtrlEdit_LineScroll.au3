#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hStatusBar, $idEdit, $hGui, $sText

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Scrollt den Text", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$hStatusBar = _GUICtrlStatusBar_Create($hGui)
	GUISetState(@SW_SHOW)

	; Setzt den Text
	For $i = 1 To 50
		$sText &= $i & @CRLF
	Next
	_GUICtrlEdit_SetText($idEdit, $sText)

	; Scrollt
	_GUICtrlStatusBar_SetText($hStatusBar, "Gescrollt: " & _GUICtrlEdit_LineScroll($idEdit, 0, _GUICtrlEdit_GetLineCount($idEdit)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
