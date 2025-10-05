#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip Get Text v(" & @AutoItVersion & ")", 450, 300, 100, 100)

	; Erstellt ein Tooltip-Steuerelement mit den Standardeinstellungen
	Local $hToolTip = _GUIToolTip_Create(0)
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$hGUI = 0 ; ist OK
	_GUIToolTip_AddTool($hToolTip, $hGUI, "Dies ist der Tooltip-Text", $hButton)

	GUISetState(@SW_SHOW)

	; Zeigt den mit der Schaltfläche verbundenen Tooltip an
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)
	; Ermittelt den Text des Tools
	_MemoMsgBox($MB_SYSTEMMODAL, 'Tooltip Text =', _GUIToolTip_GetText($hToolTip, $hGUI, $hButton))

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Zerstört das Tooltip Control
	_MemoResetHandleInProcess($hTooltip)
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
