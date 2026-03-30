(define (domain magabot_avancat)
    (:requirements :adl :numeric-fluents)
    
    (:types 
        loc obj - object
        robot paquet estanteria dispensador carregador - obj
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

    (:functions
        ;; Gestió de càrrega
        (pes ?p - paquet)
        (carrega-actual ?r - robot)
        (capacitat-maxima ?r - robot)
        
        ;; Gestió de bateria
        (bateria-actual ?r - robot)
        (bateria-maxima ?r - robot)
        
        ;; Mètrica a minimitzar
        (energia-total)
    )

    ;; Acció de moviment del robot
    (:action moure
        :parameters (?r - robot ?from - loc ?to - loc)
        :precondition (and 
            (at ?r ?from)
            (adjacent ?from ?to)
            (not (bloquejada ?to))
            (not (exists (?other - robot) (at ?other ?to)))
            (> (bateria-actual ?r) 0) ;; Si no té energia no pot fer accions
            ;; Cal assegurar que tenim bateria suficient pel cost del desplaçament
            (or 
                (and (< (carrega-actual ?r) 5) (>= (bateria-actual ?r) 2))
                (and (>= (carrega-actual ?r) 5) (>= (bateria-actual ?r) 3))
            )
        )
        :effect (and 
            (at ?r ?to)
            (not (at ?r ?from))
            ;; Cost de bateria i suma d'energia total segons la càrrega
            (when (< (carrega-actual ?r) 5) (decrease (bateria-actual ?r) 2))
            (when (< (carrega-actual ?r) 5) (increase (energia-total) 2))
            (when (>= (carrega-actual ?r) 5) (decrease (bateria-actual ?r) 3))
            (when (>= (carrega-actual ?r) 5) (increase (energia-total) 3))
        )
    )

    ;; Acció de recarregar energia
    (:action recarregar
        :parameters (?r - robot ?loc-r - loc ?loc-c - loc ?c - carregador)
        :precondition (and 
            (at ?r ?loc-r)
            (adjacent ?loc-r ?loc-c)
            (at ?c ?loc-c)
            ;; Opcional: assegurar que no malgasta temps si ja està a tope
            (< (bateria-actual ?r) (bateria-maxima ?r))
        )
        :effect (and 
            ;; Sumem 20 unitats sense superar el màxim permès
            (when (<= (+ (bateria-actual ?r) 20) (bateria-maxima ?r)) 
                (increase (bateria-actual ?r) 20)
            )
            (when (> (+ (bateria-actual ?r) 20) (bateria-maxima ?r)) 
                (assign (bateria-actual ?r) (bateria-maxima ?r))
            )
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
            (> (bateria-actual ?r) 0) ;; Si no té energia no pot fer accions
            ;; LÍMIT DE PES: La càrrega actual + el pes del paquet no pot superar la capacitat màxima
            (<= (+ (carrega-actual ?r) (pes ?p)) (capacitat-maxima ?r))
        )
        :effect (and 
            (not (on ?p ?under))
            (clear ?under)
            (not (at ?p ?loc-e)) 
            (on ?p ?r-top)
            (not (clear ?r-top))
            (clear ?p)
            (porta ?r ?p)
            ;; Sumem el pes del paquet a la càrrega del robot
            (increase (carrega-actual ?r) (pes ?p))
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
            (> (bateria-actual ?r) 0) ;; Si no té energia no pot fer accions
        )
        :effect (and 
            (not (on ?p ?r-under))
            (clear ?r-under)
            (not (porta ?r ?p)) ;; Ja no el porta
            (on ?p ?e-top)
            (not (clear ?e-top))
            (clear ?p)
            (at ?p ?loc-e) ;; El paquet torna a existir a la graella de l'estanteria
            ;; Restem el pes del paquet a la càrrega del robot
            (decrease (carrega-actual ?r) (pes ?p))
        )
    )

    ;; Dispensar paquet
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
            (> (bateria-actual ?r) 0) ;; Si no té energia no pot fer accions
        )
        :effect (and 
            (not (on ?p ?r-under))
            (clear ?r-under)
            (not (porta ?r ?p)) ;; Ja no el porta
            (dispensat ?p)
            (not (clear ?p))
            (not (esperant-dispensar ?p))
            ;; Restem el pes del paquet a la càrrega del robot
            (decrease (carrega-actual ?r) (pes ?p))
            (forall (?next - paquet)
                (when (proxim-paquet ?p ?next)
                    (esperant-dispensar ?next)
                )
            )
        )
    )
)