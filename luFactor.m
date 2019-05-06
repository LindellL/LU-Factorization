function [A,L,U,P] = luFactor(A)
%Takes matrix A, and sloves for L and U matricies by using lu
%decomposition. User must input a matrix A using the format [1 1 1; 1 1 1;
%1 1 1]. L= lower triangle. U= upper triangle. [L]*[U]=[A].

% User first inputs a matrix A  
Aorg=input('(input matrix A using [] and ;):');

%Set P.
p= [1 0 0; 0 1 0; 0 0 1];

%Rearrange variables.
A=Aorg

%Partial Pivoting around A(1,1).
column1= A(:,1);
[R,C]= max(column1);
R= A(1,:);
A(1,:)= A(3,:);
A(3,:)= R;
%Include P Matrix.
if A(1,:)~= Aorg(1,:)
    Q= p(1,:);
    p(1,:)= p(3,:);
    p(3,:)= Q;
end

%Partial Pivoting around A(2,2).
column2= [A(2,2); A(3,2)];
[r,c]= max(column1);
r= A(2,:);
A(2,:)= A(c,:);
A(c,:)= r;
%Include P Matrix.
if A(2,:)~= Aorg(2,:)
    V= p(2,:);
    p(2,:)= p(3,:);
    p(3,:)= V;
end

%Solves for the unknown variables in the L and U matricies.
a= A(1,1);
c= A(1,2);
d= A(1,3);
x= A(2,1)/A(1,1);
f= A(1,2)*x-A(2,2);
l= A(1,3)*x-A(2,3);
y= A(3,1)/A(1,1);
s= A(1,3)*y-A(3,3);
z= A(3,2)/A(1,2);
s= A(1,3)*z-A(3,3);

%Displays L,U,A, and Pivot. Plugs in each of the variables the code solved
%for.
L=[1 0 0;x 1 0; y z 1]
U=[a c d;0 f l;0 0 s]
P= p
end

