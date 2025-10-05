#include "Extras\HelpFileInternals.au3"

#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idBtn, $idChk, $idRdo, $iMsg
	Local $sWow64 = ""
	If @AutoItX64 Then $sWow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	GUICreate("Buttons", 300, 300)
	_MemoCreate(2, 60, 296, 236, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	$idBtn = GUICtrlCreateButton("Button 1", 10, 10, 40, 40, $BS_BITMAP)
	_GUICtrlButton_SetImage($idBtn, $sPath & "\blue.bmp")

	$idChk = GUICtrlCreateCheckbox("Check 1", 60, 10, 50, 32, $BS_ICON)
	_GUICtrlButton_SetImage($idChk, "shell32.dll", 14, True)

	$idRdo = GUICtrlCreateRadio("Radio 1", 120, 10, 50, 32, $BS_ICON)
	_GUICtrlButton_SetImage($idRdo, "shell32.dll", 21, True)

	_MemoWrite("Button 1 Bild-Handle: " & _GUICtrlButton_GetImage($idBtn))
	_MemoWrite("Check 1 Bild-Handle : " & _GUICtrlButton_GetImage($idChk))
	_MemoWrite("Radio 1 Bild-Handle : " & _GUICtrlButton_GetImage($idRdo))

	While 1
		$iMsg = GUIGetMsg()
		If $iMsg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	Exit
EndFunc   ;==>Example