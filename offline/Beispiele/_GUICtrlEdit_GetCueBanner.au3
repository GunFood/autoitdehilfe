#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate('Beispiel', 300, 150)
	GUISetFont(9, 400, 0, 'Segoe UI')

	Local $idInp_Username = GUICtrlCreateInput('', 10, 10, 125, 25)
	_GUICtrlEdit_SetCueBanner($idInp_Username, "Suche Ordner")

	Local $idInp_Password = GUICtrlCreateInput('', 10, 40, 125, 25)
	_GUICtrlEdit_SetCueBanner($idInp_Password, "Suche...")

	Local $idButton_Close = GUICtrlCreateButton("Schließen", 210, 120, 85, 25)
	ControlFocus($hGUI, "", $idButton_Close)

	GUISetState(@SW_SHOW, $hGUI)

	MsgBox($MB_SYSTEMMODAL, "", _GUICtrlEdit_GetCueBanner($idInp_Password))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idButton_Close
				ExitLoop

		EndSwitch
	WEnd

	GUIDelete($hGUI)
EndFunc   ;==>Example
