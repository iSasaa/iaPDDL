(define (problem pb_simpleb)
    (:domain magabot_simple)
    
    (:objects
        loc_1_1 loc_1_2 loc_1_3 loc_1_4 loc_1_5 loc_1_6
        loc_2_1 loc_2_2 loc_2_3 loc_2_4 loc_2_5 loc_2_6
        loc_3_1 loc_3_2 loc_3_3 loc_3_4 loc_3_5 loc_3_6
        loc_4_1 loc_4_2 loc_4_3 loc_4_4 loc_4_5 loc_4_6
        loc_5_1 loc_5_2 loc_5_3 loc_5_4 loc_5_5 loc_5_6
        loc_6_1 loc_6_2 loc_6_3 loc_6_4 loc_6_5 loc_6_6 - loc
        
        r1 r2 - robot
        pkg1 pkg2 pkg3 - paquet
        e1 e2 - estanteria
        d - dispensador
    )

    (:init
        ;; --- Adjacències ---
        ;; Fila 1
        (adjacent loc_1_1 loc_1_2) (adjacent loc_1_1 loc_2_1)
        (adjacent loc_1_2 loc_1_1) (adjacent loc_1_2 loc_1_3) (adjacent loc_1_2 loc_2_2)
        (adjacent loc_1_3 loc_1_2) (adjacent loc_1_3 loc_1_4) (adjacent loc_1_3 loc_2_3)
        (adjacent loc_1_4 loc_1_3) (adjacent loc_1_4 loc_1_5) (adjacent loc_1_4 loc_2_4)
        (adjacent loc_1_5 loc_1_4) (adjacent loc_1_5 loc_1_6) (adjacent loc_1_5 loc_2_5)
        (adjacent loc_1_6 loc_1_5) (adjacent loc_1_6 loc_2_6)
        ;; Fila 2
        (adjacent loc_2_1 loc_1_1) (adjacent loc_2_1 loc_2_2) (adjacent loc_2_1 loc_3_1)
        (adjacent loc_2_2 loc_1_2) (adjacent loc_2_2 loc_2_1) (adjacent loc_2_2 loc_2_3) (adjacent loc_2_2 loc_3_2)
        (adjacent loc_2_3 loc_1_3) (adjacent loc_2_3 loc_2_2) (adjacent loc_2_3 loc_2_4) (adjacent loc_2_3 loc_3_3)
        (adjacent loc_2_4 loc_1_4) (adjacent loc_2_4 loc_2_3) (adjacent loc_2_4 loc_2_5) (adjacent loc_2_4 loc_3_4)
        (adjacent loc_2_5 loc_1_5) (adjacent loc_2_5 loc_2_4) (adjacent loc_2_5 loc_2_6) (adjacent loc_2_5 loc_3_5)
        (adjacent loc_2_6 loc_1_6) (adjacent loc_2_6 loc_2_5) (adjacent loc_2_6 loc_3_6)
        ;; Fila 3
        (adjacent loc_3_1 loc_2_1) (adjacent loc_3_1 loc_3_2) (adjacent loc_3_1 loc_4_1)
        (adjacent loc_3_2 loc_2_2) (adjacent loc_3_2 loc_3_1) (adjacent loc_3_2 loc_3_3) (adjacent loc_3_2 loc_4_2)
        (adjacent loc_3_3 loc_2_3) (adjacent loc_3_3 loc_3_2) (adjacent loc_3_3 loc_3_4) (adjacent loc_3_3 loc_4_3)
        (adjacent loc_3_4 loc_2_4) (adjacent loc_3_4 loc_3_3) (adjacent loc_3_4 loc_3_5) (adjacent loc_3_4 loc_4_4)
        (adjacent loc_3_5 loc_2_5) (adjacent loc_3_5 loc_3_4) (adjacent loc_3_5 loc_3_6) (adjacent loc_3_5 loc_4_5)
        (adjacent loc_3_6 loc_2_6) (adjacent loc_3_6 loc_3_5) (adjacent loc_3_6 loc_4_6)
        ;; Fila 4
        (adjacent loc_4_1 loc_3_1) (adjacent loc_4_1 loc_4_2) (adjacent loc_4_1 loc_5_1)
        (adjacent loc_4_2 loc_3_2) (adjacent loc_4_2 loc_4_1) (adjacent loc_4_2 loc_4_3) (adjacent loc_4_2 loc_5_2)
        (adjacent loc_4_3 loc_3_3) (adjacent loc_4_3 loc_4_2) (adjacent loc_4_3 loc_4_4) (adjacent loc_4_3 loc_5_3)
        (adjacent loc_4_4 loc_3_4) (adjacent loc_4_4 loc_4_3) (adjacent loc_4_4 loc_4_5) (adjacent loc_4_4 loc_5_4)
        (adjacent loc_4_5 loc_3_5) (adjacent loc_4_5 loc_4_4) (adjacent loc_4_5 loc_4_6) (adjacent loc_4_5 loc_5_5)
        (adjacent loc_4_6 loc_3_6) (adjacent loc_4_6 loc_4_5) (adjacent loc_4_6 loc_5_6)
        ;; Fila 5
        (adjacent loc_5_1 loc_4_1) (adjacent loc_5_1 loc_5_2) (adjacent loc_5_1 loc_6_1)
        (adjacent loc_5_2 loc_4_2) (adjacent loc_5_2 loc_5_1) (adjacent loc_5_2 loc_5_3) (adjacent loc_5_2 loc_6_2)
        (adjacent loc_5_3 loc_4_3) (adjacent loc_5_3 loc_5_2) (adjacent loc_5_3 loc_5_4) (adjacent loc_5_3 loc_6_3)
        (adjacent loc_5_4 loc_4_4) (adjacent loc_5_4 loc_5_3) (adjacent loc_5_4 loc_5_5) (adjacent loc_5_4 loc_6_4)
        (adjacent loc_5_5 loc_4_5) (adjacent loc_5_5 loc_5_4) (adjacent loc_5_5 loc_5_6) (adjacent loc_5_5 loc_6_5)
        (adjacent loc_5_6 loc_4_6) (adjacent loc_5_6 loc_5_5) (adjacent loc_5_6 loc_6_6)
        ;; Fila 6
        (adjacent loc_6_1 loc_5_1) (adjacent loc_6_1 loc_6_2)
        (adjacent loc_6_2 loc_5_2) (adjacent loc_6_2 loc_6_1) (adjacent loc_6_2 loc_6_3)
        (adjacent loc_6_3 loc_5_3) (adjacent loc_6_3 loc_6_2) (adjacent loc_6_3 loc_6_4)
        (adjacent loc_6_4 loc_5_4) (adjacent loc_6_4 loc_6_3) (adjacent loc_6_4 loc_6_5)
        (adjacent loc_6_5 loc_5_5) (adjacent loc_6_5 loc_6_4) (adjacent loc_6_5 loc_6_6)
        (adjacent loc_6_6 loc_5_6) (adjacent loc_6_6 loc_6_5)

        ;; --- Entitats Bloquejades (Segons la imatge del Sector Alfa) ---
        (bloquejada loc_1_6)
        (bloquejada loc_2_2) (bloquejada loc_2_3) (bloquejada loc_2_4) (bloquejada loc_2_5) (bloquejada loc_2_6)
        (bloquejada loc_3_2) (bloquejada loc_3_4) (bloquejada loc_3_6)
        (bloquejada loc_4_2) (bloquejada loc_4_4) (bloquejada loc_4_6)
        (bloquejada loc_6_2) (bloquejada loc_6_4) (bloquejada loc_6_5)

        ;; --- Posicions inicials ---
        (at r1 loc_6_1) (at r2 loc_5_5)
        (at e1 loc_2_2) (at e2 loc_2_5)
        (at d loc_4_4)
        
        ;; --- Piles (Stack) ---
        (at pkg2 loc_2_2) (on pkg2 e1)
        (at pkg1 loc_2_2) (on pkg1 pkg2) (clear pkg1)
        (at pkg3 loc_2_5) (on pkg3 e2) (clear pkg3)
        
        (clear r1) (clear r2)
        
        ;; --- Control d'Ordre ---
        (esperant-dispensar pkg2) (proxim-paquet pkg2 pkg1) (proxim-paquet pkg1 pkg3)
    )

    (:goal (and (dispensat pkg1) (dispensat pkg2) (dispensat pkg3)))
)
