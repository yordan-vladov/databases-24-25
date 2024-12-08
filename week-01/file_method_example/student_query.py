import json

# Load the JSON file
def load_students(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)

# Save the JSON file
def save_students(file_path, students):
    with open(file_path, 'w') as file:
        json.dump(students, file, indent=4)

# Display all students
def display_all_students(students):
    if not students:
        print("No students found.")
        return
    for student in students:
        print(f"ID: {student['id']}, Name: {student['name']}, Age: {student['age']}, Grade: {student['grade']}")

# Find student by name
def find_student_by_name(students, name):
    found = False
    for student in students:
        if student['name'].lower() == name.lower():
            print(f"ID: {student['id']}, Name: {student['name']}, Age: {student['age']}, Grade: {student['grade']}")
            found = True
    if not found:
        print(f"Student with name '{name}' not found.")

# Filter students by grade
def filter_students_by_grade(students, grade):
    filtered = [student for student in students if student['grade'].upper() == grade.upper()]
    if filtered:
        for student in filtered:
            print(f"ID: {student['id']}, Name: {student['name']}, Age: {student['age']}, Grade: {student['grade']}")
    else:
        print(f"No students found with grade '{grade}'.")

# Filter students by age
def filter_students_by_age(students, age):
    filtered = [student for student in students if student['age'] == age]
    if filtered:
        for student in filtered:
            print(f"ID: {student['id']}, Name: {student['name']}, Age: {student['age']}, Grade: {student['grade']}")
    else:
        print(f"No students found with age '{age}'.")

# Insert a new student
def insert_student(students):
    new_id = max(student['id'] for student in students) + 1 if students else 1
    name = input("Enter the student's name: ")
    age = int(input("Enter the student's age: "))
    grade = input("Enter the student's grade (A, B, C, etc.): ")

    new_student = {
        "id": new_id,
        "name": name,
        "age": age,
        "grade": grade
    }

    students.append(new_student)
    print(f"Student {name} added successfully!")

# Update an existing student by ID
def update_student(students):
    student_id = int(input("Enter the student ID to update: "))
    for student in students:
        if student['id'] == student_id:
            print(f"Updating student {student['name']} (ID: {student_id})")
            student['name'] = input(f"Enter the new name (current: {student['name']}): ") or student['name']
            student['age'] = int(input(f"Enter the new age (current: {student['age']}): ") or student['age'])
            student['grade'] = input(f"Enter the new grade (current: {student['grade']}): ") or student['grade']
            print(f"Student {student['name']}'s information updated successfully!")
            return
    print(f"Student with ID {student_id} not found.")

# Delete a student by ID
def delete_student(students):
    student_id = int(input("Enter the student ID to delete: "))
    for student in students:
        if student['id'] == student_id:
            students.remove(student)
            print(f"Student with ID {student_id} deleted successfully.")
            return
    print(f"Student with ID {student_id} not found.")

# Main function to perform queries
def main():
    # Load student data from the JSON file
    file_path = 'students.json'
    students = load_students(file_path)

    while True:
        print("\nSimple Student Database")
        print("1. Display all students")
        print("2. Find student by name")
        print("3. Filter students by grade")
        print("4. Filter students by age")
        print("5. Add a new student")
        print("6. Update a student")
        print("7. Delete a student")
        print("8. Exit")

        choice = input("Enter your choice (1-8): ")

        if choice == '1':
            display_all_students(students)
        elif choice == '2':
            name = input("Enter the student's name: ")
            find_student_by_name(students, name)
        elif choice == '3':
            grade = input("Enter the grade to filter by (A, B, C, etc.): ")
            filter_students_by_grade(students, grade)
        elif choice == '4':
            age = int(input("Enter the age to filter by: "))
            filter_students_by_age(students, age)
        elif choice == '5':
            insert_student(students)
            save_students(file_path, students)
        elif choice == '6':
            update_student(students)
            save_students(file_path, students)
        elif choice == '7':
            delete_student(students)
            save_students(file_path, students)
        elif choice == '8':
            print("Exiting the program.")
            break
        else:
            print("Invalid choice. Please select a valid option.")

if __name__ == '__main__':
    main()
