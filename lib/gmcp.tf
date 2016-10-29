;; Copyright 2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/gmcp.tf

;; Initial define to get some data to have foundation to work on scripts

/set GMCP_DEBUG=0

/def gdebug = \
	/let _lv %{1} %;\
	/let _msg %{-1} %;\
	/if ({GMCP_DEBUG} >= {_lv}) \
		/echo %{_msg} %;\
	/endif

/def -hGMCP gmcp_receive = \
	/gdebug 1 GMCP: %{*} %;\
	/if ({1} =~ "Room.Info" ) \
		/test process_room_info({-1}) %;\
	/elseif ({1} =~ "Room.Glance") \
		/test process_room_glance({-1}) %;\
	/endif


;; INFO: "wewnatrz": 0, "rodzaj": 8, "obszar": "Sithe, lokacje", "idprev": "$1$$a5SudpvkmEnsbgN4VGrpR0", "domena": "Orchia", "id": "$1$$\/u\/vtMpZQbCieNa4CYDWM1", "komenda": [ "S", "na wschod", "wschod", 1 ]

/def process_room_info = \
	/gdebug 2 INFO: %{1} %;\
	/let i $[regmatch("\"wewnatrz\": ([01]), \"rodzaj\": ([0-9]+), \"obszar\": \"([^\"]+)\", \"idprev\": \"([^\"]+)\", \"domena\": \"([^\"]+)\", \"id\": \"([^\"]+)\", \"komenda\": \[ \"([^\"]*)\", \"([^\"]*)\", \"([^\"]*)\", ([0-9]+) \]", {1})] %;\
	/if ({i} == 11) \
		/let _id %{P6} %;\
		/let _idprev %{P4} %;\
		/let _domena %{P5} %;\
		/let _obszar %{P3} %;\
		/let _region %{P5}:%{P3} %;\
		/let _cmd %{P9} %;\
		/let _id $[textencode({_id})] %;\
		/let _idprev $[textencode({_idprev})] %;\
		/let _region $[textencode({_region})] %;\
		/let _obszar $[textencode({_obszar})] %;\
		/let _domena $[textencode({_domena})] %;\
		/let _cmd $[textencode({_cmd})] %;\
		/eval /set __MAP_DIR_%{_idprev}_%{_cmd}=%{_id} %;\
		/eval /set __MAP_REGION_%{_id}=%{_region} %;\
	/else \
		/echo -aBCred GMCP:INFO ERROR: %{1} %;\
	/endif

;; GMCP: Room.Glance { "usluga": 7, "nazwa": "Wnetrze gospody w Impur-kir", "drzwi": [ ], "wyjscia": [ "wyjscie", "schodki" ], "id": "$1$$2Xg49pqan8dJFF6Kfq9KB1" }
;; GMCP: Room.Glance { "usluga": 6, "nazwa": "Na placu w Impur-kir", "drzwi": [ ], "wyjscia": [ "polnoc", "wschod", "poludnie", "zachod" ], "id": "$1$$MAVWHd2BQ1HPrDCtnScfv." }
;; Room.Glance { "usluga": 0, "nazwa": "Drzwi w komnacie", "drzwi": [ [ "poludniowy-wschod", 1 ] ], "wyjscia": [ "polnoc", "polnocny-wschod", "wschod", "poludnie", "zachod" ], "id": "$1$$nMAtqXBbMsqoAsGQScjQi1" }

/def process_room_glance = \
	/gdebug 2 GLANCE: %{1} %;\
	/let i $[regmatch("\"usluga\": ([0-9]+), \"nazwa\": \"([^\"]+)\", \"drzwi\": \[([^\[\]]+)\], \"wyjscia\": \[([^\[\]]+)\], \"id\": \"([^\"]+)\"", {1})] %;\
	/if ({i} == 6) \
		/let _id %{P5} %;\
		/let _nazwa %{P2} %;\
		/let _wyjscia %{P4} %;\
		/let _drzwi %{P3} %;\
		/let _id $[textencode({_id})] %;\
		/let _exits {__MAP_EXITS_%{_id}} %;\
		/let _exits $[test(_exits)] %;\
		/let _doors {__MAP_DOORS_%{_id}} %;\
		/let _doors $[test(_doors)] %;\
		/eval /set __MAP_NAME_%{_id}=%{_nazwa} %;\
		/eval /set __MAP_EXITS_%{_id}=$[process_lists({_wyjscia}, {_exits})] %;\
		/eval /set __MAP_DOORS_%{_id}=$[process_lists({_drzwi}, {_doors})] %;\
	/else \
		/echo -aBCred GMCP:GLANCE ERROR: %{1} %;\
	/endif

;; Input "polnoc", "wschod", "poludnie", "zachod"
;; Output polnoc wschod poludnie zachod
;; Input "polnocny-wschod", "poludnie"
;; Output polnocny_45_wschod poludnie
/def process_lists = \
	/let _inp %{1} %;\
	/let _current %{2} %;\
	/let _out= %;\
	/while (regmatch("\"([^\"]+)\"", {_inp}) > 0) \
		/let _inp %{PR} %;\
		/let _out %{_out} $[textencode({P1})] %;\
	/done %;\
	/let _out $(/unique %{_out} %{_current}) %;\
	/result _out


/def map_save = \
	/let fname=private/gen/$[ftime("%Y%m%d-%H%M%S", time())].tf %;\
	/listvar __MAP_* %| /writefile -a %{fname} %;\
	/echo /load %{fname} %| /writefile -a private/gen/maps.tf 

/def map_init = \
	/eval /set __MAP_CONST_$[textencode("polnoc")]_X=0 %;\
	/eval /set __MAP_CONST_$[textencode("polnoc")]_Y=1 %;\
	/eval /set __MAP_CONST_$[textencode("polnoc")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("poludnie")]_X=0 %;\
	/eval /set __MAP_CONST_$[textencode("poludnie")]_Y=-1 %;\
	/eval /set __MAP_CONST_$[textencode("poludnie")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("wschod")]_X=1 %;\
	/eval /set __MAP_CONST_$[textencode("wschod")]_Y=0 %;\
	/eval /set __MAP_CONST_$[textencode("wschod")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("zachod")]_X=-1 %;\
	/eval /set __MAP_CONST_$[textencode("zachod")]_Y=0 %;\
	/eval /set __MAP_CONST_$[textencode("zachod")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("polnocny-zachod")]_X=-1 %;\
	/eval /set __MAP_CONST_$[textencode("polnocny-zachod")]_Y=1 %;\
	/eval /set __MAP_CONST_$[textencode("polnocny-zachod")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("polnocny-wschod")]_X=1 %;\
	/eval /set __MAP_CONST_$[textencode("polnocny-wschod")]_Y=1 %;\
	/eval /set __MAP_CONST_$[textencode("polnocny-wschod")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("poludniowy-zachod")]_X=-1 %;\
	/eval /set __MAP_CONST_$[textencode("poludniowy-zachod")]_Y=-1 %;\
	/eval /set __MAP_CONST_$[textencode("poludniowy-zachod")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("poludniowy-wschod")]_X=1 %;\
	/eval /set __MAP_CONST_$[textencode("poludniowy-wschod")]_Y=-1 %;\
	/eval /set __MAP_CONST_$[textencode("poludniowy-wschod")]_Z=0 %;\
	/eval /set __MAP_CONST_$[textencode("gora")]_X=0 %;\
	/eval /set __MAP_CONST_$[textencode("gora")]_Y=0 %;\
	/eval /set __MAP_CONST_$[textencode("gora")]_Z=1 %;\
	/eval /set __MAP_CONST_$[textencode("dol")]_X=0 %;\
	/eval /set __MAP_CONST_$[textencode("dol")]_Y=0 %;\
	/eval /set __MAP_CONST_$[textencode("dol")]_Z=-1
