;; Copyright 2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/finance.tf


/def ppm = /send policz platynowe monety
/def pzm = /send policz zlote monety
/def psm = /send policz srebrne monety
/def pmm = /send policz miedziane monety

/def sk = /send sprawdz konto

/def zm = /oop %; /wmzp %; /wpmdp %; /send zdenominuj %; /wmdp %; /zzp

/def pzp = /send probnie zamien miedz srebro zloto na platyne
/def zpt = /send zamien miedz srebro zloto na platyne

/def wmdp = /wdp %{*} monety
/def wmzp = /wzp %{*} monety
/def wzmdp = /wmdp zlote
/def wzmzp = /wmzp zlote
/def wsmdp = /wmdp srebrne
/def wsmzp = /wmzp srebrne
/def wmmdp = /wmdp miedziane
/def wmmzp = /wmzp miedziane
/def wpmdp = /wmdp platynowe
/def wpmzp = /wmzp platynowe
/def wkdp = /wdp %{*} kamienie
/def wkzp = /wzp %{*} kamienie

/def wm = /wez %{*} monety
/def wk = /wez kamienie %; /odloz granity, piaskowce

;; Sakiewka, mieszek i liczenie monet ;-)

/def wkds = /wds %{*} kamienie
/def wkzs = /wzs %{*} kamienie

/def wmds = /wds %{*} monety
/def wmzs = /wzs %{*} monety

/def wpmds = /wmds platynowe
/def wpmzs = /wmzs platynowe

/def wzmds = /wmds zlote
/def wzmzs = /wmzs zlote

/def wsmds = /wmds srebrne
/def wsmzs = /wmzs srebrne

/def wmmds = /wmds miedziane
/def wmmzs = /wmzs miedziane

