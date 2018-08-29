;==============================================================================
;    _WinAPI_GetWindowText.au3
;==============================================================================

#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <Constants.au3>
#include <WinAPI.au3>

Opt("MustDeclareVars", 1)

Global Const $IDC_STATIC = -1, $IDC_EDIT = 101

Global $hInstance

;==============================================================================
Exit Example()
;==============================================================================

Func Example()
	Local $hWndMain, $hWndEdit, $hWndStatic, $hWndButton

	$hInstance = _WinAPI_GetModuleHandle(0)

	; Das Hauptfenster erzeugen
	$hWndMain = GUICreate( _
			"_WinAPI_CreateWindowEx - Demo", _					; Titel des Fensters
			400, 300, -1, -1, _									; Größe und Position des Fensters
			BitOR($WS_OVERLAPPEDWINDOW, $WS_CLIPCHILDREN), _	; Fensterstile
			$WS_EX_WINDOWEDGE, _								; Erweiterte Fensterstile
			0)													; Handle des Parent-Fensters

	; Eine einfaches Eingabefeld erzeugen
	$hWndEdit = _WinAPI_CreateWindowEx( _
			0, _												; Erweiterte Fensterstile
			"EDIT", _											; Name der Fensterklasse
			"ENTER drücken...", _								; Text/Titel des Fensters
			BitOR($WS_TABSTOP, $WS_CHILD, $WS_BORDER, _			; Fensterstile
			$WS_VISIBLE, $ES_LEFT, $ES_NOHIDESEL), _
			100, 80, 200, 22, _									; Position und Größe des Fensters
			$hWndMain, _										; Handle des Parent-Fensters
			$IDC_EDIT, _										; Identifizierer des (Kind-)Fensters
			$hInstance, _										; Instanzhandle des Moduls
			0)													; Anwendungsdefinierter Wert

	; Eine einfaches Textlabel erzeugen
	$hWndStatic = _WinAPI_CreateWindowEx( _
			0, _												; Erweiterte Fensterstile
			"STATIC", _											; Name der Fensterklasse
			"Text", _											; Text/Titel des Fensters
			BitOR($WS_TABSTOP, $WS_CHILD, _						; Fensterstile
			$WS_VISIBLE, $SS_CENTER), _
			160, 140, 80, 18, _									; Position und Größe des Fensters
			$hWndMain, _										; Handle des Parent-Fensters
			$IDC_STATIC, _										; Identifizierer des (Kind-)Fensters
			$hInstance, _										; Instanzhandle des Moduls
			0)													; Anwendungsdefinierter Wert

	; Eine einfache Schaltfläche erzeugen
	$hWndButton = _WinAPI_CreateWindowEx( _
			0, _												; Erweiterte Fensterstile
			"BUTTON", _											; Name der Fensterklasse
			"Text", _											; Text/Titel des Fensters
			BitOR($WS_TABSTOP, $WS_CHILD, _						; Fensterstile
			$WS_VISIBLE, $BS_DEFPUSHBUTTON), _
			160, 220, 80, 25, _									; Position und Größe des Fensters
			$hWndMain, _										; Handle des Parent-Fensters
			$IDOK, _											; Identifizierer des (Kind-)Fensters
			$hInstance, _										; Instanzhandle des Moduls
			0)													; Anwendungsdefinierter Wert

	; Fensternachrichten registrieren
	GUIRegisterMsg($WM_COMMAND, "MyWM_COMMAND")

	; Das Hauptfenster anzeigen
	_WinAPI_ShowWindow($hWndMain, @SW_SHOW)

	While True
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func MyWM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg

	Local $sMessage

	Switch _WinAPI_LoWord($wParam)
		Case $IDC_EDIT
			; Nachrichten des Eingabefeldes
			Switch _WinAPI_HiWord($wParam)
				Case $EN_UPDATE
					ContinueCase
				Case $EN_CHANGE
					ConsoleWrite(_WinAPI_GetWindowText($lParam) & @CRLF)
			EndSwitch
		Case $IDOK
			$sMessage = StringFormat("Die Schaltfläche mit der ID %d wurde gedrückt.", $IDOK)
			_WinAPI_MsgBox( _
					BitOR($MB_OK, $MB_ICONASTERISK), _
					"MyWM_COMMAND", _
					$sMessage)
	EndSwitch

	Return $GUI_RUNDEFMSG
EndFunc   ;==>MyWM_COMMAND

;================================ End of File =================================