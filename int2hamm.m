function [ w, bits ] = int2hamm(N,L,d,b)
%INT2HAMM converts a vector of numbers to a respective (L,d) hamming code 
%   converts a row vector N of nonnegative integers into a corresponding array of binary Hamming code words
p=L-d;
if L<3 || d<1 || L>2^p-1 || L<2^(p-1)
    error('not a valid Hamming code');
end
if nargin==3 %if b is not specified
    B=int2bin(N);
else
    B=int2bin(N,b);
end

bits = size(B,1);
temp=B;%temp is temporary variable initialized to be B (initially a matrix)
if mod(prod(size(B)),d)~=0
    temp=reshape(B,1,prod(size(B)));%temp is now defined to be a row vector with all the elements of B
    t=d-mod(prod(size(temp)),d);%t is the number of 0s to be padded to vector temp 
    padding=zeros(1,t);
    temp=[temp padding];
end
n=ceil(prod(size(temp))/d);
B=reshape(temp,d,n);%reshaping temp to be a d*n matrix and storing back in B
w=zeros(L,n);%Initializing w to be a L*n matrix

exp=0;
count=1;
for ii=1:L
    if ii==2^exp %initializing all parity bits to 0
        w(ii,:)=0;
        exp=exp+1;
    else
        w(ii,:)=B(count,:);
        count=count+1;
    end
end
H=int2bin(1:L);%generating hamming matrix with L columns

temp2=mod(H*w,2);
exp=0;
count=1;
for ii=1:L
    if ii==2^exp 
        w(ii,:)=temp2(count,:);
        exp=exp+1;
        count=count+1;
    else   
    end
end

end
