n = 3; % The number of drug combinations

% Initializing the Size-Difference matrix for a four fault network
E = zeros(25,25,25,25,64);

% "i", "j", "k", "l" iterate over three faults, and d1, d2, d3, d4, d5, d6 iterate over drugs
for i = 0:24
    for j = i:24
        for k = j:24
            for l = k:24
                for d1 = 0:1
                    for d2 = 0:1
                        for d3 = 0:1
                            for d4 = 0:1
                                for d5 = 0:1
                                    for d6 = 0:1
                                        m = 32*d1 + 16*d2 + 8*d3 + 4*d4 + 2*d5 + d6 + 1;
                                        if (d1+d2+d3+d4+d5+d6 <= n) 
                                            E(i+1,j+1,k+1,l+1,m) = four_faults_loop(i,j,k,l,d1,d2,d3,d4,d5,d6);
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

E1 = sum(sum(sum(sum(E)))); % Summing the measures across different faults
E1 = E1(:,any(E1,2)); % Removing the zero columns
E1 = E1/max(abs(E1(:))); % Normalising the measure 
E1 = E1';

display(E1);
