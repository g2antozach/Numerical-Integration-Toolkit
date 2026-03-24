function doubleint(f,a,b,c,d,n,m)
    % Double integral using custom trapezoid and simpson functions
    hx = (b-a)/n;
    hy = (d-c)/m;

    % --- trapezoid ---
    sumy = 0;
    for i = 0:m
        y = c + i*hy;
        g = @(x) f(x,y);

        if i==0 || i==m
            w = 1;
        else 
            w = 2;
        end
        sumy = sumy + w*trapezoid(g,a,b,n);
    end

    res_trapezoid = (hy/2)*sumy;
    disp('trapezoid=')
    disp(res_trapezoid)
    
    % --- simpson ---
    sumy = 0;
    for i = 0:m
        y = c + i*hy;
        g = @(x) f(x,y);

        if i==0 || i==m
            w = 1;
        elseif mod(i,2)==1
            w = 4;
        else 
            w = 2;
        end
        sumy = sumy + w*simpson(g,a,b,n);
    end

    res_simpson = (hy/3)*sumy;

    disp('simpson=')
    disp(res_simpson)
end

%Subfunctions

function I = trapezoid(f,a,b,n)
    % Composite Trapezoidal Rule
    h = (b - a)/n;   
    sum = 0;

    for i = 1:n-1
        x = a + i*h;
        sum = sum + f(x);
    end

    % Standard formula
    I = (h/2) * (f(a) + f(b) + 2 * sum );
end

function J = simpson(f,a,b,n)

    if mod(n,2) ~= 0
        disp('n must be even number');
        return;
    end

    % Composite Simpson's 1/3 Rule 
    h = (b - a) / n;
    sum = 0;

    for i = 1:(n-1)
        xi = a + i*h;
    
        if mod(i,2) == 1      % for odd numbers
            sum = sum + 4*f(xi);
        else                  % for even numbers
            sum = sum + 2*f(xi);
        end
    end
    
    % Standard formula
    J = (h/3)*(f(a) + f(b) + sum);
end     
