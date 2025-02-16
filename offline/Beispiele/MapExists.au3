#include <MsgBoxConstants.au3>

Beispiel()

Func Beispiel()
	; Deklariert eine Map und belegt sie mit verschiedenen Schlüssel-Wert-Paaren.
	Local $mMap[]
	$mMap["Jasper"] = "Jasper Wert"
	$mMap["Beethoven"] = "Beethoven Wert"
	$mMap["Pinky"] = "Pinky Wert"

	; Zeigt an, ob der Schlüssel existiert oder nicht.
	MsgBox($MB_SYSTEMMODAL, "", "Jasper: " & MapExists($mMap, "Jasper")) ; Gibt 1 zurück.
	MsgBox($MB_SYSTEMMODAL, "", "Fidget: " & MapExists($mMap, "Fidget")) ; Gibt 0 zurück.

	; Setzt einen Schlüssel zurück, indem er auf Null gesetzt wird. Der Schlüssel ist weiterhin in der Map vorhanden.
	; Es ist MapRemove zu verwenden, um den Schlüssel vollständig zu entfernen.
	$mMap["Jasper"] = Null

	MsgBox($MB_SYSTEMMODAL, "", "Jasper: " & MapExists($mMap, "Jasper")) ; Gibt 1 zurück.
EndFunc   ;==>Beispiel
