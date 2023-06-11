#include <MsgBoxConstants.au3>

_Example()

Func _Example()

	; Fehlerabfrage. Alle COM Errors werden aufgehalten solange sie existieren.
	; Da dieses Object als Lokal deklariert wird, ist es nicht mehr vorhanden nachdem die Funktion ausgeführt wurde (Return).
	Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")

	; Erstellt ein Internet Explorer Object
	Local $oIE = ObjCreate("InternetExplorer.Application")
	; Überprüft auf Fehler
	If @error Then Return

	$oIE.Visible = True ; Setzt die Sichtbarkeit auf 'True'

	; Eigenes Abfluss Object (empfängt Events)
	Local $oIEEvents = ObjEvent($oIE, "_IEEvent_", "DWebBrowserEvents2")

	; Ruft eine Adresse ab
	$oIE.navigate("http://www.google.de/")
	; Auf Fehler überprüfen während die Seite geladen wird
	If @error Then
		$oIE.Quit()
		Return
	EndIf

	; Warten bis die Seite fertig geladen wurde
	While 1
		If $oIE.readyState = "complete" Or $oIE.readyState = 4 Then ExitLoop
		Sleep(10)
	WEnd

	; Verursacht absichtlich einen Fehler durch Aufruf einer nicht existierenden Methode
	$oIE.PlayMeARockAndRollSong()
	; Auf Fehler überprüfen
	If @error Then MsgBox(48 + 262144, "COM Error", "@error wurde auf die COM Error Nummer gesetzt." & @CRLF & "@error = 0x" & Hex(@error))

	; Wartet für ein paar Sekunden um eventuelle Events abzufangen
	Sleep(3000)

	; Nichts mehr zu tun. Schließt den IE und kehrt von der Funktion zurück
	$oIE.Quit()

	#forceref $oErrorHandler, $oIEEvents
EndFunc   ;==>_Example


; BeforeNavigate2 Methoden-definition
Func _IEEvent_BeforeNavigate2($oIEpDisp, $sIEURL, $sIEFlags, $sIETargetFrameName, $sIEPostData, $iIEHeaders, $bIECancel)
	ConsoleWrite("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--BeforeNavigate2 wurde aufgerufen--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! " & @CRLF & _
			"$oIEpDisp = " & $oIEpDisp() & "  -  " & ObjName($oIEpDisp) & @CRLF & _ ; z.B. Standard Eigenschaft und Name des Objekts
			"$sIEURL = " & $sIEURL & @CRLF & _
			"$sIEFlags = " & $sIEFlags & @CRLF & _
			"$sIETargetFrameName = " & $sIETargetFrameName & @CRLF & _
			"$sIEPostData = " & $sIEPostData & @CRLF & _
			"$iIEHeaders = " & $iIEHeaders & @CRLF & _
			"$bIECancel = " & $bIECancel & @CRLF & _
			"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! " & @CRLF & @CRLF)
EndFunc   ;==>_IEEvent_BeforeNavigate2

; COM Error Funktion des Benutzers. Wird bei jedem COM Error aufgerufen
Func _ErrFunc($oError)
	; Macht irgendwas hier.
	ConsoleWrite(@ScriptName & " (" & $oError.scriptline & ") : ==> COM Error intercepted !" & @CRLF & _
			@TAB & "err.number is: " & @TAB & @TAB & "0x" & Hex($oError.number) & @CRLF & _
			@TAB & "err.windescription:" & @TAB & $oError.windescription & @CRLF & _
			@TAB & "err.description is: " & @TAB & $oError.description & @CRLF & _
			@TAB & "err.source is: " & @TAB & @TAB & $oError.source & @CRLF & _
			@TAB & "err.helpfile is: " & @TAB & $oError.helpfile & @CRLF & _
			@TAB & "err.helpcontext is: " & @TAB & $oError.helpcontext & @CRLF & _
			@TAB & "err.lastdllerror is: " & @TAB & $oError.lastdllerror & @CRLF & _
			@TAB & "err.scriptline is: " & @TAB & $oError.scriptline & @CRLF & _
			@TAB & "err.retcode is: " & @TAB & "0x" & Hex($oError.retcode) & @CRLF & @CRLF)
EndFunc   ;==>_ErrFunc
