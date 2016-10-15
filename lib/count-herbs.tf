;; Copyright 2004-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/count-herbs.tf

/def zeruj_ziola = /quote -0 /unset `/listvar -s __ziola*

/def -i __szukaj_ziol = \
	/def -aBCyellow -mregexp -n1 -p600 -t"(Znajdujesz([ a-z-]+).|Nie znajdujesz zadnych ziol.*|Nie udalo ci sie znalezc niczego interesujacego.*|Szukasz wszedzie, ale nie znajdujesz zadnych ziol.)$$"  __szukanie_patern = \
		/repeat -0 1 \
			/set __tmp %%{P2} %%%;\
			/if (regmatch("[ a-z]+", {__tmp})) \
				/__ziola_licz %%%{__tmp} %%%;\
				/let __a=$[ftime("%Y%m%d-%H:%M:%S")] %%%;\
				/echo %%%{__a} %%%{__tmp} %%%| /writefile -a log/ZIOLA-${world_name} %%%;\
				/akcja_znajdujesz %%%;\
			/endif %%%;\
			/unset __tmp %;\
	/send szukaj $[{#} ? {1} : "ziol"] 


/def -i __ziola_licz = \
	/let __a $[replace(" ", "_", replace("-", "__", {*}))] %;\
	/eval /if (!{__ziola_%{__a}}) \
		/set __ziola_ZNALEZIONE %{__ziola_ZNALEZIONE} %{__a} %%;\
	/endif %;\
	/eval /set __ziola_%{__a} $$[{__ziola_%{__a}} + 1] %;\
	/set __ziola_SUMA $[{__ziola_SUMA} + 1] %;\
	/eval /echo -aCgreen -p <<$[strrep(" ", 9)] -> @{BCyellow}%{*}@{n} --> @{Cred}(%%{__ziola_%{__a}}/%%{__ziola_SUMA})@{n} <- $[strrep(" ", 9)]>>


/def ziola = \
	/let __f $(/length %{__ziola_ZNALEZIONE}) %;\
	/echo -aBC1 Dzisiaj znalazles nastepujace ziola: %;\
	/for __g 1 %{__f} \
		/let __ziola_tmp $$(/nth %%{__g} %{__ziola_ZNALEZIONE}) %%;\
		/let __kolor $$[1 + mod({__g}, 2)] %%;\
		/let __linia $$[replace("_", " ", replace("__", "-", {__ziola_tmp}))] %%;\
		/eval /echo -p -aBC%%{__kolor} %%{__linia} $$[strrep("-", 40-strlen({__linia}))]--> $$$[strrep(" ", 4-strlen({__ziola_%%{__ziola_tmp}}))] @{Cyellow}%%%{__ziola_%%{__ziola_tmp}}/%{__ziola_SUMA}@{n}


