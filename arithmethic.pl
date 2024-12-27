/*
 * File: my_list_preds.pl
 * Author: Franz Zbinden Garcia
 * Course: COTI 4039-KJ1
 * Date: 12/05/2024
 * Purpose: This program defines gcd and Fibonacci sequence calculations.
 */

% Computes the greatest common divisor of A and B.
gcd(A, 0, A):- !.  % Base case: GCD(A, 0) is A.

gcd(A, B, GCD):- 
    C is A mod B,  % Calculate remainder.
    gcd(B, C, GCD).  % Recursive call.

% Alternative implementation of gcd using if-then-else.
gcd_v2(A, B, GCD):- 
    B = 0 ->  
        GCD = A
    ;   
        C is A mod B, 
        gcd(B, C, GCD).

% fibo(N, Fibo) - Computes the N-th Fibonacci number.
fibo(0, 0).  % Base case: F(0) = 0.
fibo(1, 1).  % Base case: F(1) = 1.

fibo(N, Fibo) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibo(N1, Fibo1),
    fibo(N2, Fibo2),
    Fibo is Fibo1 + Fibo2.  % F(N) = F(N-1) + F(N-2).

% Tail-recursive version of Fibonacci.
fibo_v2(N, Fibo) :-
    fibo_helper_v2(N, 0, 1, Fibo).

% Base case for tail recursion.
fibo_helper_v2(0, First, _, First).

% Recursive case for tail recursion.
fibo_helper_v2(N, First, Second, Fibo) :-
    N > 0,
    Next is First + Second,
    N1 is N - 1,
    fibo_helper_v2(N1, Second, Next, Fibo).
% go/0 - Implements and tests all functions.
go :-
    % Test gcd
    write('Testing GCD:'), nl,
    gcd(48, 18, GCD1),
    format('gcd(48, 18) = ~w~n', [GCD1]),
    gcd_v2(48, 18, GCD2),
    format('gcd_v2(48, 18) = ~w~n', [GCD2]),

    % Test Fibonacci (recursive)
    write('Testing Fibonacci (recursive):'), nl,
    fibo(10, Fibo1),
    format('fibo(10) = ~w~n', [Fibo1]),

    % Test Fibonacci (tail-recursive)
    write('Testing Fibonacci (tail-recursive):'), nl,
    fibo_v2(10, Fibo2),
    format('fibo_v2(10) = ~w~n', [Fibo2]).
