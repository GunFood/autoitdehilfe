#include <IE.au3>
#include <MsgBoxConstants.au3>

;Versucht einen bereits existierenden Browser anzusprechen, der eine spezielle Webseiten-URL anzeigt.
; Erstellt einen neuen Browser und navigiert zu dieser Seite, falls sie noch nicht existiert.

$oIE = _IECreate("www.autoit.de", 1)
; Der Wiedergabewert @extended muss überprüft werden, um zu checken, ob das Verbinden erfolgreich war.
If @extended Then
	MsgBox($MB_SYSTEMMODAL, "", "An existierenden Browser angehängt")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Neuen Browser erzeugt")
EndIf

