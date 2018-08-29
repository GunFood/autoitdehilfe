;Beispiel zum Problem bei @SW_MAXIMIZE (siehe Bemerkungen oben)
;resizen und beobachten, wie sich die Werte verändern und das Group-Control neu positioniert wird.
;Dann maximieren und beobachten, daß das Group-Control nicht neu positioniert wird, weil ControlGetPos immer noch die gleichen Werte wie vor der Maximierung zurückliefert.
;Nach dem Restore wird Group übrigens nochmal falsch positioniert, anscheinend nach der Position, die das Input vorher, während der Maximierung hatte.

#include <GUIConstants.au3>
$MainGUI = GUICreate("", 600, 600, -1, -1, $WS_MINIMIZEBOX + $WS_MAXIMIZEBOX + $WS_SIZEBOX)
GUIRegisterMsg($WM_SIZE, "_WM_SIZE")
$patternGroup = GUICtrlCreateGroup("", 10, 210, 570, 60)
GUICtrlSetResizing(-1, $GUI_DOCKHEIGHT + $GUI_DOCKRIGHT + $GUI_DOCKLEFT)
Global $g_idPattern = GUICtrlCreateInput("", 70, 230, 500, 30)
GUICtrlSetResizing(-1, $GUI_DOCKHEIGHT + $GUI_DOCKRIGHT + $GUI_DOCKLEFT)
GUISetState(@SW_SHOW)


Func _WM_SIZE($hWnd, $Msg, $wParam, $lParam)
	Local $InputPos = ControlGetPos($MainGUI, "", $g_idPattern)
	GUICtrlSetData($g_idPattern, "GUICtrlGetPos( Left: " & $InputPos[0] & ", Top: " & $InputPos[1] & ", Width: " & $InputPos[2] & ", Height: " & $InputPos[3] & ")")
	Local $GroupPos = ControlGetPos($MainGUI, "", $patternGroup)
	GUICtrlSetPos($patternGroup, Default, $InputPos[1] - 18, $GroupPos[2], Default)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_SIZE

While GUIGetMsg() <> -3
WEnd
