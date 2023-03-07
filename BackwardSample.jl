function BackwardSample(n,d,a,A,m,M,G)

    #n - scalar
    #d - scalar
    #m - p x 1
    #M - p x p
    #a - p x 1
    #A - p x p

    T = size(n)[1] - 1

    v = zeros(T+1)
    θ = zeros(p,T+1)

    v[T+1] = 1 / rand(Gamma(n[T+1], d[T+1]))
    θ[T+1] = rand(MvNormal(m[:,T+1],M[:,:,T+1]))

    for i in reverse(1:T)

        v_star = rand(Gamma((1-omega)*n[t],d[t]))

        v[t] = 1 / (omega * v[t+1] + v_star)

        

    end

end