using Nemo
using KaniSQIsign
using KaniSQIsign.Level1
import KaniSQIsign.Level1: ideal_to_isogeny_from_O0

p = KaniSQIsign.Level1.p
e1 = KaniSQIsign.Level1.ExponentForIsogeny
e2 = KaniSQIsign.Level1.ExponentForTorsion
Fp2, i, cdata = KaniSQIsign.Level1.make_field_curve_torsions()
a24_0 = tdata.a24_0
xP0 = tdata.xP2e
xQ0 = tdata.xQ2e
xPQ0 = tdata.xPQ2e

N = 3 * 5 * 79
e = Int(ceil(log(2, p))) + e1

a = QOrderElem(1)
a, found = FullRepresentInteger(N*BigInt(2)^e)
a = div(a, gcd(a))

I = LeftIdeal(a, BigInt(2)^e1 * 3 * 5 * 79)
while gcd(I) != 1
    global I = div(I, gcd(I))
end
println(factor(ZZ(norm(I))))

a24 = ideal_to_isogeny_from_O0(I, e1, cdata)