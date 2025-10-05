; mit Standard-UDF

#include "Extras\HelpFileInternals.au3"

#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>

Example_External()

Func Example_External()
	Local $s_Text = 'Beispiel für Suchen und Ersetzen mit AutoIt ' & FileGetVersion(@AutoItExe) & @CRLF & _
			"dies ist ein Test" & @CRLF & _
			"dies ist nur ein Test" & @CRLF & _
			"dieser Test sollte für Sie genauso gut funktionieren wie für mich"
	Local $hTitle, $hHandle
	Local $sTitle = "[CLASS:Notepad]"

	Run("notepad.exe", "", @SW_MAXIMIZE)
	;Warten, bis das Fenster "Untitled" existiert
	Local $hWnd = WinWait($sTitle)

	;Das Handle eines Notepad-Fensters abrufen
	$hTitle = WinGetHandle($sTitle)
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Das richtige Fenster wurde nicht gefunden")
	Else
		$hHandle = ControlGetHandle($hTitle, "", ControlGetFocus($hWnd))
		If @error Then
			MsgBox($MB_SYSTEMMODAL, "Fehler", "Konnte das richtige Steuerelement nicht finden")
		Else
			; Senden Sie einen Text direkt an das Bearbeitungsfeld dieses Fensters
			ControlSend($hTitle, "", ControlGetFocus($hWnd), $s_Text)
			_GUICtrlEdit_Find($hHandle, True)
		EndIf
	EndIf

	_NotepadForceClose($hWnd)
EndFunc   ;==>Example_External
