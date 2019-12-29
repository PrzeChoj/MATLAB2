A = MacierzA(-10,10,-50,50,100,100);
max_iter = 31;
tol = 0.001;
p = [5,-2,3,1];
[B,C,D] = HalleyMatrix(p, A, tol, max_iter);