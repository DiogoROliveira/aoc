import re


def get_input():
    with open("input.txt") as f:
        return f.read().strip()
    

input = get_input()


def part2(input):
    total = 0
    valid = True
    pattern = r"do\(\)|don't\(\)|mul\(\d+,\d+\)"
    matches = re.findall(pattern, input)

    for match in matches :
        if match == "do()":
            valid = True
        elif match == "don't()":
            valid = False
        elif re.match(r'mul\(\d+,\d+\)', match) and valid:
            x = [int(x) for x in re.findall(r'\b\d+\b', match)]
            total += x[0] * x[1]
    return total 


result = part2(input)
print(result)


