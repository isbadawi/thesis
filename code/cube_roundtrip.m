function [y] = cube(x)
  % cube takes a number x and returns its cube.
  % This is a nested function that computes the square of a value.
  y = (x * square(x));
  function [v] = square(u)
    v = (u * u);
  end
end
