#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Listet alle Dateien und Ordner im Desktop-Ordner auf. Dabei wird als Parameter Default verwendet und der komplette Pfad zurückgegeben.
	Local $aFileList = _FileListToArray(@DesktopDir, Default, Default, True)
	If @error = 1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Pfad ist ungültig.")
		Exit
	EndIf
	If @error = 4 Then
		MsgBox($MB_SYSTEMMODAL, "", "Keine Dateien gefunden.")
		Exit
	EndIf
	; Zeigt das Ergebnis welches durch _FileListToArray zurückgegeben wurde.
	_ArrayDisplay($aFileList, "$aFileList")
EndFunc   ;==>Example
