#include <EditConstants.au3>
#include <FileConstants.au3>
#include <GDIPlus.au3>
#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <SendMessage.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPIHObj.au3>
#include <WinAPIShPath.au3>
#include <WindowsNotifsConstants.au3>
#include <WindowsStylesConstants.au3>

Opt('GUICloseOnESC', 0)
Opt('TrayAutoPause', 0)

Global $g_aDefault[11] = [10000, 10000, 10000, 0, 10000, 0, 0, 0, 0, 0, 0]
Global $g_aAdjust = $g_aDefault

_GDIPlus_Startup()

Local $hObj, $hSrc, $W, $H, $sData
While 1
	$sData = FileOpenDialog('Bild laden', @ScriptDir & '\Extras', 'Bilddateien (*.bmp;*.dib;*.gif;*.jpg;*.tif)|Alle Dateien (*.*)', BitOR($FD_FILEMUSTEXIST, $FD_PATHMUSTEXIST))
	If @error Then Exit

	$hObj = _GDIPlus_ImageLoadFromFile($sData)
	If $hObj Then
		$hSrc = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hObj)
		$W = _GDIPlus_ImageGetWidth($hObj)
		$H = _GDIPlus_ImageGetHeight($hObj)
		_GDIPlus_ImageDispose($hObj)
		If $hSrc Then
			ExitLoop
		EndIf
	EndIf
	MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', 'Es konnte kein Bild geladen werden.')
WEnd

Local $hForm = GUICreate(_WinAPI_PathStripPath($sData), $W, $H, (@DesktopWidth - 303) / 2 - $W)
GUICtrlCreatePic('', 0, 0, $W, $H)
GUICtrlSetState(-1, $GUI_DISABLE)
Local $hPic = GUICtrlGetHandle(-1)
Global $g_hTool = GUICreate('Anpassungen', 303, 484, -1, -1, BitOR($WS_CAPTION, $WS_POPUP), 0, $hForm)
GUICtrlCreateGraphic(0, 0, 303, 436)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlCreateGraphic(0, 436, 303, 1)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlSetBkColor(-1, 0xDFDFDF)
Global $g_aidSlider[9][6] = [[0, 0, 'Rot', 25, 650, 100], [0, 0, 'Grün', 25, 650, 100], [0, 0, 'Blau', 25, 650, 100], [0, 0, 'Schwarz', 0, 400, 10], [0, 0, 'Weiß', 600, 1000, 10], [0, 0, 'Kontrast', -100, 100, 1], [0, 0, 'Helligkeit', -100, 100, 1], [0, 0, 'Sättigung', -100, 100, 1], [0, 0, 'Farbton', -100, 100, 1]]
Local $idInput
For $i = 0 To 8
	GUICtrlCreateLabel($g_aidSlider[$i][2] & ':', 10, 21 + $i * 31, 60, 14, $SS_RIGHT)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$idInput = GUICtrlCreateInput('', 243, 18 + $i * 31, 49, 19, BitOR($ES_CENTER, $ES_READONLY))
	GUICtrlSetFont(-1, 9.3, 400, 0, 'Arial')
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$g_aidSlider[$i][2] = $idInput
	$g_aidSlider[$i][0] = GUICtrlCreateSlider(71, 19 + $i * 31, 170, 20, BitOR($TBS_BOTH, $TBS_NOTICKS))
	GUICtrlSetLimit(-1, $g_aidSlider[$i][4], $g_aidSlider[$i][3])
	$g_aidSlider[$i][1] = GUICtrlGetHandle(-1)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
Next
GUICtrlCreateLabel('Beleuchtung:', 10, 310, 65, 14, $SS_RIGHT)
GUICtrlSetBkColor(-1, 0xFFFFFF)
Global $g_idCombo = GUICtrlCreateCombo('', 77, 306, 158, 160, $CBS_DROPDOWNLIST)
Local $aLight = StringSplit('Default|Tungsten lamp|Noon sunlight|NTSC daylight|Normal print|Bond paper print|Standard daylight|Northern daylight|Cool white lamp', '|')
For $i = 1 To $aLight[0]
	_GUICtrlComboBox_AddString(-1, $aLight[$i])
Next
GUICtrlCreateLabel('Filters:', 10, 347, 60, 14, $SS_RIGHT)
GUICtrlSetBkColor(-1, 0xFFFFFF)
Global $g_aidCheck[3]
$g_aidCheck[0] = GUICtrlCreateCheckbox('Negativ (Farben invertiert)', 77, 343, 131, 21)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$g_aidCheck[1] = GUICtrlCreateCheckbox('Logarithmisch', 77, 368, 80, 21)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$g_aidCheck[2] = GUICtrlCreateCheckbox('Vorschau', 11, 401, 60, 21)
GUICtrlSetBkColor(-1, 0xFFFFFF)
GUICtrlSetState(-1, $GUI_CHECKED)
Local $aidButton[2]
$aidButton[0] = GUICtrlCreateButton('Zurücksetzen', 136, 448, 75, 25)
$aidButton[1] = GUICtrlCreateButton('Speichern...', 218, 448, 75, 25)
_Reset()
GUICtrlSetState($g_aidSlider[0][0], $GUI_FOCUS)
GUIRegisterMsg($WM_HSCROLL, 'WM_HSCROLL')
GUISetState(@SW_SHOW, $hForm)
GUISetState(@SW_SHOW, $g_hTool)

While 1
	Switch GUIGetMsg()
		Case 0
			ContinueLoop
		Case $GUI_EVENT_CLOSE
			Exit
		Case $aidButton[0]
			_Reset()
		Case $aidButton[1]
			GUISetState(@SW_DISABLE, $hForm)
			$sData = FileSaveDialog('Bild speichern', @WorkingDir, 'Bilddateien (*.bmp;*.dib;*.gif;*.jpg;*.tif)|Alle Dateien (*.*)', 2 + 16, 'MyImage.jpg', $g_hTool)
			GUICtrlSetState($aidButton[1], $GUI_FOCUS)
			GUISetState(@SW_ENABLE, $hForm)
			If Not $sData Then
				ContinueLoop
			EndIf
			$hObj = _GDIPlus_BitmapCreateFromHBITMAP(_SendMessage($hPic, $STM_GETIMAGE))
			If $hObj Then
				If _GDIPlus_ImageSaveToFile($hObj, $sData) Then
					$sData = 0
				EndIf
				_GDIPlus_ImageDispose($hObj)
			EndIf
			If $sData Then
				MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler', 'Es konnte kein Bild gespeichert werden.')
			EndIf
		Case $g_aidCheck[0]
			If GUICtrlRead($g_aidCheck[0]) = $GUI_CHECKED Then
				$g_aAdjust[9] = BitOR($g_aAdjust[9], $CA_NEGATIVE)
			Else
				$g_aAdjust[9] = BitAND($g_aAdjust[9], BitNOT($CA_NEGATIVE))
			EndIf
			_Update()
		Case $g_aidCheck[1]
			If GUICtrlRead($g_aidCheck[1]) = $GUI_CHECKED Then
				$g_aAdjust[9] = BitOR($g_aAdjust[9], $CA_LOG_FILTER)
			Else
				$g_aAdjust[9] = BitAND($g_aAdjust[9], BitNOT($CA_LOG_FILTER))
			EndIf
			_Update()
		Case $g_aidCheck[2]
			If GUICtrlRead($g_aidCheck[2]) = $GUI_CHECKED Then
				_SetBitmapAdjust($hPic, $hSrc, $g_aAdjust)
			Else
				_SetBitmapAdjust($hPic, $hSrc)
			EndIf
		Case $g_idCombo
			$sData = _GUICtrlComboBox_GetCurSel($g_idCombo)
			If $g_aAdjust[10] <> $sData Then
				$g_aAdjust[10] = $sData
				_Update()
			EndIf
	EndSwitch
WEnd

Func _Reset()
	$g_aAdjust = $g_aDefault
	For $i = 0 To 8
		GUICtrlSetData($g_aidSlider[$i][0], $g_aAdjust[$i] / $g_aidSlider[$i][5])
		GUICtrlSetData($g_aidSlider[$i][2], $g_aAdjust[$i])
	Next
	_GUICtrlComboBox_SetCurSel($g_idCombo, $g_aAdjust[10])
	If BitAND($g_aAdjust[9], $CA_LOG_FILTER) Then
		GUICtrlSetState($g_aidCheck[1], $GUI_CHECKED)
	Else
		GUICtrlSetState($g_aidCheck[1], $GUI_UNCHECKED)
	EndIf
	If BitAND($g_aAdjust[9], $CA_NEGATIVE) Then
		GUICtrlSetState($g_aidCheck[0], $GUI_CHECKED)
	Else
		GUICtrlSetState($g_aidCheck[0], $GUI_UNCHECKED)
	EndIf
	_Update()
EndFunc   ;==>_Reset

Func _SetBitmapAdjust($hWnd, $hBitmap, $aAdjust = 0)
	If Not IsHWnd($hWnd) Then
		$hWnd = GUICtrlGetHandle($hWnd)
		If Not $hWnd Then
			Return 0
		EndIf
	EndIf

	Local $tAdjust = 0
	If IsArray($aAdjust) Then
		$tAdjust = _WinAPI_CreateColorAdjustment($aAdjust[9], $aAdjust[10], $aAdjust[0], $aAdjust[1], $aAdjust[2], $aAdjust[3], $aAdjust[4], $aAdjust[5], $aAdjust[6], $aAdjust[7], $aAdjust[8])
	EndIf
	$hBitmap = _WinAPI_AdjustBitmap($hBitmap, -1, -1, $HALFTONE, $tAdjust)
	If @error Then
		Return 0
	EndIf
	Local $hPrev = _SendMessage($hWnd, $STM_SETIMAGE, $IMAGE_BITMAP, $hBitmap)
	If $hPrev Then
		_WinAPI_DeleteObject($hPrev)
	EndIf
	$hPrev = _SendMessage($hWnd, $STM_GETIMAGE)
	If $hPrev <> $hBitmap Then
		_WinAPI_DeleteObject($hBitmap)
	EndIf
	Return 1
EndFunc   ;==>_SetBitmapAdjust

Func _Update()
	If GUICtrlRead($g_aidCheck[2]) = $GUI_CHECKED Then
		_SetBitmapAdjust($hPic, $hSrc, $g_aAdjust)
	EndIf
EndFunc   ;==>_Update

Func WM_HSCROLL($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg, $wParam

	Switch $hWnd
		Case $g_hTool
			For $i = 0 To 8
				If $g_aidSlider[$i][1] = $lParam Then
					$g_aAdjust[$i] = $g_aidSlider[$i][5] * GUICtrlRead($g_aidSlider[$i][0])
					GUICtrlSetData($g_aidSlider[$i][2], $g_aAdjust[$i])
					_Update()
					ExitLoop
				EndIf
			Next
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_HSCROLL
