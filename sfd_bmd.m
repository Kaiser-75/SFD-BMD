clear 
clc
noe=input('How many element in beams ? (including reaction force) ');
l=input('Enter length of your beam ');

disp('Enter as vector: [load type,starting position,ending position,starting magnitude,ending magnitude');

disp('1. Enter Type of load.For Point Load=0; UDL=1;Ramp load=2 ');

disp('2. Enter start position of element ');
disp('3. Enter ending posit-ion of element ');

disp('4. Enter start load magnitude ');
disp('5. Enter ending load magnitude ');

disp('If it is point load, then follow [1,2,4] ');
disp('If ramp load left value greater than right value then put a negative sign in magnitude');
disp('For downward load put a negative sign');

% Calculation
value=zeros(1,l*100+1);
moment=zeros(1,l*100+1);
for i=1:noe
    % element of beam vector
    loadvector=input('Enter load vector : \n');

    x=loadvector(1,2); %position of element
    if(loadvector(1,1)==0) %point load
        c=int16(l*100+1)-x*100;
      for j=1:c
          p=int16(x*100)+1;
        value(1,p)=value(1,p)+loadvector(1,3)*beam(x,loadvector(1,2),loadvector(1,1));
        moment(1,p)=moment(1,p)+loadvector(1,3)*beam(x,loadvector(1,2),loadvector(1,1)+1);
        x=x+0.01;
       end

    else %ramp
        c=int16(l*100+1)-x*100;
        for j=1:c
            p=int16(x*100)+1;
            ld=loadvector(1,5)-loadvector(1,4);
            %ld=load difference
            ps=loadvector(1,3)-loadvector(1,2);
            slope=ld/ps;

        value(1,p)=value(1,p)+loadvector(1,4)*beam(x,loadvector(1,2),(loadvector(1,1)-1))-loadvector(1,4)*beam(x,loadvector(1,3),(loadvector(1,1))-1)+slope/2*beam(x,loadvector(1,2),loadvector(1,1))-slope/2*beam(x,loadvector(1,3),loadvector(1,1));
        moment(1,p)=moment(1,p)+loadvector(1,4)/2*beam(x,loadvector(1,2),(loadvector(1,1)))-loadvector(1,4)/2*beam(x,loadvector(1,3),(loadvector(1,1)))+slope/6*beam(x,loadvector(1,2),(loadvector(1,1)+1))-slope/6*beam(x,loadvector(1,3),(loadvector(1,1)+1));
        x=x+0.01;
        end
    end
end
      x=0:0.01:l;
     subplot(2,1,1);
     area(x,value,'faceColor','g');
     subplot(2,1,2);
     area(x,moment,'faceColor','b');





