#Include <GUIConstantsEx.au3>
#include <Constants.au3>
#include <WinAPI.au3>

Opt("GUIOnEventMode", 1) ; 0=ausgeschaltet, 1=OnEvent Modus aktiviert

$gui = GUICreate("Test", 100, 200, 300, 300)
GUISetOnEvent($GUI_EVENT_CLOSE, "_exit")

GUISetState()
Sleep(1000)

_WinAPI_SetWindowPos($gui, 0, 10, 20, 500, 500, $SWP_SHOWWINDOW)

While 1
	Sleep(10)
WEnd

Func _exit()
	Exit
EndFunc   ;==>_exit