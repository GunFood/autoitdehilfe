#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Liest die Datei ohne dass die Datei in einen Ordner heruntergeladen wird. Die Option 'Holt die Datei aus dem lokalen Cache wenn verfügbar' wurde ausgewählt.
	Local $bData = InetRead("http://www.autoitscript.com/autoit3/files/beta/update.dat")

	; Die gelesenen Bytes werden durch das @extended Makro zurückgegeben.
	Local $iBytesRead = @extended

	; Konvertiert den ANSI kompatiblen Binärstring zurück in einen String.
	Local $sData = BinaryToString($bData)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", "Die gelesenen Bytes: " & $iBytesRead & @CRLF & @CRLF & $sData)
EndFunc   ;==>Example
