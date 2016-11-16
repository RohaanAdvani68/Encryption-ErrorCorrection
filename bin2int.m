function [N] = bin2int(B)
%BIN2INT returns a row vector N containing the integer representations of the columns of B
%   This function has one input argument B (the binary array) and one output argument N (the corresponding row vector of integers).
twos=zeros(1,size(B,1));
for ii=size(B,1):-1:1
twos(1,ii)=2^(ii-1);
end

N=twos*B;

end

