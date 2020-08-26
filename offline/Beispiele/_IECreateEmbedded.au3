; Erkennt und deaktiviert COM-Errors, sodass 'Back' (zurück) und
; 'Forward' (vorwärts) außerhalb der Historygrenzen das Skript nicht abbrechen.
; (außer COM-Errors, die an die Konsole gesendet werden)

#include <GUIConstantsEx.au3>
#include <IE.au3>
#include <WindowsConstants.au3>

Local $oIE = _IECreateEmbedded()
GUICreate("EmbeddedWebControl-Test", 640, 580, _
		(@DesktopWidth - 640) / 2, (@DesktopHeight - 580) / 2, _
		$WS_OVERLAPPEDWINDOW + $WS_CLIPSIBLINGS + $WS_CLIPCHILDREN)
GUICtrlCreateObj($oIE, 10, 40, 600, 360)
Global $idButton_Back = GUICtrlCreateButton("Zurück", 10, 420, 100, 30)
Global $idButton_Forward = GUICtrlCreateButton("Vorwärts", 120, 420, 100, 30)
Global $idButton_Home = GUICtrlCreateButton("Startseite", 230, 420, 100, 30)
Global $idButton_Stop = GUICtrlCreateButton("Anhalten", 340, 420, 100, 30)

Global $g_idError_Message = GUICtrlCreateLabel("", 100, 500, 500, 30)
GUICtrlSetColor(-1, 0xff0000)

GUISetState(@SW_SHOW) ; Macht die GUI sichtbar

_IENavigate($oIE, "http://www.autoit.de")
_IEAction($oIE, "stop")

; Wartet, bis der Benutzer das Fenster schließt
While 1
	Local $iMsg = GUIGetMsg()
	Select
		Case $iMsg = $GUI_EVENT_CLOSE
			ExitLoop
		Case $iMsg = $idButton_Home
			_IENavigate($oIE, "ttp://www.autoit.de")
			_IEAction($oIE, "stop")
			_IEAction($oIE, "back")
			CheckError("Startseite", @error, @extended)
		Case $iMsg = $idButton_Back
			_IEAction($oIE, "back")
			CheckError("Zurück", @error, @extended)
		Case $iMsg = $idButton_Forward
			_IEAction($oIE, "forward")
			CheckError("Vorwärts", @error, @extended)
		Case $iMsg = $idButton_Stop
			_IEAction($oIE, "stop")
			CheckError("Anhalten", @error, @extended)
	EndSelect
WEnd

GUIDelete()

Exit

Func CheckError($sMsg, $iError, $iExtended)
	If $iError Then
		$sMsg = "Fehler beim Verwenden Error des " & $sMsg & " Buttons (" & $iExtended & ")"
	Else
		$sMsg = ""
	EndIf
	GUICtrlSetData($g_idError_Message, $sMsg)
EndFunc   ;==>CheckError
