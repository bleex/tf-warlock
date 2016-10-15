;; Copyright 2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/specs.tf

/require lib/basic.tf
/require lib/statusbar.tf

/eval /set special_list=$[(strlen({special_list})) > 0 ? {special_list} : "" ]


/def spec_stat_add = \
	/if ({#} > 1) \
		/eval /test ++{spec_stat_%{1}_hit} %;\
	/else \
		/eval /test ++{spec_stat_%{1}_miss} %;\
	/endif %;\
	/set special_list $(/remove %{1} %{special_list}) %{1}

/print_add special_hit 18 BCblue BCblue
/print_add special_miss 18 BCyellow BCyellow

/def special_list = \
	/let i $(/length %{special_list}) %;\
	/while ({i} > 0) \
		/set tmp_name $(/nth %{i} %{special_list}) %;\
		/eval /set tmp_hit %%{spec_stat_%{tmp_name}_hit} %;\
		/eval /set tmp_miss %%{spec_stat_%{tmp_name}_miss} %;\
		/let suma=$[{tmp_hit} + {tmp_miss}] %;\
		/printf_special_hit %{tmp_name}_hit %{tmp_hit} $(/print_percent %{tmp_hit} %{suma}) %;\
		/printf_special_miss %{tmp_name}_miss %{tmp_miss} $(/print_percent %{tmp_miss} %{suma}) %;\
		/test $[--i] %;\
	/done
        

/set SPEC_IN_PROGRESS=
/set SPEC_LIST=
/set SPEC_ACTIVE=

;; Run queue if not in progress and there is special to run
/def spec_run_queue = \
	/let len=$(/length %{SPEC_LIST}) %;\
	/eval /for i 1 %{len} \
	       /let cmd $$$(/nth %%%{i} %{SPEC_LIST}) %%%;\
	       /special_run_if_ready %%%{cmd} %;\

;; Trigger queue
/def spec_enable_queue = /set SPEC_IN_PROGRESS=
;; Spec in progress
/def spec_disable_queue = /set SPEC_IN_PROGRESS=T

/def -i special_is_ready = \
	/eval /set tmp_spec_stat %%{__SPEC_%{1}_STATUS} %;\
	/let res1 $[strlen(tmp_spec_stat)] %;\
	/let res2 $[strlen(SPEC_IN_PROGRESS)] %;\
	/let res 0 %;\
	/if (({res1} == 1) & ({res2} == 0)) \
		/let res 1 %;\
	/endif %;\
	/unset tmp_spec_stat %;\
	/result %{res} %;\

/def -i special_run_if_ready = \
	/let ready $(/special_is_ready %{1}) %;\
	/if ({ready}==1) \
		/eval /__SPEC_%{1}_CMD %;\
	/endif



/def -i special_add_to_list = \
	/eval /set SPEC_LIST $(/insert_to_list %{2} %{1} %{SPEC_LIST})

/def -i special_set_command = \
	/eval /def -i __SPEC_%{1}_CMD = /spec_disable_queue %%%; %{-1}

/def -i special_set_alias = \
	/eval /alias %{2} /__SPEC_%{1}_CMD %%%{*}

/def -i special_set_status_line = \
	/eval /def -i __SPEC_%{1}_ENABLE = /set __SPEC_%{1}_STATUS %{2} %;\
	/eval /def -i __SPEC_%{1}_DISABLE = /unset __SPEC_%{1}_STATUS %;\
	/eval /__SPEC_%{1}_ENABLE %;\
	/status_add -Bpoczta -r1 -s1 -x SPEC_IN_PROGRESS:1:Ccyan %;\
	/eval /status_add -BSPEC_IN_PROGRESS -r1 -s1 -x __SPEC_%{1}_STATUS:1:Cred

/def -i special_set_active = \
	/set SPEC_ACTIVE=%{1}

/def -i special_unset_active = \
	/set SPEC_ACTIVE=

/def -i spec_enable_active = \
	/if (strlen({SPEC_ACTIVE}) > 0) \
		/spec_enable %{SPEC_ACTIVE} %;\
	/endif


/def spec_enable = \
	/eval /__SPEC_%{1}_ENABLE

/def spec_disable = \
	/eval /__SPEC_%{1}_DISABLE


;;;; /test $[special_add(name, ready_message, missing_target, start_message, exec_message, priority, symbol, command, alias for special)]
/def special_add = \
	/let tmp_spec_name=%{1}%;\
	/let tmp_spec_ready_msg="%{2}"%;\
	/let tmp_spec_missing_msg="%{3}"%;\
	/let tmp_spec_begin_msg="%{4}"%;\
	/let tmp_spec_exec_msg="%{5}"%;\
	/let tmp_spec_pri=%{6}%;\
	/let tmp_spec_symbol=%{7}%;\
	/let tmp_spec_exec=%{8}%;\
	/let tmp_spec_alias=%{9}%;\
	/eval /special_add_to_list %{tmp_spec_name} %{tmp_spec_pri} %;\
	/eval /special_set_command %{tmp_spec_name} %{tmp_spec_exec} %;\
	/eval /special_set_alias %{tmp_spec_name} %{tmp_spec_alias} %;\
	/eval /special_set_status_line %{tmp_spec_name} %{tmp_spec_symbol} %;\
	/eval /def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t%{tmp_spec_ready_msg} __spec_%{tmp_spec_name}_ready = /__SPEC_%{tmp_spec_name}_ENABLE %%%; /spec_run_queue %;\
	/eval /def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t%{tmp_spec_missing_msg} __spec_%{tmp_spec_name}_missing_target = /__SPEC_%{tmp_spec_name}_ENABLE %%%; /spec_enable_queue %%%; /spec_run_queue %;\
	/eval /def -i -aCmagenta -mregexp -p300 -w -t%{tmp_spec_begin_msg} __spec_%{tmp_spec_name}_begin_exec = /spec_disable %{tmp_spec_name} %%%; /spec_disable_queue %{tmp_spec_name} %%%; /special_set_active %{tmp_spec_name} %;\
	/eval /def -i -aCmagenta -P1xCblue;2xCyellow -mregexp -p300 -w -t%{tmp_spec_exec_msg} __spec_%{tmp_spec_name}_exec = /spec_enable_queue %{tmp_spec_name} %%%; /spec_run_queue %%%; /special_unset_active %%%; /spec_stat_add %{tmp_spec_name} %%%{P1} %;\
	/purge -i __spec_all_notarget %;\
	/purge -i __spec_all_missing_target %;\
	/purge -i __spec_all_busy %;\
	/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t'^[> ]*Ale ty z nikim nie walczysz\.$$' __spec_all_notarget = /spec_enable_queue %;\
	/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t'^[> ]*Ale ty juz nie walczysz z' __spec_all_missing_target = /spec_enable_active %%; /spec_enable_queue %%; /spec_run_queue %;\
	/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t'^[> ]*W tej chwili wykonujesz inna czynnosc\. Przerwij ja by moc zrobic to, co chcesz\.$$' __spec_all_busy = /spec_enable_queue

;; Docs
;;
;; Czujesz, ze mozesz znowu kogos ciac - tmp_spec_ready_msg - enable spec, run queue
;; Nie mozesz ciac przeciwnika, ktory  - tmp_spec_missing_msg - enable spec, disable spec in progress, run queue
;; Przygotowujesz sie do zadania ciecia - tmp_spec_begin_msg - enable spec in progress
;; Bierzesz krotki rozbieg i wyskakujesz - tmp_spec_exec_msg - run queue
	
