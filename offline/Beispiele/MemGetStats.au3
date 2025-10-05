#include <MemoryConstants.au3>
#include <MsgBoxConstants.au3>

Local $aMemStats = MemGetStats()
MsgBox($MB_OK, "Feature Request", "Verwendeter Speicher (Prozentsatz des genutzten Speichers): " & @TAB & $aMemStats[$MEM_LOAD] & '%' & @CRLF & _
		"Gesamter physikalischer RAM: " & @TAB & @TAB & $aMemStats[$MEM_TOTALPHYSRAM] & ' Kb' & @TAB & '(' & Round($aMemStats[$MEM_TOTALPHYSRAM] / 1024 / 1024, 2) & ' Gb)' & @CRLF & _
		"Verfügbarer physikalischer RAM: " & @TAB & $aMemStats[$MEM_AVAILPHYSRAM] & ' Kb' & @TAB & '(' & Round($aMemStats[$MEM_AVAILPHYSRAM] / 1024 / 1024, 2) & ' Gb)' & @CRLF & _
		"Größe des Pagefile: " & @TAB & @TAB & $aMemStats[$MEM_TOTALPAGEFILE] & ' Kb' & @TAB & '(' & Round($aMemStats[$MEM_TOTALPAGEFILE] / 1024 / 1024, 2) & ' Gb)' & @CRLF & _
		"Verfügbares Pagefile: " & @TAB & @TAB & $aMemStats[$MEM_AVAILPAGEFILE] & ' Kb' & @TAB & '(' & Round($aMemStats[$MEM_AVAILPAGEFILE] / 1024 / 1024, 2) & ' Gb)' & @CRLF & _
		"Gesamter virtueller Speicher: " & @TAB & @TAB & $aMemStats[$MEM_TOTALVIRTUAL] & ' Kb' & @TAB & '(' & Round($aMemStats[$MEM_TOTALVIRTUAL] / 1024 / 1024, 2) & ' Gb)' & @CRLF & _
		"Verfügbarer virtueller Speicher: " & @TAB & $aMemStats[$MEM_AVAILVIRTUAL] & ' Kb' & @TAB & '(' & Round($aMemStats[$MEM_AVAILVIRTUAL] / 1024 / 1024, 2) & ' Gb)')
