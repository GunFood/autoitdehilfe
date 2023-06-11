#include <MsgBoxConstants.au3>

#cs
	Kompiliere dieses Skript zu "ConsoleRead.exe".
	Öffne ein Konsolenfenster und wechsle in das Verzeichnis, in dem ConsoleRead.exe ist.
	Tippe folgendes in die Befehlszeile:
	echo Hallo! | ConsoleRead.exe

	Wenn obige Zeile in einem Konsolenfenster aufgerufen wird, gibt der echo Befehl den Text
	"Hallo!" aus. Anstatt diesen anzuzeigen, bewirkt das "|" in dem Befehl, dass der Text
	An den STDIN Stream des ConsoleRead.exe Prozesses weitergeleitet wird.
#ce

Example()

Func Example()
	If Not @Compiled Then
		MsgBox($MB_SYSTEMMODAL, "", "Dieses Skript muss kompiliert sein, um seine Funktionalität zu demonstrieren.")
		Exit
	EndIf

	Local $sOutput
	While True
		$sOutput &= ConsoleRead()
		If @error Then ExitLoop
		Sleep(25)
	WEnd
	MsgBox($MB_SYSTEMMODAL, "", "Erhalten: " & @CRLF & @CRLF & $sOutput)
EndFunc   ;==>Example
