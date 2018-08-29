#include-once
#include <MsgBoxConstants.au3>

; Es ist #include-once zu verwenden wenn UDFs erstellt werden. Dies verhindert, dass die Datei mehrfach einbezogen wird falls die UDF in mehreren Dateien enthalten ist.

; Es ist dieses Dateien in IncludeFunc.au3 umzubenennen und im Ordner des Hauptskripts abzuspeichern.
; Dann ist #include "IncludeFunc.au3" am Anfang des Skripts hinzuzufügen

Func IncludeFunc()
	MsgBox($MB_SYSTEMMODAL, "", "Dies ist ein Beipsiel zum includen einer Datei.")
EndFunc   ;==>IncludeFunc
