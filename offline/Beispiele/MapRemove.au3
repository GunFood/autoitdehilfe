#include <MsgBoxConstants.au3>

Beispiel()

Func Beispiel()
	; Deklariert eine Map und belegt sie mit verschiedenen Schlüssel-Wert-Paaren.
	Local $mMap[]
	$mMap["Jasper"] = "Jasper Wert"
	$mMap["Beethoven"] = "Beethoven Wert"
	$mMap["Pinky"] = "Pinky Wert"

	; Schlüssel lesen
	Local $aKeys = MapKeys($mMap)
	Local $sData = ""
	; Werte lesen
	For $i = 0 To UBound($aKeys) - 1
		$sData &= $aKeys[$i] & ": " & $mMap[$aKeys[$i]] & @CRLF
	Next
	; Ergebnis anzeigen
	MsgBox($MB_SYSTEMMODAL, "", $sData & @CRLF & _
			'Beethoven existiert: ' & MapExists($mMap, "Beethoven") & @CRLF & 'Beethoven ist gleich Null: ' & ($mMap["Beethoven"] == Null))

	; Setzt einen Schlüssel zurück, indem er auf Null gesetzt wird. Der Schlüssel ist weiterhin in der Map vorhanden.
	$mMap["Beethoven"] = Null

	; Schlüssel und Werte neu einlesen
	$aKeys = MapKeys($mMap)
	$sData = ""
	For $i = 0 To UBound($aKeys) - 1
		$sData &= $aKeys[$i] & ": " & $mMap[$aKeys[$i]] & @CRLF
	Next
	; Anzeigen der Werte der Map-Schlüssel. Beachten Sie, dass der Schlüssel "Beethoven" jetzt einen leeren Wert (Null) enthält.
	MsgBox($MB_SYSTEMMODAL, "", $sData & @CRLF & _
			'Beethoven existiert: ' & MapExists($mMap, "Beethoven") & @CRLF & 'Beethoven ist gleich Null: ' & ($mMap["Beethoven"] == Null))

	; Entfernt den Schlüssel "Beethoven" vollständig.
	MapRemove($mMap, "Beethoven")

	; Schlüssel und Werte neu einlesen
	$aKeys = MapKeys($mMap)
	$sData = ""
	For $i = 0 To UBound($aKeys) - 1
		$sData &= $aKeys[$i] & ": " & $mMap[$aKeys[$i]] & @CRLF
	Next
	; Anzeigen der Werte der Map-Schlüssel. Beachten Sie, dass der Schlüssel "Beethoven" nicht mehr vorhanden ist.
	MsgBox($MB_SYSTEMMODAL, "", $sData & @CRLF & _
			'Beethoven existiert: ' & MapExists($mMap, "Beethoven") & @CRLF & 'Beethoven ist gleich Null: ' & ($mMap["Beethoven"] == Null))

EndFunc   ;==>Beispiel
