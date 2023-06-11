#include <APIFilesConstants.au3>
#include <Misc.au3>
#include <WinAPIError.au3>
#include <WinAPIFiles.au3>

Opt('TrayAutoPause', 0)

Local $hProgressProc = DllCallbackRegister('_ProgressProc', 'bool', 'uint64;uint64;uint64;uint64;dword;dword;handle;handle;ptr')

FileDelete(@TempDir & '\Test*.tmp')

ProgressOn('_WinAPI_MoveFileEx()', 'Erstellung einer großen Datei...', '')
Local $sFile = @TempDir & '\Test.tmp'
Local $hFile = FileOpen($sFile, 2)
For $i = 1 To 1000000
	FileWriteLine($hFile, "                                                     ")
Next
FileClose($hFile)

ProgressOn('_WinAPI_MoveFileEx()', 'Verschieben...', '0%')
Sleep(500) ; Um anzuzeigen, dass sich die Änderung auf demselben Gerät befindet, ist die Datei einfach umzubenennen

If Not _WinAPI_MoveFileEx($sFile, @TempDir & '\Test1.tmp', $MOVE_FILE_COPY_ALLOWED, DllCallbackGetPtr($hProgressProc)) Then
	_WinAPI_ShowLastError('Fehler beim verschieben ' & $sFile)
EndIf

DllCallbackFree($hProgressProc)

ProgressOff()

FileDelete(@TempDir & '\Test*.tmp')

Func _ProgressProc($iTotalFileSize, $iTotalBytesTransferred, $iStreamSize, $iStreamBytesTransferred, $iStreamNumber, $iCallbackReason, $hSourceFile, $hDestinationFile, $pData)
	#forceref $iStreamSize, $iStreamBytesTransferred, $iStreamNumber, $iCallbackReason, $hSourceFile, $hDestinationFile, $pData

	Local $iPercent = Round($iTotalBytesTransferred / $iTotalFileSize * 100)
	If $iPercent = 100 Then
		ProgressSet($iPercent, $iPercent & "%", 'Fertig')
		Sleep(2000)
	Else
		ProgressSet($iPercent, $iPercent & "%")
	EndIf
	Sleep(100)

	If _IsPressed('1B') Then
		Return $PROGRESS_CANCEL
	Else
		Return $PROGRESS_CONTINUE
	EndIf
EndFunc   ;==>_ProgressProc
