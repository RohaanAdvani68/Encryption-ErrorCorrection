function N = hamm2int(w,d,bits)
%HAMM2INT returns the integer representation N of the Hamming Code w
%   w is the binary array of code words to be converted back to integer
%   values, d is the number of data bits in each code word, bits is the number
%   of data bits used to represent each entry in the output argument N 

L=size(w,1);
p=L-d;
if L<3 || d<1 || L>2^p-1 || L<2^(p-1)
    error('not a valid Hamming code');
end
H=int2bin(1:L);%Hamming matrix

temp = mod(H*w,2);
for ii=1:size(w,2)
    errorvar=bin2int(temp(:,ii));
    if errorvar>L 
        error('multiple bit errors detected, cannot perform error correction');
    elseif errorvar~=0
        w(errorvar,ii)=mod(w(errorvar,ii)+1,2); %flipping the bits of that column
    end
end

B=zeros(d,size(w,2)); %initializing B matrix of binary for codewords
exp=0;
count=1;
for ii=1:L
    if ii~=2^exp && count<=d
        B(count,:)=w(ii,:); %assigning rows of B to corresponding non-exponent rows of w
        count=count+1;
    else 
        exp=exp+1;
    end
    
    
end

    temp=reshape(B,1,prod(size(B)));
    n=size(w,2);
    temp=temp(1,1:(bits*(floor(d*n/bits))));
    B=reshape(temp,bits,floor(d*n/bits));
    
    N=bin2int(B);%N is integer representation of B
end