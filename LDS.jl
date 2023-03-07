function linear_rule(x,dx,A,t)

    dx = A * x

    return nothing

end

function create_linearDS(rule, params, start_point)

    DS = CoupledODEs(rule, start_point, params)

    return DS

end


