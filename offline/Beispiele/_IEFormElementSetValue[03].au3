#include <IE.au3>

; Setzt den Wert eines Elements vom Typ INPUT TYPE=FILE durch die Verwendung von Send()

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oInputFile = _IEFormElementGetObjByName($oForm, "textExample")

; Setzt den Eingabefokus auf das Feld und sendet dann den Textstring
_IEAction($oInputFile, "focus")

; Markiert den bereits enthaltenen Inhalt, so dass dieser überschrieben wird.
_IEAction($oInputFile, "selectall")

Send("Es funktioniert")
