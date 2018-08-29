; Verbindet Laufwerk X mit \\myserver\stuff, wobei der aktuelle Benutzer benutzt wird
DriveMapAdd("X:", "\\myserver\stuff")

; Verbindung trennen
DriveMapDel("X:")
