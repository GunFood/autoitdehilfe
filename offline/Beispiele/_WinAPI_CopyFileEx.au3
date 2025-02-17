#include <APIFilesConstants.au3>
#include <Misc.au3>
#include <WinAPIError.au3>
#include <WinAPIFiles.au3>

Opt('TrayAutoPause', 0)

Local $hProgressProc = DllCallbackRegister('_ProgressProc', 'bool', 'uint64;uint64;uint64;uint64;dword;dword;handle;handle;ptr')

FileDelete(@TempDir & '\Test*.tmp')

ProgressOn('_WinAPI_CopyFileEx()', 'Erstellung einer großen Datei...', '')
Local $sFile = @TempDir & '\Test.tmp'
Local $hFile = FileOpen($sFile, 2)
For $i = 1 To 1000000
	FileWriteLine($hFile, "                                                     ")
Next
FileClose($hFile)

ProgressOn('_WinAPI_CopyFileEx()', 'Kopieren...', '0%')

If Not _WinAPI_CopyFileEx($sFile, @TempDir & '\Test1.tmp', 0, DllCallbackGetPtr($hProgressProc)) Then
	_WinAPI_ShowLastError('Fehler beim kopieren ' & $sFile)
EndIf

DllCallbackFree($hProgressProc)

ProgressOff()

FileDelete(@TempDir & '\Test*.tmp')

Func _ProgressProc($iTotalFileSize, $iTotalBytesTransferred, $iStreamSize, $iStreamBytesTransferred, $iStreamNumber, $iCallbackReason, $hSourceFile, $hDestinationFile, $pData)
	#forceref $iStreamSize, $iStreamBytesTransferred, $iStreamNumber, $iCallbackReason, $hSourceFile, $hDestinationFile, $pData

	Local $iPercent = Round($iTotalBytesTransferred / $iTotalFileSize * 100)
	If $iPercent = 100 Then
		ProgressSet($iPercent, '', 'Fertig')
	Else
		ProgressSet($iPercent, $iPercent & '%')
	EndIf
	Sleep(10) ; Kopierprozess verlangsamen, um die Progressbar zu sehen

	If _IsPressed('1B') Then
		Return $PROGRESS_CANCEL
	Else
		Return $PROGRESS_CONTINUE
	EndIf
EndFunc   ;==>_ProgressProc
