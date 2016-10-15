;; Copyright 2009-2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/switch.tf

/require lib/basic.tf

;; Variables
;; Global
;; __SWITCH_LIST
;; For every switch
;; __SWITCH_%{SWITCH_NAME}_ITEMS
;; __SWITCH_%{SWITCH_NAME}_ID
;; __SWITCH_%{SWITCH_NAME}_LIST
;; __SWITCH_%{SWITCH_NAME}_VAR1
;; __SWITCH_%{SWITCH_NAME}_VAR2
;; __SWITCH_%{SWITCH_NAME}_FUN
;; For every switch item
;; __SWITCH_ITEM_%{SWITCH_NAME}_%{ITEM_NAME}_LIST=function value1 value2 value3 ...


;;
;; Functions
;; /__switch_add switch_name [display attr]
;; /__switch_item_add switch_name item_name function variable1 variable2 variable3 ...
;; /switch_do switch_name [switch_to]
;; /__switch_fun switch_name

/def -i __switch_add = \
	/let _name=%{1} %;\
	/set __SWITCH_LIST=%{__SWITCH_LIST} %{_name} %;\
	/eval /set __SWITCH_%{_name}_ITEMS= %;\
	/eval /set __SWITCH_%{_name}_ID=1 %;\
	/let _attr=BCgreen %;\
	/if ({#} = 2) \
		/let _attr=%{2} %;\
	/endif %;\
	/eval /set __SWITCH_%{_name}_ATTR=%{_attr}

/def -i __switch_item_add = \
	/eval /set __SWITCH_%{1}_ITEMS=%%{__SWITCH_%{1}_ITEMS} %{2} %;\
	/let _switch=%{1} %;\
	/let _item=%{2} %;\
	/let _res= %;\
	/shift %;\
	/while (shift(), {#}) \
		/let _res=%{_res} $[textencode({1})] %;\
	/done %;\
	/eval /set __SWITCH_ITEM_%{_switch}_%{_item}_LIST=%{_res}

/def -i __switch_set_variables = \
	/let _name %{1} %;\
	/let _id 0 %;\
	/while (shift(), {#}) \
		/let _id $[++{_id}] %;\
		/eval /set __SWITCH_%{_name}_VAL%{_id} $[textdecode({1})] %;\
	/done

/def -i switch_do = \
	/let _name %{1} %;\
	/let _target=%{2} %;\
	/let _items {__SWITCH_%{_name}_ITEMS} %;\
	/let _items $[test(_items)] %;\
	/let _len $(/length %{_items}) %;\
	/let _id {__SWITCH_%{_name}_ID} %;\
	/let _id $[test(_id)] %;\
	/quote -S /unset `/listvar -s __SWITCH_%{_name}_VAL* %;\
	/if (strlen(_target) > 0) \
		/let _i=0 %;\
		/while (++{_i} <= {_len}) \
			/let _item $(/nth %{_i} %{_items}) %;\
			/if ({_item} =~ {_target}) \
				/let _id %{_i} %;\
				/break %;\
			/endif %;\
		/done %;\
	/else \
		/let _id $[{_id} == {_len} ? 1 : ++{_id}] %;\
	/endif %;\
	/eval /set __SWITCH_%{_name}_ID %{_id} %;\
	/let _item $(/nth %{_id} %{_items}) %;\
	/let _vars {__SWITCH_ITEM_%{_name}_%{_item}_LIST} %;\
	/let _vars $[test(_vars)] %;\
	/let _fun $(/car %{_vars}) %;\
	/let _fun $[textdecode(_fun)] %;\
	/eval /set __SWITCH_%{_name}_FUN %{_fun} %;\
	/let _vars $(/cdr %{_vars}) %;\
	/eval /set __SWITCH_%{_name}_LIST=%{_vars} %;\
	/__switch_set_variables %{_name} %{_vars} %;\
	/eval %{_fun} %{_vars} %;\
	/let _attr {__SWITCH_%{_name}_ATTR} %;\
	/let _attr $[test(_attr)] %;\
        /test echo("@{%{_attr}}<<< $[toupper(strcat({_name}, " ", {_item}))] >>>@{n}", "", 1)

