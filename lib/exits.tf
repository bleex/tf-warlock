;; Copyright 2007-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/exits.tf

/set __keys_wyjscia q w e r t y u i o p

/def -i __unset_wyjscia = \
	/eval /set __wyjscia_n=$[strcat(" ")] %;\
	/eval /set __wyjscia_s=$[strcat(" ")] %;\
	/eval /set __wyjscia_e=$[strcat(" ")] %;\
	/eval /set __wyjscia_w=$[strcat(" ")] %;\
	/eval /set __wyjscia_nw=$[strcat(" ")] %;\
	/eval /set __wyjscia_sw=$[strcat(" ")] %;\
	/eval /set __wyjscia_ne=$[strcat(" ")] %;\
	/eval /set __wyjscia_se=$[strcat(" ")] %;\
	/eval /set __wyjscia_x=$[strcat(" ")] %;\
	/eval /set __wyjscia_g=$[strcat(" ")] %;\
	/eval /set __wyjscia_d=$[strcat(" ")] %;\
	/eval /set __wyjscia_reszta=$[strcat(" ")] %;\
	/purge akcja_esc_[qwertyuiop]

/__unset_wyjscia

;;/def -i __unset_wyjscia = \
;;	/let a=$(/listvar -s __wyjscia_*) %;\
;;	/let i $(/length %{a}) %;\
;;	/while ({i} > 0) \
;;		/set $(/nth %{i} %{a})=$[strcat(" ")] %;\
;;		/let i $[i - 1] %;\
;;	/done %;\
;;	/purge akcja_esc_[qwertyuiop] %;\
;;	/set __wyjscia_reszta=

/def -i __set_wyjscia = \
	/let k=1 %;\
	/while ({#} > 0) \
		/if ({1} =~ "polnoc") /set __wyjscia_n=| %;\
		/elseif ({1} =~ "poludnie") /set __wyjscia_s=| %;\
		/elseif ({1} =~ "wschod") /set __wyjscia_e=- %;\
		/elseif ({1} =~ "zachod") /set __wyjscia_w=- %;\
		/elseif ({1} =~ "polnocny-zachod") /set __wyjscia_nw=\\ %;\
		/elseif ({1} =~ "poludniowy-zachod") /set __wyjscia_sw=/ %;\
		/elseif ({1} =~ "polnocny-wschod") /set __wyjscia_ne=/ %;\
		/elseif ({1} =~ "poludniowy-wschod") /set __wyjscia_se=\\ %;\
		/elseif ({1} =~ "wyjscie") /set __wyjscia_x=X %;\
		/elseif ({1} =~ "gora") /set __wyjscia_g=U %;\
		/elseif ({1} =~ "dol") /set __wyjscia_d=D %;\
		/else \
			/let l $(/nth %{k} %{__keys_wyjscia}) %;\
			/set __wyjscia_reszta %{__wyjscia_reszta} %{l} %{1} %;\
			/eval /def akcja_esc_%{l} = /idz %{1} %;\
			/test $[++k] %;\
		/endif %;\
		/shift %;\
	/done

/def -i __set_kierunki = \
	/__unset_wyjscia %;\
	/__set_wyjscia $[replace(",", " ", replace(" i ", " ", {*}))] 


