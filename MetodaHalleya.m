function [x2] = MetodaHalleya(w, x0, N)
% Metoda Halley'a wyznaczajaca zera wielomianu postaci np. w=[3,2,1]
% oblicza: x1 = x0 - w(x0)/dw(x0)*(1 - w(x0)*ddw(x0)/(2*(dw(x0))^2)
    % gdzie w(x0) oznacza wartosc wielomianu w punkcie x0,
    % dw(x0) wartosc pochodnej wielomianu w punkcie x0,
    % dd2(x0) wartosc drugiej pochodnej wielomianu w punkcie x0.
% Metoda jest powtarzana N razy

i = 1;
error = sqrt(eps);         %dokladnosc
xpocz = x0;             % wartosc poczatkowa

dw = pochodna(w);       %pochodne wielomianow
ddw = pochodna(dw);

while i <= N
    x1 = x0 - (polyval(w, x0)/polyval(dw,x0))*(1 - (polyval(w,x0)*polyval(ddw,x0)/polyval(dw,x0)^2))^(-1);     %Implementation og Halleys Methof (i.e. g(x)). 
  
    if (abs(x1 - x0)/abs(x0)) < error                 % dokladnosc jest wystarczajaca
        x2 = x1;
        return
    end
 
    i = i + 1;
    x0 = x1;             % aktualizuj x0
end

fprintf('Nie znaleziono rozwiazania w %d iteraciach zaczynajac od %d na wymaganej precyzjii wynoszacej: %d \n', N, xpocz, error);

end

