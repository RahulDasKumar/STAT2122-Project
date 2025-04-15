def count_escapes(logs):
    if not isinstance(logs, list):
        raise ValueError("Logs must be a list.")
    
    counter = 0
    for log_entry in logs:
        if log_entry[2] == "escape":
            counter += 1

    return counter


def gather_feeding_times(logs):
    if not isinstance(logs, list):
        raise ValueError("Logs must be a list.")

    feeding_times = []
    for log_entry in logs:
        if log_entry[2] == "feeding":
            feeding_times.append(log_entry[0])

    return feeding_times


def earliest_escape_time(logs):
    if not isinstance(logs, list):
        raise ValueError("Logs must be a list.")

    escape_times = [log_entry[0] for log_entry in logs if log_entry[2] == "escape"]
    
    return min(escape_times) if escape_times else -1


def count_animal_events(logs, animal):
    if not isinstance(logs, list) or not isinstance(animal, str):
        raise ValueError("Logs must be a list and animal must be a string.")

    counter = 0
    for log_entry in logs:
        if log_entry[1] == animal:
            counter += 1

    return counter


def list_animals_for_event(logs, event_type):
    if not isinstance(logs, list) or not isinstance(event_type, str):
        raise ValueError("Logs must be a list and event_type must be a string.")

    animals = {log_entry[1] for log_entry in logs if log_entry[2] == event_type}

    return list(animals)


def test_count_escapes():
    logs = [[30, "lion", "feeding"], [20, "penguin", "escape"], [10, "elephant", "health_check"]]        
    result = count_escapes(logs) 
    if result != 1: 
        print(f"Case 1: Expected 1, got {result}") 
    else:
        print("Case 1 passed!")

    logs = [[30, "lion", "escape"], [20, "penguin", "escape"], [10, "elephant", "health_check"]] 
    result1 = count_escapes(logs)
    if result1 != 2: 
        print(f"Case 2: Expected 2, got {result1}") 
    else:
        print("Case 2 passed!")

    logs2 = [] 
    result2 = count_escapes(logs2)
    if result2 != 0: 
        print(f"Case 3: Expected 0, got {result2}")
    else:
        print("Case 3 passed!")


def test_gather_feeding_times():
    logs = [[10, "lion", "feeding"], [20, "elephant", "escape"], [30, "penguin", "feeding"]]
    result = gather_feeding_times(logs)
    if result != [10, 30]:
        print(f"Case 1: Expected [10, 30], got {result}")
    else:
        print("Case 1 passed!")

    logs = [[10, "lion", "health_check"]]
    result1 = gather_feeding_times(logs)
    if result1 != []:
        print(f"Case 2: Expected [], got {result1}")
    else:
        print("Case 2 passed!")

    logs2 = []
    result2 = gather_feeding_times(logs2)
    if result2 != []:
        print(f"Case 3: Expected [], got {result2}")
    else:
        print("Case 3 passed!")


def test_earliest_escape_time():
    logs = [[10, "lion", "escape"], [20, "elephant", "feeding"], [5, "penguin", "escape"]]
    result = earliest_escape_time(logs)
    if result != 5:
        print(f"Case 1: Expected 5, got {result}")
    else:
        print("Case 1 passed!")

    logs = [[10, "lion", "feeding"]]
    result1 = earliest_escape_time(logs)
    if result1 != -1:
        print(f"Case 2: Expected -1, got {result1}")
    else:
        print("Case 2 passed!")

    logs2 = []
    result2 = earliest_escape_time(logs2)
    if result2 != -1:
        print(f"Case 3: Expected -1, got {result2}")
    else:
        print("Case 3 passed!")


def test_count_animal_events():
    logs = [[10, "lion", "feeding"], [15, "lion", "escape"], [20, "elephant", "escape"]]
    result = count_animal_events(logs, "lion")
    if result != 2:
        print(f"Case 1: Expected 2, got {result}")
    else:
        print("Case 1 passed!")

    logs = [[10, "lion", "feeding"], [15, "lion", "escape"]]
    result1 = count_animal_events(logs, "elephant")
    if result1 != 0:
        print(f"Case 2: Expected 0, got {result1}")
    else:
        print("Case 2 passed!")

    logs2 = []
    result2 = count_animal_events(logs2, "lion")
    if result2 != 0:
        print(f"Case 3: Expected 0, got {result2}")
    else:
        print("Case 3 passed!")


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


def test_main():
    test_count_escapes()
    test_gather_feeding_times()
    test_earliest_escape_time()
    test_count_animal_events()
    test_list_animals_for_event()
    print("All tests passed successfully!")


test_main()

