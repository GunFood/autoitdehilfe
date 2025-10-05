#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

; Es ist zu beachten, dass die Control-ID dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!
; Der Button erscheint nur unter Windows Vista!

Example()

Func Example()
	Local $hGUI = GUICreate("Button: Setzt und ermittelt den Text der Notiz (v" & @AutoItVersion & ")", 500, 400)
	_MemoCreate(10, 75, 390, 315, $WS_VSCROLL)

	Local $hButton = _GUICtrlButton_Create($hGUI, "Button 1", 10, 10, 160, 60, BitOR($BS_COMMANDLINK, $BS_DEFCOMMANDLINK))
	_GUICtrlButton_SetNote($hButton, "Dies ist ein Test unter Vista!")

	GUISetState(@SW_SHOW)

	_MemoWrite("Notiz: " & _GUICtrlButton_GetNote($hButton))
	_MemoWrite("Länge der Notiz: " & _GUICtrlButton_GetNoteLength($hButton) & " Zeichen")
	_MemoWrite("Buttontext: " & _GUICtrlButton_GetText($hButton))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example