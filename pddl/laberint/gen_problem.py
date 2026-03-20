
def generate_pddl():
    rows = 6
    cols = 9
    
    # grid: 0-indexed internally
    map_str = [
        "#########", # 0
        "##     ##", # 1
        "#  ##   S", # 2
        "#  ######", # 3
        "#  A   G#", # 4
        "#########"  # 5
    ]
    
    # Coordinates in 1-indexed for PDDL
    objs = []
    for r in range(1, rows + 1):
        for c in range(1, cols + 1):
            objs.append(f"loc_{r}_{c}")
    
    init = []
    # Adj
    for r in range(1, rows + 1):
        for c in range(1, cols + 1):
            # Up
            if r > 1: init.append(f"(adjacent loc_{r}_{c} loc_{r-1}_{c} up)")
            # Down
            if r < rows: init.append(f"(adjacent loc_{r}_{c} loc_{r+1}_{c} down)")
            # Left
            if c > 1: init.append(f"(adjacent loc_{r}_{c} loc_{r}_{c-1} left)")
            # Right
            if c < cols: init.append(f"(adjacent loc_{r}_{c} loc_{r}_{c+1} right)")
            
    # Walls, A, G, S
    goal = ""
    start = ""
    for r_idx, row in enumerate(map_str):
        r = r_idx + 1
        for c_idx, char in enumerate(row):
            c = c_idx + 1
            loc = f"loc_{r}_{c}"
            if char == '#':
                init.append(f"(es-paret {loc})")
            elif char == 'A':
                start = f"(at {loc})"
            elif char == 'G':
                init.append(f"(es-transformacio {loc})")
            elif char == 'S':
                goal = f"(at {loc})"
                
    pddl = f"""(define (problem laberint-exemple)
  (:domain laberint)
  (:objects 
    {" ".join(objs)} - loc
    up down left right - dir
  )
  (:init 
    {start}
    {" ".join(init)}
  )
  (:goal {goal})
)
"""
    with open("c:/Users/Joan/PDDL-Intro/pddl/laberint/problem_example.pddl", "w") as f:
        f.write(pddl)

generate_pddl()
