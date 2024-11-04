#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
 * Program Title: Example C Program
 * Description: This program demonstrates various basic operations in C,
 * including array manipulation, string operations, basic file I/O,
 * and memory allocation with malloc.
 * Each function is documented with comments explaining its functionality.
 */

// Function prototypes
void printArray(int *arr, int size);
int findMax(int *arr, int size);
int factorial(int n);
void reverseString(char *str);
void saveToFile(char *filename, char *content);

int main() {
    // Array demonstration
    int arr[] = {5, 3, 8, 1, 2};
    int size = sizeof(arr) / sizeof(arr[0]);

    printf("Array contents:\n");
    printArray(arr, size);

    // Find maximum in array
    int max = findMax(arr, size);
    printf("Maximum element in the array: %d\n", max);

    // Factorial calculation
    int num = 5;
    printf("Factorial of %d is: %d\n", num, factorial(num));

    // String manipulation
    char str[] = "Hello, world!";
    printf("Original string: %s\n", str);
    reverseString(str);
    printf("Reversed string: %s\n", str);

    // File I/O demonstration
    char *content = "This is a sample text for file I/O.";
    saveToFile("output.txt", content);

    return 0;
}

/*
 * Function: printArray
 * --------------------
 * Prints the elements of an integer array.
 * 
 * arr: pointer to the integer array.
 * size: number of elements in the array.
 * 
 * This function iterates through each element of the array and prints it.
 */
void printArray(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

/*
 * Function: findMax
 * -----------------
 * Finds the maximum element in an integer array.
 * 
 * arr: pointer to the integer array.
 * size: number of elements in the array.
 * 
 * returns: the maximum element found in the array.
 * 
 * This function iterates through the array, updating the max value
 * whenever a larger element is encountered.
 */
int findMax(int *arr, int size) {
    int max = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

/*
 * Function: factorial
 * -------------------
 * Calculates the factorial of a given integer.
 * 
 * n: the integer for which factorial is to be calculated.
 * 
 * returns: factorial of the integer 'n'.
 * 
 * This function uses recursion to calculate the factorial.
 * Base case is when n is 0 or 1; otherwise, n * factorial(n-1) is used.
 */
int factorial(int n) {
    if (n <= 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

/*
 * Function: reverseString
 * -----------------------
 * Reverses a given string in place.
 * 
 * str: pointer to the character array (string) to be reversed.
 * 
 * This function swaps characters from the beginning and end of the string,
 * moving towards the center, effectively reversing it in place.
 */
void reverseString(char *str) {
    int length = strlen(str);
    for (int i = 0; i < length / 2; i++) {
        char temp = str[i];
        str[i] = str[length - i - 1];
        str[length - i - 1] = temp;
    }
}

/*
 * Function: saveToFile
 * --------------------
 * Writes content to a file.
 * 
 * filename: the name of the file to write to.
 * content: the string content to write into the file.
 * 
 * This function opens the file in write mode. If the file exists, it will
 * be overwritten. If it does not exist, it will be created. Then, it writes
 * the content string to the file.
 */
void saveToFile(char *filename, char *content) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        perror("Error opening file");
        return;
    }
    fprintf(file, "%s\n", content);
    fclose(file);
    printf("Content written to file: %s\n", filename);
}
