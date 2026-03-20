(define (problem laberint-exemple)
  (:domain laberint)
  (:objects 
    loc_1_1 loc_1_2 loc_1_3 loc_1_4 loc_1_5 loc_1_6 loc_1_7 loc_1_8 loc_1_9
    loc_2_1 loc_2_2 loc_2_3 loc_2_4 loc_2_5 loc_2_6 loc_2_7 loc_2_8 loc_2_9
    loc_3_1 loc_3_2 loc_3_3 loc_3_4 loc_3_5 loc_3_6 loc_3_7 loc_3_8 loc_3_9
    loc_4_1 loc_4_2 loc_4_3 loc_4_4 loc_4_5 loc_4_6 loc_4_7 loc_4_8 loc_4_9
    loc_5_1 loc_5_2 loc_5_3 loc_5_4 loc_5_5 loc_5_6 loc_5_7 loc_5_8 loc_5_9
    loc_6_1 loc_6_2 loc_6_3 loc_6_4 loc_6_5 loc_6_6 loc_6_7 loc_6_8 loc_6_9 - loc
    up down left right - dir
  )
  (:init 
    ;; Posició inicial (A)
    (at loc_5_4)

    ;; Parets (#)
    (es-paret loc_1_1) (es-paret loc_1_2) (es-paret loc_1_3) (es-paret loc_1_4) (es-paret loc_1_5) (es-paret loc_1_6) (es-paret loc_1_7) (es-paret loc_1_8) (es-paret loc_1_9)
    (es-paret loc_2_1) (es-paret loc_2_2) (es-paret loc_2_8) (es-paret loc_2_9)
    (es-paret loc_3_1) (es-paret loc_3_4) (es-paret loc_3_5)
    (es-paret loc_4_1) (es-paret loc_4_4) (es-paret loc_4_5) (es-paret loc_4_6) (es-paret loc_4_7) (es-paret loc_4_8) (es-paret loc_4_9)
    (es-paret loc_5_1) (es-paret loc_5_9)
    (es-paret loc_6_1) (es-paret loc_6_2) (es-paret loc_6_3) (es-paret loc_6_4) (es-paret loc_6_5) (es-paret loc_6_6) (es-paret loc_6_7) (es-paret loc_6_8) (es-paret loc_6_9)

    ;; Transformació Fantasma (G)
    (es-transformacio loc_5_8)

    ;; Adjacències (Origen Destí Direcció)
    ;; Fila 1 a 2
    (adjacent loc_1_1 loc_2_1 down) (adjacent loc_1_2 loc_2_2 down) (adjacent loc_1_3 loc_2_3 down) (adjacent loc_1_4 loc_2_4 down) (adjacent loc_1_5 loc_2_5 down) (adjacent loc_1_6 loc_2_6 down) (adjacent loc_1_7 loc_2_7 down) (adjacent loc_1_8 loc_2_8 down) (adjacent loc_1_9 loc_2_9 down)
    ;; Fila 2 a 1 i 3
    (adjacent loc_2_1 loc_1_1 up) (adjacent loc_2_1 loc_3_1 down) (adjacent loc_2_1 loc_2_2 right)
    (adjacent loc_2_2 loc_1_2 up) (adjacent loc_2_2 loc_3_2 down) (adjacent loc_2_2 loc_2_1 left) (adjacent loc_2_2 loc_2_3 right)
    (adjacent loc_2_3 loc_1_3 up) (adjacent loc_2_3 loc_3_3 down) (adjacent loc_2_3 loc_2_2 left) (adjacent loc_2_3 loc_2_4 right)
    (adjacent loc_2_4 loc_1_4 up) (adjacent loc_2_4 loc_3_4 down) (adjacent loc_2_4 loc_2_3 left) (adjacent loc_2_4 loc_2_5 right)
    (adjacent loc_2_5 loc_1_5 up) (adjacent loc_2_5 loc_3_5 down) (adjacent loc_2_5 loc_2_4 left) (adjacent loc_2_5 loc_2_6 right)
    (adjacent loc_2_6 loc_1_6 up) (adjacent loc_2_6 loc_3_6 down) (adjacent loc_2_6 loc_2_5 left) (adjacent loc_2_6 loc_2_7 right)
    (adjacent loc_2_7 loc_1_7 up) (adjacent loc_2_7 loc_3_7 down) (adjacent loc_2_7 loc_2_6 left) (adjacent loc_2_7 loc_2_8 right)
    (adjacent loc_2_8 loc_1_8 up) (adjacent loc_2_8 loc_3_8 down) (adjacent loc_2_8 loc_2_7 left) (adjacent loc_2_8 loc_2_9 right)
    (adjacent loc_2_9 loc_1_9 up) (adjacent loc_2_9 loc_3_9 down) (adjacent loc_2_9 loc_2_8 left)
    ;; Fila 3 a 2 i 4
    (adjacent loc_3_1 loc_2_1 up) (adjacent loc_3_1 loc_4_1 down) (adjacent loc_3_1 loc_3_2 right)
    (adjacent loc_3_2 loc_2_2 up) (adjacent loc_3_2 loc_4_2 down) (adjacent loc_3_2 loc_3_1 left) (adjacent loc_3_2 loc_3_3 right)
    (adjacent loc_3_3 loc_2_3 up) (adjacent loc_3_3 loc_4_3 down) (adjacent loc_3_3 loc_3_2 left) (adjacent loc_3_3 loc_3_4 right)
    (adjacent loc_3_4 loc_2_4 up) (adjacent loc_3_4 loc_4_4 down) (adjacent loc_3_4 loc_3_3 left) (adjacent loc_3_4 loc_3_5 right)
    (adjacent loc_3_5 loc_2_5 up) (adjacent loc_3_5 loc_4_5 down) (adjacent loc_3_5 loc_3_4 left) (adjacent loc_3_5 loc_3_6 right)
    (adjacent loc_3_6 loc_2_6 up) (adjacent loc_3_6 loc_4_6 down) (adjacent loc_3_6 loc_3_5 left) (adjacent loc_3_6 loc_3_7 right)
    (adjacent loc_3_7 loc_2_7 up) (adjacent loc_3_7 loc_4_7 down) (adjacent loc_3_7 loc_3_6 left) (adjacent loc_3_7 loc_3_8 right)
    (adjacent loc_3_8 loc_2_8 up) (adjacent loc_3_8 loc_4_8 down) (adjacent loc_3_8 loc_3_7 left) (adjacent loc_3_8 loc_3_9 right)
    (adjacent loc_3_9 loc_2_9 up) (adjacent loc_3_9 loc_4_9 down) (adjacent loc_3_9 loc_3_8 left)
    ;; Fila 4 a 3 i 5
    (adjacent loc_4_1 loc_3_1 up) (adjacent loc_4_1 loc_5_1 down) (adjacent loc_4_1 loc_4_2 right)
    (adjacent loc_4_2 loc_3_2 up) (adjacent loc_4_2 loc_5_2 down) (adjacent loc_4_2 loc_4_1 left) (adjacent loc_4_2 loc_4_3 right)
    (adjacent loc_4_3 loc_3_3 up) (adjacent loc_4_3 loc_5_3 down) (adjacent loc_4_3 loc_4_2 left) (adjacent loc_4_3 loc_4_4 right)
    (adjacent loc_4_4 loc_3_4 up) (adjacent loc_4_4 loc_5_4 down) (adjacent loc_4_4 loc_4_3 left) (adjacent loc_4_4 loc_4_5 right)
    (adjacent loc_4_5 loc_3_5 up) (adjacent loc_4_5 loc_5_5 down) (adjacent loc_4_5 loc_4_4 left) (adjacent loc_4_5 loc_4_6 right)
    (adjacent loc_4_6 loc_3_6 up) (adjacent loc_4_6 loc_5_6 down) (adjacent loc_4_6 loc_4_5 left) (adjacent loc_4_6 loc_4_7 right)
    (adjacent loc_4_7 loc_3_7 up) (adjacent loc_4_7 loc_5_7 down) (adjacent loc_4_7 loc_4_6 left) (adjacent loc_4_7 loc_4_8 right)
    (adjacent loc_4_8 loc_3_8 up) (adjacent loc_4_8 loc_5_8 down) (adjacent loc_4_8 loc_4_7 left) (adjacent loc_4_8 loc_4_9 right)
    (adjacent loc_4_9 loc_3_9 up) (adjacent loc_4_9 loc_5_9 down) (adjacent loc_4_9 loc_4_8 left)
    ;; Fila 5 a 4 i 6
    (adjacent loc_5_1 loc_4_1 up) (adjacent loc_5_1 loc_6_1 down) (adjacent loc_5_1 loc_5_2 right)
    (adjacent loc_5_2 loc_4_2 up) (adjacent loc_5_2 loc_6_2 down) (adjacent loc_5_2 loc_5_1 left) (adjacent loc_5_2 loc_5_3 right)
    (adjacent loc_5_3 loc_4_3 up) (adjacent loc_5_3 loc_6_3 down) (adjacent loc_5_3 loc_5_2 left) (adjacent loc_5_3 loc_5_4 right)
    (adjacent loc_5_4 loc_4_4 up) (adjacent loc_5_4 loc_6_4 down) (adjacent loc_5_4 loc_5_3 left) (adjacent loc_5_4 loc_5_5 right)
    (adjacent loc_5_5 loc_4_5 up) (adjacent loc_5_5 loc_6_5 down) (adjacent loc_5_5 loc_5_4 left) (adjacent loc_5_5 loc_5_6 right)
    (adjacent loc_5_6 loc_4_6 up) (adjacent loc_5_6 loc_6_6 down) (adjacent loc_5_6 loc_5_5 left) (adjacent loc_5_6 loc_5_7 right)
    (adjacent loc_5_7 loc_4_7 up) (adjacent loc_5_7 loc_6_7 down) (adjacent loc_5_7 loc_5_6 left) (adjacent loc_5_7 loc_5_8 right)
    (adjacent loc_5_8 loc_4_8 up) (adjacent loc_5_8 loc_6_8 down) (adjacent loc_5_8 loc_5_7 left) (adjacent loc_5_8 loc_5_9 right)
    (adjacent loc_5_9 loc_4_9 up) (adjacent loc_5_9 loc_6_9 down) (adjacent loc_5_9 loc_5_8 left)
    ;; Fila 6 a 5
    (adjacent loc_6_1 loc_5_1 up) (adjacent loc_6_1 loc_6_2 right)
    (adjacent loc_6_2 loc_5_2 up) (adjacent loc_6_2 loc_6_1 left) (adjacent loc_6_2 loc_6_3 right)
    (adjacent loc_6_3 loc_5_3 up) (adjacent loc_6_3 loc_6_2 left) (adjacent loc_6_3 loc_6_4 right)
    (adjacent loc_6_4 loc_5_4 up) (adjacent loc_6_4 loc_6_3 left) (adjacent loc_6_4 loc_6_5 right)
    (adjacent loc_6_5 loc_5_5 up) (adjacent loc_6_5 loc_6_4 left) (adjacent loc_6_5 loc_6_6 right)
    (adjacent loc_6_6 loc_5_6 up) (adjacent loc_6_6 loc_6_5 left) (adjacent loc_6_6 loc_6_7 right)
    (adjacent loc_6_7 loc_5_7 up) (adjacent loc_6_7 loc_6_6 left) (adjacent loc_6_7 loc_6_8 right)
    (adjacent loc_6_8 loc_5_8 up) (adjacent loc_6_8 loc_6_7 left) (adjacent loc_6_8 loc_6_9 right)
    (adjacent loc_6_9 loc_5_9 up) (adjacent loc_6_9 loc_6_8 left)
  )
  (:goal (at loc_3_9))
)
