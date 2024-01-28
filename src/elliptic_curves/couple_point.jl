struct CouplePoint{T <: RingElem}
    P1::Proj1{T}
    P2::Proj1{T}
end

function double(P::CouplePoint{T}, a24_1::Proj1{T}, a24_2::Proj1{T}) where T <: RingElem
    P1, P2 = P.P1, P.P2
    P1 = xDBL(P1, a24_1)
    P2 = xDBL(P2, a24_2)
    return CouplePoint(P1, P2)
end