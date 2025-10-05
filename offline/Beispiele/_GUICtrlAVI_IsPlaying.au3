#include "Extras\HelpFileInternals.au3"

#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $hGui, $hAVI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"
	Local $idBtn_StartStop

	; Erstellt eine GUI
	$hGui = GUICreate("AVI: Öffnen (Extern)", 300, 200)
	$hAVI = _GUICtrlAVI_Create($hGui, "", -1, 10, 10)
	$idBtn_StartStop = GUICtrlCreateButton("Start", 50, 10, 75, 25)
	_MemoCreate(10, 50, 276, 144, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Open($hAVI, $sFile)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $idBtn_StartStop
				If GUICtrlRead($idBtn_StartStop) = "Start" Then
					_GUICtrlAVI_Play($hAVI)
					GUICtrlSetData($idBtn_StartStop, "Stopp")
				Else
					_GUICtrlAVI_Stop($hAVI)
					GUICtrlSetData($idBtn_StartStop, "Start")
				EndIf
				_MemoWrite("Es wird abgespielt: " & _GUICtrlAVI_IsPlaying($hAVI))

			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>Example