#include <WinAPIShPath.au3>

Local $aPath1 = 'C:\Documents\Test.txt'
Local $aPath2 = 'C:\Documents\Archive\Sample.txt'

ConsoleWrite('Pfad1 : ' & $aPath1 & @CRLF)
ConsoleWrite('Pfad2 : ' & $aPath2 & @CRLF)
ConsoleWrite('Präfix: ' & _WinAPI_PathCommonPrefix($aPath1, $aPath2) & @CRLF)
