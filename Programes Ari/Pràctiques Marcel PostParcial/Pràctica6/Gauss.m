function val = Gauss(f,a,b,ordre)

[z,w] = QuadraturaGauss(ordre);
val = 0.5*(b-a)*f(canviinv(z,a,b))'*w';
end