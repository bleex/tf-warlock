;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/hilites.tf

;; Kierunki

;;/def -F -PCgreen -w -p100 -t"((polnocny|poludniowy)-|zachod|wschod|polnoc|poludnie|gora|dol|wyjscie|drzwi)" __kierunki_hilite

;; Standard
/def -i -P1Cgreen -w -p300 -t"^[> ]*Jedyne widoczne wyjscie to:(.*)\." __kierunki_1_hilite = /repeat -0 1 /__set_kierunki %{P1}

/def -i -P5Cgreen -w -p300 -t"^[> ]*(Sa|Jest) tutaj ([a-z]*) widoczn(e|ych) wyjsc(|ia|ie):(.*)\." __kierunki_2_hilite = /repeat -0 1 /__set_kierunki %{P5}

/def -i -P1Cgreen -w -p300 -t"^[> ]*Zdaje ci sie ze mozna by stad wyjsc gdzies na (.*)\." __kierunki_3_hilite = /repeat -0 1 /__set_kierunki %{P1}

/def -i -P1Cgreen -w -p300 -t"^[> ]*Zdaje ci sie ze jedyne wyjscie stad to (.*)\." __kierunki_4_hilite = /repeat -0 1 /__set_kierunki %{P1}

;; Druzynowe chodzenie
/def -i -P1Cmagenta -w -p100 -t"przybywa(?:ja|) za toba z(?:e|) (.*)\." __druzyna_chodzenie_1_hilite
/def -i -P2Cmagenta -w -p100 -t"podazasz za ([a-z]*) na (.*)\." __druzyna_chodzenie_2_hilite

;; Chodzenie
/def -i -P1BCyellow;2Cmagenta -w -p100 -t"^[> ]*Ruszasz ([a-z ]*) na (.*)\." __chodzenie_2_hilite

;; Pustynia - RYZYKO
;; Czujesz jak pustynia powoli wysysa z ciebie zycie...

/def -i -aCred -w -mregexp -p100 -t"^[> ]*Czujesz jak pustynia powoli wysysa z ciebie zycie\.\.\." __pustynia_1_hilite = /repeat -0 1 /dzwiek

;; Walka --> walka.tf	

/def -i -aBCgreen -w -p600 -mregexp -t"^[> ]*Masz now(?:a poczte|y list \(\# [0-9]+\)) od ([a-zA-Z]+)[,.]" __poczta_1_hilite = /repeat -0 1 /dzwiek %%; /set poczta=%{P1}$(/remove %{P1} %{poczta})

;; Mowienie + dodatek o niemoznosci naprawiania ....

/def -i -P1Cred -aCblack,Cbgyellow -w -p300 -t" (?:mamrocze|charczy|marudzi|szepce|syczy|bulgocze|grzmi|piszczy|popiskuje|spiewa|mowi|nuci|dudni|mruczy|skrzypi|krzyczy|huczy|brzeczy|szepcze|powarkuje)(?:.*): ((?:[A-Z][a-z]*)(?:[a-z ]*) nie nadaje sie do (?:naprawy|ostrzenia|czyszczenia)\.|)" __mowienie_1_hilite
/def -i -aBCyellow -w -p300 -t"{Mowisz|Mowisz:|Krzyczysz|Krzyczysz:|Szepczesz|Szepczesz:} *" __mowienie_2_hilite

/def -i -P -w -p300 -t"(namysla sie|wzdryga sie|zaczyna szukac)" __emoty_1_zabezpieczenie

;; Podarki
/def -i -F -P -aCyellow -w -p100 -t'\ (daje|wyplaca|wrecza) ci\ ' __podarki_1_hilite
/def -i -F -P -aCyellow -w -p100 -t"^[> ]*(Otrzymujesz|Dostajesz) *" __podarki_2_hilite

;; Potwory
;; Przy dodawaniu nowych potworow z niestandardowa liczba mnoga nalezy pamietac o (?:...)

/set POTWORY (?: (?:behemot|besti|demon(?:ic|)|gargoyl|ghast|ghoul|gigant|gnil(?:ec|ce)|goblin|gobor|golem|gremlin|harpi|hobgoblin|hobgobor|horror|humanoid|kmaran|kobold|kosciej|kosciotrup|licz|minotaur|moloh|mumi|niedzwiedz|ork|oslizg|osmiornic|ogar|ogr(?:zyc|)|ogrylion|olbrzym(?!i)|ozywien(?:iec|ce)|pajak|pajeczyc|poczwar|potepien(?:iec|c)|potwor|robak|ryboczlek|rycerz|skarabeusz|smok|strzyg|szkielet|topiel(?:ec|ce)|troll|upior|uruk|w[ae]z|widm|zjaw|zomb(?:i|iego)|zwierzoludz)(?:ek|(?:k|)(?:ie|ow|[aeyio]|)))

/eval /def -i -F -P1Cred;2Cbgcyan,Cred;3Cbggreen,Cred -w -p910 -t"(%{POTWORY})(?: (?:(przybywa(?:ja|))|(odchodzi))|[,. ])" __potwory_hilite

/set KAMIENIE (?:kamien|agat|akwamaryn|aleksandryt|beryl|bursztyn|celestyn|diament|fluoryt|kartusz|kawal(?:ek|ki|kow) zlota|krwawnik|kwarc|lazuryt|malachit|mandaryn|nefryt|opal|roz[ae] pustyni|rutyl|syderyt|szafir|szmaragd|turkus|turmalin|wiwianit)

/eval /def -i -F -P1Cbgmagenta,Cblack -w -p210 -t" (%{KAMIENIE}(?:ie|ow|[yei]|))[,. ]" __kamienie_hilite

