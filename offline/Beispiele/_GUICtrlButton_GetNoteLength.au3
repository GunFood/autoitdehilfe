#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

; Es ist zu beachten, dass das Handle dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!

Example()

Func Example()
	Local $hGui

	$hGui = GUICreate("Buttons", 400, 400)
	_MemoCreate(10, 65, 390, 325, $WS_VSCROLL)

	Local $hBtn = _GUICtrlButton_Create($hGui, "Button 1", 10, 10, 210, 45, BitOR($BS_COMMANDLINK, $BS_DEFPUSHBUTTON, $BS_PUSHLIKE))
	_GUICtrlButton_SetNote($hBtn, "Dies ist ein Test unter Vista!")

	GUISetState(@SW_SHOW)

	_MemoWrite("Notiz: " & _GUICtrlButton_GetNote($hBtn))
	_MemoWrite("Länge der Notiz: " & _GUICtrlButton_GetNoteLength($hBtn) & " Zeichen")
	_MemoWrite("Buttontext: " & _GUICtrlButton_GetText($hBtn))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example