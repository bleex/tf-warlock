;; Copyright 2009-2011 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/battle.tf

/require lib/printf.tf

;; Trwaja prace nad tym elementem 

/eval /set uniki=$[{uniki} ? {uniki} : 0]
/eval /set parowania=$[{parowania} ? {parowania} : 0]
/eval /set tarcze=$[{tarcze} ? {tarcze} : 0]
/eval /set oberwane=$[{oberwane} ? {oberwane} : 0]

/eval /set pudlo_unik=$[{pudlo_unik} ? {pudlo_unik} : 0]
/eval /set pudlo_parowanie=$[{pudlo_parowanie} ? {pudlo_parowanie} : 0]
/eval /set pudlo_tarcza=$[{pudlo_tarcza} ? {pudlo_tarcza} : 0]
/eval /set trafienie=$[{trafienie} ? {trafienie} : 0]

/set __bez_obrazen (pcha|tnie|uderza)

/set __jak (?:bez (?:problemu|trudu)|blyskawicznie|dokladnie|dynamicznie|gladko|ledwo|mistrzowsko|niemrawo|niepewnie|nieporadnie|niezdarnie|niezgrabnie|niezrecznie|perfekcyjnie|pewnie|plynnie|powolnie|prosto|szczesliwie|udanie|umiejetnie|wprawnie|zgrabnie|zrecznie|zwinnie|z (?:latwoscia|mozolem|trudem|wysilkiem)|)

/eval /set __jak_ciosy %{__jak}

/set __ciecia (?:gleboko tnie|(?:plytko |powierzchownie |)nacina|(?:w pol |paskudnie |)rozcina|rozplatuje|szeroko kroi|zacina)

/set __obicia (?:gruchocze|kruszy|miazdzy|muska|obija|(?:doszczetnie |)rozgniata|tlucze|(?:mocno |)uderza)

/set __klucia (?:dziurawi|plytko dzga|bolesnie kluje|nabija|(?:bolesnie|plytko) nakluwa|gleboko pcha|(?:na wylot |)przebija|przekluwa)

;; Eldaeth nacina mlecznookiego napuchnietego topielca zebatym zdobionym mieczem, trafiajac go w lewe ramie.
;;/set __bomkociecia (?:nacina|rabie|rozcina|rznie|siecze|tnie)

/eval /def -i -P1BCblue;2Cblue -w -p250 -t"^[> ]*(%{__jak}) ((%{__ciecia}|%{__obicia}|%{__klucia})sz) (.*)$$" __hilite_ciosy_moje = /test ++{trafienie}
/eval /def -i -P1BCred;2Cred -w -p250 -t"(%{__jak}) ((%{__ciecia}|%{__obicia}|%{__klucia}) cie) (.*)$$" __hilite_ciosy_we_mnie = /test ++{oberwane}
/eval /def -i -P1BCgreen;2Cgreen -w -p240 -t" (%{__jak}) (%{__ciecia}|%{__obicia}|%{__klucia}) (.*)$$" __hilite_ciosy_cudze


/eval /def -i -P1BCyellow -w -p230 -t"^[> ]*(%{__bez_obrazen}sz) (.*)$$" __hilite_bez_obrazen_moje
/eval /def -i -P1BCyellow;2Cyellow -w -p220 -t" (%{__bez_obrazen}) (cie|)" __hilite_bez_obrazen_w_ciebie

/eval /set __jak_obrona %{__jak}

/eval /def -i -P1BCyellow;2Cyellow -w -p260 -t"^[> ]*(%{__jak}) (unikasz) (?:ciecia|pchniecia|uderzenia)" __hilite_uniki_moje = /test ++{uniki}

/def -i -PCyellow -w -p260 -t"nie udaje sie trafic ciebie" __hilite_uniki_moje_2 = /test ++{uniki}
/def -i -PCyellow -w -p260 -t"lecz tobie udaje sie uniknac tego ciosu\." __hilite_uniki_moje_3 = /test ++{uniki}

/eval /def -i -P1BCyellow;2Cyellow -w -p250 -t"^[> ]*(?:[a-z]+ ){1,6}(%{__jak}) (unika) (?:ciecia|pchniecia|uderzenia)" __hilite_uniki_innych
/eval /def -i -P1BCyellow;2Cyellow -w -p250 -t"^[> ]*(?:[a-z]+ ){1,6}(%{__jak}) (unika) twojego (?:ciecia|pchniecia|uderzenia)" __hilite_uniki_pudlo = /test ++{pudlo_unik}

/eval /def -i -P1BCyellow;2Cyellow -w -p260 -t"^[> ]*(?:[a-z]+ ){1,6}wyprowadza (?:ciecie|pchniecie|uderzenie)(?: [a-z]+){1,6}, lecz (%{__jak_obrona}) (parujesz) je" __hilite_parowania_moje = /test ++{parowania}
/eval /def -i -P1BCyellow;2Cyellow -w -p250 -t"^[> ]*(?:[a-z]+ ){1,6}wyprowadza (?:ciecie|pchniecie|uderzenie)(?: [a-z]+){1,6}, lecz (?:[a-z]+ ){1,6}(%{__jak}) (paruje) je" __hilite_parowania_cudze


/eval /def -i -P1BCyellow;2Cyellow -w -p260 -t"^[> ]*Wyprowadzasz (?:ciecie|pchniecie|uderzenie)(?: [a-z]+){1,6}, lecz (?:[A-Za-z]+ ){1,6}(%{__jak}) (paruje)" __hilite_parowanie_wroga = /test ++{pudlo_parowanie}

/eval /def -i -P1Cyellow -w -p260 -t"^[> ]*Wyprowadzasz (?:ciecie|pchniecie|uderzenie)(?: [a-z]+){1,6}, lecz (?:[A-Za-z]+ ){1,6}(zastawia sie)" __hilite_tarcze_wroga = /test ++{pudlo_tarcza}

/eval /def -i -P1Cyellow -w -p260 -t"^[> ]*(?:[a-z]+ ){1,6}wyprowadza (?:ciecie|pchniecie|uderzenie)(?: [a-z]+){1,6}, lecz (zastawiasz sie)" __hilite_tarcze_moje = /test ++{tarcze}
/eval /def -i -P1Cyellow -w -p250 -t"^[> ]*(?:[a-z]+ ){1,6}wyprowadza (?:ciecie|pchniecie|uderzenie)(?: [a-z]+){1,6}, lecz (?:[a-z]+ ){1,6}(zastawia sie)" __hilite_tarcze_cudze


/def -i -P -aBCred -w -p260 -t"atakuje cie(bie|)!" __atak_hilite = /repeat -0 1 /dzwiek %; /akcja_all %; /akcja_mojaobrona %; /akcja_ctrl_trigger 2
;;/def -i -P1BCred -w -p260 -t"^[> ]*(?:[a-z]+ ){1,6}((?:ledwo muska|(?:lekko |bardzo ciezko |powaznie |)rani|masakruje) cie) " __walka_1_hilite
;;/def -i -P1Cgreen -w -p230 -t"^[> ]*(?:[a-z]+ ){1,6}(ledwo muska|(?:lekko |bardzo ciezko |powaznie |)rani|masakruje) " __walka_2_hilite
/def -i -P0BCred -w -p260 -t"(?:ledwo muska|(?:|lekko|bardzo ciezko|powaznie) rani|masakruje) cie " __walka_1_hilite = /test ++{oberwane}
/def -i -P0Cgreen -w -p230 -t"(?:ledwo muska|(?:lekko|bardzo ciezko|powaznie|) rani|masakruje) " __walka_2_hilite
/def -i -aBCyellow -w -p260 -t"Atakujesz *" __walka_6_hilite
/def -i -P -aBCyellow -w -p220 -t"wspiera cie w walce z" __walka_8_hilite
/def -i -P -aCred -w -p220 -t"w panice wybiega" __walka_9_hilite
/def -i -P0Cbgcyan -aCred -w -p260 -t"(peka|rozpada sie)\!" __zniszczenie_1_hilite = /repeat -0 1 /dzwiek
/def -i -F -P -w -p200 -t" zabil(?:[ao]|) " __zabijanie_9_hilite = \
	/repeat -0 1 \
		/echo %%;\
		/eval /echo -aCgreen -p <<$[strrep(" ", 9)] -> @{Cyellow}%{PL}%{P0}%{PR}@{n} <- $[strrep(" ", 9)]>> %%;\
		/echo


/def -i -F -aBCyellow -mregexp -w -p100 -t'^[> ]*Zabiles (.*)\.$$' __zabiles_hilite = \
	/repeat -0 1 \
		/dzwiek %%;\
        	/__frag_licz MOJE %{P1} %%;\
		/let __a=$[ftime("%Y%m%d-%H:%M:%S")] %%;\
		/echo %%{__a} %{P1} %%| /writefile -a private/log/FRAGI-${world_name} %%;\
		/akcja_all %%;\
		/akcja_zabiles %%;\
		/akcja_ctrl_trigger 1 %%;\
		/send cechy

/def -i -w -p600 -mregexp -aBCred -t"^[> ]*Udalo ci sie gdzies uciec!" __ucieczka_alarm = /repeat -0 1 /dzwiek %; /repeat -1 5 /dzwiek


/print_add defens 15 BCyellow BCred
/print_add ofens 15 BCgreen BCred

/def defens = \
	/let suma=$[{uniki}+{parowania}+{tarcze}+{oberwane}] %;\
	/printf_defens uniki %{uniki} $(/print_percent %{uniki} %{suma}) %;\
	/printf_defens parowania %{parowania} $(/print_percent %{parowania} %{suma}) %;\
	/printf_defens tarcze %{tarcze} $(/print_percent %{tarcze} %{suma}) %;\
	/printf_defens oberwane %{oberwane} $(/print_percent %{oberwane} %{suma}) %;\
	/printf_defens SUMA %{suma}

/def ofens = \
	/let suma=$[{pudlo_unik}+{pudlo_parowanie}+{pudlo_tarcza}+{trafienie}] %;\
	/printf_ofens unik %{pudlo_unik} $(/print_percent %{pudlo_unik} %{suma}) %;\
	/printf_ofens tarcza %{pudlo_tarcza} $(/print_percent %{pudlo_tarcza} %{suma}) %;\
	/printf_ofens parowanie %{pudlo_parowanie} $(/print_percent %{pudlo_parowanie} %{suma}) %;\
	/printf_ofens trafienie %{trafienie} $(/print_percent %{trafienie} %{suma}) %;\
	/printf_ofens SUMA %{suma}
	

