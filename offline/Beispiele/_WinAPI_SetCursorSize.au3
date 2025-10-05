#include <GUIConstantsEx.au3>
#include <WinAPIRes.au3>

Local $iSizeSav = _WinAPI_GetCursorSize()

Local $bReturn, $iSize = $iSizeSav
Opt("MouseCoordMode", 2)

GUICreate("Get/Set cursor size (" & @AutoItVersion & ")", 320, 120, @DesktopWidth / 2 - 160, @DesktopHeight / 2 - 45)
GUICtrlCreateLabel("Enter Cursor Size", 90, 33)
Local $idInput = GUICtrlCreateInput($iSize, 190, 30, 30, 20)
Local $idBtn = GUICtrlCreateButton("Ok", 130, 75, 60, 20)

GUISetState(@SW_SHOW)

; Loop until the user exits.
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ExitLoop

		Case $idBtn
			$iSize = GUICtrlRead($idInput)
			$bReturn = _WinAPI_SetCursorSize($iSize)
			If @error Then
				MsgBox(0, "Error", "CursorSize = " & $iSize & " is invalid")
			Else
				MouseMove(205, 39, 0)
			EndIf
	EndSwitch
WEnd

; restore initial size
_WinAPI_SetCursorSize($iSizeSav)
