;; Copyright 2009-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/progres.tf

/require lib/printf.tf
/require lib/time.tf

;;Poczyniles duze postepy, odkad pojawiles sie w tym swiecie.
;;Poziomy dla postepow to:
;;   znikome, minimalne, nieznaczne, male, nieduze, duze, znaczne,
;;   wspaniale, wysmienite, ogromne i fantastyczne.

/def postepy_add = \
	/if ({*}!~{postepy_last}) \
		/eval /set postepy_last=%{*} %;\
		/let postepy_time $[ftime("%H:%M:%S", time())] %;\
		/let postepy_diff $[{postepy_last_time} > 0 ? interval({postepy_last_time}, {postepy_time}) : ''] %;\
		/eval /set postepy_last_time %{postepy_time} %;\
		/eval /set postepy=%{postepy} %{postepy_last} %{postepy_last_time} %{postepy_diff}, %;\
	/endif

/print_add progress 20 BCyellow BCred

/def postepy_list = \
	/test regmatch(',', {postepy}) %;\
	/let a=%{PL} %;\
	/while ({a} !~ "") \
		/printf_progress %{a} %;\
		/test regmatch(',', {PR}) %;\
		/let a=%{PL} %;\
	/done

/def -i -mregexp -P1Cbgred,Cblack -p400 -t'^[> ]*Poczyniles (znikome|minimalne|nieznaczne|male|nieduze|spore|duze|znaczne|wspaniale|wysmienite|ogromne|fantastyczne) postepy, odkad pojawiles sie w tym swiecie\.$' __postepy_hilite = /repeat -0 1 /postepy_add %{P1}


