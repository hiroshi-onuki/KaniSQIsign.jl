include("level1/prime.jl")
include("level1/klpt_constants.jl")
include("level1/precomputed_order_data.jl")

include("../quaternion/order.jl")
include("../quaternion/cornacchia.jl")
include("../quaternion/ideal.jl")
include("../quaternion/klpt.jl")

include("global_data.jl")
include("order_data.jl")

include("../elliptic_curves/dlog.jl")

include("../ideal_to_isogeny/ideal_to_isogeny.jl")

include("../sqisign/sqisign.jl")

const StrategyDim2 = compute_strategy(ExponentForIsogenyDim2 - 2, 2, 1)
const StrategyDim2Precompute = compute_strategy(ExponentForIsogenyDim2 - 4, 2, 1)
const StrategiesDim1 = Dict(
    ExponentForIsogenyDim1 - 2 => compute_strategy(div(ExponentForIsogenyDim1 - 2,2) - 1, 1, 1),
    ExponentForIsogenyDim1 => compute_strategy(div(ExponentForIsogenyDim1,2) - 1, 1, 1),
    2*ExponentForIsogenyDim1 => compute_strategy(div(2*ExponentForIsogenyDim1,2) - 1, 1, 1),
    ExponentForSignLastIsogeny => compute_strategy(div(ExponentForSignLastIsogeny, 2) - 1, 1, 1),
    ExponentForVerifyLastIsogeny => compute_strategy(div(ExponentForVerifyLastIsogeny, 2) - 1, 1, 1),
    SQISIGN_challenge_length => compute_strategy(div(SQISIGN_challenge_length, 2) - 1, 1, 1),
    ExponentForCommitmentLastIsogeny => compute_strategy(div(ExponentForCommitmentLastIsogeny, 2) - 1, 1, 1)
)

function make_E0_data()
    _, T = polynomial_ring(GF(p), "T")
    Fp2, Fp2_i = finite_field(T^2 + 1, "i")

    A0 = Fp2(0)

    # constatns from precompute/level1torsion.sage
    P2e = Point(1167679482150863195523978450170412562715924357238602796020786585710888718237*Fp2_i + 195807475550494427451649608271104515847911618849141017426569917821137983194, 4862877640333236516853362674124171341900551523228923073125804599913941126908*Fp2_i + 12087566741318956310016631707446387960429051679627903688618432549189813607113)
    Q2e = Point(16698678036888159145222325877341979469331592807967656108504895321760082456674*Fp2_i + 17670550043488527913294654719241287516199605546357117887099111989649833191717, 12087566741318956310016631707446387960429051679627903688618432549189813607113*Fp2_i + 13003479878705785823892941653388220690146965641977335831399877307557030048003)
    M_i_2e = [0 226156424291633194186662080095093570025917938800079226639565593765455331327; 1 0]
    M_ij_2e = [88475647014491780774030463409406647354967665999901254734577395960466747576 76278804618693665767563678434573940724652365522363015681732478960904148031; 76278804618693665767563678434573940724652365522363015681732478960904148032 137680777277141413412631616685686922670950272800177971904988197804988583752]
    M_1k_2e = [149877619672939528419098401660519629301265573277716210957833114804551183297 88475647014491780774030463409406647354967665999901254734577395960466747576; 88475647014491780774030463409406647354967665999901254734577395960466747576 76278804618693665767563678434573940724652365522363015681732478960904148032]
    M44inv = [49309845769699026045433051751637292096 16707168060197807711205357869159042888 16707168060197807711205357869159042888 290972521151239437417941555680130919361; 16707168060197807711205357869159042888 290972521151239437417941555680130919361 290972521151239437417941555680130919360 323575198860740655752169249562609168568; 306868030800542848040963891693450125680 98619691539398052090866103503274584191 98619691539398052090866103503274584191 33414336120395615422410715738318085776; 241662675381540411372508503928493627265 306868030800542848040963891693450125680 306868030800542848040963891693450125680 98619691539398052090866103503274584191]
    xP79 = Proj1(17808121587231935828586247647640248406498136232625158867643836578213625687058*Fp2_i + 16286020220186406872658333272204684378108399162171061810188411060180396717158)
    xQ79 = Proj1(9666366218806412695809897752201928575473258451879582949833353562903542320936*Fp2_i + 7006434669972382365232974777910912269605319342842388545794231682129891672556)
    xPQ79 = Proj1(6177489307606325993454671866278064966740225045468462451886239598612102775407*Fp2_i + 13671566132822630425158412348447527223411962625561735380596203407515593567278)
    M_i_79 = [23 17; 6 56]
    M_ij_79 = [5 45; 17 74]
    M_1k_79 = [10 2; 34 70]
    xP3 = Proj1(7592000161467079587213592319318508362654288632426985883306372487657684985337*Fp2_i + 5871283952432172208638013510020471438703819898938916211796738350958029596793)
    xQ3 = Proj1(10274357357571942753532712008193883669393228532779273021219309419813286189574*Fp2_i + 11995073566606850132108290817491920593343697266267342692728943556512941578118)
    xPQ3 = Proj1(7592000161467079587213592319318508362654288632426985883306372487657684985337*Fp2_i + 11995073566606850132108290817491920593343697266267342692728943556512941578118)
    M_i_3 = [0 1; 2 0]
    M_ij_3 = [2 1; 0 1]
    M_1k_3 = [1 1; 1 0]
    xP5 = Proj1(16847507437177049189361159365262205020927859760801772793381914323733962762775*Fp2_i + 13605772272000940996312273595013481905001275501775595968625244296334384227937)
    xQ5 = Proj1(14903774597198409284239785752835947767246841440555037991163254909693742042546*Fp2_i + 1512147991088225013929455726144523372607638967117200841246904558202606601877)
    xPQ5 = Proj1(8423063828240058255372866588572582315449878488821245985682748700472502099684*Fp2_i + 3240355384479175514433459582131682725898481475866896002740253104610619971431)
    M_i_5 = [1 4; 2 4]
    M_ij_5 = [4 2; 3 1]
    M_1k_5 = [2 1; 0 4]
    
    a24_0 = A_to_a24(A0)
    xP2e = Proj1(P2e.X, P2e.Z)
    xQ2e = Proj1(Q2e.X, Q2e.Z)
    PQ2e = add(P2e, -Q2e, Proj1(A0))
    xPQ2e = Proj1(PQ2e.X, PQ2e.Z)
    xP2e_short = xDBLe(xP2e, a24_0, ExponentForIsogenyDim1)
    xQ2e_short = xDBLe(xQ2e, a24_0, ExponentForIsogenyDim1)
    xPQ2e_short = xDBLe(xPQ2e, a24_0, ExponentForIsogenyDim1)

    # precomputed values for discrete logarithm
    tp_table = make_pairing_table(A0, P2e, ExponentFull)
    tp_P2e_Q2e = Tate_pairing_P0(Q2e, tp_table, Cofactor)
    window_size = 3
    fq_dlog_table1, fq_dlog_table2 = make_dlog_table(tp_P2e_Q2e, ExponentFull, window_size)
    strategy_dlog = compute_strategy(div(ExponentFull, window_size) - 1, window_size, 1)
    dlog_data_full = DlogData(ExponentFull, window_size, fq_dlog_table1, fq_dlog_table2, strategy_dlog)
    base = tp_P2e_Q2e^(BigInt(2)^(ExponentFull - SQISIGN_challenge_length))
    fq_dlog_table1_c, fq_dlog_table2_c = make_dlog_table(base, SQISIGN_challenge_length, window_size)
    strategy_dlog_c = compute_strategy(div(SQISIGN_challenge_length, window_size) - 1, window_size, 1)
    dlog_data_chall = DlogData(SQISIGN_challenge_length, window_size, fq_dlog_table1_c, fq_dlog_table2_c, strategy_dlog_c)

    DegreesOddTorsionBases = [3, 5, 79]
    ExponentsOddTorsionBases = [1, 1, 1]
    OddTorsionBases = [[xP3, xQ3, xPQ3], [xP5, xQ5, xPQ5], [xP79, xQ79, xPQ79]]

    Matrices_2e = [M_i_2e, M_ij_2e, M_1k_2e]
    Matrices_odd = [[M_i_3, M_ij_3, M_1k_3], [M_i_5, M_ij_5, M_1k_5], [M_i_79, M_ij_79, M_1k_79]]

    # make constants for isomorphism to the curve E_A0
    _, T = polynomial_ring(Fp2, "T")
    As = roots((256 * (T^2 - 3)^3 - 1728 * (T^2 - 4))/T^2)
    A0d = As[1]
    beta = -A0d/3
    gamma = square_root(1 / (1 - 3*beta^2))
    A0dd = As[2]
    beta_d = -A0dd/3
    gamma_d = square_root(1 / (1 - 3*beta_d^2))
    function isomorphism_to_A0(A::Proj1{FqFieldElem}, Ps::Vector{Proj1{FqFieldElem}})
        if A == Proj1(A0)
            return Ps
        elseif A == Proj1(A0d)
            return [Proj1(gamma*(P.X - beta*P.Z), P.Z) for P in Ps]
        elseif A == Proj1(A0dd)
            return [Proj1(gamma_d*(P.X - beta_d*P.Z), P.Z) for P in Ps]
        else
            throw(ArgumentError("A is not A0d or A0dd"))
        end
    end

    return Fp2, E0Data(A0, A0d, A0dd, a24_0, jInvariant_A(A0), P2e, Q2e, xP2e, xQ2e, xPQ2e, xP2e_short, xQ2e_short, xPQ2e_short, DegreesOddTorsionBases, ExponentsOddTorsionBases, OddTorsionBases, Matrices_2e, M44inv, Matrices_odd, isomorphism_to_A0, dlog_data_full, dlog_data_chall, tp_table)
end

# Fp2 and values in Fp2
function make_precomputed_values()
    Fp2, E0 = make_E0_data()

    precomputed_orders_data = [order_data_2, order_data_5, order_data_7]
    orders_data = [compute_order(Fp2, E0, order_data) for order_data in precomputed_orders_data]
    @assert orders_data[1].j_inv == 8000
    @assert orders_data[2].j_inv^2 - 1264000*orders_data[2].j_inv - 681472000 == 0
    @assert orders_data[3].j_inv == -3375 || orders_data[3].j_inv == 16581375

    return GlobalData(E0, orders_data)
end