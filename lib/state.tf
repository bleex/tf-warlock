;; Copyright 2004-2013 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/state.tf

/require lib/wounds.tf
/require lib/stan.tf

/set kondycje_regexp=(bardzo (?:mocno (?:zniszczona z widocznymi platami zmumifikowanego ciala|zniszczony)|zniszczona z tu i owdzie widocznymi fragmentami zmumifikowanego ciala|zniszczony)|ciezko rann[aey]|doszczetnie (?:zmasakrowana i pozbawiona bandazy|zmasakrowany(?:| a iskierka niezycia tylko tli sie w jego oczach)|zniszczona i pozbawiona bandazy)|gasnaca|gotow rozpasc sie w kazdej chwili|ledwo zyw[aey]|lekko (?:podniszczona i naddarta|podniszczony|poobijany i pociety|poszczerbiony|rann[aey])|miejscami (?:pokryty zielona ropa|polamany i poszczerbiony)|migocaca|migotliwa|mocno (?:pocieta ze zwisajacymi pasmami bandazy|pociety|pokruszony)|na skraju smierci|nienaruszona|plonaca|pocieta z odpadajacymi pasmami bandazy|pociety(?:| i poobijany)|pokiereszowan[aey]|pokruszona|pokryty obficie lejaca sie ropa|polamany i popekany|popekana|poranion[aey]|porysowana|poszczerbiony i troche pokruszony|poturbowan[aey]|rann[aey]|rozblyskujaca|rozfalowana gwaltownie|rozplomieniona|rozplywajaca sie|szemrzaca|w dobrym stanie|w fantastycznej kondycji|w pelni zdrow(|[ae])|w swietnej kondycji|w swietnym stanie|w zlej kondycji|w zlym stanie|wzburzona|zarzaca sie|zmasakrowan[aey](?:| a jego tkanki ledwo trzymaja sie kosci)|znikajaca)

/eval /def -i -mregexp -p700 -t"^[> ]*(?:\\[){0,1}(?:(Jestes)(?:\\]){0,1}|((?:[A-Za-z]+ ){0,5}[A-Za-z]+)(?:\\]){0,1} jest) %{kondycje_regexp}\.\$" __kondycja_subs = \
	/substitute -p $$[wounds_get(strcat({P1},{P2}), {P3})]
	

;;Jestes fizycznie w pelni zdrow, zas mentalnie w pelni sil.
;;Czujesz sie bardzo bezpiecznie i jestes bardzo zmeczony.
;;Nie chce ci sie pic i jestes bardzo najedzony.
;;Jestes trzezwy.
;;Ciezar twego ekwipunku nieco ci wadzi.
;;Wiek: A dni B godzin C minut D sekund.

/def stan = \
	/stan_1 %;\
	/stan_2 %;\
	/stan_3 %;\
	/stan_4 %;\
	/stan_5 %;\
	/stan_6 %;\
	/send stan %;\

/def stan_1 = \
	/def -i -n1 -mregexp -p400 -t"^[> ]*Jestes fizycznie (poraniony|ledwo zywy|w fantastycznej kondycji|poturbowany|w swietnej kondycji|w zlym stanie|pokiereszowany|ciezko ranny|w pelni zdrow|ranny|w dobrym stanie|zmasakrowany|w zlej kondycji|na skraju smierci|lekko ranny), zas mentalnie (bardzo zmeczony|u kresu sil|zmeczony|w zlej kondycji|nadwatlony|wyczerpany|lekko oslabiony|oslabiony|nadwyrezony|znuzony|w pelni sil|wykonczony)\.\$" __stan_1 = \
		/test $$[stan_helper_1({P1},{P2})]

/def stan_2 = \
	/def -i -n1 -mregexp -p400 -t"^[> ]*Czujesz sie (trwozliwie|nieswojo|smiertelnie przerazony|zaniepokojony|histerycznie przerazony|przerazony|niespokojnie|spokojnie|bezpiecznie|lekliwie|nerwowo|strachliwie|bardzo bezpiecznie) i jestes (bardzo zmeczony|wycienczony|troche zmeczony|wyczerpany|calkowicie wycienczony|bardzo wyczerpany|zmeczony|w pelni wypoczety|wypoczety|nieco wyczerpany)\.\$" __stan_2 = \
		/test stan_helper_2({P1},{P2})

/def stan_3 = \
	/def -i -n1 -mregexp -p400 -t"^[> ]*(Troche chce ci sie pic|Chce ci sie bardzo pic|Nie chce ci sie pic|Chce ci sie pic) i jestes (bardzo najedzony|glodny|bardzo glodny|najedzony)\.\$" __stan_3 = \
		/test stan_helper_3({P1},{P2})

/def stan_4 = \
	/def -i -n1 -mregexp -p400 -t"^[> ]*(ale masz bardzo niemilego kaca|podchmielony|ale masz lekkiego kaca|ale masz niezlego kaca|ale masz niemilego kaca|ale masz potwornego kaca|ale masz bardzo straszliwego kaca|podpity|pijany|nawalony|ale masz bardzo drazniacego kaca|ale masz straszliwego kaca|ale masz drazniacego kaca|wstawiony|trzezwy|zalany|ale masz sporego kaca|ale masz bardzo potwornego kaca|ale masz bardzo lekkiego kaca|odurzony|schlany)\.\$" __stan_4 = \
		/test stan_helper_4({P1})

/def stan_5 = \
	/set ciezar=0 %;\
	/def -i -n1 -mregexp -p400 -t"^[> ]*(Ciezar twego ekwipunku nieco ci wadzi|Twoj ekwipunek przygniata cie do ziemi|Twoj ekwipunek jest niemilosiernie ciezki|Ciezar twego ekwipunku troche ci zawadza|Ciezar twego ekwipunku nieznacznie ci ciazy|Ciezar twego ekwipunku bardzo ci przeszkadza|Ciezar twego ekwipunku jest dosc klopotliwy)\.\$" __stan_5 = \
		/test stan_helper_5({P1})

/def stan_6 = /def -i -n1 -mregexp -p400 -t"^[> ]*Wiek:" __stan_6 = /purge -i __stan_[12345]

/def -i __kondycja_wszystkich = \
	/send k wszystkich %;\

