;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/settings.tf

/def -i -ag -h'REDEF' gag_redef
/def -i -ag -h'LOAD' load_hook = /echo -p @{BCgreen}%% Loading commands from @{n}@{BCred}%{*}%{n}
/def -i -ag -h'LOG' gag_log
/def -i -ag -h'CONFLICT' gag_conflic
/def -i COMPRESS_SUFFIX=.bz2
/def -i COMPRESS_READ=bzcat

/require tools.tf
/require kbfunc.tf
/require complete.tf
/require kbstack.tf
/require textutil.tf

/set TERM=vt102
;; Wylaczanie mesgow - bardzo przydatne gdyz domyslnym 
;; ustawieniem u mnie na terminalu jest tryb 620
/set shpause off
/sh -q mesg n
/set shpause on

/localecho on
/insert on
/quitdone off
/login on

/set kecho on
/set kprefix=[INPUT]: 
/set kecho_attr BCmagenta

/set secho on
/set sprefix=[SENT]: 
/set secho_attr BCcyan

/set istrip=off
;; Gdy bylo mniej to tf potrafil mi powylaczac polowe triggerow (hility, beepy ...)
;; przy wiekszej walce badz nawet przy piciu intensywnym mleka z buklakow przez 
;; czlonkow druzyny :-) 
;; Oznacza to, ze w ciagu 10 sekund zostanie wywolanych maksymalnie 10k triggerow
/set max_trig 10000

;;; In visual mode, scroll output instead of wrapping from bottom to top.
;;/scroll on

;;; Enable windowing mode.
/visual on

;;; Enable/disable paging
/more off

;;; Enable suppression of introductory MUD text.
/quiet off

;;; Disable old-style slash interpretation
;;; I recommend this unless you have old macros containing multiple slashes.
/set oldslash=off


/histsize -i 65545
;; Czas pokazywania komunikatow na pasku (domyslnie 5.0)
/set alert_time=3.0
;; Rozmiar pola wejsciowego (ilosc linii)
;;/set isize=5

;; Wlaczenie separacji komend przez %; w polu wejsciowym
/set sub=off

/set time_format=%H:%M

/set warn_curly_re=off

/set telopt=off
