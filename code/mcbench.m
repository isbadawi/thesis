function f = fro(M)
  % calculates the frobenius norm
  f = sqrt(sum(sum(M.^2)));
end
