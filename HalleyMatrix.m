function [B,C,D] = HalleyMatrix(p, A, tol, max_iter)

% Funkcja oblicza pierwiastki wielomianu metod� Halleya
% p - wsp�czynniki wielomianu
% A - macierz przybli�e� pocz�tkowych
% tol - dok�adno��
% max_iter - maksymalna liczba iteracji
% Zwracane s� macierze B i C, kt�re zawieraj� odpowiednio liczb� iteracji -
% szybko�� zbie�no�ci albo do jakiego pierwiastka jest zbie�ny

[n,m] = size(A);
B = zeros(n,m);
C = zeros(n,m);
for i=1:n
    for j=1:m
        [x,k] = MetodaHalleya(p, A(i,j), tol, max_iter);
        B(i,j) = k;
        C(i,j) = x;
    end
end
D = zamianaCnaD(C);
end