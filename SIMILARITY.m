function [ Decision3 ] = SIMILARITY( pij,a,b,c,d,e,f,g,h )
%Incase both isolation and and fringe module fail, the similarity modulel
%is used to determine whether the pixel is noisy or not.

A = [ pij a b c d e f g h] ;
A = sort(A) ;

Wij4 = A(4) ;
Median_in_Wij = A(5) ;
Wij6 = A(6) ;

Th_SMa = 15/255 ;
Th_SMb = 60/255 ;

Maxij = Wij6 + Th_SMa ; 
Minij = Wij4 - Th_SMa ;

if Maxij <= Median_in_Wij + Th_SMb 
    Nmax = Maxij ;
else
    Nmax = Median_in_Wij + Th_SMb ;
end

if Minij >= Median_in_Wij - Th_SMb 
    Nmin = Minij ;
else
    Nmin = Median_in_Wij - Th_SMb ;
end

Decision3 = (pij>=Nmax || pij <=Nmin) ; 

end