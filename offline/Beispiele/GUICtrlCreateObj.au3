#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

; Einfaches Beispiel: Ein Internet Explorer Objekt in eine AutoIt GUI einbetten.

Func Example()
	; Dieses bestimmte Objekt wird als ObjEvent() deklariert, um das Objekt zu spe4ichern, #forceref vermeidet Au3Check-Warnungen.
	Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")
	#forceref $oErrorHandler

	Local $idButton_Back, $idButton_Forward
	Local $idButton_Home, $idButton_Stop, $iMsg

	Local $oIE = ObjCreate("Shell.Explorer.2")

	; Eine simple GUI für die Ausgabe erzeugen.
	GUICreate("Embedded Web control Test", 640, 580, (@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, BitOR($WS_OVERLAPPEDWINDOW, $WS_CLIPSIBLINGS, $WS_CLIPCHILDREN))
	GUICtrlCreateObj($oIE, 10, 40, 600, 360)
	GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
	$idButton_Back = GUICtrlCreateButton("Zurück", 10, 420, 100, 30)
	$idButton_Forward = GUICtrlCreateButton("Vor", 120, 420, 100, 30)
	$idButton_Home = GUICtrlCreateButton("AutoIt Home", 230, 420, 100, 30)
	$idButton_Stop = GUICtrlCreateButton("Stoppen", 330, 420, 100, 30)

	GUISetState(@SW_SHOW) ; Macht die GUI sichtbar
	$oIE.navigate("http://google.com")
	Sleep(3000)

	$oIE.navigate("http://www.autoit.de")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$iMsg = GUIGetMsg()

		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $iMsg = $idButton_Home
				$oIE.navigate("https://www.autoit.de")
			Case $iMsg = $idButton_Back
				$oIE.GoBack
			Case $iMsg = $idButton_Forward
				$oIE.GoForward
			Case $iMsg = $idButton_Stop
				$oIE.Stop
		EndSelect

	WEnd

	GUIDelete()
EndFunc   ;==>Example

; COM-Fehlerfunktion des Benutzers wird aufgerurfen, wenn ein COM-Fehler auftritt
Func _ErrFunc($oError)
	; Macht hier etwas.
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
