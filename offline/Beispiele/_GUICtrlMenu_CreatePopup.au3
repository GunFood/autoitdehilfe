#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WinAPIError.au3>
#include <WindowsConstants.au3>

Global Enum $e_idOpen = 1000, $e_idSave, $e_idInfo

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Menu", 400, 300)
	GUISetState(@SW_SHOW)

	; Registriert eine benutzerdefinierte Funktion
	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	GUIRegisterMsg($WM_CONTEXTMENU, "WM_CONTEXTMENU")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Handle der WM_COMMAND Nachrichten
Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam
	Switch $wParam
		Case $e_idOpen
			_WinAPI_ShowMsg("Öffnen")
		Case $e_idSave
			_WinAPI_ShowMsg("Speichern")
		Case $e_idInfo
			_WinAPI_ShowMsg("Info")
	EndSwitch
EndFunc   ;==>WM_COMMAND

; Handle der WM_CONTEXTMENU Nachrichten
Func WM_CONTEXTMENU($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam
	Local $hMenu

	$hMenu = _GUICtrlMenu_CreatePopup()
	_GUICtrlMenu_InsertMenuItem($hMenu, 0, "Öffnen", $e_idOpen)
	_GUICtrlMenu_InsertMenuItem($hMenu, 1, "Speichern", $e_idSave)
	_GUICtrlMenu_InsertMenuItem($hMenu, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($hMenu, 3, "Info", $e_idInfo)
	_GUICtrlMenu_TrackPopupMenu($hMenu, $wParam)
	_GUICtrlMenu_DestroyMenu($hMenu)
	Return True
EndFunc   ;==>WM_CONTEXTMENU
