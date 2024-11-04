#include <stdio.h>

#define MAX 100  // Define a constant

// Function to calculate factorial
int factorial(int n) {
    if (n <= 1) {
        return 1; // Base case for recursion
    }
    return n * factorial(n - 1); // Recursive call
}

/* 
   Function to check if a number is prime
   This function uses a basic algorithm
*/
int is_prime(int num) {
    if (num <= 1) {
        return 0; /* Not prime */
    }
    for (int i = 2; i * i <= num; i++) {  // Loop up to the square root of num
        if (num % i == 0) {
            return 0;  // Not prime if divisible by i
        }
    }
    return 1;  // Number is prime
}

// Main function
int main() {
    printf("Advanced C Code Test\n"); // Print message

    // Array initialization
    int numbers[] = {1, 2, 3, 5, 8, 13, 21};
    int size = sizeof(numbers) / sizeof(numbers[0]);  // Calculate array size

    // Loop through the array
    for (int i = 0; i < size; i++) {
        printf("Factorial of %d is %d\n", numbers[i], factorial(numbers[i]));  /* Print factorial */
        
        if (is_prime(numbers[i])) {  // Check for prime
            printf("%d is a prime number\n", numbers[i]); /* Inline comment */
        } else {
            printf("%d is not a prime number\n", numbers[i]);
        }
    }

    /*
       Additional multi-line comment
       to simulate more comments in code
    */
    int count = 0;
    while (count < 5) { // Simple while loop with inline comment
        printf("Count is %d\n", count);
        count++; /* Increment count */
    }

    // Final return
    return 0; /* Program ends here */
}

/* End of file comment */
