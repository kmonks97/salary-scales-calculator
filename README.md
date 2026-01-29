# Salary Scales Calculator



A Bash script that generates a salary progression table based on:

- starting salary

- number of scale points

- increment amount

- management status (affects progression speed)



## Features

- Input validation using regex

- Manager vs non‑manager progression logic

- Auto‑incrementing salary and year

- Clean, formatted table output



## How to Run

```bash

chmod +x salaryScales.sh

./salaryScales.sh

```

## Example Output (Management)

Here is an example of the script generating a 10 point scale for a Management role:



```text

Salary Scales Table (Management):

YEAR | POINTS | SALARY(€)
-----|--------|---------
2026 | 1      | 31500
2026 | 2      | 32250
2027 | 3      | 33000
2027 | 4      | 33750
2028 | 5      | 34500
2028 | 6      | 35250
2029 | 7      | 36000
2029 | 8      | 36750
2030 | 9      | 37500
2030 | 10     | 38250
-----|--------|---------

Salary scale table generated successfully.

```



## Additional Example Output (Non‑Management)

Here is an example of the script generating a 10 point scale for a Non-Management role:


```text

Salary Scales Table (Non-Management):

YEAR | POINTS | SALARY(€)
-----|--------|---------
2026 | 1      | 31500
2027 | 2      | 32250
2028 | 3      | 33000
2029 | 4      | 33750
2030 | 5      | 34500
2031 | 6      | 35250
2032 | 7      | 36000
2033 | 8      | 36750
2034 | 9      | 37500
2035 | 10     | 38250
-----|--------|---------

Salary scale table generated successfully.

````
