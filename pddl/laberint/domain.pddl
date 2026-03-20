(define (domain laberint)
  (:requirements :adl)
  (:types loc dir - object)
  
  (:predicates
    (at ?l - loc)
    (adjacent ?from ?to - loc ?d - dir)
    (es-paret ?l - loc)
    (es-fantasma)
    (es-transformacio ?l - loc)
  )

  ;; Moviment normal (no pot atravessar parets)
  (:action moure-normal
    :parameters (?from ?to - loc ?d - dir)
    :precondition (and 
                    (not (es-fantasma))
                    (at ?from)
                    (adjacent ?from ?to ?d)
                    (not (es-paret ?to)))
    :effect (and 
              (at ?to)
              (not (at ?from))))

   ;; Acció per convertir-se en fantasma
    (:action transformar-se
      :parameters (?l - loc)
      :precondition (and (at ?l) (es-transformacio ?l))
      :effect (es-fantasma))

  ;; Moviment fantasma (pot atravessar parets)
  (:action moure-fantasma
    :parameters (?from ?to - loc ?d - dir)
    :precondition (and 
                    (es-fantasma)
                    (at ?from)
                    (adjacent ?from ?to ?d))
    :effect (and 
              (at ?to)
              (not (at ?from))))
)
