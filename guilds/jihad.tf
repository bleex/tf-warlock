;; Copyright 2009-2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_GUILDS__/jihad.tf

/require lib/specs.tf

/set pakiet=P

/test $[special_add( \
	"lpsypnij",\
	'^[> ]*Czujesz, ze mozesz znow komus sypnac piaskiem po oczach\.$$',\
	'^[> ]*Nie mozesz sypnac piaskiem w oczy przeciwnika, ktory zniknal z pola widzenia\.$$',\
	'^[> ]*Przygotowujesz sie do sypniecia piaskiem w',\
	'^[> ]*Blyskawicznym ruchem rzucasz garsc piachu.*(?:(oslepiajac (?:go|ja) na jakis czas)|(Niestety przeciwnik przewiduje twoj manewr i zamyka na czas oczy))\.$$',\
	1,\
	"S",\
	'/send lpsypnij $$$[{#} ? {*} : "przeciwnikowi"]',\
	"lps")]

/test $[special_add( \
	"lpdzgnij",\
	'^[> ]*Czujesz, ze mozesz znowu kogos ciac\.$$',\
	'^[> ]*Nie mozesz ciac przeciwnika, ktory zniknal z pola widzenia\.$$',\
	'^[> ]*Przygotowujesz sie do zadania ciecia w',\
	'^[> ]*Bierzesz krotki rozbieg i wyskakujesz w kierunku.*(?:(pozostawiajac.*)|(uchyla sie przed tym ciosem))\.$$',\
	2,\
	"D",\
	'/send lpdzgnij $$$[{#} ? {*} : "przeciwnika"]',\
	"lpd")]



/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Czujesz, ze mozesz uzyc kolejnego pakietu\.$" __pakiet_hilite_todo = /set pakiet=P
/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Przykladasz ziolowy maly pakiet do rany. Po chwili czujesz jak zaczyna dzialac, usuwajac bol i leczac zranione miejsce\.$" __pakiet_hilite_done = /unset pakiet

;; Custom hits by Esail
;; Z krotkiego zamachu wyprowadzasz bardzo dlugie ciecie koncem klingi swej blekitnawej porecznej szabli, ktore trafiajac wylupiastookiego niskiego ryboczleka w korpus zostawia po sobie lekko krwawiaca ryse.
;; Biorac szeroki zamach wyprowadzasz bardzo dlugie ciecie klinga swej blekitnawej porecznej szabli, ktore trafiajac wylupiastookiego niskiego ryboczleka w korpus zostawia po sobie krwawiaca ryse.

;; (przygotowanie) wyprowadzasz (rodzaj) (ciecie|uderzenie|pchniecie) (czesc broni) (swej|swego) (bron), ktore trafiajac (kogo) w (co) zostawia po sobie (obrazenia).

/set __lp_przygotowanie_szabla (?:Biorac szeroki zamach|Jakby od niechcenia|Lagodnym ruchem dloni|Lekko prowadzac(?: [a-z]+){1,3}|Oszczednym ruchem nadgarstka|Pewnie prowadzac bron do celu|Wystudiowanym ruchem nadgarstka|Z krotkiego zamachu|Z mordercza skutecznoscia|Z zabojcza skutecznoscia)
/set __lp_przygotowanie_sztylet (?:Niewiarygodnie plynnym ruchem|Pewnie prowadzac bron do celu|Skracajac dystans w trzech krokach|Z chytrym blyskiem w oku|Z dlugiego wypadu|Z dobiegu|Z krotkiego dobiegu|Z krotkiego wypadu|Z mordercza skutecznoscia|Z polobrotu|Z wypadu|Z zabojcza skutecznoscia)


/eval /def -i -P1Cblue;2BCblue -mregexp -p400 -w -t"^[> ]*(?:%{__lp_przygotowanie_szabla}|%{__lp_przygotowanie_sztylet}) wyprowadzasz (.*) (?:swej|swego) .*, ktor[ey] trafiajac .* zostawia po sobie (.*)\." __lp_ciosy_hilite = /test ++{trafienie}
