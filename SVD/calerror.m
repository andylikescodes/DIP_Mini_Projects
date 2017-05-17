function error = calerror(X,Xc)
error = sqrt(sum(sum((X-Xc).^2)))/sqrt(sum(sum(X.^2)));