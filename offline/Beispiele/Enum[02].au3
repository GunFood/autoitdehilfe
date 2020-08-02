#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt Variablen im lokalen Bereich und führt eine Aufzählung durch die Variablen. Standardmäßig wird bei 0 begonnen.
	Local Enum $eCat, $eDog, $eMouse, $eHamster ; $eHamster ist gleich dem Wert 3, nicht 4.

	; Erstellt ein Array im lokalen Bereich mit 4 Elementen.
	Local $aAnimalNames[4]

	; Weist jedem Array-Element den Namen des jeweiligen Tieres zu. Zum Beispiel heißt die Katze Jasper.
	$aAnimalNames[$eCat] = 'Jasper' ; $eCat ist gleich dem Wert 0, ähnlich wie bei der Verwendung von $aAnimalNames[0]
	$aAnimalNames[$eDog] = 'Beethoven' ; $eDog ist gleich dem Wert 1, ähnlich wie bei der Verwendung von $aAnimalNames[1]
	$aAnimalNames[$eMouse] = 'Pinky' ; $eMouse ist gleich dem Wert 2, ähnlich wie bei der Verwendung von $aAnimalNames[2]
	$aAnimalNames[$eHamster] = 'Fidget' ; $eHamster ist gleich dem Wert 3, ähnlich wie bei der Verwendung von $aAnimalNames[3]

	; Zeigt die Werte des Arrays an.
	MsgBox($MB_SYSTEMMODAL, '', '$aAnimalNames[$eCat] = ' & $aAnimalNames[$eCat] & @CRLF & _
			'$aAnimalNames[$eDog] = ' & $aAnimalNames[$eDog] & @CRLF & _
			'$aAnimalNames[$eMouse] = ' & $aAnimalNames[$eMouse] & @CRLF & _
			'$aAnimalNames[$eHamster] = ' & $aAnimalNames[$eHamster] & @CRLF)

	; Manchmal ist die Verwendung dieses Ansatzes für den Zugriff auf ein Element praktischer als die Verwendung eines nummerischen Werts,
	; da die Änderung des Indexwerts der Enum-Konstante keinen Einfluss auf die Position im Array hat. Daher ist das Ändern der Position
	; von $eCat im Array so einfach wie das Ändern der Reihenfolge, die in der ursprünglichen Deklaration angezeigt wird, z.B.

	; Local Enum $eDog, $eMouse, $eCat, $eHamster

	; Jetzt ist $eCat das 3. Element im Array. Wenn Sie nummerische Werte verwenden würden, müssten Sie alle Referenzen von $aAnimalNames[0]
	; in $aAnimalNames[2] sowie für die anderen Elemente, die jetzt verschoben wurden, manuell ändern.
EndFunc   ;==>Example
