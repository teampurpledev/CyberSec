#!/usr/bin/python3
#  Vigenere Cipher
# This function generates the key in a cyclic manner
# with it's length isn't equal to the length of original text
def generateKey(string, key):
   key = list(key)
   if len(string) == len(key):
       return(key)
   else:
       for i in range(len(string) -
                      len(key)):
           key.append(key[i % len(key)])
   return("" . join(key))

# This function returns the encrypted text generated
def cipherText(string, key):
   cipher_text = []
   for i in range(len(string)):
       x = (ord(string[i]) +
            ord(key[i])) % 26
       x += ord('A')
       cipher_text.append(chr(x))
   return("" . join(cipher_text))

# This function decrypts and returns the original text
def originalText(cipher_text, key):
   orig_text = []
   for i in range(len(cipher_text)):
       x = (ord(cipher_text[i]) -
            ord(key[i]) + 26) % 26
       x += ord('A')
       orig_text.append(chr(x))
   return("" . join(orig_text))

# data input
string = input("Type the Text to encrypt: ")
keyword = input("Type the keyword to use it: ")

# the input must be uppercase, so we use the function upper() with the string
key = generateKey(string.upper(), keyword.upper())
cipher_text = cipherText(string.upper(),key.upper())

# show the information.
print("Ciphertext :", cipher_text)
print("Original/Decrypted Text :",
originalText(cipher_text, key))
