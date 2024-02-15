using Nemo
import KaniSQIsign: QOrderElem, norm, LeftIdeal, FullRepresentInteger, small_element

p = BigInt(2)^247*79 - 1

N = 79
e = Int(ceil(log(2, p/N))) + 10
a, found = FullRepresentInteger(N*BigInt(2)^e, p)
if found
    println(a)
    println(div(norm(a), BigInt(2)^e))
end
while gcd(a) != 1
    global a = div(a, gcd(a))
end
n = 120
I = LeftIdeal(a, BigInt(2)^n)
println(factor(ZZ(norm(I))))
@assert norm(I) == BigInt(2)^n
x = small_element(I)
println(x)
@assert norm(x) % norm(I) == 0
println(log(2, div(norm(x), norm(I))))

x = small_element(I)
println(x)
@assert norm(x) % norm(I) == 0
println(log(2, div(norm(x), norm(I))))
