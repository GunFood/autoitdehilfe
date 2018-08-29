#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iSize = DirGetSize(@HomeDrive)
	MsgBox($MB_SYSTEMMODAL, "", "Größe (MegaBytes): " & Round($iSize / 1024 / 1024))

	$iSize = DirGetSize(@WindowsDir, $DIR_NORECURSE)
	MsgBox($MB_SYSTEMMODAL, "", "Größe (MegaBytes): " & Round($iSize / 1024 / 1024))

	Local $hTimer = TimerInit()

	Local $aSize = DirGetSize("\\10.0.0.1\h$", $DIR_EXTENDED) ; erweiterter Modus
	If Not @error Then
		Local $iDiff = Round(TimerDiff($hTimer) / 1000) ; Zeit in Sekunden
		MsgBox($MB_SYSTEMMODAL, "", "Größe (Bytes): " & $aSize[0] & @CRLF _
				 & "Dateien: " & $aSize[1] & @CRLF & "Verzeichnisse: " & $aSize[2] & @CRLF _
				 & "TimeDiff (Sek): " & $fDiff)
	EndIf
EndFunc   ;==>Example
