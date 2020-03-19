function [ decision1 ] = ISOLATE( pij,a,b,c,d,e,f,g,h )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
A = [a b c d] ;
top_half_max=max(A);
top_half_min=min([a b c d]);

bottom_half_max=max([e f g h]);
bottom_half_min=min([e f g h]);

top_half_diff=top_half_max-top_half_min;
bottom_half_diff=bottom_half_max-bottom_half_min;

Th_IMa=20/255;
Th_IMb=25/255;

IM_TOP_HALF = true ;
IM_BOTTOM_HALF = true ;

if((top_half_diff>=Th_IMa)||(bottom_half_diff>=Th_IMb))
        IM_TOP_HALF= (abs(pij-top_half_max)>=Th_IMb)||(abs(pij-top_half_min)>=Th_IMb);
        IM_BOTTOM_HALF=(abs(pij-bottom_half_max)>=Th_IMb)||(abs(pij-bottom_half_min)>=Th_IMb);

end
decision1 = (IM_TOP_HALF || IM_BOTTOM_HALF) ;

end