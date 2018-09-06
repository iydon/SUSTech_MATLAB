function x = lineprog(f,A,b,Aeq,beq)
    % max f
    % A*x<b, Aeq*x=beq

    [rowA,colA] = size(A);
    r = rank(A);
    
    if nargin==3
        x = lineprog([f,zeros(1,rowA)],[],[],[A,eye(rowA)],b);
        return;
    elseif nargin==5
        if ~isempty(A)
            [rowAeq,colAeq] = size(Aeq);    % colAeq==colA;
            x = lineprog([f,zeros(1,rowA)],[],[],...
                [Aeq,zeros(rowAeq,rowA);A,eye(rowA)],[beq;b]);
            return;
        end
        tmp = Aeq' \ f';
        x = Aeq'*tmp;
    end   
end