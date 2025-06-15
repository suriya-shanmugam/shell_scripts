### Patterns

### Condition

```
awk -F"," '$2 > 200 {print $2}' sample3.csv
```

### Grep using awk
-  ~ use tilt to mention a pattern
- // define pattern - same as sed

```
awk -F"," '$0 ~ /[a-zA-Z]{5,10}/{print $1}' sample3.csv
```
### Combine condition and pattern
```
awk -F"," '$2 > 500 && $1 ~  /[a-zA-Z]{5,10}/{print $1,$2}' OFL=" " sample3.csv
```
