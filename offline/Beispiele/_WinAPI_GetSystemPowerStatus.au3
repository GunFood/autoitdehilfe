#include <GUIConstantsEx.au3>
#include <WinAPISys.au3>
#include <WindowsStylesConstants.au3>

GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), 180, 185, -1, -1, -1, $WS_EX_TOPMOST)

GUICtrlCreateLabel('AC power:', 10, 14, 100, 14)
GUICtrlCreateLabel('Status:', 10, 34, 100, 14)
GUICtrlCreateLabel('Charge:', 10, 54, 100, 14)
GUICtrlCreateLabel('Time remaining:', 10, 74, 100, 14)
GUICtrlCreateLabel('Full Time remaining:', 10, 94, 100, 14)
GUICtrlCreateLabel('Battery saver:', 10, 114, 100, 14)

Global $g_aidLabel[6]
For $i = 0 To 5
	$g_aidLabel[$i] = GUICtrlCreateLabel('Unknown', 110, 14 + 20 * $i, 60, 14)
Next

Local $idButton = GUICtrlCreateButton('OK', 55, 141, 70, 23)

GUISetState(@SW_SHOW)

AdlibRegister('_BatteryStatus', 1000)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE, $idButton
			ExitLoop
	EndSwitch
WEnd

Func _BatteryStatus()
	Local $aData = _WinAPI_GetSystemPowerStatus()
	If @error Then Return

	If BitAND($aData[1], 128) Then
		$aData[0] = 'Not present'
		For $i = 1 To 3
			$aData[$i] = 'Unknown'
		Next
	Else
		Local $H, $M
		Switch $aData[0]
			Case 0
				$aData[0] = 'Offline'
			Case 1
				$aData[0] = 'Online'
			Case Else
				$aData[0] = 'Unknown'
		EndSwitch
		Switch $aData[2]
			Case 0 To 100
				$aData[2] &= '%'
			Case Else
				$aData[2] = 'Unknown'
		EndSwitch
		Switch $aData[3]
			Case -1
				$aData[3] = 'Unknown'
			Case Else
				$H = ($aData[3] - Mod($aData[3], 3600)) / 3600
				$M = ($aData[3] - Mod($aData[3], 60)) / 60 - $H * 60
				$aData[3] = StringFormat('%02d:%02d', $H, $M)
		EndSwitch
		Switch $aData[4]
			Case -1
				$aData[4] = 'Unknown'
			Case Else
				$H = ($aData[4] - Mod($aData[4], 3600)) / 3600
				$M = ($aData[4] - Mod($aData[4], 60)) / 60 - $H * 60
				$aData[4] = StringFormat('%02d:%02d', $H, $M)
		EndSwitch
		If BitAND($aData[1], 8) Then
			$aData[1] = 'Charging'
		Else
			Switch BitAND($aData[1], 0xF)
				Case 1
					$aData[1] = 'High'
				Case 2
					$aData[1] = 'Low'
				Case 4
					$aData[1] = 'Critical'
				Case Else
					$aData[1] = 'Unknown'
			EndSwitch
		EndIf
		Switch $aData[5]
			Case 0
				$aData[5] = 'Off'
			Case 1
				$aData[5] = 'On'
			Case Else
				$aData[5] = 'Unknown'
		EndSwitch
	EndIf
	For $i = 0 To 5
		GUICtrlSetData($g_aidLabel[$i], $aData[$i])
	Next
EndFunc   ;==>_BatteryStatus
