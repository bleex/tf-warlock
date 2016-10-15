;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/aliases.tf

/require alias.tf
/require map.tf

/def dripack = \
	/if ({_manage_bp} != 1) \
		/oop %;\
		/let i 1 %;\
	/else \
		/otworz_p %;\
	/endif %;\
	/wzp %{1} %;\
	/repeat -0 -S $[{3} ? {3} : 1] /send pociagnij lyczek z %{2} %;\
	/wdp %{1} %;\
	/if ({i} != 1) \
		/zamknij_p %;\
	/else \
		/zzp %;\
	/endif 
	

/def dri = \
	/let i %{1} %;\
	/repeat -0 -S %{i} /send napij sie %{-1}


/def daj = \
	/let tmp_imie=%{1} %;\
	/test $[wykonaj("/send daj %{arg} %{tmp_imie}", {-1})]

;; Testowanie nowych lokacji
;; Z dzialajace gagowaniem


/set __czasowniki \
	wykop, kop, trenuj, kup, przejrzyj, zamow, wejdz, przejdz, \
	wespnij sie, zlap, chwyc, zejdz, zzsun, dotknij, urwij, \
	wyskocz, zlam, zniszcz, rozwal, uderz, pomodl sie, modl sie, \
	rozsun, wsun, dosun, posun, odsun, nasun, wysun, zasun, \
	przesun, usun, rozciagnij, wciagnij, dociagnij, pociagnij, \
	odciagnij, naciagnij, wyciagnij, zaciagnij, uciagnij, wcisnij, \
	docisnij, pocisnij, odcisnij, wycisnij, zacisnij, przecisnij, \
	ucisnij, rozlacz, wlacz, polacz, odlacz, wylacz, zalacz, \
	przelacz, rozerwij, porwij, oderwij, narwij, wyrwyj, przerwij, \
	urwij, podwaz, wywaz, przewaz, roznies, wnies, donies, ponies, \
	odnies, nanies, wynies, zanies, przenies, unies, wplyn, doplyn, \
	poplyn, wyplyn, wypowiedz, przeplyn, umiesc, nadaj, wypowiedz, \


/def -i sprawdz = /test $[wykonaj("/send %{arg}", {*})]


/def -i __testuj = \
	/def -P -F -ag -p600 -t'^[> ]*Erm... Slucham?[ ]*' __gag_slucham %;\
	/eval /set __testuj_ilosc_polecen $[liczargc({*})] %;\
	/set __testuj_licznik 0 %;\
	/set secho off %;\
	/def -P -t"^" __testuj_max = \
		/set __testuj_licznik $$[__testuj_licznik + 1] %%;\
		/if ({__testuj_licznik} = {__testuj_ilosc_polecen} - 1) \
			/set secho on %%;\
			/purge __gag_slucham %%;\
			/unset __testuj_licznik %%;\
			/purge __testuj_max %%;\
		/endif %;\
	/sprawdz %{*}

/def testuj = /__testuj %{__czasowniki}

