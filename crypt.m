function output = crypt(message,key)
%CRYPT takes as inputs a message string and a square key matrix and produces as output an encrypted message string
%   Crypt works for both encryption and de-cryption: to decrypt an encrypted message, simply call the function with the encrypted message and the inverse of the key (rounded) as inputs.
    x=size(key,2);
    msg=double(message);
    n=length(msg);
    if(mod(n,x)~=0)%if length of key not evenly divisible by size of key
        p=x-mod(n,x);
        padding=32*ones(1,p);
        msg=[msg padding];
        n=length(msg);
    end
    msg=reshape(msg,x,n/x);
    ncode=char(mod(key*(msg-32),95)+32);
    [s1,s2]=size(ncode);
    output=reshape(ncode,1,s1*s2);
    
end

