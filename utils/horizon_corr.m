function [ r ] = horizon_corr( I0 )

    format long;
    I0=double(I0);
    [row,col]=size(I0);
     x=zeros(row*(col-1),1);
     y=zeros(row*(col-1),1);
    for ii=1:row
        for jj=1:col-1
            x((ii-1)*(col-1)+jj)=I0(ii,jj);
            y((ii-1)*(col-1)+jj)=I0(ii,jj+1);
        end
    end
    % figure
    % plot(x,y,'+')
    % axis([0,255,0,255])
    A=corrcoef(x,y);
    r1=A(1,2);

    for ii=1:row-1

        for jj=1:col
            x((ii-1)*col+jj)=I0(ii,jj);
            y((ii-1)*col+jj)=I0(ii+1,jj);
        end
    end
    % figure
    % plot(x,y,'+')
    % axis([0,255,0,255])
    A=corrcoef(x,y);
    r2=A(1,2);
    clear x y
    x=zeros((row-1)*(col-1),1);
    y=zeros((row-1)*(col-1),1);
    for ii=1:row-1

        for jj=1:col-1
            x((ii-1)*(col-1)+jj) = I0(ii,jj);
            y((ii-1)*(col-1)+jj) = I0(ii+1,jj+1);
        end
    end
    % figure
    % plot(x,y,'+')
    % axis([0,255,0,255])
    A = corrcoef(x, y);
    r3 = A(1, 2);
    r = [r1, r2, r3];

end