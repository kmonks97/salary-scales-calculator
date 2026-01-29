#!/bin/bash
#
# Salary Scale Calculator
# This script calculates and displays a salary progression table based on:
# - starting salary
# - number of scale points
# - increment amount
# - management status (affects progression speed)

# Regex pattern to ensure salary, points, and increment are numeric
re='^[0-9]+$'

# Function to validate positive whole numbers
validate_number() {
    local value=$1
    local field_name=$2

    if ! [[ $value =~ $re ]] || [ $value -le 0 ]; then
        echo "Error: $field_name must be a positive whole number, please restart the program"
        exit 1
    fi
}

echo ""
# Q1: Ask for starting salary
echo "Enter the starting salary in Euro(€)?"
echo ""
read salary
validate_number "$salary" "salary"

echo ""
# Q2: Ask for number of points on salary scale
echo "Enter the total number of salary scale points"
echo ""
read points
validate_number "$points" "points"

echo ""
# Q3: Ask for salary increment
echo "Enter the salary increment amount (€)"
echo ""
read increment
validate_number "$increment" "increment"

echo ""
# Q4: Ask if manager
echo "Is the employee a manager? (yes/no)"
echo ""
read isManager

# Convert isManager to uppercase
isManager="${isManager^^}"

# Validate yes/no
if [[ "$isManager" != "YES" && "$isManager" != "NO" ]]; then
    echo "Error: Answer must be 'yes' or 'no', please restart the program"
    exit 1
fi

# Get current year
currentYear=$(date +"%Y")

echo ""
if [[ "$isManager" == "YES" ]]; then
    echo "Salary Scales Table (Management):"
else
    echo "Salary Scales Table (Non-Management):"
fi
echo ""

# Build table
{
echo "YEAR | POINTS | SALARY(€)"
echo "-----|--------|---------"

for ((i = 1; i <= points; i++)); do
    echo "$currentYear | $i | $salary"

    if [[ "$isManager" == "YES" ]]; then
        if (( i % 2 == 0 )); then
            ((currentYear++))
        fi
    else
        ((currentYear++))
    fi

    salary=$((salary + increment))
done

echo "-----|--------|---------"
} | column -t -s '|' -o '|'

echo ""
echo "Salary scale table generated successfully."
