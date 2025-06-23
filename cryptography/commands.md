# Encrypt 

## Hash functions
- Deterministic
- No collision
- Cannot construct data back from the hash

- Used to verify the integrity of the file - Remains same for the exact same data However changes even if a bit flips

```
hash(value: array<byte>) -> vector<byte, N>  (for some fixed N)
# N- sha1 160 bits
```

```
echo "Hello" | sha1sum

```

## Symmetric key cryptography

```
## To encrpyt 
openssl aes-256-cbc -salt -in README.md -out README.enc.md

## To decrypt 
openssl aes-256-cbc -d -in README.enc.md -out README.decrypt.md

```
