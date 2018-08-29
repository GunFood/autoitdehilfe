#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $hGui, $hAVI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"
	Local $id_StartStop

	; Erstellt eine GUI
	$hGui = GUICreate("AVI: Öffnen (Extern)", 300, 200)
	$hAVI = _GUICtrlAVI_Create($hGui, "", -1, 10, 10)
	$id_StartStop = GUICtrlCreateButton("Start", 50, 10, 75, 25)
	$g_idMemo = GUICtrlCreateEdit("", 10, 50, 276, 144, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Open($hAVI, $sFile)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $id_StartStop
				If GUICtrlRead($id_StartStop) = "Start" Then
					_GUICtrlAVI_Play($hAVI)
					GUICtrlSetData($id_StartStop, "Stopp")
				Else
					_GUICtrlAVI_Stop($hAVI)
					GUICtrlSetData($id_StartStop, "Start")
				EndIf
				MemoWrite("Es wird abgespielt: " & _GUICtrlAVI_IsPlaying($hAVI))

			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
