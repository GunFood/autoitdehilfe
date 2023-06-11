#include <MsgBoxConstants.au3>
#include <WinAPIDlg.au3>

Example()

Func Example()
	Local $idButton
	GUICreate("Test")
	$idButton = GUICtrlCreateButton("testen", 0, 0)
	MsgBox($MB_SYSTEMMODAL, "ID", "Identifizierer des angegebenen Controls: " & _WinAPI_GetDlgCtrlID(GUICtrlGetHandle($idButton)))
EndFunc   ;==>Example
