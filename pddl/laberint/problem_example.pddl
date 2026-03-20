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
    (at loc_5_4)
    ;; Parets Fila 1
    (es-paret loc_1_1) (es-paret loc_1_2) (es-paret loc_1_3) (es-paret loc_1_4) (es-paret loc_1_5) (es-paret loc_1_6) (es-paret loc_1_7) (es-paret loc_1_8) (es-paret loc_1_9)
    ;; Parets Fila 2
    (es-paret loc_2_1) (es-paret loc_2_2) (es-paret loc_2_8) (es-paret loc_2_9)
    ;; Parets Fila 3
    (es-paret loc_3_1) (es-paret loc_3_4) (es-paret loc_3_5) (es-paret loc_3_9)
    ;; Parets Fila 4
    (es-paret loc_4_1) (es-paret loc_4_4) (es-paret loc_4_5) (es-paret loc_4_6) (es-paret loc_4_7) (es-paret loc_4_8) (es-paret loc_4_9)
    ;; Parets Fila 5
    (es-paret loc_5_1) (es-paret loc_5_9)
    ;; Parets Fila 6
    (es-paret loc_6_1) (es-paret loc_6_2) (es-paret loc_6_3) (es-paret loc_6_4) (es-paret loc_6_5) (es-paret loc_6_6) (es-paret loc_6_7) (es-paret loc_6_8) (es-paret loc_6_9)
    
    (es-transformacio loc_5_8)
    
    ;; Adjacències (només algunes per prova o generem una malla bàsica)
    (adjacent loc_2_3 loc_2_4 right) (adjacent loc_2_4 loc_2_3 left)
    (adjacent loc_2_4 loc_2_5 right) (adjacent loc_2_5 loc_2_4 left)
    (adjacent loc_2_5 loc_2_6 right) (adjacent loc_2_6 loc_2_5 left)
    (adjacent loc_2_6 loc_2_7 right) (adjacent loc_2_7 loc_2_6 left)
    (adjacent loc_2_7 loc_2_8 right) (adjacent loc_2_8 loc_2_7 left)
    (adjacent loc_5_4 loc_5_5 right) (adjacent loc_5_5 loc_5_4 left)
    (adjacent loc_5_5 loc_5_6 right) (adjacent loc_5_6 loc_5_5 left)
    (adjacent loc_5_6 loc_5_7 right) (adjacent loc_5_7 loc_5_6 left)
    (adjacent loc_5_7 loc_5_8 right) (adjacent loc_5_8 loc_5_7 left)
    (adjacent loc_2_3 loc_3_3 down) (adjacent loc_3_3 loc_2_3 up)
    (adjacent loc_3_3 loc_4_3 down) (adjacent loc_4_3 loc_3_3 up)
    (adjacent loc_4_3 loc_5_3 down) (adjacent loc_5_3 loc_4_3 up)
    (adjacent loc_5_3 loc_5_4 right) (adjacent loc_5_4 loc_5_3 left)
  )
  (:goal (at loc_3_8))
)
