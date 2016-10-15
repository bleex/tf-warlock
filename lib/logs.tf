;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/logs.tf

/def -i -p100 -h'connect' connect_log = \
	/set LOG_FILE_${world_name}=private/log/$[ftime("%Y%m%d-%H%M%S", time())]-${world_name}.log %;\
	/sys mkdir -p log %;\
	/eval /log -i %%LOG_FILE_${world_name} %;\
	/eval /log -l %%LOG_FILE_${world_name} %;\
	/eval /log -w %%LOG_FILE_${world_name} %;\
	/def -hloadfail -ag ~gagloadfail %;\
	/eval /require private/chars/${world_name}.tf %;\
	/undef ~gagloadfail %;\


