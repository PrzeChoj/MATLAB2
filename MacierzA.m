function A = MacierzA(a,b,c,d,n,m)

% Funkcja zwraca macierz A o wymiarach (n+1, m+1) punktów xk + i*yj, gdzie
% xk nale¿y do przedzia³u [a,b] oraz xk = a + k*h1 dla k = 0...n i h1 =
% (b-a)/n
% yj nale¿y do przedzia³u [c,d] oraz yj = c + j*h2 dla c = 0...m i h2 =
% (d-c)/m

h1 = (b - a)/n;
h2 = (d - c)/m;
A = zeros(n+1, m+1);
x = zeros(1, n+1);
y = zeros(1, m+1);

for k=1:n+1
    x(1,k) = a + (k-1) * h1;
end
for j=1:m+1
    y(1,j) = c + (j-1) * h2;
end
for k=1:n+1
    for j=1:m+1
        A(k,j) = x(1,k) + y(1, j) * i;
    end
end
end