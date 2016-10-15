;; Copyright 2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/loot.tf

;; Pierwszy argument z odbezpieczeniem
;; Drugi z odkladaniem plecaka (if > 0)
;; Trzeci (if > 0) wraz z wycena
;; Czwarty to liczba powtorzen
;; Reszta co sprzedawac

/def __base_sprzedaj = \
	/if ({#} > 4) \
		/let l %{1} %;\
		/let k %{2} %;\
		/let j %{3} %;\
		/let i %{4} %;\
		/send otworz %{__SWITCH_pojemnik_VAL1} %;\
		/if ({k} > 0) /send poloz %{__SWITCH_pojemnik_VAL1} %; /endif %;\
		/repeat -0 -S %{i} \
			/send wez %{-4} z %{__SWITCH_pojemnik_VAL2} %%;\
			/if ({l} > 0) /send odbezpiecz %{-4} %%; /endif %%;\
			/if ({j} > 0) /send wycen %{-4} %%; /endif %%;\
			/send sprzedaj %{-4} %%;\
			/send wloz monety do %{__SWITCH_pojemnik_VAL2} %;\
		/if ({k} > 0) /send wez %{__SWITCH_pojemnik_VAL3} %; /send zaloz %{__SWITCH_pojemnik_VAL3} %; /endif %;\
		/send zamknij %{__SWITCH_pojemnik_VAL1} %;\
	/endif

/def -i __sprzedaj = \
	/__base_sprzedaj 0 0 0 %{*}

/def -i __sprzedaj_ciezkie = \
	/__base_sprzedaj 0 1 0 %{*} %;\

/def -i __wycen_sprzedaj = \
	/__base_sprzedaj 0 0 1 %{*}

/def -i __wycen_sprzedaj_ciezkie = \
	/__base_sprzedaj 0 1 1 %{*}

/def odloz = /test $[wykonaj("/send odloz %{arg}", {*})] %;\

/def zaloz = /test $[wykonaj("/send zaloz %{arg}", {*})] %;\

/def sprzedaj = /test $[wykonaj("/send sprzedaj %{arg}", replace(' i ', ',', {*}))] %;\

/def zlomuj = /test $[wykonaj("/send zlomuj %{arg}", replace(' i ', ',', {*}))] %;\


/def oop = /set _manage_bp=1 %; /send otworz %{__SWITCH_pojemnik_VAL1}

/def zzp = /set _manage_bp=0 %; /send zamknij %{__SWITCH_pojemnik_VAL1}

/def otworz_p = \
	/if ({_manage_bp} != 1) \
		/send otworz %{*} %{__SWITCH_pojemnik_VAL1} %;\
	/endif

/def zamknij_p = \
	/if ({_manage_bp} != 1) \
		/send zamknij %{*} %{__SWITCH_pojemnik_VAL1} %;\
	/endif

/def wdp = \
	/otworz_p %;\
	/test $[wykonaj("/send wloz %{arg} do %{__SWITCH_pojemnik_VAL2}", {*})] %;\
	/zamknij_p

/def wzp = \
	/otworz_p %;\
	/test $[wykonaj("/send wez %{arg} z %{__SWITCH_pojemnik_VAL2}", {*})] %;\
	/zamknij_p

/def obp = /otworz_p %;\
           /send ob %{__SWITCH_pojemnik_VAL1} %;\
	   /zamknij_p

/def napp = /otworz_p %;\
	    /send napelnij %{__SWITCH_pojemnik_VAL1} %;\
	    /zamknij_p

/def oprp = /otworz_p %;\
	    /send oproznij %{__SWITCH_pojemnik_VAL1} %;\
	    /zamknij_p


/def ooz = /set _manage_zz=1 %; /send otworz %{__SWITCH_ziola_VAL1}

/def zzz = /set _manage_zz=0 %; /send zamknij %{__SWITCH_ziola_VAL1}

/def otworz_z = \
	/if ({_manage_zz} != 1) \
		/send otworz %{*} %{__SWITCH_ziola_VAL1} %;\
	/endif

/def zamknij_z = \
	/if ({_manage_zz} != 1) \
		/send zamknij %{*} %{__SWITCH_ziola_VAL1} %;\
	/endif

/def wdz = \
	/otworz_z %;\
	/test $[wykonaj("/send wloz %{arg} do %{__SWITCH_ziola_VAL2}", {#} ? {*} : "ziola")] %;\
	/zamknij_z

/def wzz = \
	/otworz_z %;\
	/test $[wykonaj("/send wez %{arg} %{__SWITCH_ziola_VAL4} %{__SWITCH_ziola_VAL2}", {#} ? {*} : "ziola")] %;\
	/zamknij_z 

/def obz = /otworz_z %;\
	   /send ob %{__SWITCH_ziola_VAL1} %;\
	   /zamknij_z



/def oos = /set _manage_ss=1 %; /send otworz %{__SWITCH_monety_VAL1}

/def zzs = /set _manage_ss=0 %; /send zamknij %{__SWITCH_monety_VAL1}

/def otworz_s = \
	/if ({_manage_ss} != 1) \
		/send otworz %{*} %{__SWITCH_monety_VAL1} %;\
	/endif

/def zamknij_s = \
	/if ({_manage_ss} != 1) \
		/send zamknij %{*} %{__SWITCH_monety_VAL1} %;\
	/endif

/def wds = \
	/otworz_s %;\
	/test $[wykonaj("/send wloz %{arg} do %{__SWITCH_monety_VAL2}", {#} ? {*} : "monety")] %;\
	/zamknij_s

/def wzs = \
	/otworz_s %;\
	/test $[wykonaj("/send wez %{arg} z %{__SWITCH_monety_VAL2}", {#} ? {*} : "monety")] %;\
	/zamknij_s 

/def obs = /otworz_s %;\
	   /send ob %{__SWITCH_monety_VAL1} %;\
	   /zamknij_s

/def naps = /otworz_s %;\
	    /send napelnij %{__SWITCH_monety_VAL1} %;\
	    /zamknij_s 

/def oprs = /otworz_s %;\
	    /send oproznij %{__SWITCH_monety_VAL1} %;\
	    /zamknij_s


