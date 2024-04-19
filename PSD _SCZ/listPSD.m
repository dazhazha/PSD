function z = listPSD (X)

X1=reshape(X,[size(X,1)*size(X,2) 1]);
X1=normalize(X1);
X = reshape(X1,[size(X,1) size(X,2)]);
for i=1:size(X,2)
    Px      = fft(X(:,i));
    PxPx    = Px.*conj(Px)/length(Px);
    tmp     = abs(PxPx);
    Valmean  = mean(tmp(1:length(PxPx)/2));
    z{i}      = {PxPx, Valmean};
end
end