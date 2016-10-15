;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/statusbar.tf

;; Zmienne napisowe na pasku - potrzebne do kolorowania

/set __label_max3 (3)
/set __label_max4 (4)
/set __label_max5 (5)
/set __label_max6 (6)
/set __label_max7 (7)
/set __label_max8 (8)
/set __label_max9 (9)
/set __label_max10 (10)
/set __label_max11 (11)
/set __label_max12 (12)
/set __label_max13 (13)
/set __label_max14 (14)
/set __label_max15 (15)
/set __label_max16 (16)
/set __label_max17 (17)
/set __label_opi opi
/set __label_pi pi
/set __label_je je
/set __label_obc obc
/set __label_zme zme 
/set __label_man man
/set __label_kon kon 
/set __label_tr tr 
/set __label_srodek #
/set __label_str str

/set status_height=3

/def -i status_clean = \
	/for i 0 (status_height-1) \
		/let j=$$[status_fields(i)] %%;\
		/while ({j} !~ "") \
			/status_rm -r%%{i} %%;\
			/let j=$$[status_fields(i)] %%;\
		/done

/status_clean

;; Roza wiatrow

/status_add -s0 -r0 __wyjscia_nw:1:BCred
/status_add -s0 -r0 __wyjscia_n:1:BCred
/status_add -s0 -r0 __wyjscia_ne:1:BCred
/status_add -s0 -r1 __wyjscia_w:1:BCred
/status_add -s0 -r1 __label_srodek:1:BCred
/status_add -s0 -r1 __wyjscia_e:1:BCred
/status_add -s0 -r2 __wyjscia_sw:1:BCred
/status_add -s0 -r2 __wyjscia_s:1:BCred
/status_add -s0 -r2 __wyjscia_se:1:BCred

/status_add -s2 -r0 __wyjscia_g:1:BCred
/status_add -s2 -r1 __wyjscia_x:1:BCred
/status_add -s2 -r2 __wyjscia_d:1:BCred

/status_add -s2 -r2 __wyjscia_reszta::BCred

/status_add -s3 @world:12
/status_add -s0 __label_str:4:Cgray10
/status_add -s0 strach:2:Cgray16
/status_add -s0 __label_max12:4:Cgray10
/status_add -s0 __label_opi:4:Cwhite
/status_add -s0 ochlej:3:BCwhite
/status_add -s0 __label_max8:3:Cwhite
/status_add -s0 __label_pi:3:Cmagenta
/status_add -s0 pragnienie:1:B,Cmagenta
/status_add -s0 __label_max3:3:Cmagenta
/status_add -s0 __label_je:3:Cgreen
/status_add -s0 glod:1:B,Cgreen
/status_add -s0 __label_max3:3:Cgreen
/status_add -s0 __label_obc:4:Cyellow
/status_add -s0 ciezar:1:B,Cyellow
/status_add -s0 __label_max7:3:Cyellow
/status_add -s0 __label_zme:4:Cred
/status_add -s0 zmeczenie:1:B,Cred
/status_add -s0 __label_max9:3:Cred
/status_add -s0 __label_man:4:Ccyan
/status_add -s0 mana:2:B,Ccyan
/status_add -s0 __label_max11:4:Ccyan
/status_add -s0 __label_kon:4:Cblue
/status_add -s0 kond:2:B,Cblue
/status_add -s0 __label_max13:4:Cblue
/status_add -s0 :3
/status_add -s1 -r1 objawienie:1:Cgreen
/status_add -s1 -r1 pakiet:1:Cred
/status_add -s2 -r1 poczta::Cgreen

