#include <IE.au3>

; Erweitertes Beispiel
; Fuegt eine Uhr und einen Herkunft-String im Kopfbereich ein. Diese bleiben auch beim Weiterbrowsen auf jeder Folgeseite erhalten.
; Benutzt _IEDocInsertText, _IEDocInsertHTML und
; _IEPropertySet Funktionen "innerhtml" und "referrer"

Global $g_oIE = _IECreate("http://www.autoitscript.com")

AdlibRegister("UpdateClock", 1000) ; Uhren-Update einmal pro Sekunde

While 1
	Sleep(10000)
WEnd

Exit

Func UpdateClock()
	; wartet bis das Browser-Fenster existiert
	If Not WinExists(_IEPropertyGet($g_oIE, "hwnd")) Then Exit

	Local $sCurTime = "<font color=red><b>Aktuelle Zeit ist: </b>" & @HOUR & ":" & @MIN & ":" & @SEC & "</font>"
	; _IEGetObjById soll nach der Navigation einen "NoMatch"-Fehler zurückgeben
	;   (bevor DIV eingefügt wird), deshalb wird die Benachrichtigung vorübergehen abgeschaltet
	_IEErrorNotify(False)
	Local $oAutoItClock = _IEGetObjById($g_oIE, "AutoItClock")
	If Not IsObj($oAutoItClock) Then ; Fügt DIV-Element ein, falls es nicht gefunden wurde
		;
		; Holt Referenz zu BODY, fügt DIV ein, holt Referenz zu DIV, aktualisiert die Zeit
		Local $oBody = _IETagNameGetCollection($g_oIE, "body", 0)
		_IEDocInsertHTML($oBody, "<div id='AutoItClock'></div>", "afterbegin")
		$oAutoItClock = _IEGetObjById($g_oIE, "AutoItClock")
		_IEPropertySet($oAutoItClock, "innerhtml", $sCurTime)
		;
		; Überprüft den Herkunft-String. Ist dieser nicht leer, fügt er ihn nach der Uhr ein
		_IELoadWait($g_oIE)
		Local $sReferrer = _IEPropertyGet($g_oIE, "referrer")
		If $sReferrer Then _IEDocInsertText($oAutoItClock, _
				"  Referred by: <font color=red>" & $sReferrer & "</font>", "afterend")
	Else
		_IEPropertySet($oAutoItClock, "innerhtml", $sCurTime) ; Aktualisiert die Zeit
	EndIf
	_IEErrorNotify(True)
EndFunc   ;==>UpdateClock
