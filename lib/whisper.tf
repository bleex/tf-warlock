;; Copyright 2008-2013 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/whisper.tf

/def -i -aBCgreen -w -p600 -mregexp -t"^[> ]*Nagle czujesz jak jakas magiczna sila wdziera sie do twojej glowy. Wewnatrz twego umyslu rozbrzmiewa glos (.*) :" __magowie_pytanie_hilite = /dodaj_objawienie $[encode_attr({P1})] %; /repeat -0 1 /dzwiek %%; /set objawienie=X

/def dodaj_objawienie = \
	/set whisper_who=@{n}%{*} @{n}@{BCblue}==>@{n} %;\
	/def -i -aBCred -n1 -w -mregexp -t"^[> ]*(.+)$$" __dodanie_tekstu_objawienia = \
		/whisper_add %%{whisper_who} $$[encode_attr({P1})]

/def -i -aBCgreen -w -p600 -mregexp -t"^[> ]*Odpowiadasz ([^:]*): (.*)$$" __dodaj_odpowiedz = \
	/whisper_add @{n}@{BCgreen}%{P1}@{n} @{BCblue}<==@{n} @{BCred}%{P2}@{n}

/def whisper_list = \
	/let i 0 %;\
	/let max $(/length %{whisper_data})%;\
	/for i 1 %{max} \
		/let cur=$$(/nth %%{i} %{whisper_data}) %%;\
		/eval /echo -p $$[textdecode({cur})] 

/def whisper_add = \
	/set whisper_data=%{whisper_data} $[textencode({*})]
