using Nemo
import KaniSQIsign: Weil_pairing_2power, random_point, random_point_order_2power,
    Proj1, Point, odd_isogeny, is_infinity, ladder, Montgomery_coeff,
    xDBLe, CouplePoint, gluing_isogeny, product_isogeny_no_strategy, product_isogeny

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

p = ZZ(21733158535462224051193457152486610816840494993914547553836971106544815964159)
R, T = polynomial_ring(GF(p), "T")
Fp2, i = finite_field(T^2 + 1, "i")
n = 126

A1 = Fp2(0)
A2 = Fp2(14315894054688352886472043435540548553469578380160907159667202474869512425868*i+15895614532914569881628667012721287520289866651131861854076328660820921435999)
a24_1 = Proj1(A1 + 2, Fp2(4))
a24_2 = Proj1(A2 + 2, Fp2(4))

xP1 = Proj1(216434799814958236859909207527888081108259142705534202957608094521858560039*i + 4607931223502399333776782442858082971008774506483322627968163866910106400867)
xQ1 = Proj1(2551264489632946648071352917988880536127114593842903756427780543847459775510*i + 5004346411686464008980982934336675110707999550510535981970495692413484160571)
xP2 = Proj1(10584066311641695979614923370764380118808071926017899263733519650374110728762*i + 16681757135873951815200445878703617598705829778436191101812038073528907008048)
xQ2 = Proj1(19604520574412173562959614331012344748483390760015854117037604609400791842069*i + 13623549632151586710558650610257732628997501117782234165354628801209070168456)
xP1Q1 = Proj1(2035282106195628209080382543982800451645522778442835277094127476963040730428*i + 9372672122369791004975915732205872383273114885580916893699223467613120767426)
xP2Q2 = Proj1(3236360997168428334118206598660167006031470140604955622618076275731401344927*i + 9800814452923687317292117247551853770481174716264358934877205205320269229975)

P1P2 = CouplePoint(xP1, xP2)
Q1Q2 = CouplePoint(xQ1, xQ2)
P1Q1P2Q2 = CouplePoint(xP1Q1, xP2Q2)

codomain, images = product_isogeny_no_strategy(a24_1, a24_2, P1P2, Q1Q2, P1Q1P2Q2, CouplePoint{FqFieldElem}[], n)
println(codomain)
@time product_isogeny_no_strategy(a24_1, a24_2, P1P2, Q1Q2, P1Q1P2Q2, CouplePoint{FqFieldElem}[], n)

strategy= Int[125, 36, 34, 21, 13, 8, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, 2, 1, 1, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 8, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, 2, 1, 1, 1, 1, 1, 13, 8, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, 2, 1, 1, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 13, 8, 5, 3, 2, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, 2, 1, 1, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1]
codomain, images = product_isogeny(a24_1, a24_2, P1P2, Q1Q2, P1Q1P2Q2, CouplePoint{FqFieldElem}[], n, strategy)
println(codomain)
@time product_isogeny(a24_1, a24_2, P1P2, Q1Q2, P1Q1P2Q2, CouplePoint{FqFieldElem}[], n, strategy)