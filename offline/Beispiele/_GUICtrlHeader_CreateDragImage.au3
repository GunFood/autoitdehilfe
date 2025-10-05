#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <StructureConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>
#include <WinAPIMisc.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header DragImage erstellen (v" & @AutoItVersion & ")", 450, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 32, 444, 240)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Erstellt eine halbtransparente Version eines Itembildes zur Verwendung als ziehendes Bild
	Local $hImage = _GUICtrlHeader_CreateDragImage($hHeader, 1)
	Local $aSize = _GUIImageList_GetIconSize($hImage)
	Local $hDC = _WinAPI_GetDC($hGui)

	_MemoWrite("Bild drag Handle: " & "0x" & Hex($hImage))
	_MemoWrite("IsPtr  = " & IsPtr($hImage) & " IsHWnd  = " & IsHWnd($hImage))

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	Local $iMsg, $tPos, $tRECT
	; Erstellt eine halbtransparente Version eines Itembildes zur Verwendung als ziehendes Bild an der aktueller Cursorposition bis die GUI geschlossen wird
	Do
		$iMsg = GUIGetMsg()
		If $iMsg = $GUI_EVENT_MOUSEMOVE Then
			If $tPos <> 0 Then
				$tRECT = DllStructCreate($tagRECT)
				DllStructSetData($tRECT, "Left", DllStructGetData($tPos, "X"))
				DllStructSetData($tRECT, "Top", DllStructGetData($tPos, "Y"))
				DllStructSetData($tRECT, "Right", DllStructGetData($tPos, "X") + $aSize[0])
				DllStructSetData($tRECT, "Bottom", DllStructGetData($tPos, "Y") + $aSize[1])
				_WinAPI_InvalidateRect($hGui, $tRECT)
			EndIf
			$tRECT = _WinAPI_GetClientRect($hGui)
			$tPos = _WinAPI_GetMousePos(True, $hGui)
			If _WinAPI_PtInRect($tRECT, $tPos) Then
				_GUIImageList_Draw($hImage, 0, $hDC, DllStructGetData($tPos, "X"), DllStructGetData($tPos, "Y"))
			EndIf
		EndIf
	Until $iMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
