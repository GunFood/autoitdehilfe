#include <GUIConstantsEx.au3>
#include <WinAPISys.au3>
#include <WinAPIvkeysConstants.au3>
#include <WindowsNotifsConstants.au3>

#cs
	https://www.autoitscript.com/forum/topic/153782-help-filedocumentation-issues-discussion-only/?do=findComment&comment=1508831
#ce

Global $g_iVK1 = $VK_Q
Global $g_iVK2 = $VK_W
Global $g_iVK3 = $VK_E
Global $g_sBeep = "Beep"
Local $sHelp = "Hold a combination of Q+W+E" & @CRLF & _
		"to activate different actions (Beeps on a diatonic scale, in this case)"
Local $sKL = _WinAPI_GetKeyboardLayoutLocale()
If $sKL = "French" Then
	$g_iVK1 = $VK_A
	$g_iVK2 = $VK_Z
	$g_iVK3 = $VK_E
	$sHelp = "Presser une  combinaison de A+Z+E" & @CRLF & _
			"pour activer differentes actions (Bips sur une échelle diatonique, dans ce cas)"
	$g_sBeep = "Bip"
EndIf

Global $g_hWndKeybd = GUICreate('_WinAPI_GetKeyboardState v(' & @AutoItVersion & ')')
GUICtrlCreateLabel($sHelp, 40, 10)
Global $g_idEdit = GUICtrlCreateEdit("", 4, 48, 390, 345)

Local $tRID = DllStructCreate($tagRAWINPUTDEVICE)
DllStructSetData($tRID, 'UsagePage', 0x01) ; Generic Desktop Controls
DllStructSetData($tRID, 'Usage', 0x06) ; Keyboard
DllStructSetData($tRID, 'Flags', $RIDEV_INPUTSINK)
DllStructSetData($tRID, 'hTarget', $g_hWndKeybd)
_WinAPI_RegisterRawInputDevices($tRID)
GUIRegisterMsg($WM_INPUT, WM_INPUT)

GUISetState(@SW_SHOW)

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE

Func WM_INPUT($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg, $wParam
	Switch $hWnd
		Case $g_hWndKeybd
			Local $tRIK = DllStructCreate($tagRAWINPUTKEYBOARD)
			If _WinAPI_GetRawInputData($lParam, $tRIK, DllStructGetSize($tRIK), $RID_INPUT) Then KeystrokeLogic($tRIK)
	EndSwitch
	If $wParam Then Return 0 ; Jpm: not sure when it will occur
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_INPUT

Func KeystrokeLogic($tRIK)
	Local Static $iIgnoreRelease = 0
	If BitAND(1, DllStructGetData($tRIK, 'Flags')) Then ; on release
		Local $tKeys = _WinAPI_GetKeyboardState()
		Local $iChord = (BitAND(128, DllStructGetData($tKeys, 1, 1 + $g_iVK1)) ? 1 : 0) _
				 + (BitAND(128, DllStructGetData($tKeys, 1, 1 + $g_iVK2)) ? 2 : 0) _
				 + (BitAND(128, DllStructGetData($tKeys, 1, 1 + $g_iVK3)) ? 4 : 0)  ; add one due to DllStructGetData being 1-based while the byte array is 0-based
		Switch $iChord
			Case 1
				If Not $iIgnoreRelease Then
					_Beep("Q", 384)
				Else
					$iIgnoreRelease -= 1
				EndIf
			Case 2
				If Not $iIgnoreRelease Then
					_Beep("W", 432)
				Else
					$iIgnoreRelease -= 1
				EndIf
			Case 3
				If Not $iIgnoreRelease Then _Beep("Q+W", 480)
				$iIgnoreRelease = 1
			Case 4
				If Not $iIgnoreRelease Then
					_Beep("E", 512)
				Else
					$iIgnoreRelease -= 1
				EndIf
			Case 5
				If Not $iIgnoreRelease Then _Beep("Q+E", 576)
				$iIgnoreRelease = 1
			Case 6
				If Not $iIgnoreRelease Then _Beep("W+E", 640)
				$iIgnoreRelease = 1
			Case 7
				_Beep("Q+W+E", 720)
				$iIgnoreRelease = 2
		EndSwitch
	EndIf
EndFunc   ;==>KeystrokeLogic

Func _Beep($sKeys, $iFrequency)
	#forceref $sKeys ; Not use : english keyboard keys
	GUICtrlSetData($g_idEdit, @TAB & $g_sBeep & " (" & $iFrequency & " Hz)" & @CRLF, 1)
	Beep($iFrequency, 200)
EndFunc   ;==>_Beep
