;; Copyright 2013 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/stan.tf

/def stan_add = \
	/let co %{1} %;\
	/let len %{2} %;\
	/let num %{3} %;\
	/let stan_lvl $[textencode({-3})] %;\
	/eval /set __STAN_%{co}_LVL_%{stan_lvl}=$[strlen({num}) = {len} ? {num} : strcat(strrep(' ', {len} - strlen({num})), {num})]

/def stan_set = \
	/let co %{1} %;\
	/let stan_lvl $[textencode({-1})] %;\
	/eval /set %{co}=$$(/test $$[echo({__STAN_%{co}_LVL_%{stan_lvl}})])

/def stan_helper_1 = \
	/stan_set kond %{1} %;\
	/stan_set mana %{2} %;\

/def stan_helper_2 = \
	/stan_set strach %{1} %;\
	/stan_set zmeczenie %{2} %;\

/def stan_helper_3 = \
	/stan_set pragnienie %{1} %;\
	/stan_set glod %{2} %;\

/def stan_helper_4 = \
	/stan_set ochlej %{1} %;\

/def stan_helper_5 = \
	/stan_set ciezar %{1} %;\

