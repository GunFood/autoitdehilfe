; Dies wählt Datei und dann Seite einrichten im Editor aus

WinActivate("[CLASS:Notepad]", "")
WinMenuSelectItem("[CLASS:Notepad]", "", "&Datei", "Seite ein&richten...")
