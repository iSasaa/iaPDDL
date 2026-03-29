(define (domain magabot_simple)
    (:requirements :adl)
    
    (:types 
        loc obj - object
        robot paquet estanteria dispensador - obj
    )

    (:predicates
        ;; Connectivitat i obstacles
        (adjacent ?from ?to - loc)
        (bloquejada ?l - loc)
        
        ;; Localització
        (at ?e - obj ?l - loc)
        
        ;; Lògica de pila (Stack)
        (on ?p - paquet ?base - obj)
        (porta ?r - robot ?p - paquet)
        (clear ?e - obj)             
        
        ;; Estat final i ordenació
        (dispensat ?p - paquet)
        (esperant-dispensar ?p - paquet) 
        (proxim-paquet ?p1 ?p2 - paquet) 
    )

    ;; Acció de moviment del robot
    (:action moure
        :parameters (?r - robot ?from - loc ?to - loc)
        :precondition (and 
            (at ?r ?from)
            (adjacent ?from ?to)
            (not (bloquejada ?to))
            (not (exists (?other - robot) (at ?other ?to)))
        )
        :effect (and 
            (at ?r ?to)
            (not (at ?r ?from))
        )
    )

    ;; Agafar paquet
    (:action agafar
    :parameters (?r - robot ?p - paquet ?under - obj ?r-top - obj ?loc-r - loc ?loc-e - loc ?est - estanteria)
    :precondition (and 
        (at ?r ?loc-r)
        (adjacent ?loc-r ?loc-e)
        (at ?est ?loc-e) 
        (at ?p ?loc-e)
        (on ?p ?under)
        (clear ?p)
        (clear ?r-top)
        (or (on ?r-top ?r) (= ?r-top ?r)) 
    )
    :effect (and 
        (not (on ?p ?under))
        (clear ?under)
        (not (at ?p ?loc-e)) 
        (on ?p ?r-top)
        (not (clear ?r-top))
        (clear ?p)
        (porta ?r ?p)
    )
)

    ;; Deixar paquet
    (:action deixar
    :parameters (?r - robot ?p - paquet ?r-under - obj ?e-top - obj ?loc-r - loc ?loc-e - loc ?est - estanteria)
    :precondition (and 
        (at ?r ?loc-r)
        (porta ?r ?p) ;; Comprovem que el porta, sense dependre de la casella
        (on ?p ?r-under)
        (clear ?p)
        (adjacent ?loc-r ?loc-e)
        (at ?est ?loc-e) ;; Assegurem que deixem en una estanteria
        (at ?e-top ?loc-e)
        (clear ?e-top)
    )
    :effect (and 
        (not (on ?p ?r-under))
        (clear ?r-under)
        (not (porta ?r ?p)) ;; Ja no el porta
        (on ?p ?e-top)
        (not (clear ?e-top))
        (clear ?p)
        (at ?p ?loc-e) ;; El paquet torna a existir a la graella de l'estanteria
    )
)

(:action dispensar
    :parameters (?r - robot ?p - paquet ?r-under - obj ?loc-r - loc ?loc-d - loc ?d - dispensador)
    :precondition (and 
        (at ?r ?loc-r)
        (porta ?r ?p) ;; Substitueix (at ?p ?loc-r)
        (on ?p ?r-under)
        (clear ?p)
        (adjacent ?loc-r ?loc-d)
        (at ?d ?loc-d)
        (esperant-dispensar ?p)
    )
    :effect (and 
        (not (on ?p ?r-under))
        (clear ?r-under)
        (not (porta ?r ?p)) ;; Ja no el porta
        (dispensat ?p)
        (not (clear ?p))
        (not (esperant-dispensar ?p))
        (forall (?next - paquet)
            (when (proxim-paquet ?p ?next)
                (esperant-dispensar ?next)
            )
        )
    )
)
)
