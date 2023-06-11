; wie man eine Objektreferenz über den Dateinamen erhält
; Eine Excel Datei mit dem Namen Worksheet.xls muss im Skripverzeichnis vorhanden sein, damit das Beispiel funktioniert.

#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFileName = @ScriptDir & "\Worksheet.xls"

	If Not FileExists($sFileName) Then
		MsgBox($MB_SYSTEMMODAL, "", "Excel Datei Test" & @CRLF & "Test kann nicht ausgeführt werden, weil diese Exeldatei nicht existiert: " & $sFileName)
		Return False
	EndIf

	Local $oExcelDoc = ObjGet($sFileName) ; Die Excelobjektreferenz mit dem Dateinamen erzeugen

	If IsObj($oExcelDoc) Then

		; Tipp: Folgende Zeilen entkommentieren um Excel sichtbar zu machen (credit: DaleHohm)
		; $oExcelDoc.Windows(1).Visible = 1	 ; Das erste Arbeitsblatt in der Arbeitsmappe sichtbar machen
		; $oExcelDoc.Application.Visible = 1 ; Die Anwendung anzeigen (ohne dies wird Excel beendet)

		Local $sString = "" ; String für Anzeigezwecke

		For $oProperty In $oExcelDoc.BuiltinDocumentProperties
			$sString &= $oProperty.Name & ":" & $oProperty.Value & @CRLF
		Next

		MsgBox($MB_SYSTEMMODAL, "", "Excel Datei Test" & @CRLF & "Die Dokumenteneigenschaften von " & $sFileName & " sind:" & @CRLF & @CRLF & $sString)

		$oExcelDoc.Close ; Exceldokument schließen

	Else
		MsgBox($MB_SYSTEMMODAL, "", "Excel Datei Test" & @CRLF & "Fehler: Die Datei " & $sFileName & " konnte nicht als Excelobjekt geöffnet werden.")
	EndIf
EndFunc   ;==>Example
