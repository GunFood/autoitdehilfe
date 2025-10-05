#pragma compile(AutoItExecuteAllowed, True)

#include <MsgBoxConstants.au3>
#include <WinAPISys.au3>

; create a script which use CPU
Local $sTestAu3 = @TempDir & "\TestSystemIdle.au3"
FileDelete($sTestAu3)
FileWriteLine($sTestAu3, 'For $i = 1 To 20000000')
FileWriteLine($sTestAu3, '$i = $i')
FileWriteLine($sTestAu3, 'Next')

;~ Local $sTestAu3 = @TempDir & "\TestIOIdle.au3"
;~ FileDelete($sTestAu3)
;~ FileWriteLine($sTestAu3, 'For $i = 1 To 100000')
;~ FileWriteLine($sTestAu3, 'FileRead(@ScriptFullPath)')
;~ FileWriteLine($sTestAu3, 'Next')

If @Compiled Then
	Run(@AutoItExe & ' /AutoIt3ExecuteScript "' & $sTestAu3 & '"')
Else
	Run(@AutoItExe & " " & $sTestAu3)
EndIf

Local $fCurSystem, $fSystemPercent = 1.0, $nSystemSleep = 0, $iRefresh = 2000
Local $fCurIO, $fIOPercent = 1.0, $nIOSleep = 0
Local $hTimer = TimerInit()

Do
	$nSystemSleep += 1
	Sleep($iRefresh)
	$fCurSystem = _WinAPI_QueryProcessorUsage(True)
Until $fCurSystem < $fSystemPercent
Do
	;in case the processor is not really idle !!!
	$nIOSleep += 1
	Sleep($iRefresh)
	$fCurIO = _WinAPI_QueryDiskUsage(True)
Until $fCurIO < $fIOPercent

Local $sElapse = Round(TimerDiff($hTimer) / 1000, 2)

FileDelete($sTestAu3)

MsgBox($MB_TOPMOST, 'Test duration', $sElapse & " sec (" & $nSystemSleep & "/" & $nIOSleep & ')')
