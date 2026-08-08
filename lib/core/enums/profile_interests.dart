enum ProfileInterests {
  // القراءة والكتابة
  reading,
  writing,
  poetry,
  books,
  blogging,
  calligraphy,
  languages,

  // الفنون والإبداع
  art,
  drawing,
  painting,
  sculpting,
  design,
  interiorDesign,
  architecture,
  photography,
  filmmaking,
  theater,
  fashion,
  makeup,
  skincare,
  crafts,
  handmadeCrafts,

  // الموسيقى والترفيه
  music,
  singing,
  instruments,
  djing,
  dancing,
  movies,
  anime,
  standupComedy,
  podcasts,
  streaming,

  // الطعام والشراب
  cooking,
  baking,
  food,
  coffee,
  tea,
  wineTasting,

  // الرياضة واللياقة
  fitness,
  gym,
  running,
  yoga,
  meditation,
  martialArts,
  boxing,
  swimming,
  cycling,
  hiking,
  climbing,
  football,
  basketball,
  volleyball,
  tennis,
  golf,
  skiing,
  surfing,
  diving,
  fishing,
  camping,

  // الألعاب والتسلية
  gaming,
  esports,
  chess,
  boardGames,
  puzzles,

  // التكنولوجيا والعلوم
  technology,
  programming,
  ai,
  robotics,
  science,
  astronomy,
  psychology,
  philosophy,

  // الأعمال والمال
  business,
  entrepreneurship,
  marketing,
  investing,
  cryptocurrency,
  realEstate,
  economics,

  // السفر والمركبات
  travel,
  cars,
  motorcycles,
  aviation,
  sailing,

  // الطبيعة والحيوانات
  nature,
  animals,
  pets,
  gardening,
  environment,

  // المجتمع والحياة
  history,
  religion,
  politics,
  parenting,
  volunteering,
  charity,
  socialMedia,
  shopping,
  learning;

 static List<ProfileInterests>get popular => [
    travel, reading, writing, fishing, hiking, football, food, music, art, history,
    shopping, gaming, gym, nature, religion, volunteering, cars, business, environment
  ];

  String get text => switch (this) {
  // القراءة والكتابة
    reading => "القراءة",
    writing => "الكتابة",
    poetry => "الشعر",
    books => "الكتب",
    blogging => "التدوين",
    calligraphy => "الخط العربي",
    languages => "اللغات",

  // الفنون والإبداع
    art => "الفن",
    drawing => "الرسم",
    painting => "الرسم بالألوان",
    sculpting => "النحت",
    design => "التصميم",
    interiorDesign => "التصميم الداخلي",
    architecture => "العمارة",
    photography => "التصوير",
    filmmaking => "صناعة الأفلام",
    theater => "المسرح",
    fashion => "الموضة",
    makeup => "المكياج",
    skincare => "العناية بالبشرة",
    crafts => "الحرف اليدوية",
    handmadeCrafts => "الصناعات اليدوية",

  // الموسيقى والترفيه
    music => "الموسيقى",
    singing => "الغناء",
    instruments => "العزف على الآلات",
    djing => "الدي جي",
    dancing => "الرقص",
    movies => "الأفلام",
    anime => "الأنمي",
    standupComedy => "الكوميديا الارتجالية",
    podcasts => "البودكاست",
    streaming => "البث المباشر",

  // الطعام والشراب
    cooking => "الطبخ",
    baking => "الخبز والحلويات",
    food => "الطعام",
    coffee => "القهوة",
    tea => "الشاي",
    wineTasting => "تذوق النبيذ",

  // الرياضة واللياقة
    fitness => "اللياقة البدنية",
    gym => "الجيم",
    running => "الجري",
    yoga => "اليوجا",
    meditation => "التأمل",
    martialArts => "الفنون القتالية",
    boxing => "الملاكمة",
    swimming => "السباحة",
    cycling => "ركوب الدراجات",
    hiking => "المشي والرحلات",
    climbing => "تسلق الجبال",
    football => "كرة القدم",
    basketball => "كرة السلة",
    volleyball => "الكرة الطائرة",
    tennis => "التنس",
    golf => "الجولف",
    skiing => "التزلج",
    surfing => "ركوب الأمواج",
    diving => "الغوص",
    fishing => "الصيد",
    camping => "التخييم",

  // الألعاب والتسلية
    gaming => "الألعاب",
    esports => "الرياضات الإلكترونية",
    chess => "الشطرنج",
    boardGames => "ألعاب الطاولة",
    puzzles => "الألغاز",

  // التكنولوجيا والعلوم
    technology => "التكنولوجيا",
    programming => "البرمجة",
    ai => "الذكاء الاصطناعي",
    robotics => "الروبوتات",
    science => "العلوم",
    astronomy => "الفلك",
    psychology => "علم النفس",
    philosophy => "الفلسفة",

  // الأعمال والمال
    business => "الأعمال",
    entrepreneurship => "ريادة الأعمال",
    marketing => "التسويق",
    investing => "الاستثمار",
    cryptocurrency => "العملات الرقمية",
    realEstate => "العقارات",
    economics => "الاقتصاد",

  // السفر والمركبات
    travel => "السفر",
    cars => "السيارات",
    motorcycles => "الدراجات النارية",
    aviation => "الطيران",
    sailing => "الإبحار",

  // الطبيعة والحيوانات
    nature => "الطبيعة",
    animals => "الحيوانات",
    pets => "الحيوانات الأليفة",
    gardening => "البستنة",
    environment => "البيئة",

  // المجتمع والحياة
    history => "التاريخ",
    religion => "الدين",
    politics => "السياسة",
    parenting => "الأبوة والأمومة",
    volunteering => "التطوع",
    charity => "الأعمال الخيرية",
    socialMedia => "وسائل التواصل الاجتماعي",
    shopping => "التسوق",
    learning => "التعلم",
  };
}