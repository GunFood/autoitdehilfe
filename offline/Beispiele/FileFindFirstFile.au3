#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist einer lokalen Variable ein Suchhandle für alle Dateien im aktuellen Verzeichnis zu.
	Local $hSearch = FileFindFirstFile("*.*")

	; Prüft, ob die Suche erfolgreich war. Falls nicht wird eine Nachricht dargestellt und False zurückgegeben.
	If $hSearch = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Fehler: Es passt keine Dateien bzw. Ordner zu dem Suchmuster.")
		Return False
	EndIf

	; Weist einer lokalen Variable einen leeren String zu, die die Namen der gefundenen Dateien aufnimmt.
	Local $sFileName = "", $iResult = 0

	While 1
		$sFileName = FileFindNextFile($hSearch)
		; Falls es keine passenden Dateien mehr gibt.
		If @error Then ExitLoop

		; Zeigt den Dateinamen.
		$iResult = MsgBox(BitOR($MB_SYSTEMMODAL, $MB_OKCANCEL), "", "Datei: " & $sFileName)
		If $iResult <> $IDOK Then ExitLoop ; Falls der Benutzer den Abbrechen oder Schließen Button anklickt.
	WEnd

	; Schließt das Suchhandle.
	FileClose($hSearch)
EndFunc   ;==>Example
