#include <IE.au3>
#include <MsgBoxConstants.au3>

; Setzt den Wert eines Elements vom Typ INPUT TYPE=FILE bei einem unsichtbarem Fenster durch die Verwendung von ControlSend()

Local $oIE = _IE_Example("form")

; Versteckt das Browser-Fenster, um das Senden von Text zu einem versteckten Fenster zu demonstrieren
_IEAction($oIE, "invisible")

Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oInputFile = _IEFormElementGetObjByName($oForm, "textExample")

; Setzt den Fokus auf das Input-Control und sendet dann den Textstring
_IEAction($oInputFile, "focus")

; Markiert den bereits enthaltenen Inhalt, so dass dieser überschrieben wird.
_IEAction($oInputFile, "selectall")

; Ermittelt ein Handle zu dem IE-Fenster
Local $hIE = _IEPropertyGet($oIE, "hwnd")
ControlSend($hIE, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "Es funktioniert")

_IEAction($oIE, "visible")
MsgBox($MB_SYSTEMMODAL, "Erfolg", "Wert gesetzt auf 'Es funktioniert'")
