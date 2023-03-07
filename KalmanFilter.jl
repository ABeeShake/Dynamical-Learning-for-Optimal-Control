function KalmanFilter(y, n0,d0,m0,M0,G,F,V,W)

    #n - scalar
    #d - scalar
    #m - p x 1
    #M - p x p
    #a - p x 1
    #A - p x p

    N,T = size(y)
    p = size(G)[1]

    n = zeros(T+1)
    d = zeros(T+1)
    m = zeros(p,T+1)
    M = zeros(p,p,T+1)
    a = zeros(p,T+1)
    A = zeros(p,p,T+1)
    
    n[1] = n0
    d[1] = d0
    m[:,1] = m0
    M[:,:,1] = M0

    for t in 2:T

        a[:,t] = G[:,:,t] * m[:,t-1]
        A[:,:,t] = G[:,:,t] * M[:,:,t-1] * G[:,:,t]' + W

        n_star = omega * n[t-1]
        d_star = omega * d[t-1]

        q = F[:,:,t]*a[:,t]
        Q = F[:,:,t] * A[:,:,t] * F[:,:,t]' + V

        m[:,t] = a[:,t] + A[:,:,t]*F[:,:,t] * inv(Q)(y[:,t] - q)
        M[:,:,t] = A[:,:,t] - A[:,:,t] * F[:,:,t]' * inv(Q) * F[:,:,t] * A[:,:,t]'
        n[t] = n_star + N/2
        d[t] = d_star + 1/2 * (y[:,t] - q)' * inv(Q) * (y[:,t] - q) 

    end

    return n,d,a,A,m,M

end