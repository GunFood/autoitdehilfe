#include <GUIConstantsEx.au3>
#include <GuiReBar.au3>
#include <WinAPIError.au3>
#include <WinAPIRes.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $idInput, $id_Get, $hReBar, $hInstance, $sText
	; Erstellt eine GUI
	$hGui = GUICreate("WinAPI", 500, 300)

	$idInput = GUICtrlCreateInput("4209", 0, 0, 100, 20)

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hGui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	; Erstellt ein mehrzeiliges Input-Control (Memo)
	$g_idMemo = GUICtrlCreateEdit("", 2, 55, 496, 200, BitOR($WS_VSCROLL, $WS_HSCROLL))
	GUICtrlSetFont($g_idMemo, 10, 400, 0, "Courier New")

	; Fügt eine neue Gruppe in das Rebar-Control ein, die das Input-Control enthält
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($idInput), 120, 200, "String-ID:")

	$id_Get = GUICtrlCreateButton("String einlesen", 0, 0, 70, 25)

	; Fügt eine neue Gruppe in das Rebar-Control ein, die den "String einlesen"-Button enthält
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($id_Get), 120, 200)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
			Case $id_Get
				GUICtrlSetData($g_idMemo, "")
				; Bindet eine ausführbare Datei als Modul in den Adressraum des Skriptprozesses ein
				$hInstance = _WinAPI_LoadLibraryEx("shell32.dll", $LOAD_LIBRARY_AS_DATAFILE)
				If $hInstance Then
					; Lädt eine Stringressource aus einem eingebundenen Modul
					$sText = _WinAPI_LoadString($hInstance, GUICtrlRead($idInput))
					If Not @error Then
						MemoWrite('Folgender String wurde eingelesen (' & @extended & ' Zeichen): ' & @CRLF & @CRLF & $sText)
					Else
						MemoWrite("Letzte Fehlermeldung: " & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
					EndIf
					; Gibt das eingebundene Modul wieder frei
					MemoWrite(@CRLF & @CRLF & @CRLF & @CRLF & "Freigabe der Bibliothek erfolgreich? " & _WinAPI_FreeLibrary($hInstance))
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
