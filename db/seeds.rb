# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Boston Marathon
route = Route.create(distance: 26.8, numPoints: 111, name: "Boston Marathon")
route.points.create([{lat: 42.22849193456534, lon: -71.52209472551476, orderNum: 0},{lat: 42.22849193456534, lon: -71.52209472551476, orderNum: 1},{lat: 42.22901308396202, lon: -71.51931381173199, orderNum: 2},{lat: 42.23002994882397, lon: -71.51768302865094, orderNum: 3},{lat: 42.231428111262126, lon: -71.5167388910777, orderNum: 4},{lat: 42.23206362940496, lon: -71.5156230921275, orderNum: 5},{lat: 42.23339819667664, lon: -71.51167488045758, orderNum: 6},{lat: 42.235177575809175, lon: -71.50815582223004, orderNum: 7},{lat: 42.23619434136072, lon: -71.5064392084605, orderNum: 8},{lat: 42.236575624219235, lon: -71.50360679574078, orderNum: 9},{lat: 42.23625788866377, lon: -71.50077438302105, orderNum: 10},{lat: 42.236448530189016, lon: -71.49965858407086, orderNum: 11},{lat: 42.23670271799351, lon: -71.49716949410504, orderNum: 12},{lat: 42.237910096083056, lon: -71.49244880623883, orderNum: 13},{lat: 42.24083312631907, lon: -71.4866981501109, orderNum: 14},{lat: 42.24509034019627, lon: -71.47734260506695, orderNum: 15},{lat: 42.24661524280035, lon: -71.47519683785504, orderNum: 16},{lat: 42.248203643818016, lon: -71.4742527002818, orderNum: 17},{lat: 42.25055440392522, lon: -71.47236442513531, orderNum: 18},{lat: 42.25182504858855, lon: -71.47124862880446, orderNum: 19},{lat: 42.254048615156236, lon: -71.46875953883864, orderNum: 20},{lat: 42.255319189427226, lon: -71.46712875575759, orderNum: 21},{lat: 42.25570035671703, lon: -71.46498298854567, orderNum: 22},{lat: 42.25678031819402, lon: -71.46137809962966, orderNum: 23},{lat: 42.257796735630926, lon: -71.45785904140212, orderNum: 24},{lat: 42.258622562735525, lon: -71.45459747524, orderNum: 25},{lat: 42.259448379025095, lon: -71.4524517080281, orderNum: 26},{lat: 42.26109997915901, lon: -71.4498767873738, orderNum: 27},{lat: 42.263132658398185, lon: -71.44867515773512, orderNum: 28},{lat: 42.26548286207852, lon: -71.44652939052321, orderNum: 29},{lat: 42.269420844815286, lon: -71.44489860744216, orderNum: 30},{lat: 42.27145325578358, lon: -71.44309616298415, orderNum: 31},{lat: 42.2731045414416, lon: -71.43949127406813, orderNum: 32},{lat: 42.27431122283283, lon: -71.43734550685622, orderNum: 33},{lat: 42.27354911095782, lon: -71.43348312587477, orderNum: 34},{lat: 42.272024859560986, lon: -71.42953491420485, orderNum: 35},{lat: 42.272469436692916, lon: -71.42816162318923, orderNum: 36},{lat: 42.274247713861904, lon: -71.42490005702712, orderNum: 37},{lat: 42.27570840400186, lon: -71.42000770778395, orderNum: 38},{lat: 42.27805813884139, lon: -71.41022300929762, orderNum: 39},{lat: 42.27945523694076, lon: -71.40361404628493, orderNum: 40},{lat: 42.28155082601095, lon: -71.39451599330641, orderNum: 41},{lat: 42.28186833342652, lon: -71.3894519826863, orderNum: 42},{lat: 42.28224934021323, lon: -71.38387298793532, orderNum: 43},{lat: 42.28256684410884, lon: -71.375890733907, orderNum: 44},{lat: 42.28364634538603, lon: -71.36799431056716, orderNum: 45},{lat: 42.283011346874744, lon: -71.3645610830281, orderNum: 46},{lat: 42.28205883710788, lon: -71.36078453273512, orderNum: 47},{lat: 42.28212233820699, lon: -71.35889625758864, orderNum: 48},{lat: 42.28364634538603, lon: -71.3473091146443, orderNum: 49},{lat: 42.28504331958303, lon: -71.34027099818923, orderNum: 50},{lat: 42.28904357433235, lon: -71.33048628922552, orderNum: 51},{lat: 42.29151979521319, lon: -71.32559393998235, orderNum: 52},{lat: 42.2937419657151, lon: -71.32130240555853, orderNum: 53},{lat: 42.29539266731298, lon: -71.3158950721845, orderNum: 54},{lat: 42.29596405393962, lon: -71.30928610917181, orderNum: 55},{lat: 42.29602754102258, lon: -71.30181883927435, orderNum: 56},{lat: 42.29596405393962, lon: -71.29735564347357, orderNum: 57},{lat: 42.29666240833195, lon: -71.29289244767278, orderNum: 58},{lat: 42.29761469729554, lon: -71.28997420426458, orderNum: 59},{lat: 42.29926529738574, lon: -71.28860091324896, orderNum: 60},{lat: 42.304788144618236, lon: -71.28362273331732, orderNum: 61},{lat: 42.31100870268262, lon: -71.275640479289, orderNum: 62},{lat: 42.31380140635126, lon: -71.27263640519232, orderNum: 63},{lat: 42.31925951481818, lon: -71.26482581254095, orderNum: 64},{lat: 42.323384515242616, lon: -71.26250838395208, orderNum: 65},{lat: 42.3249709818586, lon: -71.2606201088056, orderNum: 66},{lat: 42.32528827038117, lon: -71.25787352677435, orderNum: 67},{lat: 42.3263035829, lon: -71.25461196061224, orderNum: 68},{lat: 42.32801688561851, lon: -71.25203703995794, orderNum: 69},{lat: 42.32992050057806, lon: -71.2485179817304, orderNum: 70},{lat: 42.33302961445505, lon: -71.24551390763372, orderNum: 71},{lat: 42.335440658183856, lon: -71.24225234147161, orderNum: 72},{lat: 42.33988181256608, lon: -71.23950575944036, orderNum: 73},{lat: 42.341087214634065, lon: -71.23830412980169, orderNum: 74},{lat: 42.339437711242304, lon: -71.23581503983587, orderNum: 75},{lat: 42.33899360678197, lon: -71.22954939957708, orderNum: 76},{lat: 42.3377247196123, lon: -71.22577284928411, orderNum: 77},{lat: 42.33651925308502, lon: -71.22354125138372, orderNum: 78},{lat: 42.33670959144137, lon: -71.220708838664, orderNum: 79},{lat: 42.337407493819164, lon: -71.21907805558294, orderNum: 80},{lat: 42.336646145386595, lon: -71.21615981217474, orderNum: 81},{lat: 42.33791505432002, lon: -71.21272658463567, orderNum: 82},{lat: 42.33778816457886, lon: -71.20929335709661, orderNum: 83},{lat: 42.33861294331954, lon: -71.20671843644232, orderNum: 84},{lat: 42.337661274581684, lon: -71.20225524064153, orderNum: 85},{lat: 42.33785160948146, lon: -71.1979637062177, orderNum: 86},{lat: 42.3355675526618, lon: -71.19487380143255, orderNum: 87},{lat: 42.33601168131826, lon: -71.1921272194013, orderNum: 88},{lat: 42.33639236052739, lon: -71.18586157914251, orderNum: 89},{lat: 42.33594823455936, lon: -71.17830847855657, orderNum: 90},{lat: 42.337407493819164, lon: -71.17513274308294, orderNum: 91},{lat: 42.33696337502036, lon: -71.17247199174017, orderNum: 92},{lat: 42.339310824573694, lon: -71.16886710282415, orderNum: 93},{lat: 42.340008698082485, lon: -71.16406058426946, orderNum: 94},{lat: 42.33950115448058, lon: -71.15830992814153, orderNum: 95},{lat: 42.33797849909458, lon: -71.15358924027532, orderNum: 96},{lat: 42.335884787736475, lon: -71.15041350480169, orderNum: 97},{lat: 42.3377247196123, lon: -71.14140128251165, orderNum: 98},{lat: 42.339628040765135, lon: -71.13436316605657, orderNum: 99},{lat: 42.33956459765487, lon: -71.13007163163275, orderNum: 100},{lat: 42.341087214634065, lon: -71.12466429825872, orderNum: 101},{lat: 42.34432265329227, lon: -71.11342047806829, orderNum: 102},{lat: 42.34660639210186, lon: -71.10509490128607, orderNum: 103},{lat: 42.34838891791818, lon: -71.09868335304782, orderNum: 104},{lat: 42.34940385753509, lon: -71.09460639534518, orderNum: 105},{lat: 42.351148246713585, lon: -71.08834075508639, orderNum: 106},{lat: 42.351401972015786, lon: -71.08705329475924, orderNum: 107},{lat: 42.347944876682725, lon: -71.08525085030124, orderNum: 108},{lat: 42.348801239113975, lon: -71.08203219948336, orderNum: 109},{lat: 42.35000647017902, lon: -71.07731151161715, orderNum: 110},{lat: 42.35032363240795, lon: -71.07641028938815, orderNum: 111}])

#Disney World Half Marathon
route2 = Route.create(distance: 13.1, numPoints: 174, name: "Disney World Half Marathon")
route2.points.create([{lat: 28.381765248298905, lon: -81.54330825753277, orderNum: 0},{lat: 28.383275514165124, lon: -81.54631233162945, orderNum: 1},{lat: 28.383804102136715, lon: -81.55086135811871, orderNum: 2},{lat: 28.382822436663723, lon: -81.55506706185406, orderNum: 3},{lat: 28.381161135929936, lon: -81.55738449044293, orderNum: 4},{lat: 28.3789711997446, lon: -81.56339263863629, orderNum: 5},{lat: 28.379650839951726, lon: -81.5651950830943, orderNum: 6},{lat: 28.382218330317226, lon: -81.56674003548687, orderNum: 7},{lat: 28.39218564492581, lon: -81.57017326302594, orderNum: 8},{lat: 28.39384677292184, lon: -81.57146072335308, orderNum: 9},{lat: 28.394752831765455, lon: -81.57429313607281, orderNum: 10},{lat: 28.39754646444058, lon: -81.57609558053082, orderNum: 11},{lat: 28.398225985578293, lon: -81.57849883980816, orderNum: 12},{lat: 28.398376989683868, lon: -81.58073043770855, orderNum: 13},{lat: 28.400415524048977, lon: -81.5820178980357, orderNum: 14},{lat: 28.403511001242556, lon: -81.5816745752818, orderNum: 15},{lat: 28.41241943320194, lon: -81.5752372762654, orderNum: 16},{lat: 28.416042986828955, lon: -81.57686805934645, orderNum: 17},{lat: 28.416594057159763, lon: -81.57719421491493, orderNum: 18},{lat: 28.41625435604191, lon: -81.58024120435584, orderNum: 19},{lat: 28.415952398577836, lon: -81.58101368055213, orderNum: 20},{lat: 28.41614867004832, lon: -81.58120465272077, orderNum: 21},{lat: 28.417035666004736, lon: -81.58121538155683, orderNum: 22},{lat: 28.418460505657386, lon: -81.58120465272077, orderNum: 23},{lat: 28.418837943700744, lon: -81.58121538155683, orderNum: 24},{lat: 28.41858317336342, lon: -81.58042144768842, orderNum: 25},{lat: 28.418422762095794, lon: -81.5793914794267, orderNum: 26},{lat: 28.41903609798375, lon: -81.57928419106611, orderNum: 27},{lat: 28.419715481281564, lon: -81.57959532731184, orderNum: 28},{lat: 28.42026275910121, lon: -81.58044290536054, orderNum: 29},{lat: 28.420291066497708, lon: -81.58073258393415, orderNum: 30},{lat: 28.419932505583006, lon: -81.58117246621259, orderNum: 31},{lat: 28.419668302026743, lon: -81.58120465272077, orderNum: 32},{lat: 28.419300303117566, lon: -81.58120465272077, orderNum: 33},{lat: 28.41885681555322, lon: -81.58129048340925, orderNum: 34},{lat: 28.419158764735027, lon: -81.58210587494978, orderNum: 35},{lat: 28.419422969562724, lon: -81.582610130572, orderNum: 36},{lat: 28.41911158523212, lon: -81.58286762263742, orderNum: 37},{lat: 28.418903995169632, lon: -81.58354353930918, orderNum: 38},{lat: 28.418913431090385, lon: -81.58432674434152, orderNum: 39},{lat: 28.418998354339408, lon: -81.58462715175119, orderNum: 40},{lat: 28.419564507592096, lon: -81.58458423640695, orderNum: 41},{lat: 28.420481670128094, lon: -81.58676433668006, orderNum: 42},{lat: 28.420141981482267, lon: -81.5882663737284, orderNum: 43},{lat: 28.41840577805023, lon: -81.58929634199012, orderNum: 44},{lat: 28.417952850733652, lon: -81.59006881818641, orderNum: 45},{lat: 28.41568818509048, lon: -81.5902833949076, orderNum: 46},{lat: 28.412026873194378, lon: -81.59032631025184, orderNum: 47},{lat: 28.410554763663256, lon: -81.59024047956336, orderNum: 48},{lat: 28.409762079673747, lon: -81.59024047956336, orderNum: 49},{lat: 28.408780654608304, lon: -81.5891675959574, orderNum: 50},{lat: 28.406893273156054, lon: -81.58843803510536, orderNum: 51},{lat: 28.404062137928083, lon: -81.58633518323768, orderNum: 52},{lat: 28.402665416680644, lon: -81.5853481303202, orderNum: 53},{lat: 28.401193177055447, lon: -81.58491897687782, orderNum: 54},{lat: 28.399834168476087, lon: -81.58453273877967, orderNum: 55},{lat: 28.396776335447672, lon: -81.58204364881385, orderNum: 56},{lat: 28.395492774305886, lon: -81.58062744245399, orderNum: 57},{lat: 28.395266261902492, lon: -81.57946872815955, orderNum: 58},{lat: 28.39428470256044, lon: -81.57676506147254, orderNum: 59},{lat: 28.393907177316144, lon: -81.57419014081825, orderNum: 60},{lat: 28.39334088692845, lon: -81.57221603498328, orderNum: 61},{lat: 28.39258582837194, lon: -81.57152938947547, orderNum: 62},{lat: 28.391302216482188, lon: -81.57049941990408, orderNum: 63},{lat: 28.38680945246649, lon: -81.5689544675115, orderNum: 64},{lat: 28.384242073261806, lon: -81.56835365269217, orderNum: 65},{lat: 28.381599117970946, lon: -81.5671520230535, orderNum: 66},{lat: 28.380315373062388, lon: -81.56685161564383, orderNum: 67},{lat: 28.378351968439038, lon: -81.56599330875906, orderNum: 68},{lat: 28.376010938499974, lon: -81.56543540928396, orderNum: 69},{lat: 28.375331274968904, lon: -81.56552123997244, orderNum: 70},{lat: 28.374915922889425, lon: -81.56689453098807, orderNum: 71},{lat: 28.37567110727881, lon: -81.56801032993826, orderNum: 72},{lat: 28.377521286310436, lon: -81.56770992252859, orderNum: 73},{lat: 28.37789886990267, lon: -81.56612205479178, orderNum: 74},{lat: 28.37876730706365, lon: -81.56294631931814, orderNum: 75},{lat: 28.379786767700974, lon: -81.56045722935232, orderNum: 76},{lat: 28.38008882823011, lon: -81.55783939335379, orderNum: 77},{lat: 28.380957247459147, lon: -81.55432033512625, orderNum: 78},{lat: 28.380579674755072, lon: -81.55329036686453, orderNum: 79},{lat: 28.377445769430693, lon: -81.55230331394705, orderNum: 80},{lat: 28.377396683602875, lon: -81.5520865916551, orderNum: 81},{lat: 28.377443881680858, lon: -81.55170035355695, orderNum: 82},{lat: 28.377509958954754, lon: -81.55141067498334, orderNum: 83},{lat: 28.37727396850182, lon: -81.55127120011457, orderNum: 84},{lat: 28.377028537873773, lon: -81.55121755593427, orderNum: 85},{lat: 28.376915262007763, lon: -81.55127120011457, orderNum: 86},{lat: 28.37667927023167, lon: -81.55109953873762, orderNum: 87},{lat: 28.376528235219425, lon: -81.55119609826215, orderNum: 88},{lat: 28.376330001439502, lon: -81.55124974244245, orderNum: 89},{lat: 28.37613176728908, lon: -81.55112099640974, orderNum: 90},{lat: 28.37625448371159, lon: -81.55054163926252, orderNum: 91},{lat: 28.376103448094483, lon: -81.55027341836103, orderNum: 92},{lat: 28.375876894265613, lon: -81.5501232146562, orderNum: 93},{lat: 28.375593701299046, lon: -81.54998373978742, orderNum: 94},{lat: 28.375603141076766, lon: -81.54982280724653, orderNum: 95},{lat: 28.37524442893234, lon: -81.54977989190229, orderNum: 96},{lat: 28.375083952053945, lon: -81.54970479004987, orderNum: 97},{lat: 28.37500843343894, lon: -81.54972624772199, orderNum: 98},{lat: 28.3748290765128, lon: -81.54969406121381, orderNum: 99},{lat: 28.374621399981233, lon: -81.54969406121381, orderNum: 100},{lat: 28.374272124413107, lon: -81.54953312867292, orderNum: 101},{lat: 28.374187165317224, lon: -81.54950094216474, orderNum: 102},{lat: 28.374102206153328, lon: -81.5495116710008, orderNum: 103},{lat: 28.374055006588424, lon: -81.54943656914838, orderNum: 104},{lat: 28.37398892716226, lon: -81.54946875565656, orderNum: 105},{lat: 28.373856768186467, lon: -81.54955458634504, orderNum: 106},{lat: 28.373715169101136, lon: -81.54958677285322, orderNum: 107},{lat: 28.373460290271243, lon: -81.54957604401716, orderNum: 108},{lat: 28.373299810693805, lon: -81.54949021332868, orderNum: 109},{lat: 28.37327149074315, lon: -81.54939365380415, orderNum: 110},{lat: 28.37306381087419, lon: -81.54937219613203, orderNum: 111},{lat: 28.37295997078723, lon: -81.54947948449262, orderNum: 112},{lat: 28.37275229030842, lon: -81.54942584031232, orderNum: 113},{lat: 28.37274285027699, lon: -81.54947948449262, orderNum: 114},{lat: 28.37263900987587, lon: -81.5495653151811, orderNum: 115},{lat: 28.37255404947209, lon: -81.54952239983686, orderNum: 116},{lat: 28.372525729322383, lon: -81.54939365380415, orderNum: 117},{lat: 28.37255404947209, lon: -81.54929709427961, orderNum: 118},{lat: 28.372610689748832, lon: -81.54922199242719, orderNum: 119},{lat: 28.3729788508106, lon: -81.54930782311567, orderNum: 120},{lat: 28.373394210474633, lon: -81.54923272126325, orderNum: 121},{lat: 28.373677409313114, lon: -81.54908251755842, orderNum: 122},{lat: 28.37394172754695, lon: -81.54922199242719, orderNum: 123},{lat: 28.3739983670828, lon: -81.54929709427961, orderNum: 124},{lat: 28.374385403101744, lon: -81.54921126359113, orderNum: 125},{lat: 28.374470362038856, lon: -81.54912543290266, orderNum: 126},{lat: 28.374876276021368, lon: -81.54914689057478, orderNum: 127},{lat: 28.3753010680607, lon: -81.54920053475507, orderNum: 128},{lat: 28.375546502397757, lon: -81.54937219613203, orderNum: 129},{lat: 28.37581081597437, lon: -81.54915761941083, orderNum: 130},{lat: 28.37625448371159, lon: -81.54893231385358, orderNum: 131},{lat: 28.376471597034392, lon: -81.54881429665693, orderNum: 132},{lat: 28.37643383822756, lon: -81.54859971993574, orderNum: 133},{lat: 28.376518795524014, lon: -81.54833149903425, orderNum: 134},{lat: 28.376688709912806, lon: -81.54823493950971, orderNum: 135},{lat: 28.37682086536034, lon: -81.54812765114912, orderNum: 136},{lat: 28.37711349469391, lon: -81.54827785485395, orderNum: 137},{lat: 28.377245649612174, lon: -81.54837441437849, orderNum: 138},{lat: 28.377349485503878, lon: -81.5485568045915, orderNum: 139},{lat: 28.377613794587713, lon: -81.54871773713239, orderNum: 140},{lat: 28.377783707222367, lon: -81.5489001273454, orderNum: 141},{lat: 28.377736509295573, lon: -81.54820275300153, orderNum: 142},{lat: 28.377585475788802, lon: -81.54750537865766, orderNum: 143},{lat: 28.37753827777382, lon: -81.54702258103498, orderNum: 144},{lat: 28.377321166634406, lon: -81.54636812203535, orderNum: 145},{lat: 28.377245649612174, lon: -81.54615354531416, orderNum: 146},{lat: 28.377443881680858, lon: -81.54601407044538, orderNum: 147},{lat: 28.377764828054158, lon: -81.54632520669111, orderNum: 148},{lat: 28.377793146805185, lon: -81.54673290246137, orderNum: 149},{lat: 28.377934740446857, lon: -81.547204971248, orderNum: 150},{lat: 28.37799137785062, lon: -81.54761266701826, orderNum: 151},{lat: 28.378000817414964, lon: -81.54795598977216, orderNum: 152},{lat: 28.37808577345632, lon: -81.5485031604112, orderNum: 153},{lat: 28.378180168978005, lon: -81.54909324639448, orderNum: 154},{lat: 28.378331201637963, lon: -81.54898595803388, orderNum: 155},{lat: 28.378359520237748, lon: -81.54872846596845, orderNum: 156},{lat: 28.37835008070533, lon: -81.54806327813276, orderNum: 157},{lat: 28.37834064117208, lon: -81.54776287072309, orderNum: 158},{lat: 28.37828400395483, lon: -81.54737663262495, orderNum: 159},{lat: 28.378217927163153, lon: -81.54692602151044, orderNum: 160},{lat: 28.378142410779397, lon: -81.54649686806806, orderNum: 161},{lat: 28.377944180016268, lon: -81.54578876488813, orderNum: 162},{lat: 28.378255685334864, lon: -81.54559564583906, orderNum: 163},{lat: 28.378378399300104, lon: -81.54611062996992, orderNum: 164},{lat: 28.378586068763944, lon: -81.546486139232, orderNum: 165},{lat: 28.378633266312658, lon: -81.54690456383832, orderNum: 166},{lat: 28.37872766134708, lon: -81.54725861542829, orderNum: 167},{lat: 28.378822056297487, lon: -81.54763412469038, orderNum: 168},{lat: 28.378822056297487, lon: -81.54793453210004, orderNum: 169},{lat: 28.37885037476623, lon: -81.54836368554243, orderNum: 170},{lat: 28.378793737821184, lon: -81.54869627946027, orderNum: 171},{lat: 28.37878429832742, lon: -81.54905033105024, orderNum: 172},{lat: 28.379171316883493, lon: -81.54892158501752, orderNum: 173},{lat: 28.379190195801325, lon: -81.54851388924726, orderNum: 174}])

#Stingray Run 5k
route3 = Route.create(distance: 3.1, numPoints: 25, name: "Stingray Run")
route3.points.create([{lat: 36.74635350048769, lon: -75.94459819767508, orderNum: 0},{lat: 36.743086597807356, lon: -75.94318199131521, orderNum: 1},{lat: 36.74167318897281, lon: -75.9426798819186, orderNum: 2},{lat: 36.74103697476732, lon: -75.94240093218104, orderNum: 3},{lat: 36.73832010881739, lon: -75.94139242159144, orderNum: 4},{lat: 36.735396791221746, lon: -75.94019079195277, orderNum: 5},{lat: 36.73276571046749, lon: -75.93918228136317, orderNum: 6},{lat: 36.73028931655389, lon: -75.93825960211689, orderNum: 7},{lat: 36.72936752720543, lon: -75.9378583430589, orderNum: 8},{lat: 36.72855063383256, lon: -75.93752574914106, orderNum: 9},{lat: 36.72763054352201, lon: -75.93720388405927, orderNum: 10},{lat: 36.72519697997215, lon: -75.93623828914133, orderNum: 11},{lat: 36.72638367404931, lon: -75.93665671374765, orderNum: 12},{lat: 36.72739836945875, lon: -75.93705368068186, orderNum: 13},{lat: 36.72896338104399, lon: -75.93765449517377, orderNum: 14},{lat: 36.73034778778144, lon: -75.93814802163251, orderNum: 15},{lat: 36.731775162381666, lon: -75.93875956528791, orderNum: 16},{lat: 36.73380439612362, lon: -75.93952131264814, orderNum: 17},{lat: 36.73469173913974, lon: -75.93986892687099, orderNum: 18},{lat: 36.73739153764571, lon: -75.94092035280482, orderNum: 19},{lat: 36.74005685067128, lon: -75.94195032106654, orderNum: 20},{lat: 36.742894017941076, lon: -75.9430232046725, orderNum: 21},{lat: 36.74416641029101, lon: -75.94353818880336, orderNum: 22},{lat: 36.74511209364173, lon: -75.94394588457362, orderNum: 23},{lat: 36.74607495926204, lon: -75.94431066499965, orderNum: 24},{lat: 36.74640164306693, lon: -75.94452524172084, orderNum: 25}]) 

User.create(name: "Aslyn", email: "a@yahoo.com", password: "123456", password_confirmation: "123456")
