#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Control einbinden (v" & @AutoItVersion & ")", 500, 300)

	; Standard ist 1 Abschnitt und kein Text
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetMinHeight($hStatus, 20)

	GUISetState(@SW_SHOW)

	; Initialisiert drei Abschnitte
	Local $aParts[4] = [80, 160, 300, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; Bindet eine Progressbar in das Control ein
	Local $hProgress, $idProgress
	If @OSType = "WIN32_WINDOWS" Then
		$idProgress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_SMOOTH)
		$hProgress = GUICtrlGetHandle($idProgress)
		_GUICtrlStatusBar_EmbedControl($hStatus, 2, $hProgress)
	Else
		$idProgress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_MARQUEE) ; Der Stil 'marquee' funktioniert bei Windows XP und neuer
		$hProgress = GUICtrlGetHandle($idProgress)
		_GUICtrlStatusBar_EmbedControl($hStatus, 2, $hProgress)
		_SendMessage($hProgress, $PBM_SETMARQUEE, True, 200) ; Der Stil 'marquee' funktioniert bei Windows XP und neuer
	EndIf

	Local $idInput = GUICtrlCreateInput("Dies wurde eingebunden", 0, 0)
	Local $hInput = GUICtrlGetHandle($idInput)
	_GUICtrlStatusBar_EmbedControl($hStatus, 3, $hInput, 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
