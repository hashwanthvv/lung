% Four faults simultaneously

function output = four_faults_loop(fault1, fault2, fault3, fault4, x1, x2, x3, x4, x5, x6)

    % Inputs
    %EGF = 0; HBEGF = 0; IGF = 0; NRG1 = 0;
    EGF = 1; HBEGF = 1; IGF = 1; NRG1 = 1;

    % Drugs
    CRY = x1; LY294002 = x2; Temsirolimus = x3; Lapatinib = x4; HO3867 = x5; Met = x6;
    
    %Initial Definitions
    ERK1 = 0; AKT = 0; RPS6KB1 = 0;
    
    k1 = 50; k2 = 50; k3 = 50;
    
    n = 50; i = 10;
    
    j = 3*n + i;
    
    output1 = zeros(1,j);
    
       for t=1:n
            if (fault1 == 1 || fault2 == 1 || fault3 == 1 || fault4 == 1)
                EGFR = 1; 
            else
                if t*AKT > k1
                    EGFR = 0;
                else
                    EGFR = EGF;
                end
            end

            if (fault1 == 2 || fault2 == 2 || fault3 == 2 || fault4 == 2)
                EFGR = 1;
            else
                EFGR = EGF + HBEGF;
            end 

            if (fault1 == 3 || fault2 == 3 || fault3 == 3 || fault4 == 3)
                IFGR1AB = 1;
            else
                IFGR1AB = IGF;
            end

            if (fault1 == 4 || fault2 == 4 || fault3 == 4 || fault4 == 4)
                ERBB2 = 1;
            else
                ERBB2 = NRG1;
            end

            if (fault1 == 5 || fault2 == 5 || fault3 == 5 || fault4 == 5)
                JAK1 = 1;
            else
                JAK1 = min(EGFR, ~Lapatinib);
            end

            if (fault1 == 6 || fault2 == 6 || fault3 == 6 || fault4 == 6)
                STAT3 = 1;
            else
                STAT3 = JAK1;
            end

            if (fault1 == 7 || fault2 == 7 || fault3 == 7 || fault4 == 7)
                IRS1 = 1;
            else
                if t*RPS6KB1 > k3
                    IRS1 = 0;
                else
                    IRS1 = IFGR1AB;
                end
            end

            if (fault1 == 8 || fault2 == 8 || fault3 == 8 || fault4 == 8)
                GRB2 = 1;
            else
                if t*ERK1 > k2
                    GRB2 = 0;
                else
                    GRB2 = (min(EGFR, ~Lapatinib) + min(EFGR, ~Lapatinib) + IFGR1AB + min(ERBB2, ~Lapatinib));
                end
            end

            if (fault1 == 9 || fault2 == 9 || fault3 == 9 || fault4 == 9)
                RAS = 1;
            else
                RAS = GRB2;
            end

            if (fault1 == 10 || fault2 == 10 || fault3 == 10 || fault4 == 10)
                MEKK1 = 1;
            else
                MEKK1 = RAS;
            end

            if (fault1 == 11 || fault2 == 11 || fault3 == 11 || fault4 == 11)
                RAF = 1;
            else
                RAF = RAS;
            end

            if (fault1 == 12 || fault2 == 12 || fault3 == 12 || fault4 == 12)
                MKK4 = 1;
            else
                MKK4 = MEKK1;
            end

            if (fault1 == 13 || fault2 == 13 || fault3 == 13 || fault4 == 13)
                MEK1 = 1;
            else
                MEK1 = RAF;
            end    

            if (fault1 == 14 || fault2 == 14 || fault3 == 14 || fault4 == 14)
                PIK3CA = 1;
            else
                PIK3CA = (RAS+ min(STAT3,min(~CRY,~HO3867)) + (IRS1)+ min(ERBB2, ~Lapatinib));
            end 

            if (fault1 == 15 || fault2 == 15 || fault3 == 15 || fault4 == 15)
                JNK1 = 1;
            else
                JNK1 = MKK4;
            end 

            if (fault1 == 16 || fault2 == 16 || fault3 == 16 || fault4 == 16)
                ERK1 = 1;
            else
                ERK1 = MEK1;
            end 

            if (fault1 == 17 || fault2 == 17 || fault3 == 17 || fault4 == 17)
                PIP3 = 1; 
            else
                PIP3 = min(PIK3CA, ~LY294002); 
            end 

            if (fault1 == 18 || fault2 == 18 || fault3 == 18 || fault4 == 18)
                PDPK1 = 1;
            else
                PDPK1 = PIP3;
            end

            if (fault1 == 19 || fault2 == 19 || fault3 == 19 || fault4 == 19)
                AKT = 1;
            else
                AKT = PIP3;
            end

            if (fault1 == 20 || fault2 == 20 || fault3 == 20 || fault4 == 20)
                TSC1 = 0;
            else
                if x6 == 1
                    TSC1 = ~(AKT) + Met;
                else                    
                    TSC1 = ~(AKT); 
                end
            end

            if (fault1 == 21 || fault2 == 21 || fault3 == 21 || fault4 == 21)
                RHEB = 1;
            else
                RHEB = ~TSC1;
            end

            if (fault1 == 22 || fault2 == 22 || fault3 == 22 || fault4 == 22)
                mTOR = 1;
            else
                mTOR = RHEB;
            end

            if (fault1 == 23 || fault2 == 23 || fault3 == 23 || fault4 == 23)
               RPS6KB1 = 1; 
            else
               RPS6KB1 = (min(ERK1, ~CRY) + PDPK1 + min(mTOR, ~(Temsirolimus)));  
            end

            if (fault1 == 24 || fault2 == 24 || fault3 == 24 || fault4 == 24)
               BAD = 0; 
            else
               BAD = ~(RPS6KB1 + (AKT)); 
            end

            BCL2 = min((min(STAT3, min(~CRY, ~HO3867))), ~BAD);
            SRFELK1 = min(min(ERK1, ~CRY), RPS6KB1); 
            FOSJUN = min(JNK1, RPS6KB1);
            SRFELK4 = min(min(ERK1, ~CRY), RPS6KB1); 
            SP1 = min(ERK1, ~CRY); 

            k = 3*t+1;
            
            for l=k:k+i
                output1(l) = BCL2 + SRFELK1 + FOSJUN + SRFELK4 + SP1;
            end     
            
        end
     
     output = trapz(output1);
end
