;; Copyright 2007-2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/loot.tf

/def skrzyneczka = \
	/c1 kluczyk %;\
	/send otworz skrzyneczke kluczykiem %;\
	/send otworz skrzyneczke %;\
	/send wez monety ze skrzyneczki %;\
	/send wloz kluczyk do skrzyneczki %;\
	/send zamknij skrzyneczke %;\
	/wmdp

/def skrzynia = \
	/c1 klucz %;\
	/send otworz skrzynie kluczem %;\
	/send otworz skrzynie %;\
	/send wez monety ze skrzyni %;\
	/send wez rekawiczki ze skrzyni %;\
	/send wez halabarde ze skrzyni %;\
	/odloz klucz, miedziane monety, mithrylowa monete %;\
	/send zamknij skrzynie %;\
	/wmdp %;\
	/napp

/def rwij = /send wyrwij oko z %{*} ciala %;\
            /send wyrwij oko z %{*} ciala
;;	    /send wyrwij nos z %{*} ciala %;\
;;	    /send wyrwij ucho z %{*} ciala %;\
;;	    /send wyrwij ucho z %{*} ciala

/def jedz = /send zjedz szczatki

/def kroj = /rwij %{*} %;\
	    /jedz
	    
/def tnij = /send wytnij skore z %{*} ciala

/def wmc = /tnij %{*} %;\
	   /wdp skory

/def wmk = /send wytnij mieso z %{*} ciala %;\
           /send wytnij skore z %{*} ciala %;\
	   /kroj %;\
           /wdp miesa, skory, oczy, serca 

/def sm = /__sprzedaj $[{#} ? {1} : 3] miesa 
/def scm = /__sprzedaj_ciezkie $[{#} ? {1} : 3] miesa 

/def ss = /__sprzedaj $[{#} ? {1} : 3] skory 
/def scs = /__sprzedaj_ciezkie $[{#} ? {1} : 3] skory 
	  
/def sb = /__sprzedaj $[{#} ? {1} : 3] bronie
/def scb = /__sprzedaj_ciezkie $[{#} ? {1} : 3] bronie

/def sz = /__sprzedaj $[{#} ? {1} : 3] wszystkie zbroje
/def scz = /__sprzedaj_ciezkie $[{#} ? {1} : 3] wszystkie zbroje

/def ska = /__base_sprzedaj 1 0 1 $[{#} ? {1} : 1] kamienie
/def scka = /__base_sprzedaj 1 1 1 $[{#} ? {1} : 1] kamienie

/def szi = /otworz_p %;\
	   /wzp zamkniete %{__SWITCH_ziola_VAL3} %;\
;;	   /wzp zamkniete niebieskawe %{__SWITCH_ziola_VAL3} %;\
	   /repeat -0 -S $[{#} ? {1} : 3] \
;;	   	/otworz_z niebieskawy %%;\
	   	/otworz_z %%;\
		/wzz %%;\
;;		/wdz bladozolte male kwiaty %%;\
;;;;		/wdz brodawkowate kuliste grzyby %%;\
;;		/wdz brunatne grube klacza %%;\
;;		/wdz ciemnopurpurowe suche kwiaty %%;\
;;		/wdz cuchnace czarne grzyby %%;\
;;		/wdz plamiste czerwonawe kwiatki %%;\
;;		/wdz gwiazdkowate ciemnobrazowe owoce %%;\
;;		/wdz lancetowate miesiste liscie %%;\
;;		/wdz malutkie ciemnozielone mchy %%;\
;;		/wdz nakrapiane zlocistozolte kwiatki %%;\
;;		/wdz okragle czarne owoce %%;\
;;		/wdz owlosione biale kwiatki %%;\
;;		/wdz pofaldowane skorzaste liscie %%;\
;;		/wdz rozgalezione jasnoszare korzenie %%;\
;;		/wdz rozowawe lisciaste rosliny %%;\
		/wdz zlocistozolte spore kwiatki %%;\
;;		/wdz purpurowo-sine tajemnicze kwiaty %%;\
;;		/wdz wlokniste brazowoszare korzenie %%;\
;;		/wdz zoltozielone skorzaste rosliny %%;\
;;		/wdz sluzowate grzyby %%;\
;;		/wdz %%;\
		/zzz %%;\
		/wdp %{__SWITCH_ziola_VAL1} %;\
	   /send sprzedaj ziola %;\
	   /wmdp %;\
	   /zamknij_p
	   	
/def swzi = /otworz_p %;\
 	    /wzp %{__SWITCH_ziola_VAL3} %;\
	    /repeat -0 -S $[{#} ? {1} : 3] \
		/wzz %%;\
		/wdp %{__SWITCH_ziola_VAL1} %;\
	    /send sprzedaj ziola %;\
	    /wmdp %;\
	    /zamknij_p

;; Ziola

/def _wdz = \
	/let i %{1} %;\
	/otworz_z %{i} %;\
	/wdz

/def wwdp = /wdp %{__SWITCH_ziola_VAL1}
/def wwzp = /wzp %{__SWITCH_ziola_VAL1}


;; Zbieranie

/def wez = /test $[wykonaj("/send wez %{arg}", {#} ? {*} : "wszystko")]

/def ww = /send wez wszystko

;; Urna, skrzynia, kufer,kosz ...

/def wdu = /test $[wykonaj("wloz %{arg} do %%{__SWITCH_skrzynia_VAL1}", {*})]
/def wzu = /test $[wykonaj("wez %{arg} %%{__SWITCH_skrzynia_VAL3} %%{__SWITCH_skrzynia_VAL1}", {*})]

/def obu = ob %{__SWITCH_skrzynia_VAL2}

;; Operacje na zwlokach ;-)
;; Zbieranie, ogladanie .... (przydatne do trybu hieny cmentarnej)

/set __hiena_cmentarna_ilosc 9
/set __hiena_cmentarna_licz 0
/set __hiena_cmentarna_tmp 0

/def b1 = /send wez bronie z pierwszego ciala
/def b2 = /send wez bronie z drugiego ciala
/def b3 = /send wez bronie z trzeciego ciala
/def b4 = /send wez bronie z czwartego ciala
/def b5 = /send wez bronie z piatego ciala
/def b6 = /send wez bronie z szostego ciala
/def b7 = /send wez bronie z siodmego ciala
/def b8 = /send wez bronie z osmego ciala
/def b9 = /send wez bronie z dziewiatego ciala
/def ba = \
	/def -F -mregexp -ag -t'^[> ]*Wez (co|skad)?' __gag_hiena %;\
	/set __hiena_cmentarna_licz 0 %;\
	/def -P -t"[a-z ]" __hiena_max = \
		/set __hiena_cmentarna_licz $$[__hiena_cmentarna_licz + 1] %%;\
		/if ({__hiena_cmentarna_licz} = {__hiena_cmentarna_ilosc} - 1) \
			/purge __gag_hiena %%;\
			/set __hiena_cmentarna_licz 0 %%;\
			/purge __hiena_max %%;\
		/endif %;\
	/b1 %; /b2 %; /b3 %; /b4 %; /b5 %; /b6 %; /b7 %; /b8 %; /b9 %;\


/def wezc = \
	/let tmp_ktore=%{1} %;\
	/test $[wykonaj("/send wez %{arg} z %{tmp_ktore} ciala", {-1})]


/def c1 = /wezc pierwszego %{*}
/def c2 = /wezc drugiego %{*}
/def c3 = /wezc trzeciego %{*}
/def c4 = /wezc czwartego %{*}
/def c5 = /wezc piatego %{*}
/def c6 = /wezc szostego %{*}
/def c7 = /wezc siodmego %{*}
/def c8 = /wezc osmego %{*}
/def c9 = /wezc dziewiatego %{*}
/def ca = \
	/liczargc %{*} %;\
	/let i %? %;\
	/set __hiena_cmentarna_tmp $[i * __hiena_cmentarna_ilosc] %;\
	/def -F -mregexp -ag -t'^[> ]*Wez (co|skad)?' __gag_hiena %;\
	/set __hiena_cmentarna_licz 0 %;\
	/def -P -t"[a-z ]" __hiena_max = \
		/set __hiena_cmentarna_licz $$[__hiena_cmentarna_licz + 1] %%;\
		/if ({__hiena_cmentarna_licz} = {__hiena_cmentarna_tmp} - 1) \
			/purge __gag_hiena %%;\
			/set __hiena_cmentarna_licz 0 %%;\
			/purge __hiena_max %%;\
		/endif %;\
	/c1 %{*} %; /c2 %{*} %; /c3 %{*} %; /c4 %{*} %; /c5 %{*} %; /c6 %{*} %; /c7 %{*} %; /c8 %{*} %; /c9 %{*}

/def k1 = /send wez kamienie z pierwszego ciala
/def k2 = /send wez kamienie z drugiego ciala
/def k3 = /send wez kamienie z trzeciego ciala
/def k4 = /send wez kamienie z czwartego ciala
/def k5 = /send wez kamienie z piatego ciala
/def k6 = /send wez kamienie z szostego ciala
/def k7 = /send wez kamienie z siodmego ciala
/def k8 = /send wez kamienie z osmego ciala
/def k9 = /send wez kamienie z dziewiatego ciala
/def ka = \
	/def -F -mregexp -ag -t'^[> ]*Wez (co|skad)?' __gag_hiena %;\
	/set __hiena_cmentarna_licz 0 %;\
	/def -P -t"[a-z ]" __hiena_max = \
		/set __hiena_cmentarna_licz $$[__hiena_cmentarna_licz + 1] %%;\
		/if ({__hiena_cmentarna_licz} = {__hiena_cmentarna_ilosc} - 1) \
			/purge __gag_hiena %%;\
			/set __hiena_cmentarna_licz 0 %%;\
			/purge __hiena_max %%;\
		/endif %;\
	/k1 %; /k2 %; /k3 %; /k4 %; /k5 %; /k6 %; /k7 %; /k8 %; /k9 %; /odloz granity, piaskowce

/def m1 = /send wez monety z pierwszego ciala
/def m2 = /send wez monety z drugiego ciala
/def m3 = /send wez monety z trzeciego ciala
/def m4 = /send wez monety z czwartego ciala
/def m5 = /send wez monety z piatego ciala
/def m6 = /send wez monety z szostego ciala
/def m7 = /send wez monety z siodmego ciala
/def m8 = /send wez monety z osmego ciala
/def m9 = /send wez monety z dziewiatego ciala
/def ma = \
	/def -F -mregexp -ag -t'^[> ]*Wez (co|skad)?' __gag_hiena %;\
	/set __hiena_cmentarna_licz 0 %;\
	/def -P -t"[a-z ]" __hiena_max = \
		/set __hiena_cmentarna_licz $$[__hiena_cmentarna_licz + 1] %%;\
		/if ({__hiena_cmentarna_licz} = {__hiena_cmentarna_ilosc} - 1) \
			/purge __gag_hiena %%;\
			/set __hiena_cmentarna_licz 0 %%;\
			/purge __hiena_max %%;\
		/endif %;\
	/m1 %; /m2 %; /m3 %; /m4 %; /m5 %; /m6 %; /m7 %; /m8 %; /m9

/def w1 = /send wez wszystko z pierwszego ciala
/def w2 = /send wez wszystko z drugiego ciala
/def w3 = /send wez wszystko z trzeciego ciala
/def w4 = /send wez wszystko z czwartego ciala
/def w5 = /send wez wszystko z piatego ciala
/def w6 = /send wez wszystko z szostego ciala
/def w7 = /send wez wszystko z siodmego ciala
/def w8 = /send wez wszystko z osmego ciala
/def w9 = /send wez wszystko z dziewiatego ciala
/def wa = \
	/def -F -mregexp -ag -t'^[> ]*Wez (co|skad)?' __gag_hiena %;\
	/set __hiena_cmentarna_licz 0 %;\
	/def -P -t"[a-z ]" __hiena_max = \
		/set __hiena_cmentarna_licz $$[__hiena_cmentarna_licz + 1] %%;\
		/if ({__hiena_cmentarna_licz} = {__hiena_cmentarna_ilosc} - 1) \
			/purge __gag_hiena %%;\
			/set __hiena_cmentarna_licz 0 %%;\
			/purge __hiena_max %%;\
		/endif %;\
	/w1 %; /w2 %; /w3 %; /w4 %; /w5 %; /w6 %; /w7 %; /w8 %; /w9

/def z1 = /send wez wszystkie zbroje z pierwszego ciala
/def z2 = /send wez wszystkie zbroje z drugiego ciala
/def z3 = /send wez wszystkie zbroje z trzeciego ciala
/def z4 = /send wez wszystkie zbroje z czwartego ciala
/def z5 = /send wez wszystkie zbroje z piatego ciala
/def z6 = /send wez wszystkie zbroje z szostego ciala
/def z7 = /send wez wszystkie zbroje z siodmego ciala
/def z8 = /send wez wszystkie zbroje z osmego ciala
/def z9 = /send wez wszystkie zbroje z dziewiatego ciala
/def za = \
	/def -F -mregexp -ag -t'^[> ]*Wez (co|skad)?' __gag_hiena %;\
	/set __hiena_cmentarna_licz 0 %;\
	/def -P -t"[a-z ]" __hiena_max = \
		/set __hiena_cmentarna_licz $$[__hiena_cmentarna_licz + 1] %%;\
		/if ({__hiena_cmentarna_licz} = {__hiena_cmentarna_ilosc} - 1) \
			/purge __gag_hiena %%;\
			/set __hiena_cmentarna_licz 0 %%;\
			/purge __hiena_max %%;\
		/endif %;\
	/z1 %; /z2 %; /z3 %; /z4 %; /z5 %; /z6 %; /z7 %; /z8 %; /z9

/def loot = \
	/ca $[{#} ? {*} : "wszystko" ] %;\
	/wez %{*}
