#include <APIDlgConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIDlg.au3>
#include <WinAPISys.au3>

If Number(_WinAPI_GetVersion()) < 6.0 Then
	MsgBox(BitOR($MB_ICONERROR, $MB_SYSTEMMODAL), 'Fehler', 'Benötigt Windows Vista oder neuer.')
	Exit
EndIf

_WinAPI_ShellOpenWithDlg(@ScriptFullPath, $OAIF_EXEC)
