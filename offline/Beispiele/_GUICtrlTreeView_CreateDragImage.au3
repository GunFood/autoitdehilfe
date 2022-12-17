#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <WinAPIGdiDC.au3>
#include <WinAPIMisc.au3>
#include <WinAPISysWin.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("TreeView: Erstellt ein ziehbares Bitmap (v" & @AutoItVersion & ")", 500, 300)

	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	Local $hTreeView = GUICtrlGetHandle(GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE))

	GUISetState(@SW_SHOW)

	; Lädt die Bilder
	Local $hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlTreeView_CreateSolidBitMap($hTreeView, 0x0000FF, 16, 16))
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	Local $iImage, $hItem
	For $x = 0 To 5
		$iImage = Random(0, 8, 1)
		$hItem = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x), $iImage, $iImage)
		For $y = 0 To 3
			$iImage = Random(0, 8, 1)
			_GUICtrlTreeView_AddChild($hTreeView, $hItem, StringFormat("[%02d] Neues Child", $y), $iImage, $iImage)
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)
	_GUICtrlTreeView_SelectItem($hTreeView, 0)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Local $bDragging = False, $hDrag
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_MOUSEMOVE
				If $bDragging Then DrawDragImage($hTreeView, $hDrag)

			Case $GUI_EVENT_PRIMARYDOWN
				Local $hSelected = _GUICtrlTreeView_GetSelection($hTreeView)
				If $hSelected Then
					$bDragging = True
					; Erstellt ein ziehbares Bitmap
					$hDrag = _GUICtrlTreeView_CreateDragImage($hTreeView, $hSelected)
					DrawDragImage($hTreeView, $hDrag)
				EndIf

			Case $GUI_EVENT_PRIMARYUP
				If $bDragging Then
					$bDragging = False
					; Löscht die Imagelist
					_GUIImageList_Destroy($hDrag)
					_WinAPI_InvalidateRect($hTreeView)
					_WinAPI_InvalidateRect(HWnd($hGUI))
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example

; Zeichnet ein ziehbares Bitmap
Func DrawDragImage(ByRef $hControl, ByRef $hDrag)
	Local $tPoint, $hDC
	$hDC = _WinAPI_GetWindowDC($hControl)
	$tPoint = _WinAPI_GetMousePos(True, $hControl)
	_WinAPI_InvalidateRect($hControl)
	_GUIImageList_Draw($hDrag, 0, $hDC, DllStructGetData($tPoint, "X"), DllStructGetData($tPoint, "Y"))
	_WinAPI_ReleaseDC($hControl, $hDC)
EndFunc   ;==>DrawDragImage
