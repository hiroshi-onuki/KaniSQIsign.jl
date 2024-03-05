using KaniSQIsign

function keygen_test(param::Module, num::Int)
    _, _, cdata = param.make_field_curve_torsions()
    println("Keygen test for $(param)")
    for _ in 1:num
        @time pk, sk, found = param.key_gen(cdata)
        println("Found: $(found)")
    end
end

function commitment_test(param::Module, num::Int)
    _, _, cdata = param.make_field_curve_torsions()
    println("Commitment test for $(param)")
    for _ in 1:num
        @time com, sk, found = param.commitment(cdata)
        println("Found: $(found)")
    end
end

function gen_ideals(param::Module, e::Int)
    S = param.LeftIdeal[]
    for _ in 1:(1000 * 2^e)
        I = param.sample_random_ideal_2e(e)
        @assert gcd(I) == 1
        @assert param.norm(I) == BigInt(2)^e
        if !(I in S)
            push!(S, I)
        end
        println(length(S))
    end
    println("Generated $(length(S)) ideals of norm 2^$e")
end

keygen_test(KaniSQIsign.Level1, 10)
commitment_test(KaniSQIsign.Level1, 10)
#gen_ideals(KaniSQIsign.Level1, 5)