
const chi_eval = Dict{Tuple{Int, Int}, Int}(
    (0, 0) => 1,
    (0, 1) => 1,
    (0, 2) => 1,
    (0, 3) => 1,
    (1, 0) => 1,
    (1, 1) => -1,
    (1, 2) => 1,
    (1, 3) => -1,
    (2, 0) => 1,
    (2, 1) => 1,
    (2, 2) => -1,
    (2, 3) => -1,
    (3, 0) => 1,
    (3, 1) => -1,
    (3, 2) => -1,
    (3, 3) => 1
)

const even_indices = [
    [0, 0],
    [0, 1],
    [0, 2],
    [0, 3],
    [1, 0],
    [1, 2],
    [2, 0],
    [2, 1],
    [3, 0],
    [3, 3]
]

function level_22_constants_sqr(tnull::ThetaNullLv2, chi::Integer, i::Integer)
    Ucontant = 0
    for t in 0:3
        Ucontant += chi_eval[(chi, t)] * tnull[t + 1] * tnull[(i ⊻ t) + 1]
    end
    return Ucontant
end