(define (problem pb_avancat2a)
    (:domain magabot_simple)
    
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
        ;; Nota: 'carregador' no existeix a domain_simple; loc_5_5 es marca com bloquejada
    )

    (:init
        ;; --- ADJACÈNCIES ---
        ;;   1    2    3    4    5    6
        ;; 1 [  ] [  ] [R1] [  ] [  ] [  ]
        ;; 2 [  ] [##] [##] [E1] [  ] [  ]
        ;; 3 [  ] [  ] [##] [##] [##] [  ]
        ;; 4 [##] [  ] [##] [R2] [  ] [  ]
        ;; 5 [D ] [  ] [  ] [  ] [C ] [E2]
        ;;
        ;; Cada cel·la no-paret llista totes les seves veïnes no-paret (igual que pb_avancat1c)

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
        (bloquejada loc_5_5) ;; C (físicament bloquejat encara que no s'usa en domain_simple)
        (bloquejada loc_5_6) ;; E2

        ;; --- POSICIONS INICIALS ---
        (at r1 loc_1_3)
        (at r2 loc_4_4)
        (at e1 loc_2_4)
        (at e2 loc_5_6)
        (at d loc_5_1)

        ;; Stack E1: e1 -> pkg1(4kg) -> pkg2(3kg) -> pkg3(2kg) -> pkg4(1kg) al capdamunt
        (at pkg1 loc_2_4) (on pkg1 e1)
        (at pkg2 loc_2_4) (on pkg2 pkg1)
        (at pkg3 loc_2_4) (on pkg3 pkg2)
        (at pkg4 loc_2_4) (on pkg4 pkg3) (clear pkg4)

        ;; Stack E2: e2 -> pkg5(3kg) -> pkg6(2kg) al capdamunt
        ;; Robots accedeixen E2 des de loc_4_6 (adjacent al nord)
        (at pkg5 loc_5_6) (on pkg5 e2)
        (at pkg6 loc_5_6) (on pkg6 pkg5) (clear pkg6)

        (clear r1) (clear r2)

        ;; Goal logic (sense ordre: tots els paquets es poden dispensar en qualsevol ordre)
        (esperant-dispensar pkg1)
        (esperant-dispensar pkg2)
        (esperant-dispensar pkg3)
        (esperant-dispensar pkg4)
        (esperant-dispensar pkg5)
        (esperant-dispensar pkg6)
    )

    (:goal (and 
        (dispensat pkg1)
        (dispensat pkg2)
        (dispensat pkg3)
        (dispensat pkg4)
        (dispensat pkg5)
        (dispensat pkg6)
    ))
)
