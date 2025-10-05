#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hImage, $idBtn, $aIdealSize

	GUICreate("Buttons", 400, 400)
	_MemoCreate(119, 10, 276, 374, $WS_VSCROLL)

	$hImage = _GUIImageList_Create(32, 32, 5, 3, 6)
	For $x = 6 To 11
		_GUIImageList_AddIcon($hImage, "shell32.dll", $x, True)
	Next

	$idBtn = GUICtrlCreateButton("Button 1", 10, 10, 90, 50)
	_GUICtrlButton_SetImageList($idBtn, $hImage)

	GUISetState(@SW_SHOW)

	$aIdealSize = _GUICtrlButton_GetIdealSize($idBtn)
	_MemoWrite("Button 1 ideale Breite: " & $aIdealSize[0] & " Höhe: " & $aIdealSize[1])

	Sleep(3000)

	_MemoWrite(StringFormat("Setzt die Größe: %s", _GUICtrlButton_SetSize($idBtn, $aIdealSize[0], $aIdealSize[1])))

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example