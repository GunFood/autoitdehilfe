#include <WinAPIShPath.au3>

Local $aPath1 = 'C:\Documents\Text'
Local $aPath2 = '..\Test.txt'

ConsoleWrite('Pfad1   : ' & $aPath1 & @CRLF)
ConsoleWrite('Pfad2   : ' & $aPath2 & @CRLF)
ConsoleWrite('Ergebnis: ' & _WinAPI_PathAppend($aPath1, $aPath2) & @CRLF)
