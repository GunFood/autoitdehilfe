#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>
#include <WinAPIMisc.au3>
#include <WinAPISysWin.au3>

Global $g_idMemo
Example()

Func Example()
	Local $hGui, $hHeader, $hImage, $iMsg, $aSize, $tPos, $tRECT, $hDC

	; Erstellt eine GUI
	$hGui = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGui)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Erstellt eine halbtransparente Version eines Itembildes zur Verwendung als ziehendes Bild
	$hImage = _GUICtrlHeader_CreateDragImage($hHeader, 1)
	$aSize = _GUIImageList_GetIconSize($hImage)
	$hDC = _WinAPI_GetDC($hGui)

	MemoWrite("Bild drag Handle: " & "0x" & Hex($hImage))
	MemoWrite("IsPtr  = " & IsPtr($hImage) & " IsHWnd  = " & IsHWnd($hImage))

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

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
