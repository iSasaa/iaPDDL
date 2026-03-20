(define (problem laberint-3x3)
  (:domain laberint)
  (:objects 
    loc_1_1 loc_1_2 loc_1_3
    loc_2_1 loc_2_2 loc_2_3
    loc_3_1 loc_3_2 loc_3_3 - loc
    up down left right - dir
  )
  (:init 
    ;; Posició inicial de l'agent (A)
    (at loc_1_1)

    ;; Parets (#)
    (es-paret loc_1_2)
    (es-paret loc_2_2)

    ;; Casella 1-1
    (adjacent loc_1_1 loc_1_2 right) (adjacent loc_1_1 loc_2_1 down)

    ;; Casella 1-2
    (adjacent loc_1_2 loc_1_1 left) (adjacent loc_1_2 loc_1_3 right) (adjacent loc_1_2 loc_2_2 down)

    ;; Casella 1-3
    (adjacent loc_1_3 loc_1_2 left) (adjacent loc_1_3 loc_2_3 down)

    ;; Casella 2-1
    (adjacent loc_2_1 loc_1_1 up) (adjacent loc_2_1 loc_2_2 right) (adjacent loc_2_1 loc_3_1 down)

    ;; Casella 2-2
    (adjacent loc_2_2 loc_1_2 up) (adjacent loc_2_2 loc_2_1 left) (adjacent loc_2_2 loc_2_3 right) (adjacent loc_2_2 loc_3_2 down)

    ;; Casella 2-3
    (adjacent loc_2_3 loc_1_3 up) (adjacent loc_2_3 loc_2_2 left) (adjacent loc_2_3 loc_3_3 down)

    ;; Casella 3-1
    (adjacent loc_3_1 loc_2_1 up) (adjacent loc_3_1 loc_3_2 right)

    ;; Casella 3-2
    (adjacent loc_3_2 loc_2_2 up) (adjacent loc_3_2 loc_3_1 left) (adjacent loc_3_2 loc_3_3 right)

    ;; Casella 3-3
    (adjacent loc_3_3 loc_2_3 up) (adjacent loc_3_3 loc_3_2 left)
  )
  (:goal (at loc_3_3))
)
