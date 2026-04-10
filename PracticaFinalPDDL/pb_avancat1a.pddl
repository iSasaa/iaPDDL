(define (problem pb_avancat1a)
    (:domain magabot_avancat)
    
    (:objects
        loc_1_1 loc_1_2 loc_1_3 loc_1_4 loc_1_5 loc_1_6
        loc_2_1 loc_2_2 loc_2_3 loc_2_4 loc_2_5 loc_2_6
        loc_3_1 loc_3_2 loc_3_3 loc_3_4 loc_3_5 loc_3_6
        loc_4_1 loc_4_2 loc_4_3 loc_4_4 loc_4_5 loc_4_6
        loc_5_1 loc_5_2 loc_5_3 loc_5_4 loc_5_5 loc_5_6
        loc_6_1 loc_6_2 loc_6_3 loc_6_4 loc_6_5 loc_6_6 - loc
        
        r1 r2 - robot
        pkg1 pkg2 pkg3 pkg4 - paquet
        e1 e2 - estanteria
        d - dispensador
        c - carregador
    )

    (:init
        ;; --- ADJACÈNCIES ---
        ;; Fila 1
        (adjacent loc_1_1 loc_1_2) (adjacent loc_1_1 loc_2_1)
        (adjacent loc_1_2 loc_1_1) (adjacent loc_1_2 loc_1_3)
        (adjacent loc_1_3 loc_1_2) (adjacent loc_1_3 loc_1_4)
        (adjacent loc_1_4 loc_1_3) (adjacent loc_1_4 loc_1_5) (adjacent loc_1_4 loc_2_4)
        (adjacent loc_1_5 loc_1_4) (adjacent loc_1_5 loc_1_6)
        (adjacent loc_1_6 loc_1_5) (adjacent loc_1_6 loc_2_6)

        ;; Fila 2
        (adjacent loc_2_1 loc_1_1) (adjacent loc_2_1 loc_3_1)
        (adjacent loc_2_4 loc_1_4) (adjacent loc_2_4 loc_3_4)
        (adjacent loc_2_6 loc_1_6) (adjacent loc_2_6 loc_3_6)

        ;; Fila 3
        (adjacent loc_3_1 loc_2_1) (adjacent loc_3_1 loc_3_2) (adjacent loc_3_1 loc_4_1)
        (adjacent loc_3_2 loc_3_1) (adjacent loc_3_2 loc_4_2)
        (adjacent loc_3_4 loc_2_4)
        (adjacent loc_3_6 loc_2_6) (adjacent loc_3_6 loc_4_6)

        ;; Fila 4
        (adjacent loc_4_2 loc_3_2) (adjacent loc_4_2 loc_5_2)
        (adjacent loc_4_4 loc_4_5) (adjacent loc_4_4 loc_5_4)
        (adjacent loc_4_5 loc_4_4) (adjacent loc_4_5 loc_4_6)
        (adjacent loc_4_6 loc_3_6) (adjacent loc_4_6 loc_4_5) (adjacent loc_4_6 loc_5_6)

        ;; Fila 5
        (adjacent loc_5_1 loc_4_1) (adjacent loc_5_1 loc_5_2) (adjacent loc_5_1 loc_6_1)
        (adjacent loc_5_2 loc_5_1) (adjacent loc_5_2 loc_4_2) (adjacent loc_5_2 loc_5_3) (adjacent loc_5_2 loc_6_2)
        (adjacent loc_5_3 loc_5_2) (adjacent loc_5_3 loc_5_4) (adjacent loc_5_3 loc_6_3)
        (adjacent loc_5_4 loc_5_3) (adjacent loc_5_4 loc_4_4) (adjacent loc_5_4 loc_6_4)

        ;; Fila 6
        (adjacent loc_6_2 loc_5_2) (adjacent loc_6_2 loc_6_1) (adjacent loc_6_2 loc_6_3)
        (adjacent loc_6_4 loc_6_3) (adjacent loc_6_4 loc_6_5) (adjacent loc_6_4 loc_5_4)
        (adjacent loc_6_5 loc_6_4) (adjacent loc_6_5 loc_6_6)
        (adjacent loc_6_6 loc_6_5) (adjacent loc_6_6 loc_5_6)

        ;; --- ENTITATS BLOQUEJADES ---
        (bloquejada loc_2_2) (bloquejada loc_2_3) (bloquejada loc_2_4) (bloquejada loc_2_5)
        (bloquejada loc_3_3) (bloquejada loc_3_4) (bloquejada loc_3_5) 
        (bloquejada loc_4_1) (bloquejada loc_4_3) 
        (bloquejada loc_5_1) (bloquejada loc_5_5) (bloquejada loc_5_6)
        (bloquejada loc_6_1) (bloquejada loc_6_2) (bloquejada loc_6_3) (bloquejada loc_6_6)

        ;; --- POSICIONS INICIALS ---
        (at r1 loc_1_6)
        (at r2 loc_4_2)
        (at e1 loc_2_4)
        (at e2 loc_5_1)
        (at c loc_6_2)
        (at d loc_6_6)
        
        ;; Stack: e1 -> pkg1(4) -> pkg2(3) -> pkg3(2) -> pkg4(1)
        (at pkg1 loc_2_4) (on pkg1 e1)
        (at pkg2 loc_2_4) (on pkg2 pkg1)
        (at pkg3 loc_2_4) (on pkg3 pkg2)
        (at pkg4 loc_2_4) (on pkg4 pkg3) (clear pkg4)
        
        (clear e2) (clear r1) (clear r2)
        
        ;; Atributs
        (= (pes pkg1) 4) (= (pes pkg2) 3) (= (pes pkg3) 2) (= (pes pkg4) 1)
        
        ;; Carrega Limitada de 10 Kilos per als robots
        (= (carrega-actual r1) 0) (= (carrega-maxima r1) 10)
        (= (bateria-actual r1) 20) (= (bateria-maxima r1) 50)
        
        (= (carrega-actual r2) 0) (= (carrega-maxima r2) 10)
        (= (bateria-actual r2) 20) (= (bateria-maxima r2) 50)
        
        ;; Goal
        (esperant-dispensar pkg1)
        (esperant-dispensar pkg2)
        (esperant-dispensar pkg3)

        (= (energia-total) 0)
    )

    (:goal (and 
        (dispensat pkg1) 
        (dispensat pkg2) 
        (dispensat pkg3)
    ))
    
    (:metric minimize (energia-total))
)