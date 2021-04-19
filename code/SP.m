function [x] = SP(y, Phi, K)
    [M,N] = size(Phi);
    K = ceil(M * 0.38);
    y_r = y;
    support=[];
    support_old=ones(K,1);
    res_old=sum(y_r.^2);
    frame=ones(N,1);
    tol=1;

    while true
        [~,add_index]=sort(abs(y_r'*Phi),'descend');
        add_index=add_index(1:K);
        support=union(support,add_index);
        x_mmse=Phi(:,support)\y;
        [~,add_index]=sort(abs(x_mmse),'descend');
        support=support(add_index(1:K)); 
        x_mmse=Phi(:,support)\y;
        y_r=y-Phi(:,support)*x_mmse;
        res=sum(y_r.^2);
        if res<eps
            break;
        end
        rate=res/res_old;
        if rate>=1+tol || sum(frame(support))==0
            support=support_old;
            x_mmse=x_mmse_old;
            res=res_old;
            break;
        end
        if rate>=1
            tol=tol/2;
        end
        support_old=support;
        x_mmse_old=x_mmse;
        res_old=res;
        frame=ones(N,1);
        frame(support_old)=zeros(K,1);
    end

    x=zeros(N,1);
    x(support)=x_mmse;
end