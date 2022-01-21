function v=beam(x,a,n)

% x = any position
% a = position of load
% n = load type
 if x>=a
    v=(x-a).^ n;
 else 
    v=0;
 end
 




