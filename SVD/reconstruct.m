function image = reconstruct(U,S,V,R)
image = (S(1:R,1:R)*U(:,1:R)')'*V(:,1:R)';