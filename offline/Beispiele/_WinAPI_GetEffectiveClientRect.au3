#include <GUIConstantsEx.au3>
#include <GUIStatusBar.au3>
#include <StaticConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPISys.au3>

; Create GUI
Local $hForm = GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), 600, 400)
Local $idMenu = GUICtrlCreateMenu("&File")
Local $idMni_Exit = GUICtrlCreateMenuItem("E&xit", $idMenu)
Local $aCtrl[2]
$aCtrl[0] = _GUICtrlStatusBar_Create($hForm)
Local $idLV = GUICtrlCreateListView('', 0, 0, 600, 200, -1, 0)
$aCtrl[0] = $idLV

; Calculate effective client area (excluding Menu, ListView, and StatusBar controls)
Local $tRECT = _WinAPI_GetEffectiveClientRect($hForm, $aCtrl)
Local $aPos = _WinAPI_GetPosFromRect($tRECT)
GUICtrlCreateLabel($aPos[2] & 'x' & $aPos[3], $aPos[0], $aPos[1], $aPos[2], $aPos[3], BitOR($SS_CENTER, $SS_CENTERIMAGE))
GUICtrlSetFont(-1, 25, 400, 0, 'Tahoma')
GUICtrlSetBkColor(-1, 0xFFD0D0)

; Show GUI
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE, $idMni_Exit
			ExitLoop
	EndSwitch
WEnd
