(define (domain gripper-adl)
   (:requirements :adl)
   (:types ball room gripper - object)
   (:predicates (at-robby ?r - room)
                (at-ball ?b - ball ?r - room)
                (carry ?g - gripper ?b - ball))

   (:action move
       :parameters (?from - room ?to - room)
       :precondition (at-robby ?from)
       :effect (and (at-robby ?to)
                    (not (at-robby ?from))))

   (:action pick
       :parameters (?obj - ball ?room - room ?gripper - gripper)
       :precondition (and (at-ball ?obj ?room) 
                          (at-robby ?room) 
                          (forall (?b - ball) (not (carry ?gripper ?b))))
       :effect (and (carry ?gripper ?obj)
                    (not (at-ball ?obj ?room))))

   (:action drop
       :parameters (?obj - ball ?room - room ?gripper - gripper)
       :precondition (and (carry ?gripper ?obj) 
                          (at-robby ?room))
       :effect (and (at-ball ?obj ?room)
                    (not (carry ?gripper ?obj)))))
