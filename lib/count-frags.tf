;; Copyright 2004-2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/count-frags.tf

/require lib/basic.tf

/def cf_clear = /quote -0 /unset `/listvar -s __licznik*

/def -i __frag_licz = \
	/let imie %{1} %;\
	/let potworek $(/last %{*}) %;\
	/eval /if (!{__licznik_SUMA_FRAGOW_%{potworek}}) \
		/set __licznik_SFRAGOWANE_POTWORKI %{__licznik_SFRAGOWANE_POTWORKI} %{potworek} %%;\
	/endif %;\
	/eval /set __licznik_%{imie}_%{potworek} $$[{__licznik_%{imie}_%{potworek}} + 1] %;\
	/eval /set __licznik_SUMA_FRAGOW_%{potworek} $$[{__licznik_SUMA_FRAGOW_%{potworek}} + 1] %;\
	/eval /set __licznik_%{imie}_SUMA_FRAGOW $$[{__licznik_%{imie}_SUMA_FRAGOW} + 1] %;\
	/set __licznik_SUMA_FRAGOW $[{__licznik_SUMA_FRAGOW} + 1] %;\
	/echo %;\
	/eval /echo -aCgreen -p <<$[strrep(" ", 9)] -> @{BCyellow}%{imie}@{n} --> @{Cred}(%%{__licznik_%{imie}_%{potworek}}/%%{__licznik_SUMA_FRAGOW_%{potworek}})@{n} @{BCyellow}%{potworek}@{n} <- $[strrep(" ", 9)]>> %;\
	/echo



;; args: number elements 
/def -i cf_get_current = \
	/let start=%{1} %;\
	/shift %;\
	/let end=%{1} %;\
	/shift %;\
	/let res= %;\
	/while ({start} <= {end}) \
		/let current=$(/nth %{start} %{*}) %;\
		/let res=%{res} %{current} %;\
		/test ++{start} %;\
	/done %;\
	/result {res}

/def -i cf_print_table = \
	/let cft_max_mon=%{1} %;\
	/let cft_max_sum=%{2} %;\
	/let cft_max_team=%{3} %;\
	/let cft_current=%{-3} %;\
	/let cft_frags=Fragi %;\
	/let line=$[strcat({cft_frags}, strrep(" ", {cft_max_mon}-strlen({cft_frags})))] %;\
	/let cft_frags=SUMA %;\
	/let line=$[strcat({line}, strrep(" ", {cft_max_sum}-strlen({cft_frags})), {cft_frags})] %;\
	/let cft_frags_cnt=$[strlen({__licznik_SUMA_FRAGOW}) ? {__licznik_SUMA_FRAGOW} : "0"] %;\
	/let line2=$[strcat({cft_frags}, strrep(" ", {cft_max_mon}-strlen({cft_frags})))] %;\
	/let line2=$[strcat({line2}, strrep(" ", {cft_max_sum}-strlen({cft_frags_cnt})), {cft_frags_cnt})] %;\
	/let j=1 %;\
	/let max=$(/length %{cft_current}) %;\
	/while ({j} <= {max}) \
		/let cft_who=$(/nth %{j} %{cft_current}) %;\
		/let line=$[strcat({line}, strrep(" ", {cft_max_team}-strlen({cft_who})), {cft_who})]%;\
		/let cft_who_cnt={__licznik_%{cft_who}_SUMA_FRAGOW} %;\
		/let cft_who_cnt=$[test({cft_who_cnt})] %;\
		/let cft_stat=$[strlen({cft_who_cnt}) ? {cft_who_cnt} : "0" ] %;\
		/let line2=$[strcat({line2}, strrep(" ", {cft_max_team}-strlen({cft_stat})), {cft_stat})]%;\
		/test ++{j} %;\
	/done %;\
	/echo -aC2 %{line} %;\
	/echo -aC1 %{line2} %;\
	/let i=1 %;\
	/let len=$(/length %{__licznik_SFRAGOWANE_POTWORKI}) %;\
	/while ({i} <= {len}) \
		/let cft_mon=$(/nth %{i} %{__licznik_SFRAGOWANE_POTWORKI}) %;\
		/let cft_mon_cnt={__licznik_SUMA_FRAGOW_%{cft_mon}} %;\
		/let cft_mon_cnt=$[test({cft_mon_cnt})] %;\
		/let line=$[strcat({cft_mon}, strrep(" ", {cft_max_mon} - strlen({cft_mon})))] %;\
		/let line=$[strcat({line}, strrep(" ", {cft_max_sum} - strlen({cft_mon_cnt})), {cft_mon_cnt})] %;\
		/let j=1 %;\
		/while ({j} <= {max}) \
			/let cft_who=$(/nth %{j} %{cft_current}) %;\
			/let cft_who_cnt={__licznik_%{cft_who}_%{cft_mon}} %;\
			/let cft_who_cnt=$[test({cft_who_cnt})] %;\
			/let cft_stat=$[strlen({cft_who_cnt}) ? {cft_who_cnt} : "0" ] %;\
			/let line=$[strcat({line}, strrep(" ", {cft_max_team} - strlen({cft_stat})), {cft_stat})] %;\
			/test ++{j} %;\
		/done %;\
		/echo -aBC$[1 + mod({i}, 2)] %{line} %;\
		/test ++{i} %;\
	/done %;\
	/echo

;; cf_max_mon - first column length
;; cf_max_team - other columns length
;; cf_columns - number of columns left for printing stats (exluding first column)

/def  cf_list = \
	/let cf_team=MOJE %{__dodani} %;\
	/let cf_team_cnt=$(/length %{cf_team}) %;\
	/let cf_max_mon=$(/maxlen %{__licznik_SFRAGOWANE_POTWORKI} Fragi) %;\
	/let cf_min_allowed_team=$[strlen({__licznik_SUMA_FRAGOW} ? {__licznik_SUMA_FRAGOW} : 1) + 1] %;\
	/let cf_max_mon=$[{cf_max_mon} + 1] %;\
	/let cf_max_team=$(/maxlen %{cf_team}) %;\
	/let cf_max_team=$[{cf_max_team} >= {cf_min_allowed_team} ? {cf_max_team} : {cf_min_allowed_team}] %;\
	/let cf_max_team=$[{cf_max_team} + 1] %;\
	/let cf_columns=$[columns() - {cf_max_mon} - {cf_min_allowed_team} - 3] %;\
	/let cf_num_team=$[{cf_columns} / {cf_max_team}] %;\
	/let cf_start=1 %;\
	/while ({cf_start} <= {cf_team_cnt}) \
		/let cf_end=$[{cf_start} + {cf_num_team} - 1] %;\
		/let cf_current=$(/cf_get_current %{cf_start} %{cf_end} %{cf_team}) %;\
		/cf_print_table %{cf_max_mon} %{cf_min_allowed_team} %{cf_max_team} %{cf_current} %;\
		/let cf_start=$[{cf_end} + 1] %;\
	/done


