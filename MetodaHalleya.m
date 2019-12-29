function [x, k, w_x] = MetodaHalleya(p, x0, tol, max_iter)

% Wyznaczanie zera wielomianu metod� Halleya'a
% p - wspolczynniki wielomianu np. p =[3,2,1], czyli w(x) = 3x^2 + 2x + 1
% x0 - pocz�tkowe przybli�enie
% tol - dok�adno��
% max_iter - maksymalna ilo�� iteracji
% Metoda zwraca:
% x - przybli�enie
% i - liczba wykonanych iteracji
% w_x=w(x), gdzie x jest obliczonym przybli�eniem zera w(x)

k = 0;
dx = tol + 1;
xpocz = x0;             % warto�� pocz�tkowa

dw = pochodna(p);       % I pochodna wielomianu
ddw = pochodna(dw);     % II pochodna wielomianu

while abs(dx) > tol && k <= max_iter
    w = polyval(p,x0);
    if abs(w) <= tol               % dok�adno�� jest wystarczaj�ca
        x = x0;
        w_x = w;
        return
    end
    dzielnik = 2*polyval(dw,x0)^2 - (w*polyval(ddw,x0));
    
    if dzielnik == 0
        disp(' Dzielenie przez zero! ');
        return
    end
    
    dx = (2*w*polyval(dw, x0))/dzielnik;
    x1 = x0 - dx;        % obliczanie nast�pnego przybli�enia 
    k = k + 1;           % aktualizacja i
    x0 = x1;             % aktualizacja x0
end

fprintf('Nie znaleziono rozwi�zania w %d iteracjach, zaczynaj�c od %d z wymagan� precyzj� wynosz�cej: %d \n', max_iter, xpocz, tol);
k = 31;         % bo zamiar jest taki, aby wszystkie pierwiastki nie znalezione do 30 iteracji by�y kolorowane na jeden kolor  
x = NaN;
end

