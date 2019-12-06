function [u] = backreal(L, Ec, Eg, phi)
ll = 1;
Ng = floor(sqrt(Eg));
Nc = floor(sqrt(Ec));
phi_m = zeros(2*Ng + 1, 2*Ng + 1);
u = zeros(2*Ng + 1, 2*Ng + 1);
n = 0;
        for ii = -Ng:Ng
            for j = -Ng:Ng
                    r2 = sqrt(ii^2 + j^2);
                    if r2 <= Nc
                        n = n + 1;
                        if ii <= 0  
                            iik = ii + 2*Ng + 1; 
                        else
                            iik = ii ;  
                        end
                        if  j <= 0  
                            jk = j + 2*Ng + 1;   
                        else
                            jk = j ;
                        end
                        phi_m(iik, jk) = phi(n, ll);
                    end
            end
        end
        u = ifftn(phi_m)*((2*Ng + 1)^2)/(2*L);