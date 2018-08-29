#include <FontConstants.au3>
#include <WinAPIGdi.au3>

Local Const $sFaceName = 'Arial'

ConsoleWrite($sFaceName & ' Standard => ' & _WinAPI_GetFontName($sFaceName, $FS_REGULAR) & @CRLF)
ConsoleWrite($sFaceName & ' Fett => ' & _WinAPI_GetFontName($sFaceName, $FS_BOLD) & @CRLF)
ConsoleWrite($sFaceName & ' Kursiv => ' & _WinAPI_GetFontName($sFaceName, $FS_ITALIC) & @CRLF)
ConsoleWrite($sFaceName & ' Kursiv und Fett => ' & _WinAPI_GetFontName($sFaceName, BitOR($FS_BOLD, $FS_ITALIC)) & @CRLF)
