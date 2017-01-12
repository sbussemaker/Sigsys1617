function [ root, prime ] = rootsofunity( N )

    prime = N + 1;
    while (isPrime(prime) == 0) 
        prime = prime + N;
    end
    root = findRoot(prime);

%% Computes whether n is prime
    function [ ispr ] = isPrime( n )
      root = ceil(sqrt(n));
      for i=2:root
        if (mod(n,i) == 0) 
            ispr = 0;
            return;
        end
      end
      ispr = 1;
    end

%% Finds a root for p
    function [ root ] = findRoot( p )
      n = 2;
      root = n;
      exponent = 1;
      while (exponent ~= p-1)
        if (n == 1)
          root = root + 1;
          n = root;
          exponent = 1;
        end
        prod = n;
        prod = prod*root;
        n = mod(prod,p);
        exponent = exponent + 1;
      end
    end
end

