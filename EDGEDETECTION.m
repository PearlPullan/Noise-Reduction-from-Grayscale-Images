function [ reconstructed_value ] = EDGEDETECTION( pij,a, b, c, d, e, f, g, h )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    A = [ pij a b c d e f g h] ;
    A = sort(A) ;

    Wij4 = A(4) ;
    Wij6 = A(6) ;

    Th_SMa = 15/255 ;

    Maxij = Wij6 + Th_SMa ; 
    Minij = Wij4 - Th_SMa ;

    d1=abs(d-h)+abs(a-e);
    d2=abs(a-g)+abs(b-h);
    d3=abs(b-g)*2;
    d4=abs(b-f)+abs(c-g);
    d5=abs(c-d)+abs(e-f);
    d6=abs(d-e)*2;
    d7=abs(a-h)*2;
    d8=abs(c-f)*2;

    D=[d1 d2 d3 d4 d5 d6 d7 d8 ];
 
    d_is_noisy  = 0 ;
    e_is_noisy  = 0 ;
    f_is_noisy  = 0 ;
    g_is_noisy = 0  ;
    h_is_noisy  = 0 ;

    if d>=Maxij && d<=Minij 
        d_is_noisy = 1 ;
    end

    if e>=Maxij && e<=Minij 
        e_is_noisy = 1 ;
    end

    if f>=Maxij && f<=Minij 
        f_is_noisy = 1 ;
    end

    if g>=Maxij && g<=Minij 
        g_is_noisy = 1 ;
    end

    if h>=Maxij && h<=Minij 
        h_is_noisy = 1 ;
    end

    
    if d_is_noisy && e_is_noisy && f_is_noisy && g_is_noisy && h_is_noisy
        reconstructed_value=(a+(2*b)+c)/4;
    
    else
        if d_is_noisy
            D(1) = 999 ;D(5) = 999 ; D(6) = 999 ;
        end
    
        if e_is_noisy
            D(1) = 999 ; D(5) = 999 ; D(6) = 999 ;
        end
    
         if f_is_noisy
            D(4) = 999 ;D(5) = 999 ; D(8) = 999 ;
         end
    
        if g_is_noisy
            D(2) = 999 ; D(3) = 999 ; D(4) = 999 ;
        end
    
        if h_is_noisy
            D(1) = 999; D(2) =999 ; D(7) = 999 ;
        end
    
        C = sort(D) ;
        Dmin = C(1) ;
   
        switch Dmin
            case D(1) 
            p_cap=(a+d+e+h)/4;
            case D(2) 
                p_cap = (a+b+g+h)/4 ;
            case D(3)
            p_cap = (b+g)/2 ;
            case D(4)
            p_cap = (b+c+f+g)/4 ;
            case D(5)
            p_cap = (c+d+e+f)/4 ;    
            case D(6)
            p_cap = (d+e)/2 ;
            case D(7)
            p_cap = (a+h)/2 ;
            case D(8)
            p_cap = (c+f)/2 ;    
            
        end
        
        reconstructed_value = ALLFILTERS(p_cap, b,d,e,g) ;
    end

    
end
