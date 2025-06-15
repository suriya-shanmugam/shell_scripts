## Basics
### Structure
- awk 'pattern|condition{action}' filename
- $0 - print all the columns in a line
- $1,$2 ... - print first column,second column and so on

```
awk 'print{$1}' sample1.txt
```
### Conditions
- NR number range
```
awk 'NR!=1{print $1}' sample1.txt
```

### Delimiter 
- -F is set the Delimiter - In this case Delimiter is ","
- Default delimiter is space  or tab or multiple space
```
awk -F"," '{print $1}' sample2.txt 
```

- FS - File seperator can be used as well
```
awk '{print $2 $3}' FS=',' sample2.txt
```

### Output Field Seperator
- OFS - Output Filed limiter
- Use comma in action and use delimiter to display on the screen
```
awk -F',' '{print $2,$3}'  OFS="/" sample2.txt
```
