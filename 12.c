#include <stdio.h>
#include <stdbool.h>
 
#define N 4
 
// Function to print the solution
void printSolution(char board[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            printf(" %c ", board[i][j]);
        }
        printf("\n");
    }
}
 
// Function to check if a queen can be placed on board[row][col]
bool isSafe(char board[N][N], int row, int col) {
    int i, j;
 
    // Check the row on the left side
    for (i = 0; i < col; i++)
        if (board[row][i] == 'Q')
            return false;
 
    // Check upper diagonal on the left side
    for (i = row, j = col; i >= 0 && j >= 0; i--, j--)
        if (board[i][j] == 'Q')
            return false;
 
    // Check lower diagonal on the left side
    for (i = row, j = col; j >= 0 && i < N; i++, j--)
        if (board[i][j] == 'Q')
            return false;
 
    return true;
}
 
// Recursive function to solve N Queens problem
bool solveNQUtil(char board[N][N], int col) {
    // If all queens are placed, return true
    if (col >= N)
        return true;
 
    // Consider this column and try placing this queen in all rows one by one
    for (int i = 0; i < N; i++) {
        // Check if the queen can be placed on board[i][col]
        if (isSafe(board, i, col)) {
            // Place this queen in board[i][col]
            board[i][col] = 'Q';
 
            // Recur to place rest of the queens
            if (solveNQUtil(board, col + 1))
                return true;
 
            // If placing queen in board[i][col] doesn't lead to a solution, then remove queen from board[i][col]
            board[i][col] = '-';
        }
    }
 
    // If the queen cannot be placed in any row in this column, then return false
    return false;
}
 
// Function to solve N Queens problem for 4 queens
void solve4Queens() {
    char board[N][N];
 
    // Initialize the board with '-'
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            board[i][j] = '-';
 
    if (solveNQUtil(board, 0) == false) {
        printf("Solution does not exist\n");
        return;
    }
 
    printSolution(board);
}
 
// Driver function
int main() {
    printf("Solution for 4 Queens problem:\n");
    solve4Queens();
    return 0;
}
