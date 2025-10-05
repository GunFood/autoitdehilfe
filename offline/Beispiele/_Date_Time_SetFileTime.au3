#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIError.au3>
#include <WinAPIFiles.au3>
#include <WinAPIHObj.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hFile, $tFile, $aTime
	Local $sTempFile = @TempDir & "\Test.xyz"

	; Erstellen der GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Erzeugen einer Test Datei und setzen der Dateizeit
	$hFile = _WinAPI_CreateFile($sTempFile, 1)
	If $hFile = 0 Then _WinAPI_ShowError("Die Datei konnte nicht erstellt werden")
	$tFile = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	Local $pFile = DllStructGetPtr($tFile)
	_Date_Time_SetFileTime($hFile, $tFile, $tFile, $tFile)
	_WinAPI_CloseHandle($hFile)

	; Liest die Dateizeit
	$hFile = _WinAPI_CreateFile($sTempFile, 2)
	If $hFile = 0 Then _WinAPI_ShowError("Die Datei konnte nicht geöffnet werden")
	$aTime = _Date_Time_GetFileTime($hFile)
	_WinAPI_CloseHandle($hFile)

	_MemoWrite("Erstellt ..: " & _Date_Time_FileTimeToStr($aTime[0]))
	_MemoWrite("Letzter Zugriff .: " & _Date_Time_FileTimeToStr($aTime[1]))
	_MemoWrite("Letzte Änderung .: " & _Date_Time_FileTimeToStr($aTime[2]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	FileDelete($sTempFile)
EndFunc   ;==>Example