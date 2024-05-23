(define (problem problems)
    (:domain domains)
    (:objects
        humanoid_robot - robot
        warehouse table - store
        motor regulator brackets cables pulleys switches - part
    )

    (:init
        (isWarehouse warehouse)
        (isTable table)
        (part-at warehouse motor)
        (part-at warehouse regulator)
        (part-at warehouse brackets)
        (part-at warehouse cables)
        (part-at warehouse pulleys)
        (part-at warehouse switches)
        (hand-empty)
        
        (isMotor motor)
        (isregulator regulator)
        (isBrackets brackets)
        (isCable cables)
        (isPulley pulleys)
        (isSwitch switches)

        ;todo: put the initial state's facts and numeric values here
    )

    (:goal
        (and
            (motorAssembed)
            (regulatorAssembed)
            (bracketAssembed)
            (cableAssembed)
            (pulleyAssembed)
            (switchAssembed)

            ;todo: put the goal condition here
        )
    )

)