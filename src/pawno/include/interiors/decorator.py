def bread(function):
    def wrapper(*args, **kwargs):
        print(' ________')
        print('(________)')
        function()
        print(' ________')
        print('(________)')
    return wrapper


def ingridients(function):
    def wrapper(*args, **kwargs):
        print('помидор')
        function()
        print('котлета')
    return wrapper


@bread
@ingridients
def sandwich(food):
    print(food)


sandwich('сыр')
bread(ingridients(sandwich))
