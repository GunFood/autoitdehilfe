#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>

Example()

Func Example()
	Local $hGUI = GUICreate(StringTrimRight(@ScriptName, 4), 350, 200)

	Local $idButton = GUICtrlCreateButton("Dies ist ein Button", 30, 32, 130, 28)
	Local $hButton = GUICtrlGetHandle($idButton)
    ; Erstellt ein Tooltip Control mit den Standardeinstellungen
	Local $hToolTip = _GUIToolTip_Create(0)

    ; Fügt dem Tooltip Control ein Tool hinzu
	_GUIToolTip_AddTool($hToolTip, 0, "Dies ist ein ToolTip", $hButton)
	GUISetState(@SW_SHOW)

	While 1
		If GUIGetMsg() = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
	; Zerstört des Tooltip Control
	_GUIToolTip_Destroy($hToolTip)
    GUIDelete($hGUI)
EndFunc   ;==>Example