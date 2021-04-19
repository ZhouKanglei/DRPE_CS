function [NPCR, UACI] = NPCR_UACI(I1, I2)

I1 = double(I1);
I2 = double(I2);
[row, col] = size(I1);

D = 1-(I1 == I2);
NPCR = sum(D(:))/row/col;
UACI = sum(sum(abs(I1-I2)))/(255)/row/col;
sprintf('NPCR = %.8f\nUACI = %.8f',NPCR, UACI)


