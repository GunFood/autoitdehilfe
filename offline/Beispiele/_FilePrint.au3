#include <File.au3>
#include <MsgBoxConstants.au3>

Local $sFilePath = FileOpenDialog("zu druckende Datei ", " ", "Textdokumente (*.txt) ", $FD_FILEMUSTEXIST)
If @error Then Exit

Local $print = _FilePrint($sFilePath)
If $print Then
	MsgBox($MB_SYSTEMMODAL, "Drucken ", "Die Datei wurde gedruckt. ")
Else
	MsgBox($MB_SYSTEMMODAL, "Drucken ", "Fehler:  " & @error & @CRLF & "Die Datei wurde nicht gedruckt. ")
EndIf
