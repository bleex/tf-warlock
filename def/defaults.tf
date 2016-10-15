;; Copyright 2004-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/defaults.tf

/require alias.tf

/echo -au -aBCyellow Laduje domyslne wartosci

;; Wlaczam autoenter

;;/enter

;; Domyslne ustawienia ekwipunku

/switch_do tryb expiarz

/switch_do monety sakiewka

/switch_do pojemnik plecak

/switch_do ziola woreczek

/switch_do swiatlo lampa

/switch_do dzwiek beep

/switch_do przemykanie brak

/switch_do skrzynia skrzynia

;; Do aktualizacji paska statusu
/set mana= 0
/set kond= 0
/set zmeczenie=0
/set pragnienie=0
/set glod=0
/set ciezar=0 
/set ochlej=  0
/set strach= 0

/e karly

/def akcja_atak = /test
/def akcja_wsparcie = /test
/def akcja_obrona = /test
/def akcja_mojaobrona = /test
/def akcja_zabil = /test
/def akcja_all = /test
;;/def akcja_zabiles = /test
;;/def akcja_zabiles = /c1 monety, kamienie %; /wdp srebrne monety, miedziane monety, kamienie
;;/def akcja_zabiles = /c1 monety %; /wdp srebrne monety, miedziane monety
;;/def akcja_zabiles = /c1 monety, kamienie, stary graniasty czarny mlot %; /wdp srebrne monety, miedziane monety, kamienie, mloty %; /kroj
;;/def akcja_zabiles = /c1 kamienie, stary graniasty czarny mlot %; /wdp kamienie, mloty %; /kroj
;;/def akcja_zabiles = /c1 monety, kamienie, szable, stary graniasty czarny mlot  %; /wdp kamienie, monety, mloty %; /napp %; /kroj
;;/def akcja_zabiles = 	/c1 monety, kamienie, szable, stary graniasty czarny mlot %;\
;;			/wdp kamienie, miedziane monety, srebrne monety, mloty %; /kroj
;;/def akcja_zabiles = /dzwiek %; /c1 monety, kamienie %; odloz miedziane monety %; /wdp monety, kamienie %; /kroj
;;/def akcja_zabiles = /dzwiek %; /c1 monety, kamienie %; /kroj %; /wdp monety, kamienie, wszystkie szczatki
/def akcja_zabiles = /dzwiek %; /c1 zlote monety, kamienie, mikstury %; wez zlote monety %; /odloz piaskowce, granity

/def akcja_move = /test
/def akcja_premove = /test



/def akcja_znajdujesz = /test

/def akcja_ziola = /test

;; Do repeata co 7 sekund

/def a = k wszystkich

;; Do funkcji dodaj

/set __mianownik |
/set __dopelniacz |
/set __celownik |
/set __biernik |
/set __narzednik |
/set __miejscownik |

/set __dodani=


/f1 /leczpa
/f2 /lecz
/f3 /leczru
/f4 /leczme
/f5 /lele siebie
/f8 /ma %; /wm %; /odloz miedziane monety %; /wmdp
/f9 /wzp srebrne monety %; odloz monety
/f10 /switch_do tryb
/f11 /switch_do skrzynia

/def akcja_kpgwiazdka = /switch_do przemykanie

/def akcja_kpslash = /stan

/def akcja_kpplus = /__kondycja_wszystkich

/def akcja_kpenter = /send ob wszystkich

/def akcja_kpminus = /send wesprzyj

/def -i akcja_ctrl_n = /test
/def -i akcja_ctrl_b = wez plecak %; zaloz plecak 
;;/def -i akcja_ctrl_v = /wez kamienie, bronie, wszystkie zbroje
/def -i akcja_ctrl_v = odloz plecak

/def -i akcja_ctrl_a = /atak
/def -i akcja_ctrl_s = trop
/def -i akcja_ctrl_q = /wmzp %; /ws %; /wmdp
/def -i akcja_ctrl_w = /akcja_ctrl_potworki 1
/def -i akcja_ctrl_e = /akcja_ctrl_potworki 2
/def -i akcja_ctrl_r = /akcja_ctrl_potworki 3
/def -i akcja_ctrl_t = /akcja_ctrl_potworki 4
/def -i akcja_ctrl_y = /akcja_ctrl_potworki 5
/def -i akcja_ctrl_u = /akcja_ctrl_potworki 6
/def -i akcja_ctrl_i = /akcja_ctrl_potworki 7
/def -i akcja_ctrl_o = /akcja_ctrl_potworki 8
/def -i akcja_ctrl_p = /akcja_ctrl_potworki 9
/def -i akcja_ctrl_d = /akcja_ctrl_bindy 1
/def -i akcja_ctrl_f = /akcja_ctrl_bindy 2
/def -i akcja_ctrl_g = /akcja_ctrl_bindy 3
/def -i akcja_ctrl_h = /akcja_ctrl_bindy 4
/def -i akcja_ctrl_j = /akcja_ctrl_bindy 5
/def -i akcja_ctrl_k = /akcja_ctrl_bindy 6
/def -i akcja_ctrl_l = /akcja_ctrl_bindy 7
;;/def -i akcja_ctrl_g = /wez kamienie, bronie, wszystkie zbroje %; /wa %; /napp

/set postepy=
/set postepy_last=brak

/arrow_add 5 jestes

/echo -au -aBCyellow Domyslne wartosci zaladowane

