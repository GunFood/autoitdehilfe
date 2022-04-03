#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Öffnet den Papierkorb durch die Verwendung folgender CLSID.
	ShellExecute("::{645FF040-5081-101B-9F08-00AA002F954E}")

	; Zeigt ein Nachrichtenfenster mit der Frage, ob der Papierkorb geleert werden soll.
	If MsgBox(($MB_YESNO + $MB_SYSTEMMODAL), "", "Soll der Papierkorb in Laufwerk " & @HomeDrive & "\ geleert werden?") = $IDNO Then Return False

	; Leert den Papierkorb. Dies ist nur für den Ordner @HomeDrive. Dies ist standardmäßig Laufwerk C:\.
	Local $iRecycle = FileRecycleEmpty(@HomeDrive)

	; Zeigt eine Nachricht, ob der Papierkorb erfolgreich geleert wurde.
	If $iRecycle Then
		MsgBox($MB_SYSTEMMODAL, "", "Der Papierkorb wurde erfolgreich geleert.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Der Papierkorb konnte nicht geleert werden.")
	EndIf
EndFunc   ;==>Example
