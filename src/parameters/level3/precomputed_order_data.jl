function order_data_2()
    d = 2
    A = [549160461127850020884440098126358982922551041652077986225596251763336211989871429335079986049023465296480236223361, 0]
    I = KaniSQIsign.Level3.LeftIdeal(KaniSQIsign.Level3.QOrderElem(3679365833420629248479517668017738399370142719840405938583268083974245902581097423541480355380878534155162472716361, 0, 0, 0), KaniSQIsign.Level3.QOrderElem(0, 3679365833420629248479517668017738399370142719840405938583268083974245902581097423541480355380878534155162472716361, 0, 0), KaniSQIsign.Level3.QOrderElem(40189135265630597253702225108691812176634917351133698780087811812871820828694682468710202865966309653298197721976170564437668362881256637338872886916224694607449220382884398454481989535969877839199848805519645238101398269126683712806897392300728331909197556684518015409389927583342825276402, -686838496332368789956314714964114386965819821514275278240492720802729602852198906561889145994237030007658144517424587997271994573726972538532767426942960668794588052414304158467611504505758068660139918356463635278555544601390564746185848110495623761971689033118077126607007371249303586040, 1, 0), KaniSQIsign.Level3.QOrderElem(97876074133687573095512469746293270324712328225808354096289725342110419090087361475015800713359209255044716205478844699414543050654246451578313841921883077583198223761713824594992085948399781390371188082342687, 22669297275104487951659590213896972953636326694762044805339379658480244102537710291595128827959080126465182000313536759816771926627613891830934591427448944398588852618985732975827167824517500493795080155506791, -24824407481993302677229049473856372395450927812211198965041585561989589818002503045552575860964935596669590762242893973182898696955104743971409497083021, 1))
    M = BigInt[2118607766062827247847320081598059669354943567878050300859891171509629834884452014234175895746376923422369693967 2186726698045788860110385274145864539214172918445888940551673274820074139507871332725796459364421413115124891349; -238105724586039066207870010398515930513295946705694314040011839707859138033202656294635947290968429750433482778 -1205064809844902649310932230948524781529279938440947954567970686788457571313274906921532425214550946820937485989]
    N = 3679365833420629248479517668017738399370142719840405938583268083974245902581097423541480355380878534155162472716361
    M_sqrt_d = BigInt[1058969563504254170980244883680378981609606882859157176621594312910240978638155357210928177045608170788200120606 556881741574121984193678207756827340345973950758189605983733853145889133418676792054546786296688265802015310642; -2070134218927483883131794412164921789277903427204681591702043730948836336281256134953991733352547290377241247163 -1058969563504254170980244883680378981609606882859157176621594312910240978638155357210928177045608170788200120606]
    return d, A, I, M, N, M_sqrt_d
end

function order_data_6()
    d = 6
    A = [0, 103277031172713908772541883943748906950772867882917315799243676202486642397920551728547691982013947874601846465069]
    I = KaniSQIsign.Level3.LeftIdeal(KaniSQIsign.Level3.QOrderElem(1270653907630333682980623472128154549706936142086411491313880132094890315617729019039639654403716074966127367825153, 0, 0, 0), KaniSQIsign.Level3.QOrderElem(0, 1270653907630333682980623472128154549706936142086411491313880132094890315617729019039639654403716074966127367825153, 0, 0), KaniSQIsign.Level3.QOrderElem(-3744997780763066314024131304399664457170765787557691410599140805629931673585847461941248826934946294495150086093095956720704065044927844375842541497527360361297076332026937950209477143427113862642348590422030268736315951195770059021821174018105152573384556926608909178943272284793365, -18244745594482893766686703147461868132502941530424477910563660099271885300569403990072191341404732946005552217365881477815794937609202284441131118770457265323801235648721204628615347920792898851736011074375668298268772303112972399614198354101167156368708697116586544862118965853878015, 1, 0), KaniSQIsign.Level3.QOrderElem(549724346390634929099936082229325288710127844041818708433723954390958086823894919803263037753876216055741997637837136731312336221947210461386240877152951263055193697467521499678606869515545282996901234226124038198049564903462805756206690526978003164383657259403276, 443322595011106743130337515426686467004100397316883046697527441119592254266535107952933561319113124621936382329156778569023322964574022049165314491294618070459144960942461127895265410762108036915593575933856695183416298424038303192068433689611600151314912070160036, -50639168925857295651813590268664651905091433252723892600219712748139796954515556290274288942880299187832840351784010238695516279150223826370610277777056777442339742073782188898258450694544238819105501157479, 1))
    M = BigInt[-1624385971242164629679932253484538619407575578125331303201489244340708143847511687571526463252818771605434327743 -1956551504628167733132881419204291559703529635437093192346985876636607919523089216696958266582143573726636165324; 83084620615711502051298362296425602367693895545062014338240081062383286210014736842994184647502220638908961617 11849075614317396087697710440682133709035015853601886432611008253052319783871218267751507207759449767810153071]
    N = 1270653907630333682980623472128154549706936142086411491313880132094890315617729019039639654403716074966127367825153
    M_sqrt_d = BigInt[1543744637542575553910145950316062432754690744811000164647091059826007268299933451770968890944765181373195911940 188600202688910549338680960494553053977948648516350018808187564204433122277358781489734781693567037376651548105; -408681578025316470146985845719025489694466819668714252675517352318726981180295317037710000980500704077543283302 -1543744637542575553910145950316062432754690744811000164647091059826007268299933451770968890944765181373195911940]
    return d, A, I, M, N, M_sqrt_d
end

function order_data_7()
    d = 7
    A = [69441707087456700882236162285867117225444181606121201937073179446264356454588742456334651984240841011248253370366, 554817087202594079750091904094353512031555853219704320298572075456447707191709022193097331130677836005818694944856]
    I = KaniSQIsign.Level3.LeftIdeal(KaniSQIsign.Level3.QOrderElem(3013106357879528506563986211863829766019522402517279598089329962421723933450283952266714815486883840702922467004127, 0, 0, 0), KaniSQIsign.Level3.QOrderElem(0, 3013106357879528506563986211863829766019522402517279598089329962421723933450283952266714815486883840702922467004127, 0, 0), KaniSQIsign.Level3.QOrderElem(76798312343131879469422172649107217879792049058580412539570459838543231384184595304107114685774753146452617556645484406599377510848499352893326468182449303725731770964133237325185455408555448940209836818462925366466199137923394578211235685274942285966032293647569628600473876445371498, -3392762543993525566062673496193417831536952360755091438769026945166828293889040539062101191393519536329626000167626065240617763031686998720182156904750259209527351708301330635415705222687917042220343877259243100144275758952004113699432673284559469541667241854979554954457372150960020, 1, 0), KaniSQIsign.Level3.QOrderElem(24123031514625002604361765838254608006357327220086363741699035406927897472040433583808330541080918323818941564041967731496268969816651278868178903486920219707193968652848501236798388998367727308877146435208882, -85204053465392392224976747278795313972876780926883396689970759666403030358130766439824325589393145802438393276022451191820177545253014700944508813313862848793110480414514120995730854775556378029457594547732759, 8230773533609352910721825977132414080920995110053538006929025243748195956820756681598312038697091205208276549197143928477223325681247930292395214223457, 1))
    M = BigInt[-2030846155882666873848713658866001934501787260678498261142034092386428259662100834543080449271337513508245029329 -1582229623280089477893950699417703545413638883706234375276055202474011834158404977939649185416706025316195750097; -585248693369219362405449588498027803239736480805931761286583046390763401628518147726655319198886376364430195779 -163573165261105018597488619717723691587565177613306038112528782411460904521716585792498996876335956172783457396]
    N = 3013106357879528506563986211863829766019522402517279598089329962421723933450283952266714815486883840702922467004127
    M_sqrt_d = BigInt[861670819019434711810390232431791257503478595712145658268113884111641401562930879901711508884977383121180180403 2001512675357984841868884197416312176715139270595429974361166083629249417653345080787028091484943266730038906228; -727646451925113896674805070462530748647404559203072934864641575015559274572817392062855080222417089158452022332 -861670819019434711810390232431791257503478595712145658268113884111641401562930879901711508884977383121180180403]
    return d, A, I, M, N, M_sqrt_d
end

function order_data_11()
    d = 11
    A = [301063230893996944177865864558339518228280737610013440354999313229200245375457635989489835383015002479569433987463, 317717785443259878274356604559054405135694101228949066815023286586835744497625006578370212276493276399988312553574]
    I = KaniSQIsign.Level3.LeftIdeal(KaniSQIsign.Level3.QOrderElem(782362285529672351403571114566042795430461036857751567905047146652261208023505519971192485622817351398102711652629, 0, 0, 0), KaniSQIsign.Level3.QOrderElem(0, 782362285529672351403571114566042795430461036857751567905047146652261208023505519971192485622817351398102711652629, 0, 0), KaniSQIsign.Level3.QOrderElem(-147008340986154222650620522327784364292151671603871739203166921773399800114356566584139398735755756716781118163702159562795725305118583928856457428361480431986630474382129113275400983334340513860141118502094938493322359278301583621817690259011189295065583522290905233335125496344279, -867837751668094446320712253870552236176996494107323326656328250295870479636942502731185577575199989094233830845802148965160850530075410307586854688257172911995007558740006003804632873638930391036395551653910216552902713393769273978617693929475213246193623651787232827960044561627433, 1, 0), KaniSQIsign.Level3.QOrderElem(559546310176640015077469131656031079099270207383825101736491560485070274357987822513639496564569530025287640278180779487837381899281256156045479274950542786062652514748006147505822997036366176091178555066156986658156797905241642839671374098382977861929286229924, 3161014527955046773556865858776633251709930179355746245582024048367169284617670403488254690511124564943594632569047034184945268787518321338088476746767256008592839592721462255056477700923561142499738760732819939233379046655924197788747910264943224086603078588640, -1172307350979842165773438328835455673798694834621968192885306712170975905246403314955581282663961196404050940923522942630227745620730656760994804005189761426400564479460227314853171099964464821902846713296, 1))
    M = BigInt[1165143055248330549586114429926885118163434931665840269123505540524437415741082048247952677521663929517721409899 330256859026003133261010692988419018842913153667730071517973476044695314181982380642502885824818362697905726690; -205921909446041875949190704124937437688813243544885213796852127788634654945125856133589502229256744703266069782 -221602026034074173333592297028797175967053394332441454448408309707831805060327245316334664645044155913775263263]
    N = 782362285529672351403571114566042795430461036857751567905047146652261208023505519971192485622817351398102711652629
    M_sqrt_d = BigInt[98032416534504068693110501005247425970858816725687300344145754141192657461976246812838061718265331041132212892 33670184535643697438752322750651070813489443778313150526136582797100289136592713754955221992757691575380483829; -2366125106768350028252387496436642321510219887076180693907005347950045074579396304017374916517916883823052901327 -98032416534504068693110501005247425970858816725687300344145754141192657461976246812838061718265331041132212892]
    return d, A, I, M, N, M_sqrt_d
end
