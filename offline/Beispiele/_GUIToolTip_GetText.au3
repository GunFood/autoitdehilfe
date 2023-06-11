#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate(StringTrimRight(@ScriptName, StringLen(".exe")), 350, 200)

	Local $idButton = GUICtrlCreateButton("Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)

	Local $hToolTip = _GUIToolTip_Create($hGUI)

	_GUIToolTip_AddTool($hToolTip, 0, "Dies ist der ToolTip Text", $hButton)

	GUISetState(@SW_SHOW)
	; Ermittelt den Text des Tools
	MsgBox($MB_SYSTEMMODAL, 'Nachricht', _GUIToolTip_GetText($hToolTip, 0, $hButton))

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
	; Zerstört das Tooltip Control
	_GUIToolTip_Destroy($hToolTip)
	GUIDelete($hGUI)
EndFunc   ;==>Example
