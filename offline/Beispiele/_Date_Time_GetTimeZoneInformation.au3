;~ #RequireAdmin
; Die Windows API "SetTimeZoneInformation" benötigt "SeTimeZonePrivilege", so dass #RequireAdmin verwendet werden muss

#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIError.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Datum Zeit: Setzt und ermittelt die Zoneninformationen (v" & @AutoItVersion & ")", 460, 460)
	_MemoCreate(2, 2, 456, 456, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Zeigt Infos über die aktuelle Zeitzone
	Local $aOld = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aOld, "Current")

	; Setzt die neue Zeitzone. Nur Namenupdates
	If Not _Date_Time_SetTimeZoneInformation($aOld[1], "A3L CST", $aOld[3], $aOld[4], "A3L CDT", $aOld[6], $aOld[7]) Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Systemzeit kann nicht gesetzt werden" & @CRLF & @CRLF & _WinAPI_GetErrorMessage(@extended))
		Exit
	EndIf

	; Zeigt Infos über die neue Zeitzone
	Local $aNew = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aNew, "New")

	; Setzt auf originale Zeitzone zurück
	_Date_Time_SetTimeZoneInformation($aOld[1], $aOld[2], $aOld[3], $aOld[4], $aOld[5], $aOld[6], $aOld[7])

	; Zeigt Infos über die aktuelle Zeitzone
	$aOld = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aOld, "Reset")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Zeigt Details der Zeitzone an
Func ShowTimeZoneInformation(ByRef $aInfo, $sComment)
	_MemoWrite("******************* " & $sComment & " *******************")
	Local $sResult = "TIME_ZONE_ID_INVALID"
	Switch $aInfo[0]
		Case 0
			$sResult = "TIME_ZONE_ID_UNKNOWN"
		Case 1
			$sResult = "TIME_ZONE_ID_STANDARD"
		Case 2
			$sResult = "TIME_ZONE_ID_DAYLIGHT"
	EndSwitch
	_MemoWrite("Ergebnis ...................: " & $aInfo[0])
	_MemoWrite("Aktuelle Verschiebung ......: " & $aInfo[1])
	_MemoWrite("Standardname ...............: " & $aInfo[2])
	_MemoWrite("Standard Datum/Zeit ........: " & _Date_Time_SystemTimeToDateTimeStr($aInfo[3]))
	_MemoWrite("Standard Verschiebung ......: " & $aInfo[4])
	_MemoWrite("Sommerzeit Name ............: " & $aInfo[5])
	_MemoWrite("Sommerzeit Datum/Zeit ......: " & _Date_Time_SystemTimeToDateTimeStr($aInfo[6]))
	_MemoWrite("Sommerzeitverschiebung .....: " & $aInfo[7])
EndFunc   ;==>ShowTimeZoneInformation
