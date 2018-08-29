#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

; Es ist zu beachten, dass die Control-ID dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!
; Der Button erscheint nur unter Windows Vista!

Example()

Func Example()
	Local $hGui

	$hGui = GUICreate("Buttons", 400, 400)
	$g_idMemo = GUICtrlCreateEdit("", 10, 65, 390, 325, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	Local $idBtn = _GUICtrlButton_Create($hGui, "Button 1", 10, 10, 210, 45, BitOR($BS_COMMANDLINK, $BS_DEFPUSHBUTTON, $BS_PUSHLIKE))
	_GUICtrlButton_SetNote($idBtn, "Dies ist ein Test unter Vista!")

	GUISetState(@SW_SHOW)

	MemoWrite("Notiz: " & _GUICtrlButton_GetNote($idBtn))
	MemoWrite("Länge der Notiz: " & _GUICtrlButton_GetNoteLength($idBtn) & " Zeichen")
	MemoWrite("Buttontext: " & _GUICtrlButton_GetText($idBtn))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
