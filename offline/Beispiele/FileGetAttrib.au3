#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
	; Erstellt eine Konstante im lokalen Bereich um die Dateigenschaften des aktuellen Skripts zu speichern.
	Local Const $sAttribute = FileGetAttrib(@ScriptFullPath)

	; Zeigt den String der durch FileGetAttrib zurückgegebene wurde.
	MsgBox($MB_SYSTEMMODAL, "", "Die Attribute des Strings: " & @CRLF & $sAttribute)

	; ; Zeigt den String der durch AttributeToString zurückgegebene wurde.
	MsgBox($MB_SYSTEMMODAL, "", "Die Attribute des String mit leichter zu verstehenden Werten: " & @CRLF & _
			AttributeToString($sAttribute))
EndFunc   ;==>Example

Func AttributeToString($sAttribute)
	; Erstellt ein 1D Array, das die Buchstaben der Dateiattribute enthält. Dabei wird der String beim Komma getrennt.
	Local $aInput = StringSplit("R,A,S,H,N,D,O,C,T", ",")

	; Erstellt ein 1D Array, das die Dateiattributsbezeichnungen enthält. Dabei wird der String beim Komma getrennt.
	Local $aOutput = StringSplit("Read-only /, Archive /, System /, Hidden /" & _
			", Normal /, Directory /, Offline /, Compressed /, Temporary /", ",")

	; Ersetzt innerhalb der Schleife die Buchstaben der Dateiattribute durch die Dateiattributsbezeichnungen, z.B. A wird durch Archive oder S durch System ersetzt.
	For $i = 1 To $aInput[0]
		$sAttribute = StringReplace($sAttribute, $aInput[$i], $aOutput[$i], 0, $STR_CASESENSE)
	Next

	; Entfernt das einfache Leerzeichen und den angehängten Slash.
	$sAttribute = StringTrimRight($sAttribute, 2)

	; Gibt die konvertierten Dateiattributsbuchstaben aus.
	Return $sAttribute
EndFunc   ;==>AttributeToString
