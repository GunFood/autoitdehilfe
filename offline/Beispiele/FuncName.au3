#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt ein erstklassiges Objekt von MsgBox und weist es einer lokalen Variablen zu.
	Local $hMsgBox = MsgBox

	; Zeigt eine MsgBox mit der zuvor zugewiesenen Variablen an.
	$hMsgBox($MB_SYSTEMMODAL, "", "Dies ist ein Satz mit Leerzeichen.")

	; Zeigt eine MsgBox an, die den Funktionsnamen $hMsgBox anzeigt.
	$hMsgBox($MB_SYSTEMMODAL, "", "Der Funktionsname von $hMsgBox lautet: " & FuncName($hMsgBox))
EndFunc   ;==>Example
