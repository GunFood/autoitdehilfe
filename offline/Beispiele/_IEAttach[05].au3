#include <IE.au3>
#include <MsgBoxConstants.au3>

;Füllt ein Array mit den Objektreferenzen aller erzeugten IE-Browser-Instanzen.
;Das Erste Array-Element enthält die Anzahl der gefundenen Instanzen.

Local $aIE[1]
$aIE[0] = 0

Local $i = 1, $oIE
While 1
	$oIE = _IEAttach("", "instance", $i)
	If @error = $_IEStatus_NoMatch Then ExitLoop
	ReDim $aIE[$i + 1]
	$aIE[$i] = $oIE
	$aIE[0] = $i
	$i += 1
WEnd

MsgBox($MB_SYSTEMMODAL, "Gefundene Browser:", "Anzahl der IE-Browser-Instanzen im Array: " & $aIE[0])
