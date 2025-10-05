#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <WinAPIDiag.au3>
#include <WinAPISys.au3>

If Number(_WinAPI_GetVersion()) < 6.0 Then
	MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', 'Erfordert Windows Vista oder höher.')
	Exit
EndIf

Global $g_iCount = 10

Local $hForm = GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), 300, 100)
Local $idLabel = GUICtrlCreateLabel('Die Anwendung wird crashen nach ' & $g_iCount & ' Sekunden.', 10, 43, 280, 14, $SS_CENTER)
GUISetState(@SW_SHOW)

If $CmdLine[0] And ($CmdLine[1] = '/crash') Then
	MsgBox(($MB_ICONWARNING + $MB_SYSTEMMODAL), 'Achtung', 'Die Anwendung wurde neu gestartet nach unnormalem Beenden.', 0, $hForm)
EndIf

If Not @Compiled Then
	_WinAPI_RegisterApplicationRestart(BitOR($RESTART_NO_PATCH, $RESTART_NO_REBOOT), '"' & @ScriptFullPath & '" /crash')
Else
	_WinAPI_RegisterApplicationRestart(BitOR($RESTART_NO_PATCH, $RESTART_NO_REBOOT), '/crash')
EndIf

AdlibRegister('_Countdown', 1000)

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE

Func _Countdown()
	Local $iData
	#forceref $iData

	$g_iCount -= 1
	If $g_iCount Then
		GUICtrlSetData($idLabel, 'Die Anwendung wird crashen nach ' & $g_iCount & ' Sekunden.')
	Else
		Local $tData
		; Forced script crash due to a memory access violation
		$tData = DllStructCreate('int', 0x12345678)
		$iData = DllStructGetData($tData, 1)
	EndIf
EndFunc   ;==>_Countdown
