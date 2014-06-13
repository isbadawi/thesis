% cube takes a number x and returns its cube.
function y = cube(x)
    % This is a nested function that computes the square of a value.
    function v = square(u)
        v = u * u;
    end
    y = x * square(x);
end
