;Header and description

(define (domain domains)

(:requirements :strips :typing :universal-preconditions)

(:types
    robot store table part
)
(:predicates ;todo:     define predicates here
    (isWarehouse ?x - store)
    (isTable ?x - store)
    (Assemble ?x - part)
    (part-at ?x - store ?y - part )
    (picked-Part ?x - part)
    (hand-empty)
    
    (isMotor ?x - part)
    (isRegulator ?x - part)
    (isBrackets ?x - part)
    (isCable ?x - part)
    (isPulley ?x - part)
    (isSwitch ?x - part)
    
    (motorAssembed)
    (regulatorAssembed)
    (bracketAssembed)
    (cableAssembed)
    (pulleyAssembed)
    (switchAssembed)
    
    

)


;define actions here
(:action transport
    :parameters (?p - part ?w - store ?t - store)
    :precondition (and (isWarehouse ?w)(isTable ?t)
                    (part-at ?w ?p) (picked-part ?p ))
    :effect (and (part-at ?t ?p)(not (part-at ?w ?p)))
)

(:action pick-up
    :parameters (?p - part ?r - robot )
    :precondition (and (hand-empty) )
    :effect (and (picked-Part ?p)(not(hand-empty)))
)

(:action put-down
    :parameters(?p - part ?s - store)
    :precondition (and (picked-Part ?p) (isTable ?s) (part-at ?s ?p) )
    :effect (and (hand-empty)(not(picked-Part ?p)))
        
)


(:action assemble-motor
    :parameters(?p - part ?s - store)
    :precondition (and (isMotor ?p) (picked-Part ?p) (isTable ?s) (part-at ?s ?p) (forall (?prt - part)(part-at ?s ?prt) ) )
    :effect (and (motorAssembed) (Assemble ?p)(hand-empty)(not(picked-Part ?p)))
        
)

(:action assembe-regulator
    :parameters(?p - part ?s - store)
    :precondition (and (motorAssembed) (isRegulator ?p) (picked-Part ?p) (isTable ?s) (part-at ?s ?p) (forall (?prt - part)(part-at ?s ?prt) ) )
    :effect (and (regulatorAssembed) (Assemble ?p)(hand-empty)(not(picked-Part ?p)))
        
)
(:action assemble-bracket
    :parameters(?p - part ?s - store)
    :precondition (and (regulatorAssembed)(motorAssembed) (isBrackets ?p) (picked-Part ?p) (isTable ?s) (part-at ?s ?p) (forall (?prt - part)(part-at ?s ?prt) ) )
    :effect (and (bracketAssembed) (Assemble ?p)(hand-empty)(not(picked-Part ?p)))
)
(:action assemble-cable
    :parameters(?p - part ?s - store)
    :precondition (and (bracketAssembed)(regulatorAssembed)(motorAssembed) (isCable ?p) (picked-Part ?p) (isTable ?s) (part-at ?s ?p) (forall (?prt - part)(part-at ?s ?prt) ) )
    :effect (and (cableAssembed) (Assemble ?p)(hand-empty)(not(picked-Part ?p)))
)
(:action assemble-pulley
    :parameters(?p - part ?s - store)
    :precondition (and (cableAssembed)(bracketAssembed)(regulatorAssembed)(motorAssembed) (isPulley ?p) (picked-Part ?p) (isTable ?s) (part-at ?s ?p) (forall (?prt - part)(part-at ?s ?prt) ) )
    :effect (and (pulleyAssembed) (Assemble ?p)(hand-empty)(not(picked-Part ?p)))
)
(:action assemble-switch
    :parameters(?p - part ?s - store)
    :precondition (and (pulleyAssembed)(cableAssembed)(bracketAssembed)(regulatorAssembed)(motorAssembed) (isSwitch ?p) (picked-Part ?p) (isTable ?s) (part-at ?s ?p) (forall (?prt - part)(part-at ?s ?prt) ) )
    :effect (and (switchAssembed) (Assemble ?p)(hand-empty)(not(picked-Part ?p)))
)
)