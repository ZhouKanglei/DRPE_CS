function [ C ] = diffusion( P, D )
    [m, n] = size( P );
    P = uint8( P );
    D = uint8( D );
    
    for i = 2 : m
        P( i, 1 ) = bitxor( P( i, 1 ), P( i - 1, 1 ) );
    end
    
    for i = 2 : n
        P( 1, i ) = bitxor( P( 1, i ), P( 1, i - 1 ) );
    end
    
    for i = 2 : m
        for j = 2 : n
            P(i, j) = bitxor( bitxor( P( i - 1, j ), P( i, j  - 1 ) ), P( i, j ) );
        end
    end
    
    C = bitxor( P, D );

end