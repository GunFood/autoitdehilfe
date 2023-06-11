#include <MsgBoxConstants.au3>
#include <WinAPIGdiDC.au3>

Example()

Func Example()
	Local $aDevice, $i = 0, $sText
	While 1
		$aDevice = _WinAPI_EnumDisplayDevices("", $i)
		If Not $aDevice[0] Then ExitLoop
		$sText = "Erfolgreich? " & $aDevice[0] & @CRLF
		$sText &= "Gerät (Adapter oder Monitor): " & $aDevice[1] & @CRLF
		$sText &= "Beschreibung (Adapter oder Monitor): " & $aDevice[2] & @CRLF
		$sText &= "Gerätestatus-Flag: " & $aDevice[3] & @CRLF
		If BitAND($aDevice[3], 32) Then $sText &= @TAB & "- Das Gerät hat mehr Bildschirm-Modi, als das an seinem Ausgang angeschlossene Gerät unterstützt." & @CRLF
		If BitAND($aDevice[3], 16) Then $sText &= @TAB & "- Das Gerät ist austauschbar; Es kann nicht das primäre Anzeigegerät sein!" & @CRLF
		If BitAND($aDevice[3], 8) Then $sText &= @TAB & "- Das Gerät ist VGA-kompatibel." & @CRLF
		If BitAND($aDevice[3], 4) Then $sText &= @TAB & "- Stellt ein Pseudo-Gerät dar, um Anwendungsausgaben für Fernsteuerzwecke zu spiegeln." & @CRLF
		If BitAND($aDevice[3], 2) Then $sText &= @TAB & "- Der primäre Desktop befindet sich auf diesem Gerät." & @CRLF
		If BitAND($aDevice[3], 1) Then $sText &= @TAB & "- Das Gerät ist Teil des Desktops." & @CRLF
		$sText &= "Plug&Play ID (String): " & $aDevice[4] & @CRLF
		MsgBox($MB_SYSTEMMODAL, "", $sText)
		$i += 1
	WEnd
EndFunc   ;==>Example
