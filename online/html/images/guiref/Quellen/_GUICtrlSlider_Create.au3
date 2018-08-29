#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Global $hSlider

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("(UDF) Slider erstellen", 400, 296)
	$hSlider = _GUICtrlSlider_Create($hGUI, 20, 20, 196, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndSlider
	$hWndSlider = $hSlider
	If Not IsHWnd($hSlider) Then $hWndSlider = GUICtrlGetHandle($hSlider)

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndSlider
			Switch $iCode
				Case $NM_RELEASEDCAPTURE ; Das Steuerelement bemerkt, wenn die Maustaste wieder losgelassen wird
					_DebugPrint("$NM_RELEASEDCAPTURE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint
