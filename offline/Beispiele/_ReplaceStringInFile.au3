#include <File.au3>
#include <MsgBoxConstants.au3>

Local $sFind = "VORHER"
Local $sReplace = "NACHHER"

Local $sFileName = "C:\_ReplaceStringInFile.test"

Local $iMsg = "Hallo Test " & $sFind & " Hallo Test" & @CRLF
$iMsg &= "Hallo Test" & @CRLF
$iMsg &= @CRLF
$iMsg &= $sFind

FileWrite($sFileName, $iMsg)

MsgBox($MB_SYSTEMMODAL, "VORHER", $iMsg)

Local $iRetval = _ReplaceStringInFile($sFileName, $sFind, $sReplace)
If $iRetval = -1 Then
	MsgBox($MB_SYSTEMMODAL, "FEHLER", "Das Suchmuster konnte nicht Ersetzt werden!" & @CRLF & " & Datei: " & $sFileName & " Fehlercode: " & @error)
	Exit
Else
	MsgBox($MB_SYSTEMMODAL, "INFO", $iRetval & " Übereinstimmungen mit dem Suchmuster: " & $sFind & " in der Datei: " & $sFileName & " gefunden.")
EndIf

$iMsg = FileRead($sFileName, 1000)
MsgBox($MB_SYSTEMMODAL, "NACHHER", $iMsg)
FileDelete($sFileName)
