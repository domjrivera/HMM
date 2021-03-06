function [ alfa ] = alfaf_norm( obs, pi, a, b )
% alfa(t, i) = the probability that at time t we are in state i
% given the sequence of observations until t
T = size(obs, 2);
N = length(pi);
alfa = zeros(T, N);
alfa(1, :) = pi .* b(:, 1)';
alfa(1, :) = alfa(1, :) / sum(alfa(1, :));
for t=2:T
    for s=1:N
        alfa(t, s) = sum(alfa(t-1, :) .* a(:, s)') * b(s, t);
    end
    alfa(t, :) = alfa(t, :)/sum(alfa(t,:));
end

end
