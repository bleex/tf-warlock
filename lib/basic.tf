;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/basic.tf

/def -i __numerki = \
	/def  akcja_1 = 1 %;\
	/def  akcja_2 = 2 %;\
	/def  akcja_3 = 3 %;\
	/def  akcja_4 = 4 %;\
	/def  akcja_5 = 5 %;\
	/def  akcja_6 = 6 %;\
	/def  akcja_7 = 7 %;\
	/def  akcja_8 = 8 %;\
	/def  akcja_9 = 9 %;\
	/def  akcja_0 = 0 %;\


/def -i __keypad = \
	/def -i __kp_exit = /idz wyjscie %;\
	/def -i __kp_dd = /idz d %;\
	/def -i __kp_sw = /idz sw %;\
	/def -i __kp_ss = /idz s %;\
	/def -i __kp_se = /idz se %;\
	/def -i __kp_ww = /idz w %;\
	/def -i __kp_uu = /idz u %;\
	/def -i __kp_ee = /idz e %;\
	/def -i __kp_nw = /idz nw %;\
	/def -i __kp_nn = /idz n %;\
	/def -i __kp_ne = /idz ne %;\

/__keypad




;; Sposob uzycia:
;; /def _nowa_funkcja = /test $[wykonaj("<polecenie>", "<lista argumentow>")]
;; Argumenty w poleceniu reprezentuje zmienna lokalna arg
;; Przyklad:
;; /def aa = /test $[wykonaj("/echo %{arg}", "aa, bb")]
;; /aa
;; Wykona kolejno:
;; /echo aa
;; /echo bb


/def wykonaj = \
	/let polecenie %{1} %;\
	/shift %;\
	/__wykonaj_regmatch $[replace(" i ", ", ", {*})] %;\
	/while ({P1} !~ "") \
		/let arg %{P1} %;\
		/eval /eval %{polecenie} %;\
		/__wykonaj_regmatch %{PR} %;\
	/done %;\
	/if ({P0} !~ "") \
		/let arg %{P1} %;\
		/eval /eval %{polecenie} %;\
	/endif

/def -i __wykonaj_regmatch = /test regmatch('([a-z0-9A-Z ]+)([^a-z0-9A-Z ]|)', {*})

/def -i liczargc = \
	/set __argc 0 %;\
	/test wykonaj("/test ++__argc ", {*}) %;\
	/return %{__argc}

/def -i insert_to_list = \
	/let word %{2} %;\
	/let pos %{1} %;\
	/let res= %;\
	/let i 0 %;\
	/if (0 = {pos}) \
		/shift %;\
		/let res %{*} %;\
		/result "%{res}" %;\
	/endif %;\
	/shift %;\
	/while (shift(), {#}) \
		/test $[++i] %;\
		/if ({i} = {pos}) \
			/let res %{res} %{word} %{*} %;\
			/result "%{res}" %;\
		/endif %;\
		/let res %{res} %{1} %;\
	/done %;\
	/let res %{res} %{word} %;\
	/result "%{res}" 

/def -i noop = /test

/def -i contains = \
	/let _word=%{1} %;\
	/while (shift(), {#}) \
		/if (_word =~ {1}) \
			/result 1 %;\
		/endif %;\
	/done %;\
	/result 0

/def -i maxlen = \
	/let _len=0 %;\
	/let _max=0 %;\
	/while ({#}) \
		/let _len=$[strlen({1})] %;\
		/if ({_len} > {_max}) /let _max %{_len} %; /endif %;\
		/shift %;\
	/done %;\
	/result %{_max}

/def vecho = \
	/let name=%{1} %;\
	/let value={%{name}} %;\
	/let value=$[test({value})] %;\
	/echo %{name} - %{value}

