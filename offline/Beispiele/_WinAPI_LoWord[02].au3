Local $iLongWord = 0xFFF8FFD6
Local $iX = _WinAPI_LoWordSigned($iLongWord)
Local $iY = _WinAPI_HiWordSigned($iLongWord)
ConsoleWrite(StringFormat('X = %i, Y = %i\r\n', $iX, $iY))

Func _WinAPI_LoWordSigned($iLong)
    Local $tLong = DllStructCreate('long XY')
    Local $tShort = DllStructCreate('short X;short Y', DllStructGetPtr($tLong))
    $tLong.XY = $iLong
    Return $tShort.X
EndFunc

Func _WinAPI_HiWordSigned($iLong)
    Local $tLong = DllStructCreate('long XY')
    Local $tShort = DllStructCreate('short X;short Y', DllStructGetPtr($tLong))
    $tLong.XY = $iLong
    Return $tShort.Y
EndFunc