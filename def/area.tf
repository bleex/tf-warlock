;; Copyright 2004-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/area.tf

/require def/area-helpers.tf

;; Uzycie /<nazwa_expowiska>
;; Podstawia pod CTRL+[qwertyu] ustawianie kolejnych potworkow pod zmienne do aliasow 
;; na zaslanianie, atakowanie ....
;; a pod CTRL+[asdfghj] atakowanie.

;; Definicja nowego expowiska 
;; /__expowisko <nazwa> <potworek1> [<potworek2>..]
;; Potworki definiujemy w pliku potwory.tf

/__expowisko_pot cmentarz szkielet ghoul zombi widmo strzyga kosciej
/__expowisko_pot cmentarz200 szkielet zombi gnilec ghoul
/__expowisko_pot edoral pajak kmaran
/__expowisko_bindy edoral /kloda /wyspa
/__expowisko_trigger edoral /_wez_mistyczne
/__expowisko_pot gobliny goblin
/__expowisko_pot gremliny demonica imp poczwara gremlin
/__expowisko_trigger gremlin /_wez_kamienie
/__expowisko_pot harpie harpia
/__expowisko_bindy harpie /wespnij_drzewo
/__expowisko_pot hobgobliny hobgoblin muskularny_hobgoblin
/__expowisko_pot kanal karaluch szczur robaczek pajak
/__expowisko_pot karly karzel gnoll ogrylion nietoperz
/__expowisko_bindy karly /do_otworu /po_drabinie /skrzynia
/__expowisko_trigger karly /_wez_kamienie
/__expowisko_pot koboldy kobold
/__expowisko_pot krasnoludy krasnolud
/__expowisko_pot kroliki bialy_krolik szarawy_krolik rudy_krolik zajac krolik
/__expowisko_pot kurhan zjawa mumia zbroja
/__expowisko_pot las niedzwiedz osmiornica poczwara oslizg potwor istota czlowiek
/__expowisko_bindy las /do_szczelina /sz_dopoczwara /sz_zpoczwara_end /skrzyneczka
/__expowisko_pot myszy mysz
/__expowisko_pot mt mysz szczur
/__expowisko_pot morgul ork uruk pajeczyca czarnoodziany_mezczyzna
/__expowisko_pot ogry ogr gnoll wilk wilczyca smoketka
/__expowisko_pot orki ork
/__expowisko_pot ozywience ozywieniec
/__expowisko_trigger ozywience /_wez_mikstury
/__expowisko_pot pajaki pajak maly_pajak duzy_pajak gigantyczny_pajak
/__expowisko_pot piramida szkielet ghoul mumia licz
/__expowisko_pot pustynia pajak waz skarabeusz golem ozywieniec czlowiek
/__expowisko_bindy pustynia /daktyl /wk /wcisnij_szczelina /kaktus
/__expowisko_trigger pustynia /_wez_mikstury
/__expowisko_pot ruiny ogar minotaur szkielet widmo rycerz
/__expowisko_bindy ruiny /korzenie
/__expowisko_trigger ruiny /_wez_kamienie
/__expowisko_pot rowniny gobor hobgobor
/__expowisko_pot siec szybki_pajak wojowniczy_pajak pajeczyca pajak
/__expowisko_pot trolle troll goblin nietoperz
/__expowisko_bindy trolle /wodospad
/__expowisko_trigger trolle /_wez_kamienie
/__expowisko_pot uruki uruk
/__expowisko_pot warownia czlowiek zwierzoludz
/__expowisko_bindy warownia /_war_przekrec_hak /_war_pociagnij_lancuch
/__expowisko_trigger warownia /_wez_zloto
/__expowisko_pot wioska maly_goblin nieduzy_goblin duzy_goblin ogromny_goblin goblin
/__expowisko_pot wrak topielec ryboczlek
/__expowisko_trigger wrak /_wez_zloto
/__expowisko_pot zamek polork czlowiek
/__expowisko_bindy zamek /mo_dozamek /mo_zzamek
/__expowisko_trigger zamek /_wez_wojenna /test
/__expowisko_pot zuki zuk
/__expowisko_bindy zuki /do_jama /sp

