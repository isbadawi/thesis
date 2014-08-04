function z = f()
  add = @(x, y) x + y;
  three = add(1, 2);
  z = f() + three;
end
