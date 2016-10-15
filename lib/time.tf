;; Copyright 2011 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/time.tf

;; Convert HH:MM:SS into seconds
/def -i _ts2secs = \
	/let ts %{*} %;\
	/test regmatch(':', {ts}) %;\
	/let _hrs %{PL} %;\
	/test regmatch(':', {PR}) %;\
	/let _mins %{PL} %;\
	/let _secs %{PR} %;\
	/let _result $[{_hrs}*3600 + {_mins} * 60 + {_secs}] %;\
	/result %{_result}


;; Convert seconds into HH:MM:SS
/def -i _secs2ts = \
	/let _input $[trunc({*})] %;\
	/let _hrs $[trunc({_input} / 3600)] %;\
	/let _input $[{_input} - ({_hrs} * 3600)] %;\
	/let _mins $[trunc({_input} / 60)] %;\
	/let _secs $[trunc({_input} - ({_mins} * 60))] %;\
	/let _result $[strcat(_tsz({_hrs}),':',_tsz({_mins}),':',_tsz({_secs}))] %;\
	/result '%{_result}'

;; Changes 1 -> 01, 12 -> 12 
/def -i _tsz = \
	/let _inp %{*} %;\
	/let _len $[2 - strlen({_inp})] %;\
	/let _result $[strrep('0', {_len})] %;\
	/let _result $[strcat({_result},{_inp})] %;\
	/result '%{_result}'


;; Interval between timestamps
/def interval = \
	/let _diff $[trunc(_ts2secs({2}) - _ts2secs({1}))] %;\
	/let _diff $[{_diff} > 0 ? {_diff} : 86400 + {_diff}] %;\
	/let _result $[_secs2ts({_diff})] %;\
	/result '%{_result}'
	
