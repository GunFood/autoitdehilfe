#pragma compile(AutoItExecuteAllowed, True)

#include <MsgBoxConstants.au3>
#include <WinAPISys.au3>

; create a script which use CPU
Local $sTestAu3 = @TempDir & "\TestSystemIdle.au3"
FileDelete($sTestAu3)
FileWriteLine($sTestAu3, 'For $i = 1 To 20000000')
FileWriteLine($sTestAu3, '$i = $i')
FileWriteLine($sTestAu3, 'Next')

Local $fFrequency = 1.0 / _WinAPI_QueryPerformanceFrequency() * 4 ; 4 is the number of CPU and the run script only execute on 1

Local $iPid
If @Compiled Then
	$iPid = Run(@AutoItExe & ' /AutoIt3ExecuteScript "' & $sTestAu3 & '"')
Else
	$iPid = Run(@AutoItExe & " " & $sTestAu3)
EndIf

Sleep(2000)
Local $nTickCount = Round(_WinAPI_QueryProcessCycleTime($iPid) * $fFrequency, 2)

ProcessClose($iPid)
FileDelete($sTestAu3)

MsgBox($MB_TOPMOST, 'Test TickCount', $nTickCount & " msec") ; not equal to 2000 as the run script does not get CPU allocation all the time
