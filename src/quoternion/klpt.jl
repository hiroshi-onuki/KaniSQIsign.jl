# return a quoternion in O0 of norm M
function FullRepresentInteger(M::Integer, p::Integer)
    counter = 0
    found = false
    x, y, z, w = 0, 0, 0, 0
    while !found && counter < KLPT_repres_num_gamma_trial
        m = int_sqrt(div(4*M, p))
        z = rand(-m:m)
        md = int_sqrt(div(4*M - z^2, p))
        w = rand(-md:md)
        Md = 4*M - p*(z^2 + w^2)
        x, y, found = sum_of_two_squares(Md)
        if found
            @assert x^2 + y^2 == Md
        end
        if !found || (x - w) % 2 != 0 || (y - z) % 2 != 0
            found = false
            counter += 1
        end
    end
    if found
        return QOrderElem(div(x - w, 2), div(y - z, 2), z, w, p), found
    else
        return QOrderElem(0, p), found
    end
end