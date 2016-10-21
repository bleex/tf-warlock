;; Copyright 2004-2016 Liwiusz Ociepa <liwiusz<malpka>gmail,com>
;;    This program is free software; you can redistribute it and/or modify
;;    it under the terms of the GNU General Public License as published by
;;    the Free Software Foundation; either version 2 of the License, or
;;    (at your option) any later version.

/loaded __BLX_DEF__/monsters.tf

/require lib/switch.tf

;; Funkcje z tego pliku nie robia nic innego tylko definiuja mi inne funkcje 
;; uzywane przez jeszcze inne funkcje z areas.tf (ufff - duzo tych funkcji)

;; Dodawanie nowego potwora:
;; /__potwory <mianownik> <biernik> <narzednik> <celownik>
;; Uzycie - samo w zasadzie bez sensu - najlepiej uzywac funkcji z expowiska.tf
;; Mozna ostatecznie recznie odpalac ale nie chce mi sie helpa pisac

/__switch_add potworki BCmagenta

/def -i __potwory = \
	/if ({#} = 4) \
		/__switch_item_add potworki %{1} /noop %{1} %{2} %{3} %{4} %;\
	/elseif ({#} = 8) \
		/test $$[__switch_item_add("potworki", "%{1}_%{2}", "/noop", "%{1} %{2}", "%{3} %{4}", "%{5} %{6}", "%{7} %{8}")] %;\
	/elseif ({#} = 12) \
		/test $$[__switch_item_add("potworki", "%{1}_%{2}_%{3}", "/noop", "%{1} %{2} %{3}", "%{4} %{5} %{6}", "%{7} %{8} %{9}", "%{10} %{11} %{12}")] %;\
	/endif

/__potwory behemot behemota behemotem behemotowi
/__potwory bobr bobra bobrem bobrowi
/__potwory borsuk borsuka borsukiem borsukowi
/__potwory czlowiek czlowieka czlowiekiem czlowiekowi
/__potwory demonica demonice deminica demonice
/__potwory dziecko dziecko dzieckiem dziecku
/__potwory dzik dzika dzikiem dzikowi
/__potwory elf elfa elfem elfowi
/__potwory ghast ghasta ghastem ghastowi
/__potwory ghoul ghoula ghoulem ghoulowi
/__potwory gigant giganta gigantem gigantowi
/__potwory gnilec gnilca gnilcem gnilcowi
/__potwory gnoll gnolla gnollem gnollowi
/__potwory gnom gnoma gnomem gnomowi

/__potwory goblin goblina goblinem goblinowi
/__potwory duzy goblin duzego goblina duzym goblinem duzemu goblinowi
/__potwory maly goblin malego goblina malym goblinem malemu goblinowi
/__potwory nieduzy goblin nieduzego goblina nieduzym goblinem nieduzemu goblinowi
/__potwory ogromny goblin ogromnego goblina ogromnym goblinem ogromnemu goblinowi
/__potwory sredni goblin sredniego goblina srednim goblinem sredniemu goblinowi
/__potwory wielki goblin wielkiego goblina wielkim goblinem wielkiemu goblinowi

/__potwory gobor gobora goborem goborowi
/__potwory golem golema golemem golemowi
/__potwory gremlin gremlina gremlinem gremlinowi
/__potwory gwardzista gwardziste gwardzista gwardziscie
/__potwory harpia harpie harpia harpii

/__potwory hobgoblin hobgoblina hobgoblinem hobgoblinowi
/__potwory muskularny hobgoblin muskularnego hobgoblina muskularnym hobgoblinem muskularnemu hobgoblinowi

/__potwory hobgobor hobgobora hobgoborem hobgoborowi
/__potwory horror horror horrorem horrorowi
/__potwory imp impa impem impowi
/__potwory istota istote istota istocie
/__potwory jaszczurka jaszczurke jaszczurka jaszczurce
/__potwory jelen jelenia jeleniem jeleniowi
/__potwory karaluch karalucha karaluchem karaluchowi
/__potwory karzel karla karlem karlowi
/__potwory kmaran kmarana kmaranem kmaranowi
/__potwory kobieta kobiete kobieta kobiecie
/__potwory kobold kobolda koboldem koboldowi
/__potwory komar komara komarem komarowi
/__potwory kon konia koniem koniowi
/__potwory kosciej koscieja kosciejem kosciejowi
/__potwory kosciotrup kosciotrupa kosciotrupem kosciotrupowi
/__potwory kot kota kotem kotu
/__potwory kozica kozice kozica kozicy
/__potwory krasnolud krasnoluda krasnoludem krasnoludowi

/__potwory krolik krolika krolikiem krolikowi
/__potwory bialy krolik bialego krolika bialym krolikiem bialemu krolikowi
/__potwory szarawy krolik szarawego krolika szarawym krolikiem szarawemu krolikowi
/__potwory rudy krolik rudego krolika rudym krolikiem rudemu krolikowi

/__potwory krowa krowe krowa krowie
/__potwory kundel kundla kundlem kundlowi
/__potwory kura kure kura kurze
/__potwory licz licza liczem liczowi
/__potwory lis lisa lisem lisowi
/__potwory los losia losiem losiowi
/__potwory minotaur minotaura minotaurem minotaurowi
/__potwory moloh moloha molohem molohowi
/__potwory mumia mumie mumia mumii
/__potwory mysz mysz mysza myszy

/__potwory nazgul nazgula nazgulem nazgulowi
/__potwory czarnoodziany mezczyzna czarnoodzianego mezczyzne czarnoodzianym mezczyzna czarnoodzianemu mezczyznie
/__potwory zakapturzony mezczyzna zakapturzonego mezczyzne zakapturzonym mezczyzna zakapturzonemu mezczyznie

/__potwory niedzwiedz niedzwiedzia niedzwiedziem niedzwiedziowi
/__potwory niedzwiedzica niedzwiedzice niedzwiedzica niedzwiedzicy
/__potwory nietoperz nietoperza nietoperzem nietoperzowi
/__potwory niziolek niziolka niziolkiem niziolkowi
/__potwory ogar ogara ogarem ogarowi
/__potwory ogr ogra ogrem ogrowi
/__potwory ogrylion ogryliona ogrylionem ogrylionowi
/__potwory ork orka orkiem orkowi
/__potwory oslizg oslizga oslizgiem oslizgowi
/__potwory osmiornica osmiornice osmiornica osmiornicy
/__potwory owca owce owca owcy
/__potwory ozywieniec ozywienca ozywiencem ozywiencowi

/__potwory pajak pajaka pajakiem pajakowi

/__potwory maly pajak malego pajaka malym pajakiem malemu pajakowi
/__potwory duzy pajak duzego pajaka duzym pajakiem duzemu pajakowi
/__potwory gigantyczny pajak gigantycznego pajaka gigantycznym pajakiem gigantycznemu pajakowi

/__potwory szybki pajak szybkiego pajaka szybkim pajakiem szybkiemu pajakowi
/__potwory wojowniczy pajak wojowniczego pajaka wojowniczym pajakiem wojowniczemu pajakowi

/__potwory pajeczyca pajeczyce pajeczyca pajeczycy

/__potwory pies psa psem psu
/__potwory maly pies malego psa malym psem malemu psu
/__potwory grozny pies groznego psa groznym psem groznemu psu
/__potwory wielki pies wielkiego psa wielkim psem wielkiemu psu

/__potwory poczwara poczware poczwara poczwarze
/__potwory polelf polelfa polelfem polelfowi
/__potwory polork polorka polorkiem polorkowi
/__potwory potepieniec potepienca potepiencem potepiencowi
/__potwory potwor potwora potworem potworowi
/__potwory reptilion reptiliona reptilionem reptilionowi
/__potwory robaczek robaczka robaczkiem robaczkowi
/__potwory ryboczlek ryboczleka ryboczlekiem ryboczlekowi
/__potwory rys rysia rysiem rysiowi
/__potwory rycerz rycerza rycerzem rycerzowi
/__potwory skarabeusz skarabeusza skarabeuszem skarabeuszowi
/__potwory smok smoka smokiem smokowi
/__potwory smoketka smoketke smoketka smoketce
/__potwory strzyga strzyge strzyga strzydze
/__potwory swinia swinie swinia swini
/__potwory swistak swistaka swistakiem swistakowi
/__potwory szczur szczura szczurem szczurowi
/__potwory szkielet szkielet szkieletem szkieletowi
/__potwory szop szopa szopem szopowi
/__potwory topielec topielca topielcem topielcowi
/__potwory troll trolla trollem trollowi
/__potwory uruk uruka urukiem urukowi
/__potwory waz weza wezem wezowi
/__potwory wilczyca wilczyce wilczyca wilczycy
/__potwory wilk wilka wilkiem wilkowi
/__potwory widmo widmo widmem widmu
/__potwory zaba zabe zaba zabie
/__potwory zajac zajaca zajacem zajacowi
/__potwory zbroja zbroje zbroja zbroi
/__potwory zjawa zjawe zjawa zjawie
/__potwory zombi zombiego zombim zombiemu
/__potwory zuk zuka zukiem zukowi
/__potwory zwierzoludz zwierzoludzia zwierzoludziem zwierzoludziowi

