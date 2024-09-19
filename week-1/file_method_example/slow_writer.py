import time

def write_slowly(file_path, text):
    words = text.split()
    with open(file_path, 'a') as file:
        for word in words:
            file.write(word + ' ')
            file.flush()  # Ensure the word is written to the file immediately
            print(f"Written: '{word}'")
            time.sleep(1)  # Sleep for 1 second between writes
        file.write('\n')

def main():
    file_path = 'slow_output.txt'

    print("Slow Writer Program")
    print("Type your input and press Enter when done.")
    print("To quit, just type 'exit' and press Enter.")

    while True:
        user_input = input("Enter text: ")
        if user_input.lower() == 'exit':
            print("Exiting the program.")
            break

        print("Writing...")
        write_slowly(file_path, user_input)
        print("Done writing input.")

if __name__ == '__main__':
    main()
