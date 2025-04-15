def list_animals_for_event(logs, event_type):
    if not isinstance(logs, list) or not isinstance(event_type, str):
        raise ValueError("Logs must be a list and event_type must be a string.")

    animals = {log_entry[1] for log_entry in logs if log_entry[2] == event_type}

    return list(animals)

def test_list_animals_for_event():
    logs = [[10, "lion", "feeding"], [15, "elephant", "feeding"], [20, "tiger", "escape"]]
    result = list_animals_for_event(logs, "feeding")
    if set(result) != {"lion", "elephant"}:
        print(f"Case 1: Expected ['lion', 'elephant'], got {result}")
    else:
        print("Case 1 passed!")

    logs = [[10, "lion", "feeding"], [15, "lion", "feeding"]]
    result1 = list_animals_for_event(logs, "feeding")
    if set(result1) != {"lion"}:
        print(f"Case 2: Expected ['lion'], got {result1}")
    else:
        print("Case 2 passed!")

    logs2 = []
    result2 = list_animals_for_event(logs2, "feeding")
    if result2 != []:
        print(f"Case 3: Expected [], got {result2}")
    else:
        print("Case 3 passed!")

test_list_animals_for_event()