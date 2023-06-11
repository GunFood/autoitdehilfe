#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGui, $iMsg, $idBtnDoIt, $hRichEdit
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$idBtnDoIt = GUICtrlCreateButton("Mache es", 10, 260, 90, 25)

	GUISetState(@SW_SHOW)

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				GUIDelete() ; wird benötigt, da sonst das Skript abstürzt
				Exit
			Case $iMsg = $idBtnDoIt
				_GUICtrlRichEdit_Destroy($hRichEdit)
		EndSelect
	WEnd
EndFunc   ;==>Example
