function [D] = zamianaCnaD(C)

% Funkcja przyjmuje macierz miejsc zerowych C
% i zamienia j¹ na macierz liczb naturalnych numeruj¹cych
% liczby w macierzy C

[n,m] = size(C);
D = zeros(n,m);
for i=1:n
    for j=1:m
        if isnan(real(C(i,j))) || isnan(imag(C(i,j)))
            D(i,j) = -1;
        end
    end
end
p = 1;
tol = 0.1;

for i=1:n
    for j=1:m
        if D(i,j) == 0
            D(i,j) = p;
            for k=1:n
                for l=1:m
                    if isnan(real(C(k,l))) || isnan(imag(C(k,l)))
                        continue
                    end
                    if abs(C(i,j) - C(k,l)) <= tol
                        D(k,l) = p;
                    end
                end
            end
        p = p + 1;  
        end       
    end
end
end

