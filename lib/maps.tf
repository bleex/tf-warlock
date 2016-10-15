;; Copyright 2004-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/maps.tf

/def mapa = \
	/set end_color=\033[0;33m %;\
	/echo -aBCgreen Poczatek %;\
	/readfile maps/%{1} %;\
	/set end_color=\033[37;40;0m %;\
	/echo -aBCgreen Koniec %;\


/def listmap = \
	/set end_color=\033[0;33m %;\
	/echo -aBCgreen Poczatek %;\
	/sys ls maps %;\
	/set end_color=\033[37;40;0m %;\
	/echo -aBCgreen Koniec %;\


