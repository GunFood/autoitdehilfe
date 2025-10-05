#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("ToolTip einem Tool hinzufügen v(" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $iGUI = 1

	Local $idButton = GUICtrlCreateButton("Dies ist ein Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)
    ; Erstellt ein Tooltip Control mit den Standardeinstellungen
	Local $hToolTip = _GUIToolTip_Create(0)
	ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $hToolTip = ' & $hToolTip & @CRLF & '>Error code: ' & @error & '    Extended code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Console
	_MemoSetHandleInProcess($hToolTip)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

;~ 	$iGUI = 0 ; ist OK
    ; Fügt dem Tooltip Control ein Tool hinzu
	_GUIToolTip_AddTool($hToolTip, 0, "Dies ist ein ToolTip", $hButton)
	_GUIToolTip_AddTool($hToolTip, $iGUI * $hGUI, "Dies ist ein ToolTip"", $hButton)
	_GUIToolTip_AddTool($hToolTip, $iGUI * $hGUI, "Dies ist ein Tooltip für die nicht andere Strg-Tasten.", $hGUI)
	GUISetState(@SW_SHOW)

	; Zeigt den Tooltip an, der mit der Schaltfläche verbunden ist.
	Opt("MouseCoordMode", 2)
	MouseMove(50, 42, 0)
	Sleep(250)

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Zerstört des Tooltip Control
	_MemoResetHandleInProcess($hToolTip)
	_GUIToolTip_Destroy($hToolTip)
    GUIDelete($hGUI)
EndFunc   ;==>Example