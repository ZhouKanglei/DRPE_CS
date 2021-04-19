function [ P ] = diffusion( C, D )
    [m, n] = size( D );
    C = uint8( C );
    D = uint8( D );
    P = bitxor( C, D );
   
    for i = m : -1 : 2
        for j = n : -1 : 2
            P(i, j) = bitxor( bitxor( P( i - 1, j ), P( i, j  - 1 ) ), P( i, j ) );
        end
    end
    
    for i = m : -1 : 2
        P( i, 1 ) = bitxor( P( i, 1 ), P( i - 1, 1 ) );
    end
    
    for i = m : -1 : 2
        P( 1, i ) = bitxor( P( 1, i ), P( 1, i - 1 ) );
    end
    
end