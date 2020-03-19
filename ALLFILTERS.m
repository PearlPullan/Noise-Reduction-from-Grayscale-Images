function [ reconstructed_value ] = ALLFILTERS( p_cap, b,d,e,g)
         
                B = [b d p_cap e g] ;
                
               %median
               reconstructed_value=median(B);
              
               %geometric
               %reconstructed_value = (b*d*p_cap*e*g)^(1/5);
               
               %arithmetic
               %reconstructed_value = (b+d+p_cap+e+g)/5;
            
              % Harmonic mean
              % reconstructed_value=harmmean(B);
     
end

