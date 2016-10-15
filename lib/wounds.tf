;; Copyright 2013 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/wounds.tf

/def wounds_add = \
	/let stars %{1} %;\
	/let num %{2} %;\
	/let wounds_lvl $[textencode({-2})] %;\
	/eval /set __WOUNDS_STR_%{wounds_lvl}=%{stars} %;\
	/eval /set __WOUNDS_LVL_%{wounds_lvl}=$[strlen({num}) = 2 ? {num} : strcat(' ', {num})] %;\
	/eval /set __WOUNDS_NUM_%{num} $$(/remove %{wounds_lvl} %%{__WOUNDS_NUM_%{num}}) %{wounds_lvl} %;\
	/eval /set __WOUNDS_ALL $$(/remove %{wounds_lvl} %%{__WOUNDS_ALL}) %{wounds_lvl} %;\
	/eval /set __WOUNDS_LEVELS $$(/remove %{num} %%{__WOUNDS_LEVELS}) %{num}

/def wounds_get = \
	/let who $[textencode(tolower({1}))] %;\
	/let wounds_lvl $[textencode({2})] %;\
	/let ret $(/eval /echo %%{__WOUNDS_STR_%{wounds_lvl}} %%{__COLOR_%{who}_LVL_%{wounds_lvl}}%{1}@{n} %{2} %%{__ARROW_%{who}_LVL_%{wounds_lvl}}) %;\
	/if ({who} =~ "jestes") \
		/eval /set kond %%{__WOUNDS_LVL_%{wounds_lvl}} %;\
	/endif %;\
	/result {ret}


/def arrow_add = \
	/let barrier %{1} %;\
	/let who $[textencode(tolower({-1}))] %;\
	/eval /set __BARRIER_%{who} %{barrier} %;\
	/let i $(/length %{__WOUNDS_LEVELS}) %;\
	/while ({i} > 0) \
		/let lvl $(/nth %{i} %{__WOUNDS_LEVELS}) %;\
		/if ({barrier} <= {lvl}) \
			/let j $(/eval /length %%{__WOUNDS_NUM_%{lvl}}) %;\
			/while ({j} > 0) \
				/let lvl_str $(/eval /nth %{j} %%{__WOUNDS_NUM_%{lvl}}) %;\
				/eval /set __ARROW_%{who}_LVL_%{lvl_str} @{Cred}<@{Cgreen}<@{Cred}<@{Cgreen}<@{Cred}<@{Cgreen}-@{Cred}-@{Cgreen}-@{Cred}-@{Cgreen}-@{Cred}-@{Cgreen}-@{Cred}-@{n} %;\
				/eval /set __COLOR_%{who}_LVL_%{lvl_str} @{BCgreen} %;\
				/test --{j} %;\
			/done %;\
		/endif %;\
		/test --{i} %;\
	/done

/def arrow_rm = \
	/let who $[textencode(tolower({*}))] %;\
	/eval /quote -0 /unset `/listvar -s __ARROW_%{who}_LVL_*


