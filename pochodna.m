function dw = pochodna(w)

% Obliczanie pochodnej wielomianu na podstawie jego wspó³czynników
% Przyk³ad: w(x) = 3x^2 - 4x + 5 -> w = [3,-4,5] -> dw = [6,-4] -> w'(x) = 6x - 4

n = length(w);
dw = zeros(1,n-1);
    
for i = (n-1):-1:1
   dw(i) = w(i)*(n-i);
end
end

