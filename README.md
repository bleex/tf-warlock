Scripts for TinyFugue to play Warlock MUD (warlock.pl).

What is missing - private submodule


Mandatory files (assume character name: kubus):
private/private-worlds.tf:

/loaded __BLX_DEF__/private-worlds.tf
/addworld -Tlpp kubus kubus password warlock.pl 23


private/chars/kubus.tf:

/loaded __BLX_CHARS__/kubus.tf

; Load guild definition
/require guilds/jihad.tf

/set __sila 80
/set __zrecznosc 94
/set __wytrzymalosc 78
/set __inteligencja 53
/set __madrosc 44
/set __odwaga 66


/def atak = kp %; /spec_run_queue
/def akcja_mojaobrona = /spec_run_queue %; /por mezczyzna %; porownaj pierwsza szable z druga szabla
/def akcja_zabiles = /kroj %; /repeat -1 1 odloz szczatki

; Useful if Your levels exceeded levels showing exact values - but some relations are semi-constant
/def licznik-kubus = \
    /if ({__wytrzymalosc} < {__odwaga} + 12) /set __wytrzymalosc $[__odwaga + 12] %; /endif %;\
    /if ({__sila} < {__wytrzymalosc} + 2) /set __sila $[__wytrzymalosc + 2] %; /endif %;\
    /if ({__zrecznosc} < {__sila} + 14) /set __zrecznosc $[__sila + 14] %; /endif %;\
    /if ({__sila} > {__wytrzymalosc} + 3) /set __wytrzymalosc $[__sila - 3] %; /endif
