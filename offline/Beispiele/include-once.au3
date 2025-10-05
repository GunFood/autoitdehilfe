; Es ist #include-once zu verwenden wenn UDFs erstellt werden. Dies verhindert, dass die Datei mehrfach einbezogen wird falls die UDF in mehreren Dateien enthalten ist.

#include-once

#include <MsgBoxConstants.au3>

; Es ist #include „Include-once.au3“ am Anfang des Skripts hinzuzufügen.
; Dann kann das Skript IncludeFunc() aufrufen.
; Die Ausführung zeigt eine MsgBox an.

Func IncludeFunc()
	MsgBox($MB_SYSTEMMODAL, "", "Dies ist ein Beipsiel zum includen einer Datei.")
EndFunc   ;==>IncludeFunc
