# Question 2 : Remove Duplicate Characters Using Loop
# Example : Input: programming , Output: progamin

string = input("Enter string: ")

result = ""

for char in string:
    if char not in result:
        result += char

print("Unique string:", result)