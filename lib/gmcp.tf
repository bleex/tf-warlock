;; Copyright 2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/gmcp.tf

;; Initial define to get some data to have foundation to work on scripts

;;/def -hGMCP gmcp_receive = /echo GMCP: %{*} %;\
/def -hGMCP gmcp_receive = \
	/if (regmatch("Room.([a-zA-Z]+) { (.*) }$", {*}) > 0) \
		/test $[process_room({P1},{P2})] %;\
	/endif


;; INFO: "wewnatrz": 0, "rodzaj": 8, "obszar": "Sithe, lokacje", "idprev": "$1$$a5SudpvkmEnsbgN4VGrpR0", "domena": "Orchia", "id": "$1$$\/u\/vtMpZQbCieNa4CYDWM1", "komenda": [ "S", "na wschod", "wschod", 1 ]

/def process_room = \
	/if ({1} =~ "Glance") \
;;/echo GLANCE: %{2} %;\
		/test %;\
	/else \
	/if ({1} =~ "Info") \
	       /echo INFO: %{2} %;\
;;/let i $[regmatch('"wewnatrz":([0-9]), "obszar": "([a-zA-Z0-9, ]+)", "idprev": "([^\"]+)", "domena": "([a-zA-Z]+)", "id": "([^\"]+)", "komenda": .*', {2})] %;\
	       /let i $[regmatch('\"wewnatrz\"\:([0-9]), .*', {2})] %;\
	       /vecho i %;\
        /endif %;\
	/endif	       
