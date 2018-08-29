#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Definiert eine Variable um diese an _FileReadToArray zu übergeben.
	Local $aArray = 0

	; Liest die aktuelle Skriptdatei in ein Array ein. Dabei wird die zuvor definierte Variable verwendet.
	; $iFlag wird mit 0 festgelegt, so dass die Arrayanzahl nicht angezeigt wird. Es ist UBound() zu verwenden um die Größe des Arrays zu ermitteln.
	If Not _FileReadToArray(@ScriptFullPath, $aArray, 0) Then
		MsgBox($MB_SYSTEMMODAL, "", "Beim lesen der Datei ist ein Fehler aufgetreten. @error: " & @error) ; Beim lesen der aktuellen Skriptdatei ist ein Fehler aufgetreten.
	EndIf

	; Zeigt das Array in _ArrayDisplay.
	_ArrayDisplay($aArray)
EndFunc   ;==>Example
