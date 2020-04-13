#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <SendMessage.au3>
#include <WindowsConstants.au3>

Global $g_idMemo, $g_hNext = 0

Example()

Func Example()
	Local $hGui

	; Erstellt eine GUI
	$hGui = GUICreate("Zwischenablage", 600, 400)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Initialisiere den Clipboard-Anzeiger
	$g_hNext = _ClipBoard_SetViewer($hGui)

	GUIRegisterMsg($WM_CHANGECBCHAIN, "WM_CHANGECBCHAIN")
	GUIRegisterMsg($WM_DRAWCLIPBOARD, "WM_DRAWCLIPBOARD")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Beende den Clipboard-Anzeiger
	_ClipBoard_ChangeChain($hGui, $g_hNext)
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Bearbeite die $WM_CHANGECBCHAIN-Nachricht
Func WM_CHANGECBCHAIN($hWnd, $iMsg, $wParam, $lParam)
	; Zeigt an, dass eine Nachricht empfangen wurde
	MemoWrite("***** $WM_CHANGECBCHAIN *****")

	; Wenn das Fenster geschlossen ist, repariere die Nachrichtenkette
	If $wParam = $g_hNext Then
		$g_hNext = $lParam
		; Sonst reiche die Nachricht an den nächsten Anzeiger weiter
	ElseIf $g_hNext <> 0 Then
		_SendMessage($g_hNext, $WM_CHANGECBCHAIN, $wParam, $lParam, 0, "hwnd", "hwnd")
	EndIf
EndFunc   ;==>WM_CHANGECBCHAIN

; Bearbeitete $WM_DRAWCLIPBOARD-Nachrichten
Func WM_DRAWCLIPBOARD($hWnd, $iMsg, $wParam, $lParam)
	; Zeigt jeden Text aus der Zwischenablage an
	MemoWrite(_ClipBoard_GetData())

	; Reiche die Nachricht an den nächsten Anzeiger weiter
	If $g_hNext <> 0 Then _SendMessage($g_hNext, $WM_DRAWCLIPBOARD, $wParam, $lParam)
EndFunc   ;==>WM_DRAWCLIPBOARD
