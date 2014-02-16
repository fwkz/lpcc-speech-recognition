function [ lpcc_coeff ] = lpcc( lpc_coeff, G )
    % Compute LPCC coefficients from LPC.
    
    lpcc_coeff = [0];
    % G = 6;
    acc = 0;

    [lpc_amount,frames] = size(lpc_coeff); %liczymy iloœæ lpc
    lpcc_amount = ceil(1.5*lpc_amount); % bierzemy 1,5*iloœæ lpc

    for column=1:1:frames
        for row = 0:1:lpcc_amount-1
            if(row<lpc_amount)
                if(row==0)
                    lpcc_coeff(row+1,column) = log(G);
                else
                    acc=0;
                    for k= 0:1:row-1
                        acc = acc + (k/row)*lpc_coeff(row-k+1,column)*lpcc_coeff(k+1,column);
                    end
                    lpcc_coeff(row+1,column) =  -lpc_coeff(row+1,column) - acc; 
                end
            else
                acc=0;
                for k= row-lpc_amount:1:row-1
                    acc = acc + (k/row)*lpc_coeff(row-k,column)*lpcc_coeff(k+1);
                end
                lpcc_coeff(row+1,column) =  - acc; 
            end     
        end        
    end