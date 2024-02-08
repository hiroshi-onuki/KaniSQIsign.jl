using Nemo
import KaniSQIsign: random_point, random_point_order_2power,
    Proj1, odd_isogeny, is_infinity, ladder, x_add_sub,
    Point, Weil_pairing_2power, Montgomery_coeff, add, mult,
    CouplePoint, product_isogeny_no_strategy, jInvariant_A,
    infinity_point

function basis_2power_torsion(A::T, e::Integer) where T <: RingElem
    p = characteristic(parent(A))
    @assert (p + 1) % ZZ(2)^e == 0
    xP = random_point_order_2power(A, p + 1, e)
    P = Point(A, xP)
    while true
        xQ = random_point_order_2power(A, p + 1, e)
        Q = Point(A, xQ)
        weil = Weil_pairing_2power(A, P, Q, e)
        if weil^(ZZ(2)^(e-1)) != 1
            @assert weil^(ZZ(2)^e) == 1
            return P, Q
        end
    end
end

p = ZZ(2^8 * 3 * 5 * 7 - 1)
R, T = polynomial_ring(GF(p), "T")
Fp2, i = finite_field(T^2 + 1, "i")
n = 6

A1 = Fp2(0)
a24_1 = Proj1(A1 + 2, Fp2(4))
P1, Q1 = basis_2power_torsion(A1, n+2)
P1 = Proj1(P1.X, P1.Z)
Q1 = Proj1(Q1.X, Q1.Z)
PQ1 = x_add_sub(P1, Q1, a24_1)

# the codomain and the image points of a 15-isogeny
K = random_point(A1)
K = ladder(div(p + 1, 3 * 5), K, a24_1)
while is_infinity(ladder(ZZ(3), K, a24_1)) || is_infinity(ladder(ZZ(5), K, a24_1))
    global K = random_point(A1)
    global K = ladder(div(p + 1, 3 * 5), K, a24_1)
end
T = ladder(ZZ(5), K, a24_1)
a24_2, Ps = odd_isogeny(a24_1, T, 3, [P1, Q1, PQ1, K])
T = pop!(Ps)
a24_2, Ps = odd_isogeny(a24_2, T, 5, Ps)
A2 = Montgomery_coeff(a24_2)
P2, Q2, PQ2 = Ps

# a basis of E2[15]
S2 = random_point(A2)
S2 = ladder(div(p + 1, 3 * 5), S2, a24_2)
while is_infinity(ladder(ZZ(3), S2, a24_2)) || is_infinity(ladder(ZZ(5), S2, a24_2))
    global S2 = random_point(A2)
    global S2 = ladder(div(p + 1, 3 * 5), S2, a24_2)
end
T2 = random_point(A2)
T2 = ladder(div(p + 1, 3 * 5), T2, a24_2)
while is_infinity(ladder(ZZ(3), T2, a24_2)) || is_infinity(ladder(ZZ(5), T2, a24_2)) || T2 in [ladder(ZZ(i), S2, a24_2) for i in 1:15]
    global T2 = random_point(A2)
    global T2 = ladder(div(p + 1, 3 * 5), T2, a24_2)
end

# multiply P1 and Q1 by 7
P1 = ladder(ZZ(7), P1, a24_1)
Q1 = ladder(ZZ(7), Q1, a24_1)
PQ1 = ladder(ZZ(7), PQ1, a24_1)

# recover y-coordinates in A1
P1full = Point(A1, P1)
Q1full = Point(A1, Q1)
PQ1full = Point(A1, PQ1)
R1full = add(P1full, Q1full, Proj1(A1))
if R1full.X * PQ1full.Z != PQ1full.X * R1full.Z
    global Q1full = -Q1full
end
R1full = add(P1full, Q1full, Proj1(A1))
@assert R1full.X * PQ1full.Z == PQ1full.X * R1full.Z
P1full = mult(ZZ(4), P1full, Proj1(A1))
Q1full = mult(ZZ(4), Q1full, Proj1(A1))

# recover y-coordinates in A2
P2full = Point(A2, P2)
Q2full = Point(A2, Q2)
PQ2full = Point(A2, PQ2)
R2 = add(P2full, Q2full, Proj1(A2))
if R2.X * PQ2full.Z != PQ2full.X * R2.Z
    global Q2full = -Q2full
end
R2 = add(P2full, Q2full, Proj1(A2))
@assert R2.X * PQ2full.Z == PQ2full.X * R2.Z
P2full = mult(ZZ(4), P2full, Proj1(A2))
Q2full = mult(ZZ(4), Q2full, Proj1(A2))

# check Weil pairing
@assert Weil_pairing_2power(A1, P1full, Q1full, n) * Weil_pairing_2power(A2, P2full, Q2full, n) == 1

P1P2 = CouplePoint(P1, P2)
Q1Q2 = CouplePoint(Q1, Q2)
PQ1PQ2 = CouplePoint(PQ1, PQ2)
O1S2 = CouplePoint(infinity_point(Fp2), S2)
O1T2 = CouplePoint(infinity_point(Fp2), T2)

Es, images = product_isogeny_no_strategy(a24_1, a24_2, P1P2, Q1Q2, PQ1PQ2, [O1S2, O1T2], n)
println(jInvariant_A(Es[1]), " ", jInvariant_A(Es[2]))
println(images)
