# SED
## Basic format
```
sed 'p' filename
```

## To pring line number
- -n avoid printing the matched line on screen

```
sed -n '=' filename

```

## To filter lines

```
sed -n '1,5 p' /etc/passwd
```

$ - end of file
```
sed -n '1,$ p' /etc/passwd

```

! - invert condition
```
sed -n '5,6 !p' /etc/passwd
```

~ - Skip lines

```
sed -n '1~10 p' /ect/passwd
```

## Pattern Match
```
sed -n '/suriya/p' /etc/passwd
```

- Pattern along with few line
```
sed -n '/USB device found/, +2p' /var/log/syslog
```

## substitutions
```
sed 's/bash/zsh/' /etc/password
```

- Multiple instance of pattern in same line use g flag
```
sed 's/bash/zsh/g' /etc/password
```

- `i` is a case insensitve flag

```
sed 's/bash/zsh/ig' /etc/password

```
- numbers to mention number of instance in line

```
sed 's/bash/zsh/i2' /etc/password

```

- starting from 2 instance
```
sed 's/bash/zsh/i2g' /etc/passwrd

```

## inplace edit 

```
sed -i 's/bash/zsh/g' file
```

- to create backup
```
sed -i bak 's/bash/zsh/g'
```

## Delete

- by line number
```
sed '1,50 d' filename
```
- by pattern
```
sed '/False/ d' filename
# To remove empty lines
sed '/^$/ d' filename

# To remove comments #
sed '/^#/ d' filename

# To combine both 
sed '/^#/ d; /^$/ d' filename 
```
## Insert and append
```
sed '/TRUE/ i "#This enables the flag" ' filename

# To append
sed '/TRUE/ a "enabled !!!!!!!!!!!!!!!!!!!!!" ' command.md
```
