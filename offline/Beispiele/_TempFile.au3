#include <File.au3>
#include <MsgBoxConstants.au3>

; Ermittelt einen eindeutigen Dateinamen im @TempDir
$sTempFile_1 = _TempFile()

; Ermittelt einen eindeutigen Dateinamen im @HomeDrive Ordner und beginnt mit dem "prefix" genannt prefix_
$sTempFile_2 = _TempFile(@HomeDrive & "\", "prefix_", ".txt", Default) ; Es ist das Schlüsselwort Default als Standardparameter zu verwenden.

MsgBox($MB_SYSTEMMODAL, "", "Geeignete Namen für die neue temporäre Datei: " & @CRLF & @CRLF & _
		"Datei 1: " & $sTempFile_1 & @CRLF & _
		"Datei 2: " & $sTempFile_2)
