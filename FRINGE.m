function [ Decision2 ] = FRINGE( pij,a,b,c,d,e,f,g,h )

%This function is used to determine whether the given pixel lies on an edge
%or not

Th_FMa = 40/255 ;
Th_FMb = 80/255 ;

if (abs(a-pij) >= Th_FMa) || (abs(h-pij) >= Th_FMa) || (abs(a-h) >= Th_FMb)
    FM_E1 = false ;
else
    FM_E1 = true ;
end

if (abs(c-pij) >= Th_FMa) || (abs(f-pij) >= Th_FMa) || (abs(c-f) >= Th_FMb)
    FM_E2 = false ;
else
    FM_E2 = true ;
end

if (abs(b-pij) >= Th_FMa) || (abs(g-pij) >= Th_FMa) || (abs(b-g) >= Th_FMb)
    FM_E3 = false ;
else
    FM_E3 = true ;
end

if (abs(d-pij) >= Th_FMa) || (abs(e-pij) >= Th_FMa) || (abs(d-e) >= Th_FMb)
    FM_E4 = false ;
else
    FM_E4 = true ;
end

Decision2 = ~(FM_E1 || FM_E2 ||FM_E3 || FM_E4 ) ;

end












