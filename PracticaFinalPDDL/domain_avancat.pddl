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
        (es-carregador ?l - loc)
        
        ;; Localització
        (at ?e - obj ?l - loc)
        
        ;; Lògica de pila (Stack)
        (on ?p - paquet ?base - obj) 
        (clear ?e - obj)             
        
        ;; Estat final i ordenació
        (dispensat ?p - paquet)
        (esperant-dispensar ?p - paquet) 
        (proxim-paquet ?p1 ?p2 - paquet) 
    )

    (:functions
        (battery ?r - robot)
        (max-battery ?r - robot)
        (weight ?p - paquet)
        (total-weight ?r - robot)
        (max-weight ?r - robot)
        (total-energy-spent)
    )

    ;; Acció de moviment del robot
    (:action moure
        :parameters (?r - robot ?from - loc ?to - loc)
        :precondition (and 
            (at ?r ?from)
            (adjacent ?from ?to)
            (not (bloquejada ?to))
            (not (exists (?other - robot) (at ?other ?to)))
            (>= (battery ?r) 2)
            (or 
                (and (<= (total-weight ?r) 5) (>= (battery ?r) 2))
                (and (> (total-weight ?r) 5) (>= (battery ?r) 3))
            )
        )
        :effect (and 
            (at ?r ?to)
            (not (at ?r ?from))
            (if-then-else (> (total-weight ?r) 5)
                (and (decrease (battery ?r) 3) (increase (total-energy-spent) 3))
                (and (decrease (battery ?r) 2) (increase (total-energy-spent) 2))
            )
        )
    )

    ;; Agafar paquet
    (:action agafar
        :parameters (?r - robot ?p - paquet ?under - obj ?r-top - obj ?loc-r - loc ?loc-e - loc)
        :precondition (and 
            (at ?r ?loc-r)
            (adjacent ?loc-r ?loc-e)
            (at ?p ?loc-e)
            (on ?p ?under)
            (clear ?p)
            (clear ?r-top)
            (or (on ?r-top ?r) (= ?r-top ?r))
            ;; Capacitat de càrrega
            (<= (+ (total-weight ?r) (weight ?p)) (max-weight ?r))
            ;; Bateria (opcionalment accions costen 1, però l'enunciat només diu moure)
            (> (battery ?r) 0)
        )
        :effect (and 
            (not (on ?p ?under))
            (clear ?under)
            (not (at ?p ?loc-e))
            (on ?p ?r-top)
            (not (clear ?r-top))
            (clear ?p)
            (at ?p ?loc-r)
            (increase (total-weight ?r) (weight ?p))
        )
    )

    ;; Deixar paquet
    (:action deixar
        :parameters (?r - robot ?p - paquet ?r-under - obj ?e-top - obj ?loc-r - loc ?loc-e - loc)
        :precondition (and 
            (at ?r ?loc-r)
            (at ?p ?loc-r)
            (on ?p ?r-under)
            (clear ?p)
            (adjacent ?loc-r ?loc-e)
            (at ?e-top ?loc-e)
            (clear ?e-top)
            (> (battery ?r) 0)
        )
        :effect (and 
            (not (on ?p ?r-under))
            (clear ?r-under)
            (not (at ?p ?loc-r))
            (on ?p ?e-top)
            (not (clear ?e-top))
            (clear ?p)
            (at ?p ?loc-e)
            (decrease (total-weight ?r) (weight ?p))
        )
    )

    ;; Dispensar paquet
    (:action dispensar
        :parameters (?r - robot ?p - paquet ?r-under - obj ?loc-r - loc ?loc-d - loc ?d - dispensador)
        :precondition (and 
            (at ?r ?loc-r)
            (at ?p ?loc-r)
            (on ?p ?r-under)
            (clear ?p)
            (adjacent ?loc-r ?loc-d)
            (at ?d ?loc-d)
            (esperant-dispensar ?p)
            (> (battery ?r) 0)
        )
        :effect (and 
            (not (on ?p ?r-under))
            (clear ?r-under)
            (not (at ?p ?loc-r))
            (dispensat ?p)
            (not (clear ?p))
            (not (esperant-dispensar ?p))
            (decrease (total-weight ?r) (weight ?p))
            (forall (?next - paquet)
                (when (proxim-paquet ?p ?next)
                    (esperant-dispensar ?next)
                )
            )
        )
    )

    ;; Recarregar bateria en punt de càrrega adjacent
    (:action recarregar
        :parameters (?r - robot ?loc-r - loc ?loc-c - loc)
        :precondition (and 
            (at ?r ?loc-r)
            (adjacent ?loc-r ?loc-c)
            (es-carregador ?loc-c)
            (< (battery ?r) (max-battery ?r))
        )
        :effect (and 
            (when (< (+ (battery ?r) 20) (max-battery ?r))
                (increase (battery ?r) 20)
            )
            (when (>= (+ (battery ?r) 20) (max-battery ?r))
                (assign (battery ?r) (max-battery ?r))
            )
        )
    )
)
