function [ lpcc_coeff ] = lpcc( lpc_coeff, framed_signal )
    lpcc_coeff = [0];
    G = 3;
    acc = 0;

    lpc_amount = length(lpc_coeff); %liczymy iloœæ lpc
    lpcc_amount = ceil(1.5*lpc_amount); % bierzemy 1,5*iloœæ lpc

    for column = 1:1:size(framed_signal,2)
        for row = 1:1:lpcc_amount
          if (row<=lpc_amount)
                      if(row==1)
                          lpcc_coeff(row,column) =  log(G); %pierwsza kolumna
                      else
                          acc=0;
                          for k= 1:1:row-1
                              acc= acc+ ((k/row)*lpc_coeff( (row-k),column))*lpcc_coeff(k);
                          end
                          lpcc_coeff(row,column) =  -lpc_coeff(row,column) - acc; 
                      end
          else
              acc=0;
              for k=row-lpc_amount:1:row-1
                  acc= acc+ ((k/row).*lpc_coeff( (row-k),column)) *lpcc_coeff(k);
              end
              lpcc_coeff(row,column) = -acc;
          end
        end  
    end
end