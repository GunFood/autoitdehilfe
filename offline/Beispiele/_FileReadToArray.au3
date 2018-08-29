#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aRetArray, $sFilePath = @TempDir & "\Test.txt"

	; Erstellt ein  1D Array
	Local $aArray[] = ["0", "1", "2", "3", "4"]
	; Schreibt es in die Datei
	_FileWriteFromArray($sFilePath, $aArray, Default, Default, @CRLF)
	Sleep(1000)

	; Erneutes lesen, dismal mit der Anzahl
	_FileReadToArray($sFilePath, $aRetArray)
	_ArrayDisplay($aRetArray, "1D Array - Anzahl", Default, 8)

	; Erneutes lesen, dismal ohne die Anzahl
	_FileReadToArray($sFilePath, $aRetArray, $FRTA_NOCOUNT)
	_ArrayDisplay($aRetArray, "1D Array - keine Anzahl", Default, 8)

	; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	; erstellt ein "quadratisches" 2D Array
	Local $aArray[][] = [ _
			["00", "01", "02", "03"], _
			["10", "11", "12", "13"], _
			["20", "21", "22", "23"], _
			["30", "31", "32", "33"]]
	_ArrayDisplay($aArray, "Original", Default, 8)
	; Schreibt es in die Datei
	_FileWriteFromArray($sFilePath, $aArray, Default, Default, ",")
	Sleep(1000)

	; Erneutes lesen, dismal mit der Anzahl
	_FileReadToArray($sFilePath, $aRetArray, Default, ",")
	_ArrayDisplay($aRetArray, "2D Array - Anzahl", Default, 8)

	; Erneutes lesen, dismal ohne die Anzahl
	_FileReadToArray($sFilePath, $aRetArray, $FRTA_NOCOUNT, ",")
	_ArrayDisplay($aRetArray, "2D Array - keine Anzahl", Default, 8)

	; Lesen in "Array von Arrays" mit der Anzahk
	_FileReadToArray($sFilePath, $aRetArray, $FRTA_COUNT + $FRTA_INTARRAYS, ",")
	_ArrayDisplay($aRetArray, "Array von Arrays - Anzahl", Default, 8)
	; Nun wird in die Arrays innerhalb des zurückgegebenen Arrays geschaut
	_ArrayDisplay($aRetArray[1], "Array 1 innerhalb RetArray - Anzahl", Default, 8)

	; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	; Erneutes schreiben des 2D Arrays mit mehreren Trennzeichen
	_FileWriteFromArray($sFilePath, $aArray, Default, Default, ":|")
	Sleep(1000)

	; Erneutes lesen, diesmal fungiert jedes Trennzeichen als Trennpunkt
	_FileReadToArray($sFilePath, $aRetArray, $FRTA_NOCOUNT, ":|")
	_ArrayDisplay($aRetArray, "Trennen bei jedem Zeichen", Default, 8)

	; Erneutes lesen, diesmal fungiert der komplette String des Trennzeichens als Trennpunkt
	_FileReadToArray($sFilePath, $aRetArray, $FRTA_NOCOUNT + $FRTA_ENTIRESPLIT, ":|")
	_ArrayDisplay($aRetArray, "Trennzeichen beim kompletten Trennzeichen", Default, 8)

	FileDelete($sFilePath)
EndFunc   ;==>Example
