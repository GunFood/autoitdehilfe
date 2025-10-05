; == Example : Erstellit mit der UDF

#include "Extras\WM_NOTIFY.au3"

#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <StructureConstants.au3>
#include <WindowsNotifsConstants.au3>

Global $g_hSlider

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("Slider Erstellen (v" & @AutoItVersion & ")", 400, 296)
	$g_hSlider = _GUICtrlSlider_Create($hGui, 2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndSlider = $g_hSlider
	If Not IsHWnd($g_hSlider) Then $hWndSlider = GUICtrlGetHandle($g_hSlider)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndSlider
			Switch $iCode
				Case $NM_RELEASEDCAPTURE ; Das Control bemerkt, wenn die Maustaste wieder losgelassen wird
					_WM_NOTIFY_DebugEvent("$NM_RELEASEDCAPTURE", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
