#include <APIGdiConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIGdi.au3>
#include <WinAPISysWin.au3>
#include <WinAPITheme.au3>
#include <WindowsSysColorConstants.au3>

Global $g_hGUI, $g_idEdt_Note, $g_sNote, $g_iSet, $g_idChk_DarkMode, $g_idChk_CustomColors

Example() ; Win 10 onwards

Func Example()
	; Create a GUI with various controls.
	$g_hGUI = GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), 300, 165)
	_WinAPI_SetThemeAppProperties(0) ; needed to have GUICtrlSetColor() on CheckBox OK

	; Create a checkbox control.
	$g_idChk_DarkMode = GUICtrlCreateCheckbox("Use Dark mode frame", 10, 10, 125, 25)
	$g_idChk_CustomColors = GUICtrlCreateCheckbox("custom colors on change", 145, 10, 185, 25)
	GUICtrlSetState(-1, $GUI_CHECKED)
	$g_sNote = @CRLF & "Clicking the checkbox allows the window frame " & _
			@CRLF & " for this window to be drawn in dark mode colors" & _
			@CRLF & " when the dark mode system setting is enabled."
	$g_idEdt_Note = GUICtrlCreateEdit($g_sNote, 10, 44, 280, 110, BitOR($ES_CENTER, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY))

	; Display the GUI.
	GUISetState(@SW_SHOW, $g_hGUI)

	; Loop until the user exits.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $g_idChk_DarkMode
				If _IsChecked($g_idChk_DarkMode) Then    ;  enable window frame dark mode
					$g_iSet = _WinAPI_DwmSetWindowAttribute($g_hGUI, $DWMWA_USE_IMMERSIVE_DARK_MODE, True)
					LetsSeeTheDifference()
				Else                                    ;  disable window frame dark mode
					$g_iSet = _WinAPI_DwmSetWindowAttribute($g_hGUI, $DWMWA_USE_IMMERSIVE_DARK_MODE, False)
					LetsSeeTheDifference()
				EndIf

		EndSwitch
	WEnd

	; Delete the previous GUI and all controls.
	GUIDelete($g_hGUI)
EndFunc   ;==>Example

Func _IsChecked($idControlID)
	Return BitAND(GUICtrlRead($idControlID), $GUI_CHECKED) = $GUI_CHECKED
EndFunc   ;==>_IsChecked

Func LetsSeeTheDifference()
	GUICtrlSetData($g_idEdt_Note, $g_sNote & @CRLF & @CRLF & "DwmSetWindowAttribute: " & ($g_iSet ? 'OK' : 'Failed, see MSDN notes') & @CRLF & '(OSBuild: ' & @OSBuild & ')')
	If Not $g_iSet Then Return
	If _IsChecked($g_idChk_CustomColors) Then
		If _IsChecked($g_idChk_DarkMode) Then
			GUISetBkColor(0x1B1B1B, $g_hGUI)
			GUICtrlSetBkColor($g_idEdt_Note, 0x2B2B2B)
			GUICtrlSetColor($g_idEdt_Note, 0xFBFBFB)
			GUICtrlSetColor($g_idChk_DarkMode, 0xFBFBFB)
			GUICtrlSetColor($g_idChk_CustomColors, 0xFBFBFB)
			_WinAPI_RedrawWindow($g_hGUI, 0, 0, $RDW_UPDATENOW)
		Else
			GUISetBkColor(_WinAPI_SwitchColor(_WinAPI_GetSysColor($COLOR_3DFACE)), $g_hGUI)
			GUICtrlSetBkColor($g_idEdt_Note, _WinAPI_SwitchColor(_WinAPI_GetSysColor($COLOR_BTNFACE)))
			GUICtrlSetColor($g_idEdt_Note, _WinAPI_SwitchColor(_WinAPI_GetSysColor($COLOR_WINDOWTEXT)))
			GUICtrlSetColor($g_idChk_DarkMode, _WinAPI_SwitchColor(_WinAPI_GetSysColor($COLOR_WINDOWTEXT)))
			GUICtrlSetColor($g_idChk_CustomColors, _WinAPI_SwitchColor(_WinAPI_GetSysColor($COLOR_WINDOWTEXT)))
			_WinAPI_RedrawWindow($g_hGUI, 0, 0, $RDW_UPDATENOW)
		EndIf
	EndIf
	WinActivate("[CLASS:Progman;]") ; To refresh the frame.
	WinActivate($g_hGUI) ;              Only needed for the constant back and forth in this demo.
EndFunc   ;==>LetsSeeTheDifference

Func _WinAPI_DwmSetWindowAttribute_($hWnd, $iAttribute, $iData)
	Local $aCall = DllCall('dwmapi.dll', 'long', 'DwmSetWindowAttribute', 'hwnd', $hWnd, 'dword', $iAttribute, _
			'dword*', $iData, 'dword', 4)
	If @error Then Return SetError(@error, @extended, 0)
	If $aCall[0] Then Return SetError(10, $aCall[0], 0)
	Return 1
EndFunc   ;==>_WinAPI_DwmSetWindowAttribute_
