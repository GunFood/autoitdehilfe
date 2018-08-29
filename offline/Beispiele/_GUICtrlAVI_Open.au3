#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $hGui, $hAVI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"

	; Erstellt eine GUI
	$hGui = GUICreate("AVI: Öffnen (Extern)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGui, "", -1, 10, 10)
	GUISetState(@SW_SHOW)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Open($hAVI, $sFile)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Play($hAVI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>Example
