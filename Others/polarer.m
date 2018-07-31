% polarer([1,2,3,2,1])
% polarer([1,2,3,2,1], pi)
% polarer([1,2,3,2,1], pi, 0)
function fig = polarer(rhos, theta, flag)
    len = length(rhos);
    if nargin<3
        flag = 1;
    end
    if nargin<2
        theta = 2*pi/len;
    end
    thetas = 0:theta:theta*(len-1);
    if flag
        thetas = [thetas, thetas(1)];
        rhos = [rhos, rhos(1)]; 
    end
    fig = polarplot(-thetas, rhos);
end