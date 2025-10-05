#include "Extras\WM_NOTIFY.au3"

#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiTreeView.au3>
#include <StructureConstants.au3>
#include <WindowsNotifsConstants.au3>
#include <WindowsStylesConstants.au3>

Global $g_idTreeView

Example()

Func Example()
	GUICreate("TreeView: Item anklicken (v" & @AutoItVersion & ")", 400, 300)
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	$g_idTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	Local $hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUICtrlTreeView_SetNormalImageList($g_idTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($g_idTreeView)
	Local $hItem, $iImage
	For $x = 0 To 5
		$ahItem = _GUICtrlTreeView_Add($g_idTreeView, 0, StringFormat("[%02d] Neues Item", $x), $iImage, $iImage)
		For $y = 0 To 3
			$iImage = Random(0, 5, 1)
			_GUICtrlTreeView_AddChild($g_idTreeView, $ahItem, StringFormat("[%02d] Neues Child", $y), $iImage, $iImage)
		Next
	Next
	_GUICtrlTreeView_EndUpdate($g_idTreeView)

	_GUICtrlTreeView_ClickItem($g_idTreeView, $ahItem, "left", False, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndTreeview = $g_idTreeView
	$hWndTreeview = $g_idTreeView
	If Not IsHWnd($g_idTreeView) Then $hWndTreeview = GUICtrlGetHandle($g_idTreeView)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTreeview
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat mit der linken Maustaste innerhalb des Controls geklickt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgeführt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
				Case $NM_RCLICK ; Der Benutzer hat mit der rechten Maustaste innerhalb des Controls geklickt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
				Case $NM_RDBLCLK ; Der Benutzer hat einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgeführt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
