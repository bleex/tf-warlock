;; Copyright 2007-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/paths.tf

;; OTWIERANIE BRAM

/def pukbr = /send zapukaj w brame
/def pukcz = /send zapytaj %{*} czlowieka o brame
/def puker = /send przyloz dlon do bramy
/def pukli = /send pociagnij za line
/def pukot = /send otworz brame
/def pukpl = /send nadepnij na plyte
/def pukro = /send zadmij w rog
/def puksz = /send pociagnij za sznur
/def puktz = /pukud %; /send krzyknij otwierac!
/def pukuc = /send pociagnij za uchwyt
/def pukud = /send uderz w brame
/def pukwr = /send zapukaj we wrota 
/def pukza = /send zadzwon


;; SWIATYNIA ZYWIOLOW

/def sz_napis = \
	/send dol %;\
	/send ne %; /send se %; /send przeczytaj napis %; /send nw %; /send sw %;\
	/send napij sie z sadzawki %;\
	/send gora 

/def sz_start = \
	/send jaskinia %;\
	/send wslizgnij sie do szczeliny

/def sz_poczwara = \
	/send przecisnij sie przez otwor %;\
	/send wslizgnij sie do szczeliny %;\
	/send dol %; /send s

/def sz_dopoczwara = \
	/sz_start %;\
	/sz_napis %;\
	/sz_poczwara

/def sz_zpoczwara = \
	/send n %; /send u %;\
	/send wslizgnij sie w szczeline %;\
	/send przecisnij sie przez otwor %;\
	/sz_napis

/def sz_pij = \
	/send d %;\
	/send napij sie z sadzawki %;\
	/send u

/def sz_zpoczwara_end = \
	/sz_zpoczwara %;\
	/sz_pij %;\
	/__sz_symbol %{*} %;\
	/sz_end

/def -i __sz_dziura = \
	/send wcisnij sie w otwor %;\
	/send ob sciane %;\
	/send przecisnij sie przez szczeline %;\
	/send przeplyn z nurtem %;\
	/send przewroc najwiekszego grzyba %;\
	/send wejdz do otworu 

/def sz_dziura_poczwara = \
	/__sz_dziura %;\
	/send wslizgnij sie do szczeliny %;\
	/send d %; /send s

/def sz_dziura = \
	/__sz_dziura %;\
	/send przecisnij sie przez otwor

/def sz_dziura_end = \
	/sz_dziura %;\
	/sz_napis %;\
	/__sz_symbol %{*} %;\
	/sz_end

/def -i __sz_z2g = \
	/if ({1} =~ "ognia") \
		/result "brama" %;\
	/elseif ({1} =~ "wody") \
		/result "kanal" %;\
	/elseif ({1} =~ "powietrza") \
		/result "portal" %;\
	/elseif ({1} =~ "ziemi") \
		/result "korytarz" %;\
	/endif %;\
		/result "dupa"

/def sz_komnata = \
	/send e %;\
	/send zeskocz z platformy
	

/def -i __sz_symbol = \
	/sz_komnata %;\
	/send dotknij symbolu $[{#} ? {1} : "ognia"] %;\
	/send $(/__sz_z2g $[{#} ? {1} : "ognia"]) %;\
	/send schodki
	

/def sz_ogien = \
	/__sz_symbol ognia %;\
	/send wyjmij $[{#} ? {1} : "szable"] z ognia 

/def sz_woda = \
	/__sz_symbol wody %;\
	/send wylow $[{#} ? {1} : "topor"]

/def sz_powietrze = \
	/__sz_symbol powietrza %;\
	/send zlap $[{#} ? {1} : "sztylety"]

/def sz_ziemia = \
	/__sz_symbol ziemi %;\
	/send chwyc $[{#} ? {1} : "mlot"]
	
/def sz_end = \
	/send wejdz do otworu %;\
	/send wespnij sie do otworu

/def sz_doogien = \
	/sz_start %;\
	/sz_ogien %{*}

/def sz_dowoda = \
	/sz_start %;\
	/sz_woda %{*}

/def sz_dopowietrze = \
	/sz_start %;\
	/sz_powietrze %{*}

/def sz_doziemia = \
	/sz_start %;\
	/sz_ziemia %{*}

;; STATKI I BALONY

/def zs = /send zejdz ze statku
/def ws = /send kup bilet %; /send wejdz na statek

/def zb = /send wysiadz z balonu
/def wb = /send kup bilet %; /send wejdz na balon

/def zz = /send zejdz z zeppelina
/def wz = /send kup bilet %; /send wejdz na zeppelin

/def wyr = /send wyrusz na %{1} forsownie

;; POJAZDY

/def unstatek = /purge __na_statek_trig %; /purge __z_statek_trig

;; ZEPPELIN

/def na_zeppelin = /def -n1 -P -t'(Wegielek|Pucolowaty gnom) przybywa.' __na_statek_trig = /wmzp %%; /wz %%; /wmdp
/def z_zeppelin = /def -n1 -P -t'(Wegielek|Pucolowaty gnom) zsiada z zeppelina.' __z_statek_trig = /zz

/def z_zeppelin_aer = /def -n1 -p400 -F -P -t'(Wegielek|Pucolowaty gnom) krzyczy: DolecielismyDoAer - morkir!! MoznaWysiadac!!' __z_statek_trig = /zz
/def z_zeppelin_ranhar = /def -n1 -p400 -F -P -t'(Wegielek|Pucolowaty gnom) krzyczy: DolecielismyDoRanhar - garu!! MoznaWysiadac!!' __z_statek_trig = /zz
/def z_zeppelin_olgrion = /def -n1 -p400 -F -P -t'(Wegielek|Pucolowaty gnom) krzyczy: DolecielismyDoOlgrionu!! MoznaWysiadac!!' __z_statek_trig = /zz
/def z_zeppelin_habbanaya = /def -n1 -p400 -F -P -t'(Wegielek|Pucolowaty gnom) krzyczy: DolecielismyDoPlacuWHabbanai!! MoznaWysiadac!!' __z_statek_trig = /zz
/def z_zeppelin_kompania = /def -n1 -p400 -F -P -t'(Wegielek|Pucolowaty gnom) krzyczy: DolecielismyDoPlacuWeWschodniejKompaniiHandlowej!! MoznaWysiadac!!' __z_statek_trig = /zz
/def z_zeppelin_impur = /def -n1 -p400 -F -P -t'(Wegielek|Pucolowaty gnom) krzyczy: DolecielismyDoImpur - kir!! MoznaWysiadac!!' __z_statek_trig = /zz
/def z_zeppelin_cammond = /def -n1 -p400 -F -P -t'(Wegielek|Pucolowaty gnom) krzyczy: DolecielismyDoCamond - morkir!! MoznaWysiadac!!' __z_statek_trig = /zz


/def zeppelin_aer = /na_zeppelin %; /z_zeppelin_aer
/def zeppelin_ranhar = /na_zeppelin %; /z_zeppelin_ranhar
/def zeppelin_olgrion = /na_zeppelin %; /z_zeppelin_olgrion
/def zeppelin_habbanaya = /na_zeppelin %; /z_zeppelin_habbanaya
/def zeppelin_kompania = /na_zeppelin %; /z_zeppelin_kompania
/def zeppelin_impur = /na_zeppelin %; /z_zeppelin_impur
/def zeppelin_cammond = /na_zeppelin %; /z_zeppelin_cammond

;; BALON

/def na_balon = /def -n1 -P -t'^(Jednooki niezrownowazony karzel|Belzebub) przybywa.' __na_statek_trig = /wmzp %%; /wb %%; /wmdp
/def z_balon = /def -n1 -P -t'^(Jednooki niezrownowazony karzel|Belzebub) zsiada z balonu.' __z_statek_trig = /zb
/def z_balon_orchia = /def -n1 -p400 -F -P -t'^(Jednooki niezrownowazony karzel|Belzebub) krzyczy: Dolecielismy do Orchii. Ziemie te sa mi obce, zatem czas wracac.' __z_statek_trig = /zb
/def z_balon_mt = /def -n1 -p400 -F -P -t'^(Jednooki niezrownowazony karzel|Belzebub) krzyczy: Dolecielismy w okolice Pol Pelennoru i ogromnej cytadeli Minas-Tirith!' __z_statek_trig = /zb
/def z_balon_sg = /def -n1 -p400 -F -P -t'^(Jednooki niezrownowazony karzel|Belzebub) krzyczy: Dolecielismy pod Samotna Gore! Za nia swiata podobno juz nie ma!' __z_statek_trig = /zb

/def balon_orchia = /na_balon %; /z_balon_orchia
/def balon_mt = /na_balon %; /z_balon_mt
/def balon_sg = /na_balon %; /z_balon_sg

;; EDORAL

/def statek_edoral = /def -n1 -P -t'Rudy kmaran przybywa.' __na_statek_trig = /wmzp %%; /ws %%; /wmdp %%; /z_statek_edoral
/def statek_zedoral = /def -n1 -P -t'Rudy kmaran przybywa.' __na_statek_trig = /send wejdz na statek %%; /z_statek_edoral
/def z_statek_edoral = /def -n1 -P -t'Rudy kmaran zsiada z statku.' __z_statek_trig = /zs


/def wyspa = \
	/repeat -0 -S 17 /send n %;\
	/repeat -0 -S 2 /send w %;\
	/send wejdz na klode %;\
	/send przejdz po klodzie

/def pancerz = \
	/send wytnij pancerz z ciala %;\
	/send opusc bronie %;\
	/wzp mlot %;\
	/send dobadz mlota %;\
	/send rozbij pancerz %;\
	/send wez kawalki zlota %;\
	/wdp mlot, kawalki zlota %;\
	/db %; /db2
	

;; Wyspa wiez
/def statek_wiez = /def -n1 -P -t'Stary ork przybywa.' __na_statek_trig = /wmzp %%; /ws %%; /wmdp %%; /z_statek_wiez
/def z_statek_wiez = /def -n1 -P -t'Stary ork zsiada z statku.' __z_statek_trig = /zs

;; Myshan-Kir <-> Dargor-kir
/def statek_myshan = /def -n1 -P -t'Energiczny czlowiek przybywa.' __na_statek_trig = /wmzp %%; /ws %%; /wmdp %%; /z_statek_myshan
/def z_statek_myshan = /def -n1 -P -t'Energiczny czlowiek zsiada z okretu.' __z_statek_trig = /zs


/def kliper = /def -n1 -P -t'Ogorzaly niebieskooki czlowiek przybywa.' __na_statek_trig = /wmzp %%; /ws %%; /wmdp %%; /z_kliper
/def z_kliper = /def -n1 -P -t'Ogorzaly niebieskooki czlowiek zsiada z klipra.' __z_statek_trig = /zs

;; MORGHLICI

/def mo_dozamek = \
	/send wejdz w krzaki %;\
	/send nw %;\
	/send przesun kamien %;\
	/send wejdz do otworu %;\
	/send gora

/def mo_zzamek = \
	/send dol %;\
	/send wejdz w otwor %;\
	/send podnies klape %;\
	/send se %;\
	/send wejdz w szczeline 

;; Winda
;; Nadjezdzajaca z gory winda powoli zatrzymuje sie.
;; Nadjezdzajaca z dolu winda powoli zatrzymuje sie.
;; Winda zatrzymuje sie.
/def winda = /def -n1 -P -t'Nadjezdzajaca z (gory|dolu) winda powoli zatrzymuje sie.' __do_windy_trig = /send winda %%; /z_winda
/def z_winda = /def -n1 -P -t'Winda zatrzymuje sie.' __z_winda_trig = /send wyjscie
/def unwinda = /purge __do_windy_trig %; /purge __z_winda_trig

;; Takie sobie chodzenie
/def do_jama = /send wejdz do jamy
/def do_otworu = /send wejdz do otworu
/def do_szczelina = /send wejdz do szczeliny
/def po_drabinie = /send wejdz po drabinie
/def wcisnij_szczelina = /send wcisnij sie do szczeliny
/def wejdz_drzewo = /send wejdz na drzewo
/def wespnij_drzewo = /send wespnij sie na drzewo
/def wodospad = /send przejdz przez wodospad
/def kloda = /send wejdz na klode %; /send przejdz po klodzie
/def korzenie = /send przecisnij sie przez korzenie

;; Warownia zbojnicka
/def _war_przekrec_hak = /send przekrec hak
/def _war_pociagnij_lancuch = /send pociagnij lancuch

/def sp = /send sp

;; Osgiliath
/def _osg_schody = /send zejdz po schodach
/def _osg_tunel = /send wejdz do tunelu
/def _osg_sarkofag = /send otworz sarkofag %; /send wejdz do sarkofagu

