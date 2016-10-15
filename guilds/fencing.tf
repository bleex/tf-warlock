;; Copyright 2011 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_GUILDS__/fencing.tf

/set dzgnij=D
/set sypnij=S
/set pakiet=P

/alias lps /send szpchnij
/alias lpd \
	opusc drugi miecz %;\
	dobadz sztyletu %;\
	/send sztnij

/def lpdzgnij = /if (({dzgnij}=~"D") & ({specuje}!~"T")) \
			/set specuje=T %;\
			lpd %;\
		/endif

/def lpsypnij = /if (({sypnij}=~"S") & ({specuje}!~"T"))\
			/set specuje=T %;\
			lps %;\
		/endif
		

/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Czujesz, ze mozesz znowu kogos ciac\.$" __dzganie_hilite_todo = /set dzgnij=D %; /lpdzgnij
/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Czujesz, ze mozesz znowu kogos pchnac\.$" __sypanie_hilite_todo = /set sypnij=S %; /lpsypnij
;;/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Nie mozesz sypnac piaskiem w oczy przeciwnika, ktory zniknal z pola widzenia\.$" __sypanie_hilite_fail2 = /set sypnij=S %; /unset specuje %; /lpsypnij
;;/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Nie mozesz pchnac sztyletem przeciwnika, ktory zniknal z pola widzenia\.$" __dzganie_hilite_fail2 = /set dzgnij=D %; /unset specuje %; /send sztnij
/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Ale ty z nikim nie walczysz\.$" __specowanie_hilite_fail1 = /unset specuje %; opusc sztylet %; dobadz miecza %; dobadz drugiego miecza
/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Ale ty juz nie walczysz z" __specowanie_hilite_fail2 = /unset specuje %; /lpsypnij %; /lpdzgnij
/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*W tej chwili wykonujesz inna czynnosc\. Przerwij ja by moc zrobic to, co chcesz\.$" __specowanie_hilite_fail3 = /unset specuje


/def -i -aCmagenta -mregexp -p300 -w -t"^[> ]*Przygotowujesz sie do zadania ciecia w" __przygotowanie_dzganie_hilite = /set specuje=T
/def -i -aCmagenta -mregexp -p300 -w -t"^[> ]*Perfekcyjnie wykorzystujac przewage wyszkolenia w fechtunku" __dzganie_hilite_done = /unset dzgnij %; /unset specuje %; opusc sztylet %; dobadz miecza %; dobadz drugiego miecza %; /lpsypnij
/def -i -aCmagenta -mregexp -p300 -w -t"^[> ]*Przygotowujesz sie do zadania pchniecia w" __przygotowanie_sypanie_hilite = /set specuje=T
/def -i -aCmagenta -mregexp -p300 -w -t"^[> ]*Markujesz cios w kierunku" __sypanie_hilite_done = /unset sypnij %; /unset specuje %; /lpdzgnij

/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Czujesz, ze mozesz uzyc kolejnego pakietu\.$" __pakiet_hilite_todo = /set pakiet=P
/def -i -aCbgmagenta,Cblack -mregexp -p300 -w -t"^[> ]*Przykladasz ziolowy maly pakiet do rany. Po chwili czujesz jak zaczyna dzialac, usuwajac bol i leczac zranione miejsce\.$" __pakiet_hilite_done = /unset pakiet

;;
;;szpchnij sztnij szwytrac szuniknij
;;
;;szpchnij
;;Przygotowujesz sie do zadania pchniecia w garbatego dlugorekiego goblina.
;;
;;Alez wlasnie przygotowujesz sie do pchniecia mieczem.
;;
;;Markujesz cios w kierunku garbatego dlugorekiego goblina. Gdy ten chwyta przynete i probuje go sparowac wyskakujesz do przodu. Szybkim ruchem dloni 
;;wykonujesz pchniecie celujac w tors garbatego dlugorekiego goblina swoim lodowym blyszczacym ostrzem zostawiajac zauwazalna rane.
;;
;;Czujesz ze mozesz znowu kogos pchnac.
;;
;;
;;
;;sztnij (wymaga sztyletu) !!!
;;Przygotowujesz sie do zadania ciecia w zielonkawego malego goblina.
;;
;;Perfekcyjnie wykorzystujac przewage wyszkolenia w fechtunku zwodniczo mlynkujesz swym lodowatym blyszczacym ostrzem rozpraszajac uwage zielonkawego 
;;malego goblina. Gdy ten calkowicie skupia sie na twym lodowatym blyszczacym ostrzu, wyprowadzasz dobrze wyliczony cios starozytnym runicznym sztyletem 
;;celujac pod zebra. Ostrze mija jednak cel o centymetry.
;;
;;Czujesz, ze mozesz znowu kogos ciac.
;;
;;
;;
;;
;;szuniknij
;;
;;Przygotowujesz sie do uniku ciosu strachliwego malego goblina.
;;
;;Wirujac w zgrabnym piruecie przepuszczasz cios strachliwego malego goblina pod pacha wytracajac go z rownowagi i zmuszajac do odsloniecia sie.
;;
;;Czujesz, ze mozesz znowu wykonac unik.
;;
;;
;;
;;szrozbroj
;;
;;Przygotowujesz sie do rozbrojenia strachliwego malego goblina.
;;
;;Zdecydowanie napierasz na strachliwego malego goblina i wykonujac skomplikowany manewr swym lodowatym blyszczacym ostrzem absorbujesz jego uwage, by po 
;;chwili celnym ciosem trafic go w dlon. Strachliwy maly goblin zaciska jednak mocniej dlon na swej broni nie pozwalajac jej upasc na ziemie.
;;
;;Czujesz, ze mozesz znowu kogos rozbroic.
;;


;; Twoja slawa w swiecie jako Szermierza nieznacznie wzrosla.
