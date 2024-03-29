# basically the same as SQIsign reference implementation
const KLPT_equiv_bound_coeff = 7
const KLPT_equiv_num_iter = 50625
const KLPT_signing_klpt_length = 2030
const KLPT_signing_num_gamma_trial = 64
const KLPT_gamma_exponent_center_shift = 15
const KLPT_repres_num_gamma_trial = 32768
const KLPT_signing_number_strong_approx = 6784
const KLPT_secret_key_prime_size = 64
const KLPT_keygen_length = ExponentForIsogenyDim1 * 7   #1305 in the reference implementation
const KLPT_keygen_num_gamma_trial = 64
const KLPT_keygen_number_strong_approx = 5218
const SQISIGN_response_attempts = 64
const SQISIGN_keygen_attempts = 64
const SQISIGN_signing_total_length = 2030
const SQISIGN_signing_length = 5

# constants only used in our implementation
const IdealToIsogeny_2_e_good_attempts = 1000
const SQISIGN_commitment_length = 512
const SQISIGN_challenge_length = 256
const SQISIGN_sign_isogeny_bytes = 54
const SQISIGN_challenge_bytes = 32
const SQISIGN_sign_bytes = (SQISIGN_sign_isogeny_bytes + 1) * SQISIGN_signing_length + 2 * SQISIGN_challenge_bytes + 1
const ExponentForSignLastIsogeny = SQISIGN_signing_total_length % ExponentForIsogenyDim1
const ExponentForVerifyLastIsogeny = SQISIGN_signing_total_length % (2*ExponentForIsogenyDim1)
const ExponentForCommitmentLastIsogeny = SQISIGN_commitment_length % ExponentForIsogenyDim1

const SmallPrimes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
