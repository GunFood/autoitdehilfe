#include "Extras\HelpFileInternals.au3"

#include <Date.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $tTime

	; Erstellt die GUI
	GUICreate("Datum / Zeit", 500, 350)
	_MemoCreate(2, 2, 496, 346, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	_MemoWrite("Aktuelle lokale Zeit = " & _Now())
	_MemoWrite()

	; Zeigt aktuelle Zeitzoneninformationen
	Local $aOld = _Date_Time_GetTimeZoneInformation()
	ShowTimeZoneInformation($aOld, "Time Zone info")

	$tTime = _Date_Time_GetSystemTime() ; UTC
	; Nur Formatierung von $tTime, unabhängig von $iType
	_MemoWrite("Systemdatum/-zeit (0)       : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 0)) ; mm/dd/yyyy hh:mm:ss
	_MemoWrite("Systemdatum/-zeit (1)       : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 1)) ; yyyy/mm/dd hh:mm:ss
	_MemoWrite()

	; Zeigt Systemdatum und -zeit
	_MemoWrite("Systemdatum/-zeit (UTC)     : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 2, 1)) ; wday, nn MMM yyyy hh:mm:ss UTC : Systemzeit
	_MemoWrite("Systemdatum/-zeit (ISO8601) : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 3, 1)) ; yyyy/mm/ddThh:mm:ssZ : Systemzeit
	_MemoWrite()

	; Zeigt die lokale(s) Datum/-zeit
	$tTime = _Date_Time_GetLocalTime()
	_MemoWrite("Systemdatum (UTC)     : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 2)) ; wday, nn MMM yyyy hh:mm:ss UTC : Lokale Zeit
	_MemoWrite("Systemdatum (ISO8601) : " & _Date_Time_SystemTimeToDateTimeStr($tTime, 3)) ; yyyy/mm/ddThh:mm:ss-hh:mm : Lokale Zeit


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Show time zone information
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
	_MemoWrite("Ergebnis .............: " & $sResult)

	_MemoWrite("Aktuelles Bias .......: " & $aInfo[1])
	_MemoWrite("Standardname .........: " & $aInfo[2])
	_MemoWrite("Standarddatum/-zeit. .: " & _Date_Time_SystemTimeToDateTimeStr($aInfo[3]))
	_MemoWrite("Standard Bias.........: " & $aInfo[4])
	_MemoWrite("Tageslichtname .......: " & $aInfo[5])
	_MemoWrite("Tageslichtdatum/-zeit : " & _Date_Time_SystemTimeToDateTimeStr($aInfo[6]))
	_MemoWrite("Tageslicht Bias.......: " & $aInfo[7])
	_MemoWrite()
EndFunc   ;==>ShowTimeZoneInformation