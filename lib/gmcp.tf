;; Copyright 2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/gmcp.tf

;; Initial define to get some data to have foundation to work on scripts

;;/def -hGMCP gmcp_receive = \
/def -hGMCP gmcp_receive = /echo GMCP: %{*} %;\
	/if ({1} =~ "Room.Info" ) \
		/test process_room_info({-1}) %;\
	/endif


;; INFO: "wewnatrz": 0, "rodzaj": 8, "obszar": "Sithe, lokacje", "idprev": "$1$$a5SudpvkmEnsbgN4VGrpR0", "domena": "Orchia", "id": "$1$$\/u\/vtMpZQbCieNa4CYDWM1", "komenda": [ "S", "na wschod", "wschod", 1 ]

/def process_room_info = \
	/echo INFO: %{1} %;\
	/let i $[regmatch("\"wewnatrz\": ([01]), \"rodzaj\": ([0-9]+), \"obszar\": \"([^\"]+)\", \"idprev\": \"([^\"]+)\", \"domena\": \"([^\"]+)\", \"id\": \"([^\"]+)\", \"komenda\": \[ \"([^\"]+)\", \"([^\"]+)\", \"([^\"]+)\", ([0-9]+) \]", {1})] %;\
	/vecho i %;\
	/if ({i} > 0) \
		/let _id %{P6} %;\
		/let _idprev %{P4} %;\
		/let _domena %{P5} %;\
		/let _obszar %{P3} %;\
		/let _region %{P5}:%{P3} %;\
		/let _cmd %{P9} %;\
		/let _id $[textencode({_id})] %;\
		/let _idprev $[textencode({_idprev})] %;\
		/let _region $[textencode({_region})] %;\
		/let _cmd $[textencode({_cmd})] %;\
		/eval /set __MAP_DIR_%{_idprev}_%{_cmd}=%{_id} %;\
		/eval /set __MAP_REGION_%{_id}=%{_region} %;\
	/endif
