;; Copyright 2004-2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/area.tf

/require lib/switch.tf

;; Uzycie /<nazwa_expowiska>
;; Podstawia pod CTRL+[qwertyu] ustawianie kolejnych potworkow pod zmienne do aliasow 
;; na zaslanianie, atakowanie ....
;; a pod CTRL+[asdfghj] atakowanie.

;; Definicja nowego expowiska 
;; /__expowisko <nazwa> <potworek1> [<potworek2>..]
;; Potworki definiujemy w pliku potwory.tf

/__switch_add expowiska Cyellow
/__switch_add expowiska_bindy Cyellow
/__switch_add expowiska_trigger Cyellow

;; Funkcja jest zdrowo pokercona ze wzgledu na ilosc $, % - zmiana tego czesto prowadzi
;; do wywalenia tf - wiec uwazac z przerobkami.

/def -i __expowisko_pot = \
	/if ({#} >= 2) \
		/__switch_item_add expowiska %{1} /noop %{-1} %;\
		/__switch_item_add expowiska_bindy %{1} /noop %;\
		/__switch_item_add expowiska_trigger %{1} /noop /test /test %;\
	/else \
		/echo -au -aBCred Skladnia: /__expowisko_pot <nazwa> <potworek1> [<potworek2>] .. %;\
	/endif
	

/def -i __expowisko_bindy = \
	/if ({#} >= 2) \
		/__switch_item_add expowiska_bindy %{1} /noop %{-1} %;\
	/else \
		/echo -au -aBCred Skladnia: /__expowisko_bindy <nazwa> <akcja_ctrl_d> [<akcja_ctrl_f>] .. %;\
	/endif

/def -i __expowisko_trigger = \
	/if ({#} >= 2) \
		/__switch_item_add expowiska_trigger %{1} /noop %{-1} %;\
	/else \
		/echo -au -aBCred Skladnia: /__expowisko_trigger <nazwa> <akcja frag>, <akcja na obrone> .. %;\
	/endif


/def akcja_ctrl_potworki = \
	/let _name __SWITCH_expowiska_VAL%{1} %;\
	/let _value $[test({_name})] %;\
	/if (strlen({_value}) > 0) \
		/eval /switch_do potworki %{_value} %;\
	/else \
		/echo <<< UNDEFINED >>> %;\
	/endif

/def akcja_ctrl_bindy = \
	/let _name __SWITCH_expowiska_bindy_VAL%{1} %;\
	/let _value $[test(_name)] %;\
	/if (strlen({_value}) > 0) \
		/eval %{_value} %;\
	/else \
		/echo <<< UNDEFINED >>> %;\
	/endif

/def akcja_ctrl_trigger = \
	/let _name __SWITCH_expowiska_trigger_VAL%{1} %;\
	/let _value $[test(_name)] %;\
	/if (strlen({_value}) > 0) \
		/eval %{_value} %;\
	/endif


/def e = \
	/eval /switch_do expowiska %{1} %;\
	/eval /switch_do expowiska_bindy %{1} %;\
	/eval /switch_do expowiska_trigger %{1} %;\
	/akcja_ctrl_potworki 1	
