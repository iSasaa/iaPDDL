(define (problem adl-gripper4)
   (:domain gripper-adl)
   (:objects rooma roomb - room
             ball1 ball2 ball3 ball4 - ball
             left right - gripper)
   (:init (at-robby rooma)
          (at-ball ball1 rooma)
          (at-ball ball2 rooma)
          (at-ball ball3 rooma)
          (at-ball ball4 rooma))
   (:goal (and (at-ball ball1 roomb)
               (at-ball ball2 roomb)
               (at-ball ball3 roomb))))
