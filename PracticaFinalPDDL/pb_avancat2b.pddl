(define (problem pb_avancat2b)
    (:domain magabot_avancat)
    
    (:objects
        loc_1_1 loc_1_2 loc_1_3 loc_1_4 loc_1_5 loc_1_6
        loc_2_1 loc_2_2 loc_2_3 loc_2_4 loc_2_5 loc_2_6
        loc_3_1 loc_3_2 loc_3_3 loc_3_4 loc_3_5 loc_3_6
        loc_4_1 loc_4_2 loc_4_3 loc_4_4 loc_4_5 loc_4_6
        loc_5_1 loc_5_2 loc_5_3 loc_5_4 loc_5_5 loc_5_6 - loc
        
        r1 r2 - robot
        pkg1 pkg2 pkg3 pkg4 pkg5 pkg6 - paquet
        e1 e2 - estanteria
        d - dispensador
        c - carregador
    )

    (:init
        ;; --- ADJACÈNCIES (idèntiques a pb_avancat2a) ---
        ;;   1    2    3    4    5    6
        ;; 1 [  ] [  ] [R1] [  ] [  ] [  ]
        ;; 2 [  ] [##] [##] [E1] [  ] [  ]
        ;; 3 [  ] [  ] [##] [##] [##] [  ]
        ;; 4 [##] [  ] [##] [R2] [  ] [  ]
        ;; 5 [D ] [  ] [  ] [  ] [C ] [E2]

        ;; Fila 1
        (adjacent loc_1_1 loc_1_2) (adjacent loc_1_1 loc_2_1)
        (adjacent loc_1_2 loc_1_1) (adjacent loc_1_2 loc_1_3)
        (adjacent loc_1_3 loc_1_2) (adjacent loc_1_3 loc_1_4)
        (adjacent loc_1_4 loc_1_3) (adjacent loc_1_4 loc_1_5) (adjacent loc_1_4 loc_2_4)
        (adjacent loc_1_5 loc_1_4) (adjacent loc_1_5 loc_1_6) (adjacent loc_1_5 loc_2_5)
        (adjacent loc_1_6 loc_1_5) (adjacent loc_1_6 loc_2_6)

        ;; Fila 2 (2,2 i 2,3 parets)
        (adjacent loc_2_1 loc_1_1) (adjacent loc_2_1 loc_3_1)
        (adjacent loc_2_4 loc_1_4) (adjacent loc_2_4 loc_2_5)
        (adjacent loc_2_5 loc_1_5) (adjacent loc_2_5 loc_2_4) (adjacent loc_2_5 loc_2_6)
        (adjacent loc_2_6 loc_1_6) (adjacent loc_2_6 loc_2_5) (adjacent loc_2_6 loc_3_6)

        ;; Fila 3 (3,3 3,4 3,5 parets)
        (adjacent loc_3_1 loc_2_1) (adjacent loc_3_1 loc_3_2)
        (adjacent loc_3_2 loc_3_1) (adjacent loc_3_2 loc_4_2)
        (adjacent loc_3_6 loc_2_6) (adjacent loc_3_6 loc_4_6)

        ;; Fila 4 (4,1 i 4,3 parets)
        (adjacent loc_4_2 loc_3_2) (adjacent loc_4_2 loc_5_2)
        (adjacent loc_4_4 loc_4_5) (adjacent loc_4_4 loc_5_4)
        (adjacent loc_4_5 loc_4_4) (adjacent loc_4_5 loc_4_6) (adjacent loc_4_5 loc_5_5)
        (adjacent loc_4_6 loc_3_6) (adjacent loc_4_6 loc_4_5) (adjacent loc_4_6 loc_5_6)

        ;; Fila 5
        (adjacent loc_5_1 loc_5_2)
        (adjacent loc_5_2 loc_4_2) (adjacent loc_5_2 loc_5_1) (adjacent loc_5_2 loc_5_3)
        (adjacent loc_5_3 loc_5_2) (adjacent loc_5_3 loc_5_4)
        (adjacent loc_5_4 loc_4_4) (adjacent loc_5_4 loc_5_3) (adjacent loc_5_4 loc_5_5)
        (adjacent loc_5_5 loc_4_5) (adjacent loc_5_5 loc_5_4) (adjacent loc_5_5 loc_5_6)
        (adjacent loc_5_6 loc_4_6) (adjacent loc_5_6 loc_5_5)

        ;; --- ENTITATS BLOQUEJADES ---
        (bloquejada loc_2_2) (bloquejada loc_2_3)
        (bloquejada loc_3_3) (bloquejada loc_3_4) (bloquejada loc_3_5)
        (bloquejada loc_4_1) (bloquejada loc_4_3)
        (bloquejada loc_2_4) ;; E1
        (bloquejada loc_5_1) ;; D
        (bloquejada loc_5_5) ;; C
        (bloquejada loc_5_6) ;; E2

        ;; --- POSICIONS INICIALS ---
        (at r1 loc_1_3)
        (at r2 loc_4_4)
        (at e1 loc_2_4)
        (at e2 loc_5_6)
        (at c loc_5_5)
        (at d loc_5_1)

        ;; Stack E1: e1 -> pkg1(4kg) -> pkg2(3kg) -> pkg3(2kg) -> pkg4(1kg) al capdamunt
        (at pkg1 loc_2_4) (on pkg1 e1)
        (at pkg2 loc_2_4) (on pkg2 pkg1)
        (at pkg3 loc_2_4) (on pkg3 pkg2)
        (at pkg4 loc_2_4) (on pkg4 pkg3) (clear pkg4)

        ;; Stack E2: e2 -> pkg5(3kg) -> pkg6(2kg) al capdamunt
        (at pkg5 loc_5_6) (on pkg5 e2)
        (at pkg6 loc_5_6) (on pkg6 pkg5) (clear pkg6)

        (clear r1) (clear r2)

        ;; Atributs (pes de cada paquet)
        (= (pes pkg1) 4) (= (pes pkg2) 3) (= (pes pkg3) 2) (= (pes pkg4) 1)
        (= (pes pkg5) 3) (= (pes pkg6) 2)

        ;; Capacitat 12kg, bateria inicial 30, màxima 50
        (= (carrega-actual r1) 0) (= (carrega-maxima r1) 12)
        (= (bateria-actual r1) 30) (= (bateria-maxima r1) 50)

        (= (carrega-actual r2) 0) (= (carrega-maxima r2) 12)
        (= (bateria-actual r2) 30) (= (bateria-maxima r2) 50)

        ;; Goal logic (ordre: de més pes a menys, empat prioritzar E1)
        ;; Seqüència: pkg1(4kg) -> pkg2(3kg) -> pkg5(3kg,E2) -> pkg3(2kg) -> pkg6(2kg,E2) -> pkg4(1kg)
        (esperant-dispensar pkg1)
        (proxim-paquet pkg1 pkg2)
        (proxim-paquet pkg2 pkg5)
        (proxim-paquet pkg5 pkg3)
        (proxim-paquet pkg3 pkg6)
        (proxim-paquet pkg6 pkg4)

        (= (energia-total) 0)
    )

    (:goal (and 
        (dispensat pkg1)
        (dispensat pkg2)
        (dispensat pkg3)
        (dispensat pkg4)
        (dispensat pkg5)
        (dispensat pkg6)
    ))

    (:metric minimize (energia-total))
)
Hola bon dia Mateu, per la practica de IA ja tenim fets els fitxers de domini i problemes, pero per els avancats1 els models -planner opt-blind no ens serveixen perque tarden infinitament, he arribat a esperarme 1h i no donava cap resultat, i despres per els avancats2 en el 2a el normal si troba solucio pero en el 2b no en troba, tambe esperant 1h. entenc que podem fer servir diferents tipos de planners que ens proporciona la eina de ENHSP, ja que en el enunciat la part de lliurament ens diu:  
exploreu ENHSP i mireu quines estratègies de solving uns poden ajudar, quins herístiecs, etc.) mostrant els plans trobats.
A lo que entenc que entre aquests planners: sat-hmrp, sat-hadd, sat-hmax, opt-blind, opt-hrmax. Hem de justificar el perque de cada eleccio, i perque ens serveixen i funcionen alguns millor que altres no?
En cas de que diguis que aixo no fa falta, entenc que el que esperes que donem una justificacio i un perque de el resultat que ens ehm trobat i el perque sense fer cap proba de altres planners de ENHSP.
Merciii.

pb_simplea	simple	opt-blind	Sense numèrics → BFS òptim funciona, minimitza passos
pb_simpleb	simple	opt-blind	Igual
pb_simplec	simple	opt-blind	Igual
pb_avancat1a	avancat	defecte (GBFS+AIBR)	Numèrics → opt-blind infinit; AIBR guia bé
pb_avancat1b	avancat	defecte (GBFS+AIBR)	Igual, però triga ~115s
pb_avancat1c	avancat	defecte (GBFS+AIBR)	Igual
pb_avancat2a	simple	defecte (o opt-blind)	Sense numèrics però gran; defecte més ràpid
pb_avancat2b	avancat	sat-hmrp ?	GBFS no conversa; hmrp millor per numèrics interleaved

Justificació per al report (text llest)
Problemes simples: s'usa opt-blind (BFS admissible) perquè el domini no té fluents numèrics → l'espai d'estats és finit i garantim la solució òptima (mínim de passos).

Problemes avançats: opt-blind és inviable perquè els fluents numèrics (bateria, pes, energia) creen un espai d'estats continu i potencialment infinit. S'usa el planificador satisfent per defecte (GBFS + heurístic AIBR) que troba solucions en temps raonable (~1-2 min).

pb_avancat2b: cap planificador satisfent provat (GBFS+AIBR) convergeix en temps raonable (>58 min, >1M d'estats explorats) a causa de la combinació de: ordre interleaved entre dos estanteries, un únic punt d'accés al dispensador, i gestió de bateria numèrica.