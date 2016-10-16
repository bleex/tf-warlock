;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/aliases.tf

/require lib/aliases.tf

;; Podstawowe

/def start = \
	/send zaloz amulet %;\
;;	/send zaloz pierscien %;\
;;	/send zaloz wszystkie zbroje %;\
	/send zaloz %{__SWITCH_pojemnik_VAL3} %;\
	/oop %;\
	/send otworz sloiki %;\
	/send otworz woreczki %;\
;;	/send przypnij pochwe na plecach %;\
;;	/send przypnij druga pochwe na plecach %;\
;;	/send pwsun szable do pochwy %;\
;;	/send pwsun szable do drugiej pochwy %;\
;;	/repeat -0 -S $[{#} > 1 ? {2} : 3] \
;;		/send wloz spore zlocistozolte kwiatki do zielonkawego sloika %%;\
;;		/zzz zielonkawy %%;\
;;		/wdp zielonkawy sloik %;\
;;	/wdp zielonkawe sloiki %;\
;;	/repeat -0 -S $[{#} > 2 ? {3} : 2] \
;;		/send wloz bladozolte male kwiaty do czerwonawego sloika %%;\
;;		/send wloz brunatne grube klacza do czerwonawego sloika %%;\
;;		/send wloz ciemnopurpurowe suche kwiaty do czerwonawego sloika %%;\
;;		/send wloz czarne cuchnace grzyby do czerwonawego sloika %%;\
;;		/send wloz czerwonawe plamiste kwiatki do czerwonawego sloika %%;\
;;		/send wloz gwiazdkowate ciemnobrazowe owoce do czerwonawego sloika %%;\
;;		/send wloz lancetowate miesiste liscie do czerwonawego sloika %%;\
;;		/send wloz malutkie ciemnozielone mchy do czerwonawego sloika %%;\
;;		/send wloz nakrapiane zlocistozolte kwiatki do czerwonawego sloika %%;\
;;		/send wloz okragle czarne owoce do czerwonawego sloika %%;\
;;		/send wloz owlosione biale kwiatki do czerwonawego sloika %%;\
;;		/send wloz pofaldowane skorzaste liscie do czerwonawego sloika %%;\
;;		/send wloz rozgalezione jasnoszare korzenie do czerwonawego sloika %%;\
;;		/send wloz rozowawe lisciaste rosliny do czerwonawego sloika %%;\
;;		/send wloz spore zlocistozolte kwiatki do czerwonawego sloika %%;\
;;		/send wloz tajemnicze purpurowo-sine kwiaty do czerwonawego sloika %%;\
;;		/send wloz wlokniste brazowoszare korzenie do czerwonawego sloika %%;\
;;		/send wloz zoltozielone skorzaste rosliny do czerwonawego sloika %%;\
;;		/send zamknij czerwonawy sloik %%;\
;;		/send wloz czerwonawy sloik do %{__SWITCH_pojemnik_VAL2} %;\
;;	/send wloz czerwonawe sloiki do %{__SWITCH_pojemnik_VAL2} %;\
	/repeat -0 -S $[{#} ? {1} : 3] \
		/wdz %%;\
		/wdp %{__SWITCH_ziola_VAL1} %;\
	/send przypnij %{__SWITCH_monety_VAL1} do pasa %;\
	/wpmds %;\
	/wdp buklaki, beczulki, sloiki, woreczki, monety, kamienie, zwoje, dywanik, manierke %;\
	/napp %;\
	/zzp


/def med = /__medytuj %;\

/def tr = /test {#} ? send(strcat("trenuj ", {*})) : NULL,  send("trenuj")

/def tab = \
	ob tablice %;\
	re tablice %;\
	ob tabliczke %;\
	re tabliczke

/def naprawa = \
	/send opusc bronie %;\
	/send oczysc bronie %;\
	/send naostrz bronie %;\
	/send zdejmij wszystkie zbroje %;\
	/send napraw wszystkie zbroje


/alias re przeczytaj %{*}

/def buk = /send kup buklak $[{#} ? {*} : "zabojcy trolli"]

;; Picie


/def dribe = /dripack beczulke beczulki %{*}

/def dribec = /dripack beczke beczki %{*}

/def dribu = /dripack buklak buklaka %{*}

/def drima = /dripack manierke manierki %{*} 



/def driku = /dri $[{#} ? {1} : 1] z kubka

/def drifo = /dri $[{#} ? {1} : 2] z fontanny
/def drije = /dri $[{#} ? {1} : 2] z jeziora
/def drijez = /dri $[{#} ? {1} : 2] z jeziorka
/def driko = /dri $[{#} ? {1} : 2] z koryta
/def drimi = /dri $[{#} ? {1} : 2] z misy
/def drini = /dri $[{#} ? {1} : 2] z niszy
/def dripod = /dri $[{#} ? {1} : 2] z podloza
/def dripo = /dri $[{#} ? {1} : 2] z pompy
/def driru = /dri $[{#} ? {1} : 2] z rurki
/def drirz = /dri $[{#} ? {1} : 2] z rzeki
/def drisa = /dri $[{#} ? {1} : 2] z sadzawki
/def drist = /dri $[{#} ? {1} : 2] ze strumyka
/def drista = /dri $[{#} ? {1} : 2] ze stawu
/def dristr = /dri $[{#} ? {1} : 2] ze strumienia
/def dristu = /dri $[{#} ? {1} : 2] ze studni
/def driur = /dri $[{#} ? {1} : 2] z urny
/def driwi = /dri $[{#} ? {1} : 2] z wiadra
/def driwo = /dri $[{#} ? {1} : 2] z wodospadu
/def driza = /dri $[{#} ? {1} : 2] z zaglebienia
/def drizr = /dri $[{#} ? {1} : 2] ze zrodelka


;; Poczta (dostosowac)

;;/def pt = /send przeczytaj tablice
;;/def ssr = /send sprawdz swoja reputacje
;;/def wp = /send wybierz przesylke %{1} %;\
;;          /send ocen paczke
;;/def op = /send oddaj paczke
;;/def zp = /send zwroc paczke
	  

/def daktyl = \
	/for i 1 10 /send zerwij daktyla %;\
	/wdp daktyle 

/def kaktus = \
	/for i 1 15 /send wyssij wode z kaktusa

;; Zabijanie i oprawianie cial ;-)

/alias ki /send zabij %{*}
/alias kil /send kmatakuj %{*}

/alias pdp /send przejdz do przodu
/alias pdt /send przejdz do tylu


/def wp = /send wskaz %{*} %{__SWITCH_potworki_VAL2}
/def wp2 = /send wskaz drugiego %{*} %{__SWITCH_potworki_VAL2}
/def wp3 = /send wskaz trzeciego %{*} %{__SWITCH_potworki_VAL2}
/def wp4 = /send wskaz czwartego %{*} %{__SWITCH_potworki_VAL2}
/def wp5 = /send wskaz piatego %{*} %{__SWITCH_potworki_VAL2}
/def wp6 = /send wskaz szostego %{*} %{__SWITCH_potworki_VAL2}
/def wp7 = /send wskaz siodmego %{*} %{__SWITCH_potworki_VAL2}
/def wp8 = /send wskaz osmego %{*} %{__SWITCH_potworki_VAL2}
/def wp9 = /send wskaz dziewiatego %{*} %{__SWITCH_potworki_VAL2}

/def podp = /send podejrzyj %{*} %{__SWITCH_potworki_VAL2}
/def podp2 = /send podejrzyj drugiego %{*} %{__SWITCH_potworki_VAL2}
/def podp3 = /send podejrzyj trzeciego %{*} %{__SWITCH_potworki_VAL2}
/def podp4 = /send podejrzyj czwartego %{*} %{__SWITCH_potworki_VAL2}
/def podp5 = /send podejrzyj piatego %{*} %{__SWITCH_potworki_VAL2}
/def podp6 = /send podejrzyj szostego %{*} %{__SWITCH_potworki_VAL2}
/def podp7 = /send podejrzyj siodmego %{*} %{__SWITCH_potworki_VAL2}
/def podp8 = /send podejrzyj osmego %{*} %{__SWITCH_potworki_VAL2}
/def podp9 = /send podejrzyj dziewiatego %{*} %{__SWITCH_potworki_VAL2}



/def kw = /__kondycja_wszystkich


;; Pocztylionstwo (dostosowac)

/def wpdp = /wdp paczke
/def wpzp = /wzp paczke

/def wpzpop = /send otworz %{__SWITCH_pojemnik_VAL1} %;\
              /send wez paczke z %{__SWITCH_pojemnik_VAL2} %;\
              /send oddaj paczke %;\
	      /send zamknij %{__SWITCH_pojemnik_VAL1}

/def wcpzp = /send otworz %{__SWITCH_pojemnik_VAL1} %;\
             /send poloz %{__SWITCH_pojemnik_VAL1} %;\
             /send wez paczke z %{__SWITCH_pojemnik_VAL4} %;\
	     /send wez %{__SWITCH_pojemnik_VAL3} %;\
	     /send zaloz %{__SWITCH_pojemnik_VAL3} %;\
	     /send zamknij %{__SWITCH_pojemnik_VAL1}

/def wcpzpop = /send otworz %{__SWITCH_pojemnik_VAL1} %;\
               /send poloz %{__SWITCH_pojemnik_VAL1} %;\
               /send wez paczke z %{__SWITCH_pojemnik_VAL4} %;\
	       /send oddaj paczke %;\
	       /send wez %{__SWITCH_pojemnik_VAL3} %;\
	       /send zaloz %{__SWITCH_pojemnik_VAL3} %;\
	       /send zamknij %{__SWITCH_pojemnik_VAL1}

;; Lampa i pochodnia

/def nl = /send napelnij lampe olejem %;\
	  /send ocen butelke
/def zl = /send zapal %{__SWITCH_swiatlo_VAL2}
/def zg = /send zgas %{__SWITCH_swiatlo_VAL2}

;; Opcje

;; Do przerobienia

/def ou0 = /send opcje uciekaj w pelni zdrow
/def ou1 = /send opcje uciekaj w swietnej kondycji
/def ou2 = /send opcje uciekaj w dobrym stanie
/def ou3 = /send opcje uciekaj poturbowany
/def ou4 = /send opcje uciekaj lekko ranny
/def ou5 = /send opcje uciekaj pokiereszowany
/def ou6 = /send opcje uciekaj poraniony
/def ou7 = /send opcje uciekaj ranny
/def ou8 = /send opcje uciekaj w zlej kondycji
/def ou9 = /send opcje uciekaj w zlym stanie
/def ou10 = /send opcje uciekaj ciezko ranny
/def ou11 = /send opcje uciekaj zmasakrowany
/def ou12 = /send opcje uciekaj ledwo zywy
/def ou13 = /send opcje uciekaj na skraju smierci
/def ou14 = /send opcje uciekaj nigdy

/def ous = /send opcje uciekaj w swietnej kondycji
/def oud = /send opcje uciekaj w dobrym stanie
/def oul = /send opcje uciekaj lekko ranny
/def our = /send opcje uciekaj ranny
/def ouz = /send opcje uciekaj w zlej kondycji
/def ouc = /send opcje uciekaj ciezko ranny
/def oun = /send opcje uciekaj nigdy

/def ok+ = /send opcje krotkie +
/def okp = /send opcje krotkie +
/def ok- = /send opcje krotkie -
/def okm = /send opcje krotkie -

/def op+ = /send opcje przyjmowanie +
/def opp = /send opcje przyjmowanie +
/def op- = /send opcje przyjmowanie -
/def opm = /send opcje przyjmowanie -

;; Przedstawianie sie

/def in = /send przedstaw sie %{*}

;; Porownywanie 

/def por = /send porownaj sie z %{*} %;\

;; Ogladanie (do napisania)

/def obw = /send ob wszystkich


;; Wspieranie (do napisania)

/def pd = /send porzuc druzyne

;; Bron i zbroje

/def zw = /send zaloz wszystko

/def db = /send dobadz %{*} broni
/def db1 = /db pierwszej
/def db2 = /db drugiej
/def db3 = /db trzeciej
/def db4 = /db czwartej
/def db5 = /db piatej
/def db6 = /db szostej
/def db7 = /db siodmej
/def db8 = /db osmej
/def db9 = /db dziewiatej
/def db10 = /db dziesiatej
/def db11 = /db jedenastej
/def db12 = /db dwunastej

/def pdb = /send pdobadz broni z %{*} pochwy

/def pdb1 = /pdb pierwszej
/def pdb2 = /pdb drugiej

/def pdw = /send pwsun dobyta bron do %{*} pochwy

/def pdw1 = /pdw pierwszej
/def pdw2 = /pdw drugiej

;; Polowanie i expienie

/def dpo = /send daj %{*} %{__SWITCH_potworki_VAL4}

/def kz = ki %{*} zwierze
/def kn = ki %{*} niedzwiedzia

/alias kp ki %{*} %{__SWITCH_potworki_VAL2}

/def atak = kp

/def obpo = /send ob %{*} %{__SWITCH_potworki_VAL2}

/def porpo = /por %{*} %{__SWITCH_potworki_VAL3}

/def f1 = /def akcja_f1 = %{*}
/def f2 = /def akcja_f2 = %{*}
/def f3 = /def akcja_f3 = %{*}
/def f4 = /def akcja_f4 = %{*}
/def f5 = /def akcja_f5 = %{*}
/def f6 = /def akcja_f6 = %{*}
/def f7 = /def akcja_f7 = %{*}
/def f8 = /def akcja_f8 = %{*}
/def f9 = /def akcja_f9 = %{*}
/def f10 = /def akcja_f10 = %{*}
/def f11 = /def akcja_f11 = %{*}
/def f12 = /def akcja_f12 = %{*}

;; Mordeczki

/alias :) usmiechnij sie
/alias :D zasmiej sie
/alias :/ skrzyw sie nieznacznie
/alias ;] usmiechnij sie lekko
/alias ;) mrugnij nieznacznie
/alias ;p jezyk

