#!/usr/bin/python3

def encrypt(text,s):
   result = ""
  # transverse the plain text
   for i in range(len(text)):
     char = text[i]
     # Encrypt uppercase characters in plain text
     if (char.isupper()):
        result += chr((ord(char) + s-65) % 26 + 65)
     # Encrypt lowercase characters in plain text
     else:
        result += chr((ord(char) + s - 97) % 26 + 97)
   return result

string = input("Type the Text to encrypt: ")
n_shift = int(input("Number of Shifts: "))

print ("Plain Text : " + string)
print ("Shift pattern : " + str(n_shift))
print ("Cipher: " + encrypt(string,n_shift))
