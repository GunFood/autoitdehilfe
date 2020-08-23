#include <Excel.au3>
#include <MsgBoxConstants.au3>

; Erstellen des Anwendungsobjektes und Öffnen eines Beispiel Workbooks
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel", "Fehler beim Erstellen des Excel Objektes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
; Erstellen eines neuen Workbook
Local $oWorkbook = _Excel_BookNew($oExcel)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel", "Fehler beim Erstellen des Workbook." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_Close($oExcel)
	Exit
EndIf

; Einfügen des Bildes in einen Bereich von Zellen und Ändern seiner Größe. Seitenverhältnis beibehalten
Local $sPicture = @ScriptDir & "\Extras\_Excel.jpg"
_Excel_PictureAdd($oWorkbook, Default, $sPicture, "B2:D8")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 1", "Fehler beim Einfügen des Bildes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 1", "Bild eingefügt/größenverändert an 'B2:D8', Seitenverhältnis beibehalten.")

; Einfügen des Bildes ohne Größenänderung.
_Excel_PictureAdd($oWorkbook, Default, $sPicture, "F8")
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 2", "Fehler beim Einfügen des Bildes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 2", "Bild eingefügt an 'F8' ohne Größenänderung.")

; Einfügen des Bildes mit einer definierten Größe/Höhe.
_Excel_PictureAdd($oWorkbook, Default, $sPicture, "A8", Default, 300, 250)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 3", "Fehler beim Einfügen des Bildes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 3", "Bild eingefügt an 'A8' mit definierter Größe/Höhe, Seitenverhältnis ignoriert")

; Einfügen des Bildes mit einer definierten Größe/Höhe.
_Excel_PictureAdd($oWorkbook, Default, $sPicture, 250, 300, 300, 250)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 4", "Fehler beim Einfügen des Bildes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 4", "Bild an Position 250/300' mit definierter Größe/Höhe eingefügt, Seitenverhältnis ignoriert")

; Einfügen des Bildes mit einer definierten Größe/Höhe.
_Excel_PictureAdd($oWorkbook, Default, $sPicture, "F2:H9", Default, Default, Default, False)
If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 5", "Fehler beim Einfügen des Bildes." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_PictureAdd Beispiel 5", "Bild an 'F2:H9' eingefügt/angepasst, Seitenverhältnis ignoriert.")
