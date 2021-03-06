N = 3;
M = 2;
D = 2;
T = 10;
mu_them = zeros(D,N,M);
sgm_them = zeros(D,D,N,M);
for s=1:N
    for k=1:M
        [aux, j_miu] = ij(s, 1, k, 1, M, D);
        [i_s1, j_s1] = ij(s, k, 1, 1, D, D);
        [i_s2, j_s2] = ij(s, k, D, D, D, D);
        mu_them(:,s,k) = miu2(:,j_miu);
        sgm_them(:,:,s,k) = sigmas2(i_s1:i_s2,j_s1:j_s2);
    end
end
c_them = c2;
%  'max_iter' - max number of EM iterations [10]
%   'thresh' - convergence threshold [1e-4]
%   'verbose' - if 1, print out loglik at every iteration [1]
%   'cov_type' - 'full', 'diag' or 'spherical' ['full']
% 'adj_prior' - if 0, do not change prior [1]
%   'adj_trans' - if 0, do not change transmat [1]
%   'adj_mix' - if 0, do not change mixmat [1]
%   'adj_mu' - if 0, do not change mu [1]
%   'adj_Sigma' - if 0, do not change Sigma [1]
[LL, prior1, transmat1, mu1, Sigma1, mixmat1] =...
mhmm_em(obs, pi, a2, mu_them, sgm_them, c_them,...
'adj_prior', 0, 'adj_Sigma', 0,...
'adj_mu', 0, 'adjmix', 0, 'adjtrans', 0);