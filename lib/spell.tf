;; Copyright 2009-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/spell.tf

;;Inkantujesz slowa zaklecia.
;;Nie udaje ci sie skoncentrowac nad zakleciem.
;;Wyciszasz umysl. Mozesz sie ponownie skoncentrowac.

/def czaruj = \
	/test regmatch('^([^,]+),([^,]+)$$', {*}) %;\
	/if (({P1} =~ "")|({P2} =~ "")) \
		/echo /czaruj czar,w kogo %;\
	/else \
		/let czar=%{P1} %;\
		/let kogo=%{P2} %;\
		/def -i -n1 -mregexp -p600 -t"^[> ]*Oddalasz sie myslami, pograzajac umysl w glebokiej koncentracji\.$$" __czary_koncentracja = mwskaz %{kogo} %%; /purge -i __czary_* %;\
		/def -i -n1 -mregexp -p600 -t"^[> ]*Ochlon, zanim ponownie sie skoncentrujesz\.$$" __czary_ochlon = /purge -i __czary_* %;\
		/def -i -n1 -mregexp -p600 -t"^[> ]*Nie udaje ci sie skoncentrowac nad zakleciem\.$$" __czary_brakkoncentracji = /purge -i __czary_* %;\
		/def -i -n1 -mregexp -p600 -t"^[> ]*Nie znasz zaklecia o takiej nazwie\.$$" __czary_brakczaru = /purge -i __czary_* %;\
		/send mwypowiedz %{czar} %;\
	/endif
	

