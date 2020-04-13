#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <Memory.au3>
#include <WinAPIError.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $id_SetData, $id_GetData, $hMemory, $hLock, $tData, $sData, $iSize

	; Erstellt eine GUI
	GUICreate("Zwischenablage", 600, 450)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	$id_SetData = GUICtrlCreateButton("Schreibt Daten in die Zwischenablage", 50, 410, 220, 30)
	$id_GetData = GUICtrlCreateButton("Holt Daten aus der Zwischenablage", 300, 410, 220, 30)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $id_SetData
				; Zwischenablage öffnen
				If _ClipBoard_Open(0) Then

					; Zwischenablage leeren
					If _ClipBoard_Empty() Then

						; Erzeugt globalen Pufferspeicher (zeigt, warum _ClipBoard_SetData VIEL einfacher zu benutzen ist!)
						$sData = "Ein freundliches Hallo von AutoIt"
						$iSize = StringLen($sData) + 1
						$hMemory = _MemGlobalAlloc($iSize, $GHND)
						If $hMemory <> 0 Then
							$hLock = _MemGlobalLock($hMemory)
							If $hLock = 0 Then _WinAPI_ShowError("_Mem_GlobalLock fehlgeschlagen!")
							$tData = DllStructCreate("char Text[" & $iSize & "]", $hLock)
							DllStructSetData($tData, "Text", $sData)
							_MemGlobalUnlock($hMemory)

							; Schreibt Text in die Zwischenablage
							If Not _ClipBoard_SetDataEx($hMemory, $CF_TEXT) Then _WinAPI_ShowError("_ClipBoard_SetDataEx fehlgeschlagen!")
						Else
							_WinAPI_ShowError("_Mem_GlobalAlloc fehlgeschlagen!")
						EndIf

						; Zwischenablage schließen
						_ClipBoard_Close()
					Else
						; Zwischenablage schließen
						_ClipBoard_Close()
						_WinAPI_ShowError("_ClipBoard_Empty fehlgeschlagen!")
					EndIf
				Else
					_WinAPI_ShowError("_ClipBoard_Open failed")
				EndIf
			Case $id_GetData
				MemoWrite(_ClipBoard_GetData())
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
