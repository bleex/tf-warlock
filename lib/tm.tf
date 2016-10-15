;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/tm.tf

;; Dodawanie hilitow i aliasow
;; Uzycie: 
;;	/tm_add <imie>
;;	/tm_add <imie> <suffix_aliasow>
;;	/tm_add <opis> <suffix_aliasow>
;;	/tm_list
;;	/tm_rm <trzecia_kolumna_z_dodani>


/def tm_list = \
	/let i $(/length %{__dodani}) %;\
	/echo -aBCyellow Dodani: %;\
	/while ({i} > 0) \
		/let j $(/nth %{i} %{__dodani}) %;\
		/eval /echo -aBCgreen %{j} - %%{__%{j}_suffix} - %%{__%{j}_imie} %;\
		/test $[--i] %;\
	/done %;\
	/echo -aBCyellow Koniec
	
/def -i przypadek_add = \
	/let przypadek %{1} %;\
	/let id %{2} %;\
	/let suffix %{3} %;\
	/let imie $[tolower(strip_attr({-3}))] %;\
	/set __%{id}_%{przypadek} %{imie} %;\
	/eval /set __%{przypadek} |%{imie}%%{__%{przypadek}} %;\
	/test $[przypadek_set({przypadek})] %;\
	/eval /test $$[%{przypadek}_add({id}, {suffix}, {imie})] %;\



/def -i mianownik_add = \
	/arrow_add %{3} %;\
	/test
	
/def -i dopelniacz_add = \
	/alias dd%{2} /send dolacz do $[tolower({3})] %;\
	/alias po%{2} /send 'do $[tolower({3})] %%{*} %;\
	/test

/def -i celownik_add = \
	/alias sz%{2} /send szepnij $[tolower({3})] %%{*} %;\
	/alias daj%{2} \
		/__wykonaj_regmatch %%{*} %%;\
		/while ({P1} !~ "") \
			/let arg %%{P1} %%;\
			/send daj %%{arg} $[tolower({3})] %%;\
			/__wykonaj_regmatch %%{PR} %%;\
		/done %%;\
		/if ({P0} !~ "") \
			/let arg %%{P1} %%;\
			/send daj %%{arg} $[tolower({3})] %%;\
		/endif %;\
	/test

/def -i biernik_add = \
	/alias le%{2} /lele %{3} %;\
	/alias pp%{2} /send przejdz przed %{3} %;\
	/alias pz%{2} /send przejdz za %{3} %;\
	/alias sr%{2} /lesr %{3} %;\
	/alias we%{2} /send wesprzyj %{3} %;\
	/alias ws%{2} /send mwskaz %{3} %;\
	/alias zp%{2} /send zapros %{3} %;\
	/test

/def -i narzednik_add = \
	/alias pw%{2} /send przestan walczyc z %{3} %;\
	/test

/def -i miejscownik_add = \
	/test

/def -i przypadek_set = \
	/let przypadek %{1} %;\
	/eval /set tmp %%{__%{przypadek}} %;\
	/if (strlen({tmp}) > 1) \
		/let regexp $[strcat("(?:", substr({tmp}, 1, (strlen({tmp}) - 2)), ")")] %;\
		/eval /test $$[%{przypadek}_set({regexp})] %;\
	/else \
		/purge __%{przypadek}_* %;\
	/endif %;\
	/unset tmp

/def -i mianownik_set = \
	/let k (%{__jak}) (%{__ciecia}|%{__obicia}|%{__klucia}) %;\
	/def -PBCyellow -F -w -p100 -t"%{1}" __mianownik_imiona_hilite %;\
	/def -aBCcyan -w -mregexp -p200 -t"^[> ]*%{1} atakuje .*" __mianownik_atak_1_hilite = \
		/repeat -0 1 /dzwiek %%%; /akcja_all %%%; /akcja_atak %;\
	/def -aBCred,Cbgcyan -w -mregexp -p200 -t"^[> ]*%{1} (polegl|zgin(a|e)l)(a|)\.$$" __mianownik_smierc_1_hilite = \
		/repeat -0 1 /dzwiek %;\
	/def -aBCyellow -w -mregexp -p200 -t"^[> ]*%{1} wspiera [a-z ]* w walce z [a-z ]*" __mianownik_wsparcie_1_hilite = \
		/repeat -0 1 /dzwiek %%%; /akcja_all %%%; /akcja_wsparcie %;\
	/def -P1BCyellow;2BCblue;3Cblue -w -p260 -t"^[> ]*(%{1}) %{k}" __mianownik_ciosy_1_hilite %;\
	/def -aBCcyan -w -mregexp -p200 -t"^[> ]*%{1} zaprasza cie do swojej druzyny\.$$" __mianownik_zapraszanie_1_hilite %;\
	/def -aBCyellow -w -mregexp -p250 -t"^[> ]*(%{1}) zabil(?:a|)((?: [a-z]+){1,6})\.$$" __mianownik_zabijanie_1_hilite = \
		/repeat -0 1 \
			/dzwiek %%%;\
			/akcja_all %%%;\
			/akcja_zabil %%%;\
			/let j $$[tolower(replace(" ", "_", {P1}))] %%%;\
			/let k %%{P2} %%%;\
			/__frag_licz %%%{j} %%%{k} %%%;\
			/send cechy 


/def -i dopelniacz_set = /test
/def -i celownik_set = /test

/def -i biernik_set = \
	/let k (%{__jak}) (%{__ciecia}|%{__obicia}|%{__klucia}) %;\
	/def -P -aBCred -w -p200 -t"atakuje %{1}" __biernik_atak_2_hilite = \
		/repeat -0 1 /dzwiek %%%; /akcja_all %%%; /akcja_obrona %;\
	/def -PBCred -w -p260 -t"(ledwo muska|((lekko|(bardzo |)ciezko|powaznie) |)rani|masakruje) %{1}\." __biernik_walka_2_hilite %;\
	/def -P1BCred;2Cred;3BCyellow -w -p250 -t" %{k} (%{1}) " __biernik_ciosy_1_hilite %;\


/def -i narzednik_set = /test
/def -i miejscownik_set = /test


/def -i przypadek_rm = \
	/let przypadek %{1} %;\
	/let id %{2} %;\
	/let suffix %{3} %;\
	/eval /set tmp %%{__%{id}_%{przypadek}} %;\
	/let imie %{tmp} %;\
	/unset tmp %;\
	/eval /test $$[%{przypadek}_rm({id}, {suffix}, {imie})] %;\
	/unset __%{id}_%{przypadek} %;\
	/eval /set tmp_przypadek %%{__%{przypadek}} %;\
	/eval /set __%{przypadek} $[replace(strcat("|", {imie}, "|"), "|", {tmp_przypadek})] %;\
	/test $[przypadek_set({przypadek})] %;\
	/unset tmp_przypadek

/def -i mianownik_rm = \
	/arrow_rm %{3} %;\
	/test

/def -i dopelniacz_rm = \
	/unalias dd%{2} %;\
	/unalias po%{2} %;\
	/test

/def -i celownik_rm = \
	/unalias sz%{2} %;\
	/unalias daj%{2} %;\
	/test

/def -i biernik_rm = \
	/unalias le%{2} %;\
	/unalias pp%{2} %;\
	/unalias pz%{2} %;\
	/unalias sr%{2} %;\
	/unalias we%{2} %;\
	/unalias ws%{2} %;\
	/unalias zp%{2} %;\
	/test

/def -i narzednik_rm = \
	/unalias pw%{2} %;\
	/test

/def -i miejscownik_rm = \
	/test

/def tm_rm = \
	/if ({#} = 1) \
		/let id $[tolower({1})] %;\
		/let flag $[tm_check({id})] %;\
;; Kasowanie osoby
		/if ({flag} = 1) \
			/eval /set tmp_imie %%{__%{id}_imie} %;\
			/eval /set tmp_suffix %%{__%{id}_suffix} %;\
			/let suffix %{tmp_suffix} %;\
			/unset __%{id}_imie %;\
			/unset __%{id}_suffix %;\
			/set __dodani $(/remove %{id} %{__dodani}) %;\
			/test $[przypadek_rm("mianownik", {id}, {suffix})] %;\
			/test $[przypadek_rm("dopelniacz", {id}, {suffix})] %;\
			/test $[przypadek_rm("celownik", {id}, {suffix})] %;\
			/test $[przypadek_rm("biernik", {id}, {suffix})] %;\
			/test $[przypadek_rm("narzednik", {id}, {suffix})] %;\
			/test $[przypadek_rm("miejscownik", {id}, {suffix})] %;\
			/eval /echo -aBCgreen Kasowanie: %{id} - %{tmp_suffix} - %{tmp_imie} %;\
		/endif %;\
	/else \
		/echo -aBCred /tm_rm <imie> %;\
	/endif
	



/def tm_add = \
	/if ({#} > 0) \
		/tm_rm %{1} %;\
		/test %;\
		/if ({#} = 1) \
			/let suffix $[tolower(substr({1}, 0, 2))] %;\
			/let id $[tolower({1})] %;\
			/let imie $[tolower({1})] %;\
			/eval /set __%{id}_suffix %{suffix} %;\
			/eval /set __%{id}_imie %{imie} %;\
		/else \
			/let suffix $(/last %{*}) %;\
			/let id $[tolower({1})] %;\
			/let imie= %;\
			/while ({#} > 1) \
				/let imie=%{imie} %{1} %;\
				/shift %;\
			/done %;\
			/eval /set __%{id}_suffix $(/last %{*}) %;\
			/eval /set __%{id}_imie %{imie} %;\
		/endif %;\
		/def -n1 -w -msimple -t"Odmien <kto/co>?" __odmien_blad = /purge __catch_* %;\
		/def -n1 -F -w -mregexp -t"mianownik: ([a-z ]*)\," __catch_mianownik = \
			/przypadek_add mianownik %{id} %{suffix} %%{P1} %;\
		/def -n1 -F -w -mregexp -t"dopelniacz: ([a-z ]*)\," __catch_dopelniacz = \
			/przypadek_add dopelniacz %{id} %{suffix} %%{P1} %;\
		/def -n1 -F -w -mregexp -t"celownik: ([a-z ]*)\," __catch_celownik = \
			/przypadek_add celownik %{id} %{suffix} %%{P1} %;\
		/def -n1 -F -w -mregexp -t"biernik: ([a-z ]*)\," __catch_biernik = \
			/przypadek_add biernik %{id} %{suffix} %%{P1} %;\
		/def -n1 -F -w -mregexp -t"narzednik: ([a-z ]*)\," __catch_narzednik = \
			/przypadek_add narzednik %{id} %{suffix} %%{P1} %;\
		/def -n1 -F -w -mregexp -t"miejscownik: ([a-z ]*)\." __catch_miejscownik = \
			/przypadek_add miejscownik %{id} %{suffix} %%{P1} %%;\
			/purge __odmien_blad %%;\
			/set __dodani %{__dodani} %{id} %;\
		/send odmien %{imie} %;\
	/else \
		/echo -aBCred /tm_add <imie> [<suffix_aliasa>] %;\
	/endif


/def tm_check = \
	/let id $[tolower({1})] %;\
	/let flag 0 %;\
	/let i $(/length %{__dodani}) %;\
	/while ({i} > 0) \
		/let k $[($(/nth %{i} %{__dodani}))] %;\
		/if ({k} =~ {id}) \
			/let flag 1 %;\
			/break %;\
		/endif %;\
		/test $[--i] %;\
	/done %;\
	/result flag
	

/def tm_save = \
	/if ({#} = 1) \
		/let id $[tolower({1})] %;\
		/let flag $[tm_check({id})] %;\
		/let fname private/tm/%{id}.tf %;\
;; Zapisywanie  osoby
		/if ({flag} = 1) \
			/eval /set tmp_imie %%{__%{id}_imie} %;\
			/eval /set tmp_suffix %%{__%{id}_suffix} %;\
			/let suffix %{tmp_suffix} %;\
			/let imie %{tmp_imie} %;\
			/unset tmp_imie %; /unset tmp_suffix %;\
			/eval /echo /eval /set __%{id}_suffix %{suffix} %| /writefile -a %{fname}.tf %;\
			/eval /echo /eval /set __%{id}_imie %{imie} %| /writefile -a %{fname}.tf %;\
			/eval /set tmp %%{__%{id}_mianownik} %;\
			/eval /echo /przypadek_add mianownik %{id} %{suffix} %{tmp} %| /writefile -a %{fname}.tf %;\
			/eval /set tmp %%{__%{id}_dopelniacz} %;\
			/eval /echo /przypadek_add dopelniacz %{id} %{suffix} %{tmp} %| /writefile -a %{fname}.tf %;\
			/eval /set tmp %%{__%{id}_celownik} %;\
			/eval /echo /przypadek_add celownik %{id} %{suffix} %{tmp} %| /writefile -a %{fname}.tf %;\
			/eval /set tmp %%{__%{id}_biernik} %;\
			/eval /echo /przypadek_add biernik %{id} %{suffix} %{tmp} %| /writefile -a %{fname}.tf %;\
			/eval /set tmp %%{__%{id}_narzednik} %;\
			/eval /echo /przypadek_add narzednik %{id} %{suffix} %{tmp} %| /writefile -a %{fname}.tf %;\
			/eval /set tmp %%{__%{id}_miejscownik} %;\
			/eval /echo /przypadek_add miejscownik %{id} %{suffix} %{tmp} %| /writefile -a %{fname}.tf %;\
			/unset tmp %;\
			/eval /echo /eval /set __dodani %%%{__dodani} %{id} %| /writefile -a %{fname}.tf %;\
		/endif %;\
	/else \
		/echo -aBCred /tm_save <id> %;\
	/endif


/def tm_load = \
	/load private/tm/%{1}.tf
