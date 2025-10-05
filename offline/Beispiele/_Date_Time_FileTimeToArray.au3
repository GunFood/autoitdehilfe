#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $tFile, $aFile, $sFile

	; Erstellt die GUI
	GUICreate("Zeit", 400, 300)
	_MemoCreate(2, 2, 396, 296, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Entschlüsseln der Datei Zeit
	$tFile = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	$aFile = _Date_Time_FileTimeToArray($tFile)
	$sFile = StringFormat("%02d/%02d/%04d %02d:%02d:%02d", $aFile[0], $aFile[1], $aFile[2], $aFile[3], $aFile[4], $aFile[5])
	_MemoWrite("Momentane/s Zeit/Datum .: " & $sFile)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example