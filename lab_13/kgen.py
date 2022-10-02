#!/bin/python3

from sys import argv
from random import choice, randint

surnames = ["petrov", "sidorov", "ivanov", "smirnov", "alexandrov"]

cities = ["moscow", "piterburg", "omsk", "smolensk"]
streets = ["pushkinskaya", "leninskaya", "lermontova", "baumanskaya"]

car_marks = ["opel", "hynday", "shkoda", "tesla"]
colors = ["green", "blue", "black", "white", "gray"]

banks = ["gasprom", "alphabank", "tinkoff", "sberbank"]

def gen_address():
    city = choice(cities)
    street = choice(streets)
    house = randint(1, 99)
    appartment = randint(1, 99)
    return city, street, house, appartment

def gen_telephone():
    surname = choice(surnames)
    telnum = "t79" + "".join(str(randint(0, 9)) for _ in range(9))
    address = gen_address()
    return surname, telnum, address

def gen_car():
    surname = choice(surnames)
    mark = choice(car_marks)
    color = choice(colors)
    cost = randint(6, 10) * 100_000
    return surname, mark, color, cost

def gen_account():
    surname = choice(surnames)
    bank = choice(banks)
    acc_num = "a" + "".join(str(randint(0, 9)) for _ in range(4))
    cash = randint(1, 100) * 1_000
    return surname, bank, acc_num, cash

def tel_formattor(tel):
    surname, telnum, address = tel
    city, street, house, appartment = address
    return f"telephone({surname}, {telnum}, address({city}, {street}, {house}, {appartment}))."

def formator(relation_name):
    def _f(attrs):
        return f"{relation_name}({', '.join(map(str, attrs))})."
    return _f

def generate_knowledge_base(N):
    telephones = (gen_telephone() for _ in range(N))
    cars = (gen_car() for _ in range(N))
    accounts = (gen_account() for _ in range(N))

    telephones = tuple(map(tel_formattor, telephones))
    cars = tuple(map(formator("car"), cars))
    accounts = tuple(map(formator("account"), accounts))

    return '\n'.join(telephones + cars + accounts)

if __name__ == "__main__":
    try:
        N = int(argv[1])
    except:
        N = 10
    base = generate_knowledge_base(N)
    print("% Knowledge base:")
    print("% |telephone(Surname, TelNum, address(City, Street, House, Appartment))")
    print("% |car(Surname, Mark, Color, Cost)")
    print("% |account(Surname, Bank, AccNum, Cash)")
    print(base)
