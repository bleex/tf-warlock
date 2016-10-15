;; Copyright 2011 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/printf.tf

;; /print_add defensy 10 BCyellow Cred


/def print_add = \
	/let name %{1} %;\
	/let len1 %{2} %;\
	/let color1 %{3} %;\
	/let color2 %{4} %;\
	/eval /def printf_%{name} = /echo -p @{%{color1}}%%%{1} $$$[strrep("-", %{len1} - strlen({1}) - strlen({2}))]>@{n} @{%{color2}}%%%{2} %%%{3}@{n}


;; /print_percent <COUNT> <SUMM> <LENGHT>
;; /print_percent 74 79 8 ---> 93.67088%
/def print_percent = \
	/let val=%{1} %;\
	/let sum=%{2} %;\
	/let len=$[strlen({3}) ? {3} : 5] %;\
	/let fraction= %;\
	/if ({sum} == 0) \
		/let fraction=0.0 %;\
	/else \
		/let fraction=$[(100.0*{val})/(1.0*{sum})] %;\
	/endif %;\
	/echo $[substr(strcat({fraction},strrep("0",{len})),0,{len})]%%

