function [B] = int2bin(N,b)
%INT2BIN converts a vector N of non-negative integers to a matrix B whose columns represent the binary values of elements of N 
%   takes in N (a row vector of integers), b is the min number of bits used to
%   represent N in binary form. B is an array of the binary forms of N

if nargin==1 %if b is not specified
    b=floor(log2(max([N 1]))) + 1;
else
    if b<floor(log2(max([N 1]))) + 1
      b=floor(log2(max([N 1]))) + 1;
    end
end

B=zeros(b,length(N));

for ii=1:length(N)
   for jj=b:-1:1
       if N(ii)>=2^(jj-1)
           B(jj,ii)=1;
           N(ii)=N(ii)-2^(jj-1);
       else
           B(jj,ii)=0;
       end
   end
end
    

end

