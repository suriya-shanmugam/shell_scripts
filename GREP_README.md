## 1. Basics — Matching Text

| Pattern | Meaning | Example |
| --- | --- | --- |
| `foo` | Literal text | `grep 'foo' file.txt` — finds “foo” anywhere |
| `^foo` | Line **starts** with “foo” | `grep '^foo' file.txt` |
| `foo$` | Line **ends** with “foo” | `grep 'foo$' file.txt` |
| `^$` | Blank lines | `grep '^$' file.txt` |

---

## 2. Character Classes and Wildcards

| Pattern | Meaning | Example |
| --- | --- | --- |
| `.` | Any single character | `grep 'f.o'` → matches “foo”, “fao” |
| `[abc]` | Any of a, b, or c | `grep '[ch]at'` → “cat”, “hat” |
| `[^abc]` | Any **not** a, b, or c | `grep '[^0-9]'` — lines with non-digits |
| `[0-9]` | Any digit | `grep '[0-9]'` |
| `[A-Za-z]` | Any letter | `grep '[A-Za-z]'` |

---

## 3. Repetition Operators

| Pattern | Meaning | Example |
| --- | --- | --- |
| `*` | 0 or more | `grep 'lo*l'` → “ll”, “lol”, “loool” |
| `+` | 1 or more (**use `grep -E`**) | `grep -E 'go+gle'` → “gogle”, “google” |
| `?` | 0 or 1 (**use `-E`**) | `grep -E 'colou?r'` → “color” or “colour” |
| `{n}` | Exactly n times (**use `-E`**) | `grep -E '[0-9]{4}'` — 4 digits |
| `{n,}` | n or more | `grep -E '[0-9]{2,}'` |
| `{n,m}` | Between n and m | `grep -E '[A-Z]{2,4}'` |

---

## 4. Useful Shortcuts (with `grep -P` for Perl regex)

| Shortcut | Meaning | Example |
| --- | --- | --- |
| `\d` | Digit | `grep -P '\d+'` |
| `\w` | Word char (letters, digits, `_`) | `grep -P '\w+'` |
| `\s` | Whitespace | `grep -P '^\s+'` — leading spaces |
| `\b` | Word boundary | `grep -P '\bcat\b'` — matches “cat” but not “catalog” |

---

## 5. Line Context and Filtering

| Pattern | Use Case | Example |
| --- | --- | --- |
| `grep -v PATTERN` | Invert match (exclude) | `grep -v '^#' config.conf` — skip comments |
| `grep -n PATTERN` | Show line numbers | `grep -n 'error' logfile` |
| `grep -r PATTERN .` | Search recursively | `grep -r 'TODO' .` |
| `grep -l PATTERN *` | Show filenames only | `grep -l 'main' *.c` |

---

## 6. Practical Real-World Patterns

| Use | Pattern | Example |
| --- | --- | --- |
| Email | `[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}` | `grep -E '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' file` |
| IPv4 | `([0-9]{1,3}\.){3}[0-9]{1,3}` | Find IP addresses |
| Date (YYYY-MM-DD) | `[0-9]{4}-[0-9]{2}-[0-9]{2}` | Match dates |
| Hex number | `0x[0-9A-Fa-f]+` | Find hex values |
| URLs | `https?://[A-Za-z0-9./?=_-]+` | Find links |
| Comments | `^#.*` | Lines starting with `#` |

---

## 7. Extended vs. Basic Regex

- **Basic** (default `grep`) — , `.`, `[]`, `^`, `$`
- **Extended** (`grep -E` or `egrep`) — adds `+`, `?`, `{}`, `|`
- **Perl-compatible** (`grep -P`) — adds `\d`, `\w`, lookarounds, etc.

**Example:**

```bash
grep -E 'foo|bar' file.txt      # matches “foo” or “bar”
grep -P '(?<=user=)\w+' conf    # matches word after 'user='

```

---

## Pro Tips

1. Use `grep -o` to print only the matching part.
    
    → `grep -oE '[0-9]+' file.txt`
    
2. Combine with `sort` or `uniq` to count unique matches:
    
    → `grep -oE '\w+' file | sort | uniq -c`
    
3. Use `grep -A` / `B` / `C` for context around matches:
    
    → `grep -A2 'ERROR' logfile`
    

---
