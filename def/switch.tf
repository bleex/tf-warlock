;; Copyright 2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/switch.tf

/require lib/switch.tf


/def -i __mysliwy = \
	/def -i akcja_kpplus = /__kondycja_wszystkich %;\
	/def -i akcja_kpenter = /ss %;\
	/def -i akcja_kpminus = /wmc %;\
	/for i 0 9 /purge -i akcja_%%{i}

	

/def -i __zbieracz = \
	/def -i akcja_kpplus = \
			/wez bronie, kamienie, monety %%;\
			/ca bronie, monety, kamienie %%;\
			/napp %%; /wdp monety, kamienie %%;\
			%;\
	/def -i akcja_kpenter = /wmzp %%; /zmt %%; /zm %;\
	/def -i akcja_kpminus = /sb %%; /wmdp %;\
	/for i 1 9 /def akcja_%%{i} = /w%%{i} %%%; /napp %;\
	/def -i akcja_0 = /wa %%; /nap

/def -i __zielarz = \
	/def -i akcja_kpplus = /__kondycja_wszystkich %;\
	/def -i akcja_kpenter = /__szukaj_ziol %;\
	/def -i akcja_kpminus = /wdz %;\
	/for i 0 9 /purge -i akcja_%%{i} %;\
	/def  akcja_1 = zetnij drzewo %%; /repeat -0 5 ociosaj drzewo %;\
	/def  akcja_2 = /repeat -0 5 ociosaj drzewo

/def -i __dziewanniarz = \
	/def -i akcja_kpplus = /__kondycja_wszystkich %;\
	/def -i akcja_kpenter = /__szukaj_ziol dziewanny %;\
	/def -i akcja_kpminus = /wdz %;\
	/for i 0 9 /purge -i akcja_%%{i}

/def -i __expiarz = \
	/def -i akcja_kpplus = /__kondycja_wszystkich %;\
	/def -i akcja_kpenter = /send ob wszystkich %;\
	/def -i akcja_kpminus = /send wesprzyj %;\
	/purge -i akcja_0 %;\
	/def akcja_1 = kp pierwszego %;\
	/def akcja_2 = kp drugiego %;\
	/def akcja_3 = kp trzeciego %;\
	/def akcja_4 = kp czwartego %;\
	/def akcja_5 = kp piatego %;\
	/def akcja_6 = kp szostego %;\
	/def akcja_7 = kp siodmego %;\
	/def akcja_8 = kp osmego %;\
	/def akcja_9 = kp dziewiatego
	
/def -i __pocztylion = \
	/def -i akcja_kpplus = /pt %;\
	/def -i akcja_kpenter = /wpzp %%; /send ocen paczke %%; /wpdp %;\
	/def -i akcja_kpminus = /wpzpop %%; /wmdp %;\
	/for i 1 9 /def akcja_%%{i} = /wp %%{i} %%%; /wpdp %;\
	/purge -i akcja_0
	
/__switch_add tryb
/__switch_item_add tryb expiarz /__expiarz expiarz
/__switch_item_add tryb mysliwy /__mysliwy mysliwy
/__switch_item_add tryb zbieracz /__zbieracz zbieracz
/__switch_item_add tryb zielarz /__zielarz zielarz
/__switch_item_add tryb dziewanniarz /__dziewanniarz dziewanniarz
/__switch_item_add tryb pocztylion /__pocztylion pocztylion


/__switch_add monety
/__switch_item_add monety mieszek /noop mieszek mieszka mieszek mieszka
/__switch_item_add monety sakiewka /noop sakiewske sakiewki sakiewke sakiewki


/__switch_add skrzynia
/__switch_item_add skrzynia urna /noop urny urne z
/__switch_item_add skrzynia skrzynia /noop skrzyni skrzynie ze
/__switch_item_add skrzynia kufer /noop kufra kufer z
/__switch_item_add skrzynia dzban /noop dzbana dzban z
/__switch_item_add skrzynia kosz /noop kosza kosz z
/__switch_item_add skrzynia sarkofag /noop sarkofagu sarkofag z


/__switch_add pojemnik
/test $[__switch_item_add("pojemnik", "plecak", "/noop", "zalozony plecak", "zalozonego plecaka", "plecak", "plecaka")]
/test $[__switch_item_add("pojemnik", "torba", "/noop", "zalozna torbe", "zalozonej torby", "torbe", "torby")]
/test $[__switch_item_add("pojemnik", "worek", "/noop", "zalozony worek", "zalozonego worka", "worek", "worka")]
/test $[__switch_item_add("pojemnik", "sakwa", "/noop", "zalozona sakwe", "zalozonej sakwy", "sakwe", "sakwy")]


/__switch_add ziola
/__switch_item_add ziola woreczek /noop woreczek woreczka woreczki z
/__switch_item_add ziola sloik /noop sloik sloika sloiki ze
/__switch_item_add ziola plecak /noop plecak plecaka plecaki z

/__switch_add swiatlo
/__switch_item_add swiatlo lampa /noop lampa lampe
/__switch_item_add swiatlo luczywo /noop luczywo luczywo
/__switch_item_add swiatlo pochodnia /noop pochodnia pochodnie


/def -i __beep = \
	/def dzwiek = /beep

/def -i __graj1 = \
	/def dzwiek = /sys play -q media/atak1.wav &>/dev/null & /bin/true

/def -i __graj2 = \
	/def dzwiek = /sys play -q media/atak2.wav &>/dev/null & /bin/true

/def -i __cisza = \
	/def dzwiek = /noop


/__switch_add dzwiek
/__switch_item_add dzwiek cisza /__cisza cisza
/__switch_item_add dzwiek beep /__beep beep
/__switch_item_add dzwiek krotki /__graj2 krotki
/__switch_item_add dzwiek dlugi /__graj1 dlugi


/def -i __chodzenie = \
	/def idz = /akcja_premove %%; /send %%{*} %%; /akcja_move 

/def -i __przemykanie = \
	/def idz = /akcja_premove %%; /send przemknij %%{*} %%; /akcja_move

/def -i __przemykanie_druzynowe = \
	/def idz = /akcja_premove %%; /send przemknij sie z druzyna %%{*} %%; /akcja_move

/__switch_add przemykanie
/__switch_item_add przemykanie brak /__chodzenie chodzenie
/__switch_item_add przemykanie pojedyncze /__przemykanie przemykanie
/__switch_item_add przemykanie druzynowe /__przemykanie_druzynowe druzynowe

