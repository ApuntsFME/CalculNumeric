function val = Gauss(f,a,b,ordre)

[z,w] = QuadraturaGauss(ordre);
val = 0.5*(a+b)*f(canviinv(z,0,5))'*w';
end