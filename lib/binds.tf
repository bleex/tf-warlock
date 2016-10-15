;; Copyright 2003-2010 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_LIB__/binds.tf

/def key_up = /dokey recallb
/def key_down  = /dokey recallf

/def -ib'^[[5~' __page_up = /dokey searchb
/def -ib'^[[6~' __page_down = /dokey searchf

/def -ib'^[[3~' __delete = /dokey_wright
/def -ib'^[[2~' __insert = /dokey_wleft

/def -ib'^[[1~' __home = /dokey_home

/def -ib'^[[11~' __f1_1 = /akcja_f1
/def -ib'^[[[A'	__f1_2 = /akcja_f1

/def -ib'^[[12~' __f2_1 = /akcja_f2
/def -ib'^[[[B' __f2_2 = /akcja_f2

/def -ib'^[[13~' __f3_1 = /akcja_f3
/def -ib'^[[[C' __f3_2 = /akcja_f3

/def -ib'^[[14~' __f4_1 = /akcja_f4
/def -ib'^[[[D' __f4_2 = /akcja_f4

/def -ib'^[[15~' __f5_1 = /akcja_f5
/def -ib'^[[[E' __f5_2 = /akcja_f5

/def -ib'^[[17~' __f6_1 = /akcja_f6

/def -ib'^[[18~' __f7_1 = /akcja_f7

/def -ib'^[[19~' __f8_1 = /akcja_f8

/def -ib'^[[20~' __f9_1 = /akcja_f9

/def -ib'^[[21~' __f10_1 = /akcja_f10

/def -ib'^[[23~' __f11_1 = /akcja_f11

/def -ib'^[[24~' __f12_1 = /akcja_f12



/def -ib'^[On' __kpkropka_1 = /__kp_exit
/def -ib'^[Op' __kp0_1 = /__kp_dd
/def -ib'^[Oq' __kp1_1 = /__kp_sw
/def -ib'^[Or' __kp2_1 = /__kp_ss
/def -ib'^[Os' __kp3_1 = /__kp_se
/def -ib'^[Ot' __kp4_1 = /__kp_ww
/def -ib'^[Ou' __kp5_1 = /__kp_uu
/def -ib'^[Ov' __kp6_1 = /__kp_ee
/def -ib'^[Ow' __kp7_1 = /__kp_nw
/def -ib'^[Ox' __kp8_1 = /__kp_nn
/def -ib'^[Oy' __kp9_1 = /__kp_ne

/def -ib'^[Ol' __kpplus_1 = /akcja_kpplus
/def -ib'^[Oj' __kpgwiazdka_1 = /akcja_kpgwiazdka
/def -ib'^[Oo' __kpslash_1 = /akcja_kpslash
/def -ib'^[Om' __kpminus_1 = /akcja_kpminus
/def -ib'^[OM' __kpenter_1 = /akcja_kpenter

/def -ib'^[Ok' __kpplus_2 = /akcja_kpplus
/def -ib'^[OS' __kpminus_2 = /akcja_kpminus
/def -ib'^[OQ' __kpslash_2 = /akcja_kpslash
/def -ib'^[OR' __kpgwiazdka_2 = /akcja_kpgwiazdka


/def -ib'^A' __ctrl_a = /akcja_ctrl_a
/def -ib'^B' __ctrl_b = /akcja_ctrl_b
/def -ib'^D' __ctrl_d = /akcja_ctrl_d
/def -ib'^E' __ctrl_e = /akcja_ctrl_e
/def -ib'^F' __ctrl_f = /akcja_ctrl_f
/def -ib'^G' __ctrl_g = /akcja_ctrl_g
/def -ib'^H' __ctrl_h = /akcja_ctrl_h
;; ^I == TAB 
;;/def -ib'^I' __ctrl_i = /akcja_ctrl_i
/def -ib'^J' __ctrl_j = /akcja_ctrl_j
/def -ib'^K' __ctrl_k = /akcja_ctrl_k
/def -ib'^L' __ctrl_l = /akcja_ctrl_l
/def -ib'^N' __ctrl_n = /akcja_ctrl_n
/def -ib'^O' __ctrl_o = /akcja_ctrl_o
/def -ib'^P' __ctrl_p = /akcja_ctrl_p
/def -ib'^Q' __ctrl_q = /akcja_ctrl_q
/def -ib'^R' __ctrl_r = /akcja_ctrl_r
/def -ib'^S' __ctrl_s = /akcja_ctrl_s
/def -ib'^T' __ctrl_t = /akcja_ctrl_t
/def -ib'^U' __ctrl_u = /akcja_ctrl_u
/def -ib'^V' __ctrl_v = /akcja_ctrl_v
/def -ib'^W' __ctrl_w = /akcja_ctrl_w
/def -ib'^Y' __ctrl_y = /akcja_ctrl_y

/def -ib'^[1' __1 = /akcja_1
/def -ib'^[2' __2 = /akcja_2
/def -ib'^[3' __3 = /akcja_3
/def -ib'^[4' __4 = /akcja_4
/def -ib'^[5' __5 = /akcja_5
/def -ib'^[6' __6 = /akcja_6
/def -ib'^[7' __7 = /akcja_7
/def -ib'^[8' __8 = /akcja_8
/def -ib'^[9' __9 = /akcja_9
/def -ib'^[0' __0 = /akcja_0

/def -ib'^[a' __esc_a = /akcja_esc_a
/def -ib'^[b' __esc_b = /akcja_esc_b
/def -ib'^[c' __esc_c = /akcja_esc_c
/def -ib'^[d' __esc_d = /akcja_esc_d
/def -ib'^[e' __esc_e = /akcja_esc_e
/def -ib'^[f' __esc_f = /akcja_esc_f
/def -ib'^[g' __esc_g = /akcja_esc_g
/def -ib'^[h' __esc_h = /akcja_esc_h
/def -ib'^[i' __esc_i = /akcja_esc_i
/def -ib'^[j' __esc_j = /akcja_esc_j
/def -ib'^[k' __esc_k = /akcja_esc_k
/def -ib'^[l' __esc_l = /akcja_esc_l
/def -ib'^[m' __esc_m = /akcja_esc_m
/def -ib'^[n' __esc_n = /akcja_esc_n
/def -ib'^[o' __esc_o = /akcja_esc_o
/def -ib'^[p' __esc_p = /akcja_esc_p
/def -ib'^[q' __esc_q = /akcja_esc_q
/def -ib'^[r' __esc_r = /akcja_esc_r
/def -ib'^[s' __esc_s = /akcja_esc_s
/def -ib'^[t' __esc_t = /akcja_esc_t
/def -ib'^[u' __esc_u = /akcja_esc_u
/def -ib'^[v' __esc_v = /akcja_esc_v
/def -ib'^[w' __esc_w = /akcja_esc_w
/def -ib'^[x' __esc_x = /akcja_esc_x
/def -ib'^[y' __esc_y = /akcja_esc_y
/def -ib'^[z' __esc_z = /akcja_esc_z

