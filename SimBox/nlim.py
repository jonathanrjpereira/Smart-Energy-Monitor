d = {'None': 0,
     'Charger': 5,
     'CFL': 11,
     'CFL & Charger': 16,
     'Bulb': 20,
     'CFL & CFL': 22,
     'Bulb & Charger': 25,
     'CFL & CFL & Charger': 27,
     'CFL & Bulb': 31,
     'CFL & Bulb & Charger': 36,
     'CFL & CFL & Bulb': 42,
     'CFL & CFL & Charger & Bulb': 47}
     
     
while 1:
    watt =input()
    diff = float('inf')
    for key,value in d.items():
        if diff > abs(watt-value):
            diff = abs(watt-value)
            x = key

    print x
