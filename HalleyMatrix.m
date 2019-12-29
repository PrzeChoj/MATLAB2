function [B,C,D] = HalleyMatrix(p, A, tol, max_iter)

% Funkcja oblicza pierwiastki wielomianu metod¹ Halleya
% p - wspó³czynniki wielomianu
% A - macierz przybli¿eñ pocz¹tkowych
% tol - dok³adnoœæ
% max_iter - maksymalna liczba iteracji
% Zwracane s¹ macierze B i C, które zawieraj¹ odpowiednio liczbê iteracji -
% szybkoœæ zbie¿noœci albo do jakiego pierwiastka jest zbie¿ny

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