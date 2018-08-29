#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Listet alle Dateien und Ordner des Desktops durch Verwendung der Standardparameter auf
	Local $aFileList = _FileListToArray(@DesktopDir, "*")
	If @error = 1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Pfad ungültig.")
		Exit
	EndIf
	If @error = 4 Then
		MsgBox($MB_SYSTEMMODAL, "", "Keine Dateien gefunden.")
		Exit
	EndIf
	; Zeigt das Ergebnis, zurückgegeben durch _FileListToArray.
	_ArrayDisplay($aFileList, "$aFileList")
EndFunc   ;==>Example
