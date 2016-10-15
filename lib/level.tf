;; Copyright 2004-2011 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/level.tf

/require lib/printf.tf

/def -i __med_fraction = \
	/if ({*} =~ "bardzo malo") /result 4 %;\
	/elseif ({*} =~ "malo") /result 3 %;\
	/elseif ({*} =~ "troche") /result 2 %;\
	/elseif ({*} =~ "duzo") /result 1 %;\
	/elseif ({*} =~ "bardzo duzo") /result 0 %;\
	/endif %;\
	/result 0
	
/def -i __med_licz = \
	/set __sila 1 %;\
	/set __zrecznosc 1 %;\
	/set __wytrzymalosc 1 %;\
	/set __inteligencja 1 %;\
	/set __madrosc 1 %;\
	/set __odwaga 1 %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Twa sila osiagnela polboski poziom." __sila_med_3_hilite = \
		/set __sila $$[__sila + 16] %%;\
		/purge -i __sila_med_[12]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Twa zrecznosc osiagnela polboski poziom." __zrecznosc_med_3_hilite = \
		/set __zrecznosc $$[__zrecznosc + 16] %%;\
		/purge -i __zrecznosc_med_[12]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Twa wytrzymalosc osiagnela polboski poziom." __wytrzymalosc_med_3_hilite = \
		/set __wytrzymalosc $$[__wytrzymalosc + 16] %%;\
		/purge -i __wytrzymalosc_med_[12]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Twa inteligencja osiagnela polboski poziom." __inteligencja_med_3_hilite = \
		/set __inteligencja $$[__inteligencja + 16] %%;\
		/purge -i __inteligencja_med_[12]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Twa madrosc osiagnela polboski poziom." __madrosc_med_3_hilite = \
		/set __madrosc $$[__madrosc + 16] %%;\
		/purge -i __madrosc_med_[12]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Twa odwaga osiagnela polboski poziom." __odwaga_med_3_hilite = \
		/set __odwaga $$[__odwaga + 16] %%;\
		/purge -i __odwaga_med_[12]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Masz epicka sile." __sila_med_2_hilite = \
		/set __sila $$[__sila + 5] %%;\
		/purge -i __sila_med_[13]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Masz epicka zrecznosc." __zrecznosc_med_2_hilite = \
		/set __zrecznosc $$[__zrecznosc + 5] %%;\
		/purge -i __zrecznosc_med_[13]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Masz epicka wytrzymalosc." __wytrzymalosc_med_2_hilite = \
		/set __wytrzymalosc $$[__wytrzymalosc + 5] %%;\
		/purge -i __wytrzymalosc_med_[13]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Masz epicka inteligencje." __inteligencja_med_2_hilite = \
		/set __inteligencja $$[__inteligencja + 5] %%;\
		/purge -i __inteligencja_med_[13]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Masz epicka madrosc." __madrosc_med_2_hilite = \
		/set __madrosc $$[__madrosc + 5] %%;\
		/purge -i __madrosc_med_[13]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Masz epicka odwage." __odwaga_med_2_hilite = \
		/set __odwaga $$[__odwaga + 5] %%;\
		/purge -i __odwaga_med_[13]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Wydaje ci sie, ze ((bardzo |)(malo|duzo)|troche) ci brakuje, zebys mogl wyzej ocenic swa sile\.$$" __sila_med_1_hilite = \
		/set __sila $$[__sila + __med_fraction({P1})] %%;\
		/purge -i __sila_med_[23]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Wydaje ci sie, ze ((bardzo |)(malo|duzo)|troche) ci brakuje, zebys mogl wyzej ocenic swa zrecznosc\.$$" __zrecznosc_med_1_hilite = \
		/set __zrecznosc $$[__zrecznosc + __med_fraction({P1})] %%;\
		/purge -i __zrecznosc_med_[23]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Wydaje ci sie, ze ((bardzo |)(malo|duzo)|troche) ci brakuje, zebys mogl wyzej ocenic swa wytrzymalosc\.$$" __wytrzymalosc_med_1_hilite = \
		/set __wytrzymalosc $$[__wytrzymalosc + __med_fraction({P1})] %%;\
		/purge -i __wytrzymalosc_med_[23]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Wydaje ci sie, ze ((bardzo |)(malo|duzo)|troche) ci brakuje, zebys mogl wyzej ocenic swa inteligencje\.$$" __inteligencja_med_1_hilite = \
		/set __inteligencja $$[__inteligencja + __med_fraction({P1})] %%;\
		/purge -i __inteligencja_med_[23]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Wydaje ci sie, ze ((bardzo |)(malo|duzo)|troche) ci brakuje, zebys mogl wyzej ocenic swa madrosc\.$$" __madrosc_med_1_hilite = \
		/set __madrosc $$[__madrosc + __med_fraction({P1})] %%;\
		/purge -i __madrosc_med_[23]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Wydaje ci sie, ze ((bardzo |)(malo|duzo)|troche) ci brakuje, zebys mogl wyzej ocenic swa odwage\.$$" __odwaga_med_1_hilite = \
		/set __odwaga $$[__odwaga + __med_fraction({P1})] %%;\
		/purge -i __odwaga_med_[23]_hilite %;\
	/def -i -n1 -mregexp -aCyellow -p200 -t"^[> ]*Jestes ([a-z]*), ([a-z]*), ([ a-z]*), ([a-z]*), ([a-z]*) i ([a-z]*)\.$$" __cechy_med_1_hilite = \
		/if ({P1} =~ "slabiutki") /set __sila $$[__sila + 0] %%;\
		/elseif ({P1} =~ "slabowity") /set __sila $$[__sila + 5] %%;\
		/elseif ({P1} =~ "watly") /set __sila $$[__sila + 10] %%;\
		/elseif ({P1} =~ "cherlawy") /set __sila $$[__sila + 15] %%;\
		/elseif ({P1} =~ "slaby") /set __sila $$[__sila + 20] %%;\
		/elseif ({P1} =~ "krzepki") /set __sila $$[__sila + 25] %%;\
		/elseif ({P1} =~ "silny") /set __sila $$[__sila + 30] %%;\
		/elseif ({P1} =~ "mocny") /set __sila $$[__sila + 35] %%;\
		/elseif ({P1} =~ "tegi") /set __sila $$[__sila + 40] %%;\
		/elseif ({P1} =~ "potezny") /set __sila $$[__sila + 45] %%;\
		/elseif ({P1} =~ "mocarny") /set __sila $$[__sila + 50] %%;\
		/elseif ({P1} =~ "tytaniczny") /set __sila $$[__sila + 55] %%;\
		/elseif ({P1} =~ "wszechmocny") /set __sila $$[__sila + 60] %%;\
		/endif %%;\
		/if ({P2} =~ "nieskoordynowany") /set __zrecznosc $$[__zrecznosc + 0] %%;\
		/elseif ({P2} =~ "niezdarny") /set __zrecznosc $$[__zrecznosc + 5] %%;\
		/elseif ({P2} =~ "niezreczny") /set __zrecznosc $$[__zrecznosc + 10] %%;\
		/elseif ({P2} =~ "niezgrabny") /set __zrecznosc $$[__zrecznosc + 15] %%;\
		/elseif ({P2} =~ "niewprawny") /set __zrecznosc $$[__zrecznosc + 20] %%;\
		/elseif ({P2} =~ "sprawny") /set __zrecznosc $$[__zrecznosc + 25] %%;\
		/elseif ({P2} =~ "zreczny") /set __zrecznosc $$[__zrecznosc + 30] %%;\
		/elseif ({P2} =~ "szybki") /set __zrecznosc $$[__zrecznosc + 35] %%;\
		/elseif ({P2} =~ "wprawny") /set __zrecznosc $$[__zrecznosc + 40] %%;\
		/elseif ({P2} =~ "zwinny") /set __zrecznosc $$[__zrecznosc + 45] %%;\
		/elseif ({P2} =~ "gibki") /set __zrecznosc $$[__zrecznosc + 50] %%;\
		/elseif ({P2} =~ "akrobatyczny") /set __zrecznosc $$[__zrecznosc + 55] %%;\
		/elseif ({P2} =~ "ekwilibrystyczny") /set __zrecznosc $$[__zrecznosc + 60] %%;\
		/endif %%;\
		/if ({P3} =~ "deliatny") /set __wytrzymalosc $$[__wytrzymalosc + 0] %%;\
		/elseif ({P3} =~ "chorowity") /set __wytrzymalosc $$[__wytrzymalosc + 5] %%;\
		/elseif ({P3} =~ "rachityczny") /set __wytrzymalosc $$[__wytrzymalosc + 10] %%;\
		/elseif ({P3} =~ "mizerny") /set __wytrzymalosc $$[__wytrzymalosc + 15] %%;\
		/elseif ({P3} =~ "kruchy") /set __wytrzymalosc $$[__wytrzymalosc + 20] %%;\
		/elseif ({P3} =~ "dobrze zbudowany") /set __wytrzymalosc $$[__wytrzymalosc + 25] %%;\
		/elseif ({P3} =~ "wytrzymaly") /set __wytrzymalosc $$[__wytrzymalosc + 30] %%;\
		/elseif ({P3} =~ "odporny") /set __wytrzymalosc $$[__wytrzymalosc + 35] %%;\
		/elseif ({P3} =~ "masywny") /set __wytrzymalosc $$[__wytrzymalosc + 40] %%;\
		/elseif ({P3} =~ "twardy") /set __wytrzymalosc $$[__wytrzymalosc + 45] %%;\
		/elseif ({P3} =~ "umiesniony") /set __wytrzymalosc $$[__wytrzymalosc + 50] %%;\
		/elseif ({P3} =~ "muskularny") /set __wytrzymalosc $$[__wytrzymalosc + 55] %%;\
		/elseif ({P3} =~ "atletyczny") /set __wytrzymalosc $$[__wytrzymalosc + 60] %%;\
		/endif %%;\
		/if ({P4} =~ "bezmyslny") /set __inteligencja $$[__inteligencja + 0] %%;\
		/elseif ({P4} =~ "ciemny") /set __inteligencja $$[__inteligencja + 5] %%;\
		/elseif ({P4} =~ "tepy") /set __inteligencja $$[__inteligencja + 10] %%;\
		/elseif ({P4} =~ "nierozumny") /set __inteligencja $$[__inteligencja + 15] %%;\
		/elseif ({P4} =~ "ograniczony") /set __inteligencja $$[__inteligencja + 20] %%;\
		/elseif ({P4} =~ "rozgarniety") /set __inteligencja $$[__inteligencja + 25] %%;\
		/elseif ({P4} =~ "pojetny") /set __inteligencja $$[__inteligencja + 30] %%;\
		/elseif ({P4} =~ "zmyslny") /set __inteligencja $$[__inteligencja + 35] %%;\
		/elseif ({P4} =~ "inteligentny") /set __inteligencja $$[__inteligencja + 40] %%;\
		/elseif ({P4} =~ "lotny") /set __inteligencja $$[__inteligencja + 45] %%;\
		/elseif ({P4} =~ "bystry") /set __inteligencja $$[__inteligencja + 50] %%;\
		/elseif ({P4} =~ "blyskotliwy") /set __inteligencja $$[__inteligencja + 55] %%;\
		/elseif ({P4} =~ "genialny") /set __inteligencja $$[__inteligencja + 60] %%;\
		/endif %%;\
		/if ({P5} =~ "glupi") /set __madrosc $$[__madrosc + 0] %%;\
		/elseif ({P5} =~ "durny") /set __madrosc $$[__madrosc + 5] %%;\
		/elseif ({P5} =~ "zacofany") /set __madrosc $$[__madrosc + 10] %%;\
		/elseif ({P5} =~ "niemadry") /set __madrosc $$[__madrosc + 15] %%;\
		/elseif ({P5} =~ "niewyksztalcony") /set __madrosc $$[__madrosc + 20] %%;\
		/elseif ({P5} =~ "roztropny") /set __madrosc $$[__madrosc + 25] %%;\
		/elseif ({P5} =~ "wyksztalcony") /set __madrosc $$[__madrosc + 30] %%;\
		/elseif ({P5} =~ "rozsadny") /set __madrosc $$[__madrosc + 35] %%;\
		/elseif ({P5} =~ "logiczny") /set __madrosc $$[__madrosc + 40] %%;\
		/elseif ({P5} =~ "madry") /set __madrosc $$[__madrosc + 45] %%;\
		/elseif ({P5} =~ "uczony") /set __madrosc $$[__madrosc + 50] %%;\
		/elseif ({P5} =~ "oswiecony") /set __madrosc $$[__madrosc + 55] %%;\
		/elseif ({P5} =~ "wszechwiedzacy") /set __madrosc $$[__madrosc + 60] %%;\
		/endif %%;\
		/if ({P6} =~ "tchorzliwy") /set __odwaga $$[__odwaga + 0] %%;\
		/elseif ({P6} =~ "strachliwy") /set __odwaga $$[__odwaga + 5] %%;\
		/elseif ({P6} =~ "bojazliwy") /set __odwaga $$[__odwaga + 10] %%;\
		/elseif ({P6} =~ "lekliwy") /set __odwaga $$[__odwaga + 15] %%;\
		/elseif ({P6} =~ "niepewny") /set __odwaga $$[__odwaga + 20] %%;\
		/elseif ({P6} =~ "zdecydowany") /set __odwaga $$[__odwaga + 25] %%;\
		/elseif ({P6} =~ "niezachwiany") /set __odwaga $$[__odwaga + 30] %%;\
		/elseif ({P6} =~ "odwazny") /set __odwaga $$[__odwaga + 35] %%;\
		/elseif ({P6} =~ "dzielny") /set __odwaga $$[__odwaga + 40] %%;\
		/elseif ({P6} =~ "nieugiety") /set __odwaga $$[__odwaga + 45] %%;\
		/elseif ({P6} =~ "mezny") /set __odwaga $$[__odwaga + 50] %%;\
		/elseif ({P6} =~ "bohaterski") /set __odwaga $$[__odwaga + 55] %%;\
		/elseif ({P6} =~ "heroiczny") /set __odwaga $$[__odwaga + 60] %%;\
		/endif %%;\
		/repeat -0.1 1 /licznik
			
/def -i licznik_opis = \
	/let a=%{1} %;\
	/let b= %;\
	/if ({a} >= 77) \
		/let b=(pb %;\
		/let c=$[{a} - 77] %;\
	/elseif ({a} >= 66) \
		/let b=(ep %;\
		/let c=$[{a} - 66] %;\
	/else \
		/return %;\
	/endif %;\
	/echo $[{c} > 0 ? strcat({b}, '+', {c}) : {b}])
	

/print_add lvl1 20 BCblue BCred
/print_add lvl2 20 BCgreen BCred
/print_add lvl3 20 BCyellow BCred

/def licznik = \
	/let i=$(/list -s licznik-${world_name}) %;\
	/if (strlen({i}) > 0) \
		/eval /licznik-${world_name} %;\
	/endif %;\
	/set __bojowki $[__sila + __zrecznosc + __wytrzymalosc] %;\
	/set __mentale $[__inteligencja + __madrosc + __odwaga] %;\
	/set __suma_cech $[__bojowki + __mentale] %;\
	/set __wspolczynnik $[(1.0 * {__bojowki}) / (1.0 * {__mentale})] %;\
	/echo %;\
	/printf_lvl1 sila %{__sila} $(/licznik_opis %{__sila}) %;\
	/printf_lvl1 zrecznosc %{__zrecznosc} $(/licznik_opis %{__zrecznosc}) %;\
	/printf_lvl1 wytrzymalosc %{__wytrzymalosc} $(/licznik_opis %{__wytrzymalosc}) %;\
	/printf_lvl1 inteligencja %{__inteligencja} $(/licznik_opis %{__inteligencja}) %;\
	/printf_lvl1 madrosc %{__madrosc} $(/licznik_opis %{__madrosc}) %;\
	/printf_lvl1 odwaga %{__odwaga} $(/licznik_opis %{__odwaga}) %;\
	/echo %;\
	/printf_lvl2 bojowki %{__bojowki} %;\
	/printf_lvl2 mentale %{__mentale} %;\
	/echo %;\
	/test $[printf_lvl3("suma cech",  {__suma_cech})]%;\
	/echo %;\
	/printf_lvl3 wspolczynnik $[substr({__wspolczynnik}, 0, 5)] %;\
	/echo


/def -i __medytuj = \
	/__med_licz %;\
	/send medytuj %;\
	/send ocen cechy %;\
	/send powstan %;\
	/send cechy %;\

