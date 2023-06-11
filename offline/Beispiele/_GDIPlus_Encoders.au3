#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIConv.au3>
#include <WinAPIHObj.au3>
#include <WindowsConstants.au3>

Global $g_idMemo, $g_aCodex, $g_hImage

Example()

Func Example()
	Local $hBitmap

	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt ein Bild für die Parameteranzeige
	$hBitmap = _ScreenCapture_Capture("", 0, 0, 1, 1)
	$g_hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; Zeigt Encoder-Parameter
	$g_aCodex = _GDIPlus_Encoders()
	ShowEncoder("Encoder")

	; Zeigt Decoder-Parameter
	$g_aCodex = _GDIPlus_Decoders()
	ShowEncoder("Decoder")

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($g_hImage)
	_WinAPI_DeleteObject($hBitmap)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Zeigt Encoder-Informationen
Func ShowEncoder($sTitle)
	Local $iI, $iJ, $iK, $sCLSID, $tData, $tParam, $tParams, $iParamSize = _GDIPlus_ParamSize()

	For $iI = 1 To $g_aCodex[0][0]
		$sCLSID = _GDIPlus_EncodersGetCLSID($g_aCodex[$iI][5])
		MemoWrite("Bild " & $sTitle & " " & $iI)
		MemoWrite("  Codec GUID ............: " & $g_aCodex[$iI][1])
		MemoWrite("  Dateiformat GUID ......: " & $g_aCodex[$iI][2])
		MemoWrite("  Codec-Name ............: " & $g_aCodex[$iI][3])
		MemoWrite("  Codec-Dll Dateiname ...: " & $g_aCodex[$iI][4])
		MemoWrite("  Codec-Dateiformat .....: " & $g_aCodex[$iI][5])
		MemoWrite("  Dateierweiterung ......: " & $g_aCodex[$iI][6])
		MemoWrite("  Mime-Typ ..............: " & $g_aCodex[$iI][7])
		MemoWrite("  Flags .................: 0x" & Hex($g_aCodex[$iI][8]))
		MemoWrite("  Version ...............: " & $g_aCodex[$iI][9])
		MemoWrite("  Signaturzähler ........: " & $g_aCodex[$iI][10])
		MemoWrite("  Signaturgröße .........: " & $g_aCodex[$iI][11])
		MemoWrite("  Signaturmuster-Zeiger .: 0x" & Hex($g_aCodex[$iI][12]))
		MemoWrite("  Signaturmasken-Zeiger .: 0x" & Hex($g_aCodex[$iI][13]))

;~ 		If $sTitle = "Decoder" Then ContinueLoop

		MemoWrite("  Parameterlistengröße...: " & _GDIPlus_EncodersGetParamListSize($g_hImage, $sCLSID))

		$tParams = _GDIPlus_EncodersGetParamList($g_hImage, $sCLSID)
		If @error Then
			MemoWrite()
			ContinueLoop
		EndIf

		MemoWrite("  Parameteranzahl. ......: " & DllStructGetData($tParams, "Count"))
		MemoWrite()

		For $iJ = 0 To DllStructGetData($tParams, "Count") - 1
			MemoWrite("  Bild " & $sTitle & " Parameter " & $iJ)
			$tParam = DllStructCreate($tagGDIPENCODERPARAM, DllStructGetPtr($tParams, "GUID") + ($iJ * $iParamSize))
			MemoWrite("    Parameter GUID ......: " & _WinAPI_StringFromGUID(DllStructGetPtr($tParam, "GUID")))
			MemoWrite("    Anzahl der Werte ....: " & DllStructGetData($tParam, "NumberOfValues"))
			MemoWrite("    Parametertyp ........: " & DllStructGetData($tParam, "Type"))
			MemoWrite("    Parameterzeiger .....: 0x" & Hex(DllStructGetData($tParam, "Values")))
			Switch DllStructGetData($tParam, "Type")
				Case 4
					$tData = DllStructCreate("int Data[" & DllStructGetData($tParam, "NumberOfValues") & "]", DllStructGetData($tParam, "Values"))
					For $iK = 1 To DllStructGetData($tParam, "NumberOfValues")
						MemoWrite("      Wert ..............: " & DllStructGetData($tData, 1, $iK))
					Next
				Case 6
					$tData = DllStructCreate("int Low;int High", DllStructGetData($tParam, "Values"))
					MemoWrite("      Bereichsanfang ....: " & DllStructGetData($tData, "Low"))
					MemoWrite("      Bereichsende ......: " & DllStructGetData($tData, "High"))
			EndSwitch
			MemoWrite()
		Next
	Next
EndFunc   ;==>ShowEncoder
