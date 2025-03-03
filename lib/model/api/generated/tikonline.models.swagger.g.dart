// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tikonline.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      role: json['role'] as String?,
      complete: json['complete'] as bool?,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      if (instance.accessToken case final value?) 'access_token': value,
      if (instance.refreshToken case final value?) 'refresh_token': value,
      if (instance.tokenType case final value?) 'token_type': value,
      if (instance.expiresIn case final value?) 'expires_in': value,
      if (instance.role case final value?) 'role': value,
      if (instance.complete case final value?) 'complete': value,
    };

AddBookReviewDto _$AddBookReviewDtoFromJson(Map<String, dynamic> json) =>
    AddBookReviewDto(
      message: json['message'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      bookId: json['bookId'] as String?,
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AddBookReviewDtoToJson(AddBookReviewDto instance) =>
    <String, dynamic>{
      if (instance.message case final value?) 'message': value,
      if (instance.rate case final value?) 'rate': value,
      if (instance.bookId case final value?) 'bookId': value,
      if (instance.userId case final value?) 'userId': value,
      if (instance.id case final value?) 'id': value,
    };

ApiResult _$ApiResultFromJson(Map<String, dynamic> json) => ApiResult(
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ApiResultToJson(ApiResult instance) => <String, dynamic>{
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

BookCategoryDto _$BookCategoryDtoFromJson(Map<String, dynamic> json) =>
    BookCategoryDto(
      bookId: json['bookId'] as String?,
      categoryId: json['categoryId'] as String?,
      categoryTitle: json['categoryTitle'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookCategoryDtoToJson(BookCategoryDto instance) =>
    <String, dynamic>{
      if (instance.bookId case final value?) 'bookId': value,
      if (instance.categoryId case final value?) 'categoryId': value,
      if (instance.categoryTitle case final value?) 'categoryTitle': value,
      if (instance.id case final value?) 'id': value,
    };

BookDto _$BookDtoFromJson(Map<String, dynamic> json) => BookDto(
      code: json['code'] as String?,
      orderCount: (json['orderCount'] as num?)?.toInt(),
      niko: json['niko'] as bool?,
      online: json['online'] as bool?,
      physical: json['physical'] as bool?,
      discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
      physicalLink: json['physicalLink'] as String?,
      samplePdfLink: json['samplePdfLink'] as String?,
      fehrestUrl: json['fehrestUrl'] as String?,
      fehrestFile: json['fehrestFile'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      imageFile: json['imageFile'] as String?,
      pdfLink: json['pdfLink'] as String?,
      pdfSize: json['pdfSize'] as String?,
      pdfFile: json['pdfFile'] as String?,
      like: json['like'] as bool?,
      read: json['read'] as bool?,
      shelf: json['shelf'] as bool?,
      buy: json['buy'] as bool?,
      shopCard: json['shopCard'] as bool?,
      nevisande: json['nevisande'] as String?,
      entesharat: json['entesharat'] as String?,
      motarjem: json['motarjem'] as String?,
      moalef: json['moalef'] as String?,
      zirNazar: json['zirNazar'] as String?,
      sarparastMotarjem: json['sarparastMotarjem'] as String?,
      sarparastMoalef: json['sarparastMoalef'] as String?,
      baHamkari: json['baHamkari'] as String?,
      beKooshesh: json['beKooshesh'] as String?,
      gerdAvariVaTaalif: json['gerdAvariVaTaalif'] as String?,
      baMoqadameVaNezarat: json['baMoqadameVaNezarat'] as String?,
      virastar: json['virastar'] as String?,
      virastarElmi: json['virastarElmi'] as String?,
      virayeshElmi: json['virayeshElmi'] as String?,
      pages: (json['pages'] as num?)?.toInt(),
      nobatChap: json['nobatChap'] as String?,
      tarikhChap: json['tarikhChap'] as String?,
      rangChap: json['rangChap'] as String?,
      qatKetab: json['qatKetab'] as String?,
      noSahafi: json['noSahafi'] as String?,
      noKaqaz: json['noKaqaz'] as String?,
      shomareShabak: json['shomareShabak'] as String?,
      formatMohtava: json['formatMohtava'] as String?,
      zamanMotalee: json['zamanMotalee'] as String?,
      zaban: json['zaban'] as String?,
      qeymatArzi: json['qeymatArzi'] as String?,
      qeymatChapi: (json['qeymatChapi'] as num?)?.toInt(),
      salEnteshar: json['salEnteshar'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      categoryId: json['categoryId'] as String?,
      categoryTitle: json['categoryTitle'] as String?,
      myReview: json['myReview'] == null
          ? null
          : BookReviewDto.fromJson(json['myReview'] as Map<String, dynamic>),
      similarBooks: (json['similarBooks'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bookReviewss: (json['bookReviewss'] as List<dynamic>?)
              ?.map((e) => BookReviewDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bookCategories: (json['bookCategories'] as List<dynamic>?)
              ?.map((e) => BookCategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookDtoToJson(BookDto instance) => <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.orderCount case final value?) 'orderCount': value,
      if (instance.niko case final value?) 'niko': value,
      if (instance.online case final value?) 'online': value,
      if (instance.physical case final value?) 'physical': value,
      if (instance.discountPercentage case final value?)
        'discountPercentage': value,
      if (instance.physicalLink case final value?) 'physicalLink': value,
      if (instance.samplePdfLink case final value?) 'samplePdfLink': value,
      if (instance.fehrestUrl case final value?) 'fehrestUrl': value,
      if (instance.fehrestFile case final value?) 'fehrestFile': value,
      if (instance.title case final value?) 'title': value,
      if (instance.description case final value?) 'description': value,
      if (instance.imageUrl case final value?) 'imageUrl': value,
      if (instance.imageFile case final value?) 'imageFile': value,
      if (instance.pdfLink case final value?) 'pdfLink': value,
      if (instance.pdfSize case final value?) 'pdfSize': value,
      if (instance.pdfFile case final value?) 'pdfFile': value,
      if (instance.like case final value?) 'like': value,
      if (instance.read case final value?) 'read': value,
      if (instance.shelf case final value?) 'shelf': value,
      if (instance.buy case final value?) 'buy': value,
      if (instance.shopCard case final value?) 'shopCard': value,
      if (instance.nevisande case final value?) 'nevisande': value,
      if (instance.entesharat case final value?) 'entesharat': value,
      if (instance.motarjem case final value?) 'motarjem': value,
      if (instance.moalef case final value?) 'moalef': value,
      if (instance.zirNazar case final value?) 'zirNazar': value,
      if (instance.sarparastMotarjem case final value?)
        'sarparastMotarjem': value,
      if (instance.sarparastMoalef case final value?) 'sarparastMoalef': value,
      if (instance.baHamkari case final value?) 'baHamkari': value,
      if (instance.beKooshesh case final value?) 'beKooshesh': value,
      if (instance.gerdAvariVaTaalif case final value?)
        'gerdAvariVaTaalif': value,
      if (instance.baMoqadameVaNezarat case final value?)
        'baMoqadameVaNezarat': value,
      if (instance.virastar case final value?) 'virastar': value,
      if (instance.virastarElmi case final value?) 'virastarElmi': value,
      if (instance.virayeshElmi case final value?) 'virayeshElmi': value,
      if (instance.pages case final value?) 'pages': value,
      if (instance.nobatChap case final value?) 'nobatChap': value,
      if (instance.tarikhChap case final value?) 'tarikhChap': value,
      if (instance.rangChap case final value?) 'rangChap': value,
      if (instance.qatKetab case final value?) 'qatKetab': value,
      if (instance.noSahafi case final value?) 'noSahafi': value,
      if (instance.noKaqaz case final value?) 'noKaqaz': value,
      if (instance.shomareShabak case final value?) 'shomareShabak': value,
      if (instance.formatMohtava case final value?) 'formatMohtava': value,
      if (instance.zamanMotalee case final value?) 'zamanMotalee': value,
      if (instance.zaban case final value?) 'zaban': value,
      if (instance.qeymatArzi case final value?) 'qeymatArzi': value,
      if (instance.qeymatChapi case final value?) 'qeymatChapi': value,
      if (instance.salEnteshar case final value?) 'salEnteshar': value,
      if (instance.rating case final value?) 'rating': value,
      if (instance.price case final value?) 'price': value,
      if (instance.discountPrice case final value?) 'discountPrice': value,
      if (instance.totalPrice case final value?) 'totalPrice': value,
      if (instance.viewCount case final value?) 'viewCount': value,
      if (instance.categoryId case final value?) 'categoryId': value,
      if (instance.categoryTitle case final value?) 'categoryTitle': value,
      if (instance.myReview?.toJson() case final value?) 'myReview': value,
      if (instance.similarBooks?.map((e) => e.toJson()).toList()
          case final value?)
        'similarBooks': value,
      if (instance.bookReviewss?.map((e) => e.toJson()).toList()
          case final value?)
        'bookReviewss': value,
      if (instance.bookCategories?.map((e) => e.toJson()).toList()
          case final value?)
        'bookCategories': value,
      if (instance.id case final value?) 'id': value,
    };

BookDtoApiResult _$BookDtoApiResultFromJson(Map<String, dynamic> json) =>
    BookDtoApiResult(
      data: json['data'] == null
          ? null
          : BookDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookDtoApiResultToJson(BookDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

BookDtoListApiResult _$BookDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    BookDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookDtoListApiResultToJson(
        BookDtoListApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

BookOrderDto _$BookOrderDtoFromJson(Map<String, dynamic> json) => BookOrderDto(
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      rawPrice: (json['rawPrice'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      bookOrderItems: (json['bookOrderItems'] as List<dynamic>?)
              ?.map((e) => BookOrderItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookOrderDtoToJson(BookOrderDto instance) =>
    <String, dynamic>{
      if (instance.totalPrice case final value?) 'totalPrice': value,
      if (instance.rawPrice case final value?) 'rawPrice': value,
      if (instance.userId case final value?) 'userId': value,
      if (instance.bookOrderItems?.map((e) => e.toJson()).toList()
          case final value?)
        'bookOrderItems': value,
      if (instance.id case final value?) 'id': value,
    };

BookOrderDtoListApiResult _$BookOrderDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    BookOrderDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BookOrderDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookOrderDtoListApiResultToJson(
        BookOrderDtoListApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

BookOrderItemDto _$BookOrderItemDtoFromJson(Map<String, dynamic> json) =>
    BookOrderItemDto(
      bookId: json['bookId'] as String?,
      bookCode: json['bookCode'] as String?,
      bookNiko: json['bookNiko'] as bool?,
      bookOnline: json['bookOnline'] as bool?,
      bookTitle: json['bookTitle'] as String?,
      bookDescription: json['bookDescription'] as String?,
      bookImageUrl: json['bookImageUrl'] as String?,
      bookLike: json['bookLike'] as bool?,
      bookRead: json['bookRead'] as bool?,
      bookShelf: json['bookShelf'] as bool?,
      bookBuy: json['bookBuy'] as bool?,
      bookNevisande: json['bookNevisande'] as String?,
      bookRating: (json['bookRating'] as num?)?.toInt(),
      bookPrice: (json['bookPrice'] as num?)?.toInt(),
      bookDiscountPrice: (json['bookDiscountPrice'] as num?)?.toInt(),
      bookTotalPrice: (json['bookTotalPrice'] as num?)?.toInt(),
      bookViewCount: (json['bookViewCount'] as num?)?.toInt(),
      bookOrderId: json['bookOrderId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookOrderItemDtoToJson(BookOrderItemDto instance) =>
    <String, dynamic>{
      if (instance.bookId case final value?) 'bookId': value,
      if (instance.bookCode case final value?) 'bookCode': value,
      if (instance.bookNiko case final value?) 'bookNiko': value,
      if (instance.bookOnline case final value?) 'bookOnline': value,
      if (instance.bookTitle case final value?) 'bookTitle': value,
      if (instance.bookDescription case final value?) 'bookDescription': value,
      if (instance.bookImageUrl case final value?) 'bookImageUrl': value,
      if (instance.bookLike case final value?) 'bookLike': value,
      if (instance.bookRead case final value?) 'bookRead': value,
      if (instance.bookShelf case final value?) 'bookShelf': value,
      if (instance.bookBuy case final value?) 'bookBuy': value,
      if (instance.bookNevisande case final value?) 'bookNevisande': value,
      if (instance.bookRating case final value?) 'bookRating': value,
      if (instance.bookPrice case final value?) 'bookPrice': value,
      if (instance.bookDiscountPrice case final value?)
        'bookDiscountPrice': value,
      if (instance.bookTotalPrice case final value?) 'bookTotalPrice': value,
      if (instance.bookViewCount case final value?) 'bookViewCount': value,
      if (instance.bookOrderId case final value?) 'bookOrderId': value,
      if (instance.id case final value?) 'id': value,
    };

BookOrderItemDtoListApiResult _$BookOrderItemDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    BookOrderItemDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BookOrderItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookOrderItemDtoListApiResultToJson(
        BookOrderItemDtoListApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

BookReviewDto _$BookReviewDtoFromJson(Map<String, dynamic> json) =>
    BookReviewDto(
      creationDateTime: json['creationDateTime'] == null
          ? null
          : DateTime.parse(json['creationDateTime'] as String),
      message: json['message'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      bookId: json['bookId'] as String?,
      bookTitle: json['bookTitle'] as String?,
      bookImageUrl: json['bookImageUrl'] as String?,
      bookNevisande: json['bookNevisande'] as String?,
      bookEntesharat: json['bookEntesharat'] as String?,
      bookMotarjem: json['bookMotarjem'] as String?,
      bookSalEnteshar: json['bookSalEnteshar'] as String?,
      bookPages: (json['bookPages'] as num?)?.toInt(),
      bookRating: (json['bookRating'] as num?)?.toInt(),
      bookPrice: (json['bookPrice'] as num?)?.toInt(),
      bookDiscountPrice: (json['bookDiscountPrice'] as num?)?.toInt(),
      bookViewCount: (json['bookViewCount'] as num?)?.toInt(),
      bookCategoryId: json['bookCategoryId'] as String?,
      bookCategoryName: json['bookCategoryName'] as String?,
      userId: json['userId'] as String?,
      userFirstName: json['userFirstName'] as String?,
      userLastName: json['userLastName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookReviewDtoToJson(BookReviewDto instance) =>
    <String, dynamic>{
      if (instance.creationDateTime?.toIso8601String() case final value?)
        'creationDateTime': value,
      if (instance.message case final value?) 'message': value,
      if (instance.rate case final value?) 'rate': value,
      if (instance.bookId case final value?) 'bookId': value,
      if (instance.bookTitle case final value?) 'bookTitle': value,
      if (instance.bookImageUrl case final value?) 'bookImageUrl': value,
      if (instance.bookNevisande case final value?) 'bookNevisande': value,
      if (instance.bookEntesharat case final value?) 'bookEntesharat': value,
      if (instance.bookMotarjem case final value?) 'bookMotarjem': value,
      if (instance.bookSalEnteshar case final value?) 'bookSalEnteshar': value,
      if (instance.bookPages case final value?) 'bookPages': value,
      if (instance.bookRating case final value?) 'bookRating': value,
      if (instance.bookPrice case final value?) 'bookPrice': value,
      if (instance.bookDiscountPrice case final value?)
        'bookDiscountPrice': value,
      if (instance.bookViewCount case final value?) 'bookViewCount': value,
      if (instance.bookCategoryId case final value?) 'bookCategoryId': value,
      if (instance.bookCategoryName case final value?)
        'bookCategoryName': value,
      if (instance.userId case final value?) 'userId': value,
      if (instance.userFirstName case final value?) 'userFirstName': value,
      if (instance.userLastName case final value?) 'userLastName': value,
      if (instance.id case final value?) 'id': value,
    };

BookReviewDtoListApiResult _$BookReviewDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    BookReviewDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BookReviewDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookReviewDtoListApiResultToJson(
        BookReviewDtoListApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

BookSearchDto _$BookSearchDtoFromJson(Map<String, dynamic> json) =>
    BookSearchDto(
      categoryId: json['categoryId'] as String?,
      name: json['name'] as String?,
      minPrice: (json['minPrice'] as num?)?.toInt(),
      maxPrice: (json['maxPrice'] as num?)?.toInt(),
      nevisande: json['nevisande'] as String?,
      entesharat: json['entesharat'] as String?,
      motarjem: json['motarjem'] as String?,
      moalef: json['moalef'] as String?,
    );

Map<String, dynamic> _$BookSearchDtoToJson(BookSearchDto instance) =>
    <String, dynamic>{
      if (instance.categoryId case final value?) 'categoryId': value,
      if (instance.name case final value?) 'name': value,
      if (instance.minPrice case final value?) 'minPrice': value,
      if (instance.maxPrice case final value?) 'maxPrice': value,
      if (instance.nevisande case final value?) 'nevisande': value,
      if (instance.entesharat case final value?) 'entesharat': value,
      if (instance.motarjem case final value?) 'motarjem': value,
      if (instance.moalef case final value?) 'moalef': value,
    };

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      title: json['title'] as String?,
      motherId: json['motherId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.motherId case final value?) 'motherId': value,
      if (instance.id case final value?) 'id': value,
    };

CategoryDtoListApiResult _$CategoryDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    CategoryDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CategoryDtoListApiResultToJson(
        CategoryDtoListApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

ClientLoginDto _$ClientLoginDtoFromJson(Map<String, dynamic> json) =>
    ClientLoginDto(
      nationalCode: json['nationalCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      otp: json['otp'] as String?,
      compeleteProfile: json['compeleteProfile'] as bool?,
    );

Map<String, dynamic> _$ClientLoginDtoToJson(ClientLoginDto instance) =>
    <String, dynamic>{
      if (instance.nationalCode case final value?) 'nationalCode': value,
      if (instance.phoneNumber case final value?) 'phoneNumber': value,
      if (instance.otp case final value?) 'otp': value,
      if (instance.compeleteProfile case final value?)
        'compeleteProfile': value,
    };

ClientLoginDtoApiResult _$ClientLoginDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    ClientLoginDtoApiResult(
      data: json['data'] == null
          ? null
          : ClientLoginDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ClientLoginDtoApiResultToJson(
        ClientLoginDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

ExpertiseDto _$ExpertiseDtoFromJson(Map<String, dynamic> json) => ExpertiseDto(
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExpertiseDtoToJson(ExpertiseDto instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.id case final value?) 'id': value,
    };

IndexDto _$IndexDtoFromJson(Map<String, dynamic> json) => IndexDto(
      discountBooks: (json['discountBooks'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      freeBooks: (json['freeBooks'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mostViewedBooks: (json['mostViewedBooks'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      indexInfo: json['indexInfo'] == null
          ? null
          : SettingDto.fromJson(json['indexInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndexDtoToJson(IndexDto instance) => <String, dynamic>{
      if (instance.discountBooks?.map((e) => e.toJson()).toList()
          case final value?)
        'discountBooks': value,
      if (instance.freeBooks?.map((e) => e.toJson()).toList() case final value?)
        'freeBooks': value,
      if (instance.mostViewedBooks?.map((e) => e.toJson()).toList()
          case final value?)
        'mostViewedBooks': value,
      if (instance.indexInfo?.toJson() case final value?) 'indexInfo': value,
    };

IndexDtoApiResult _$IndexDtoApiResultFromJson(Map<String, dynamic> json) =>
    IndexDtoApiResult(
      data: json['data'] == null
          ? null
          : IndexDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$IndexDtoApiResultToJson(IndexDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      if (instance.userName case final value?) 'userName': value,
      if (instance.password case final value?) 'password': value,
    };

NationalLoginDto _$NationalLoginDtoFromJson(Map<String, dynamic> json) =>
    NationalLoginDto(
      nationalCode: json['nationalCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$NationalLoginDtoToJson(NationalLoginDto instance) =>
    <String, dynamic>{
      if (instance.nationalCode case final value?) 'nationalCode': value,
      if (instance.phoneNumber case final value?) 'phoneNumber': value,
      if (instance.otp case final value?) 'otp': value,
    };

NationalLoginDtoApiResult _$NationalLoginDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    NationalLoginDtoApiResult(
      data: json['data'] == null
          ? null
          : NationalLoginDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NationalLoginDtoApiResultToJson(
        NationalLoginDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      title: json['title'] as String?,
      message: json['message'] as String?,
      userId: json['userId'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      if (instance.title case final value?) 'title': value,
      if (instance.message case final value?) 'message': value,
      if (instance.userId case final value?) 'userId': value,
      if (instance.dueDate?.toIso8601String() case final value?)
        'dueDate': value,
      if (instance.id case final value?) 'id': value,
    };

NotificationDtoApiResult _$NotificationDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    NotificationDtoApiResult(
      data: json['data'] == null
          ? null
          : NotificationDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NotificationDtoApiResultToJson(
        NotificationDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

PaymentTransactionsDto _$PaymentTransactionsDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentTransactionsDto(
      amount: (json['amount'] as num?)?.toInt(),
      description: json['description'] as String?,
      refId: json['refId'] as String?,
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PaymentTransactionsDtoToJson(
        PaymentTransactionsDto instance) =>
    <String, dynamic>{
      if (instance.amount case final value?) 'amount': value,
      if (instance.description case final value?) 'description': value,
      if (instance.refId case final value?) 'refId': value,
      if (instance.userId case final value?) 'userId': value,
      if (instance.id case final value?) 'id': value,
    };

PaymentTransactionsDtoListApiResult
    _$PaymentTransactionsDtoListApiResultFromJson(Map<String, dynamic> json) =>
        PaymentTransactionsDtoListApiResult(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => PaymentTransactionsDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
          isSuccess: json['isSuccess'] as bool?,
          statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
          message: json['message'] as String?,
        );

Map<String, dynamic> _$PaymentTransactionsDtoListApiResultToJson(
        PaymentTransactionsDtoListApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

SettingDto _$SettingDtoFromJson(Map<String, dynamic> json) => SettingDto(
      banner1ImageUrl: json['banner1ImageUrl'] as String?,
      banner1ImageFile: json['banner1ImageFile'] as String?,
      banner1Title: json['banner1Title'] as String?,
      banner1SubTitle: json['banner1SubTitle'] as String?,
      banner1Description: json['banner1Description'] as String?,
      banner1ButtonText: json['banner1ButtonText'] as String?,
      banner1ButtonLink: json['banner1ButtonLink'] as String?,
      banner2ImageUrl: json['banner2ImageUrl'] as String?,
      banner2ImageFile: json['banner2ImageFile'] as String?,
      banner2Title: json['banner2Title'] as String?,
      banner2SubTitle: json['banner2SubTitle'] as String?,
      banner2Description: json['banner2Description'] as String?,
      banner2ButtonText: json['banner2ButtonText'] as String?,
      banner2ButtonLink: json['banner2ButtonLink'] as String?,
      banner3ImageUrl: json['banner3ImageUrl'] as String?,
      banner3ImageFile: json['banner3ImageFile'] as String?,
      banner3Title: json['banner3Title'] as String?,
      banner3SubTitle: json['banner3SubTitle'] as String?,
      banner3Description: json['banner3Description'] as String?,
      banner3ButtonText: json['banner3ButtonText'] as String?,
      banner3ButtonLink: json['banner3ButtonLink'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SettingDtoToJson(SettingDto instance) =>
    <String, dynamic>{
      if (instance.banner1ImageUrl case final value?) 'banner1ImageUrl': value,
      if (instance.banner1ImageFile case final value?)
        'banner1ImageFile': value,
      if (instance.banner1Title case final value?) 'banner1Title': value,
      if (instance.banner1SubTitle case final value?) 'banner1SubTitle': value,
      if (instance.banner1Description case final value?)
        'banner1Description': value,
      if (instance.banner1ButtonText case final value?)
        'banner1ButtonText': value,
      if (instance.banner1ButtonLink case final value?)
        'banner1ButtonLink': value,
      if (instance.banner2ImageUrl case final value?) 'banner2ImageUrl': value,
      if (instance.banner2ImageFile case final value?)
        'banner2ImageFile': value,
      if (instance.banner2Title case final value?) 'banner2Title': value,
      if (instance.banner2SubTitle case final value?) 'banner2SubTitle': value,
      if (instance.banner2Description case final value?)
        'banner2Description': value,
      if (instance.banner2ButtonText case final value?)
        'banner2ButtonText': value,
      if (instance.banner2ButtonLink case final value?)
        'banner2ButtonLink': value,
      if (instance.banner3ImageUrl case final value?) 'banner3ImageUrl': value,
      if (instance.banner3ImageFile case final value?)
        'banner3ImageFile': value,
      if (instance.banner3Title case final value?) 'banner3Title': value,
      if (instance.banner3SubTitle case final value?) 'banner3SubTitle': value,
      if (instance.banner3Description case final value?)
        'banner3Description': value,
      if (instance.banner3ButtonText case final value?)
        'banner3ButtonText': value,
      if (instance.banner3ButtonLink case final value?)
        'banner3ButtonLink': value,
      if (instance.id case final value?) 'id': value,
    };

ShopCardDto _$ShopCardDtoFromJson(Map<String, dynamic> json) => ShopCardDto(
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      rawPrice: (json['rawPrice'] as num?)?.toInt(),
      userId: json['userId'] as String?,
      walletAmount: (json['walletAmount'] as num?)?.toInt(),
      shopCardItems: (json['shopCardItems'] as List<dynamic>?)
              ?.map((e) => ShopCardItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShopCardDtoToJson(ShopCardDto instance) =>
    <String, dynamic>{
      if (instance.totalPrice case final value?) 'totalPrice': value,
      if (instance.rawPrice case final value?) 'rawPrice': value,
      if (instance.userId case final value?) 'userId': value,
      if (instance.walletAmount case final value?) 'walletAmount': value,
      if (instance.shopCardItems?.map((e) => e.toJson()).toList()
          case final value?)
        'shopCardItems': value,
      if (instance.id case final value?) 'id': value,
    };

ShopCardDtoApiResult _$ShopCardDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    ShopCardDtoApiResult(
      data: json['data'] == null
          ? null
          : ShopCardDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ShopCardDtoApiResultToJson(
        ShopCardDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

ShopCardItemDto _$ShopCardItemDtoFromJson(Map<String, dynamic> json) =>
    ShopCardItemDto(
      bookId: json['bookId'] as String?,
      bookPrice: (json['bookPrice'] as num?)?.toInt(),
      bookDiscountPrice: (json['bookDiscountPrice'] as num?)?.toInt(),
      bookTotalPrice: (json['bookTotalPrice'] as num?)?.toInt(),
      bookNevisande: json['bookNevisande'] as String?,
      bookMotarjem: json['bookMotarjem'] as String?,
      bookTitle: json['bookTitle'] as String?,
      bookDescription: json['bookDescription'] as String?,
      bookImageUrl: json['bookImageUrl'] as String?,
      shopCardId: json['shopCardId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShopCardItemDtoToJson(ShopCardItemDto instance) =>
    <String, dynamic>{
      if (instance.bookId case final value?) 'bookId': value,
      if (instance.bookPrice case final value?) 'bookPrice': value,
      if (instance.bookDiscountPrice case final value?)
        'bookDiscountPrice': value,
      if (instance.bookTotalPrice case final value?) 'bookTotalPrice': value,
      if (instance.bookNevisande case final value?) 'bookNevisande': value,
      if (instance.bookMotarjem case final value?) 'bookMotarjem': value,
      if (instance.bookTitle case final value?) 'bookTitle': value,
      if (instance.bookDescription case final value?) 'bookDescription': value,
      if (instance.bookImageUrl case final value?) 'bookImageUrl': value,
      if (instance.shopCardId case final value?) 'shopCardId': value,
      if (instance.id case final value?) 'id': value,
    };

StringApiResult _$StringApiResultFromJson(Map<String, dynamic> json) =>
    StringApiResult(
      data: json['data'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StringApiResultToJson(StringApiResult instance) =>
    <String, dynamic>{
      if (instance.data case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) =>
    SubscriptionDto(
      name: json['name'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SubscriptionDtoToJson(SubscriptionDto instance) =>
    <String, dynamic>{
      if (instance.name case final value?) 'name': value,
      if (instance.duration case final value?) 'duration': value,
      if (instance.price case final value?) 'price': value,
      if (instance.discountPrice case final value?) 'discountPrice': value,
      if (instance.id case final value?) 'id': value,
    };

SubscriptionDtoListApiResult _$SubscriptionDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    SubscriptionDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SubscriptionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SubscriptionDtoListApiResultToJson(
        SubscriptionDtoListApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.map((e) => e.toJson()).toList() case final value?)
        'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

TempUserDto _$TempUserDtoFromJson(Map<String, dynamic> json) => TempUserDto(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      exist: json['exist'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TempUserDtoToJson(TempUserDto instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      if (instance.otp case final value?) 'otp': value,
      if (instance.fname case final value?) 'fname': value,
      if (instance.lname case final value?) 'lname': value,
      if (instance.creationDate?.toIso8601String() case final value?)
        'creationDate': value,
      if (instance.exist case final value?) 'exist': value,
      if (instance.id case final value?) 'id': value,
    };

TempUserDtoApiResult _$TempUserDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    TempUserDtoApiResult(
      data: json['data'] == null
          ? null
          : TempUserDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TempUserDtoApiResultToJson(
        TempUserDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      seatNumber: json['seatNumber'] as String?,
      certificateUrl: json['certificateUrl'] as String?,
      conId: json['conId'] as String?,
      sex: sexNullableFromJson(json['sex']),
      userName: json['userName'] as String?,
      code: json['code'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      chap: json['chap'] as bool?,
      lastName: json['lastName'] as String?,
      nationalCode: json['nationalCode'] as String?,
      userAvatar: json['userAvatar'] as String?,
      userBarcode: json['userBarcode'] as String?,
      barcodeNumber: json['barcodeNumber'] as String?,
      likedCategories: json['likedCategories'] as String?,
      expertiseId: json['expertiseId'] as String?,
      addUserRole: userRolesNullableFromJson(json['addUserRole']),
      showUserRole: json['showUserRole'] as String?,
      password: json['password'] as String?,
      walletAmount: (json['walletAmount'] as num?)?.toInt(),
      foodDayOne: json['foodDayOne'] as bool?,
      foodDayTwo: json['foodDayTwo'] as bool?,
      foodDayThree: json['foodDayThree'] as bool?,
      foodDayFour: json['foodDayFour'] as bool?,
      foodDay1Code: json['foodDay1Code'] as String?,
      foodDay2Code: json['foodDay2Code'] as String?,
      foodDay3Code: json['foodDay3Code'] as String?,
      foodDay4Code: json['foodDay4Code'] as String?,
      hasGift: json['hasGift'] as bool?,
      role: json['role'] as String?,
      stepTwo: json['stepTwo'] as bool?,
      hasSub: json['hasSub'] as bool?,
      subDueDate: json['subDueDate'] == null
          ? null
          : DateTime.parse(json['subDueDate'] as String),
      subName: json['subName'] as String?,
      subPrice: (json['subPrice'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      reshte: json['reshte'] as String?,
      takhasos: json['takhasos'] as String?,
      expertises: (json['expertises'] as List<dynamic>?)
              ?.map((e) => ExpertiseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      if (instance.seatNumber case final value?) 'seatNumber': value,
      if (instance.certificateUrl case final value?) 'certificateUrl': value,
      if (instance.conId case final value?) 'conId': value,
      if (sexNullableToJson(instance.sex) case final value?) 'sex': value,
      if (instance.userName case final value?) 'userName': value,
      if (instance.code case final value?) 'code': value,
      if (instance.phoneNumber case final value?) 'phoneNumber': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.chap case final value?) 'chap': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.nationalCode case final value?) 'nationalCode': value,
      if (instance.userAvatar case final value?) 'userAvatar': value,
      if (instance.userBarcode case final value?) 'userBarcode': value,
      if (instance.barcodeNumber case final value?) 'barcodeNumber': value,
      if (instance.likedCategories case final value?) 'likedCategories': value,
      if (instance.expertiseId case final value?) 'expertiseId': value,
      if (userRolesNullableToJson(instance.addUserRole) case final value?)
        'addUserRole': value,
      if (instance.showUserRole case final value?) 'showUserRole': value,
      if (instance.password case final value?) 'password': value,
      if (instance.walletAmount case final value?) 'walletAmount': value,
      if (instance.foodDayOne case final value?) 'foodDayOne': value,
      if (instance.foodDayTwo case final value?) 'foodDayTwo': value,
      if (instance.foodDayThree case final value?) 'foodDayThree': value,
      if (instance.foodDayFour case final value?) 'foodDayFour': value,
      if (instance.foodDay1Code case final value?) 'foodDay1Code': value,
      if (instance.foodDay2Code case final value?) 'foodDay2Code': value,
      if (instance.foodDay3Code case final value?) 'foodDay3Code': value,
      if (instance.foodDay4Code case final value?) 'foodDay4Code': value,
      if (instance.hasGift case final value?) 'hasGift': value,
      if (instance.role case final value?) 'role': value,
      if (instance.stepTwo case final value?) 'stepTwo': value,
      if (instance.hasSub case final value?) 'hasSub': value,
      if (instance.subDueDate?.toIso8601String() case final value?)
        'subDueDate': value,
      if (instance.subName case final value?) 'subName': value,
      if (instance.subPrice case final value?) 'subPrice': value,
      if (instance.isActive case final value?) 'isActive': value,
      if (instance.reshte case final value?) 'reshte': value,
      if (instance.takhasos case final value?) 'takhasos': value,
      if (instance.expertises?.map((e) => e.toJson()).toList()
          case final value?)
        'expertises': value,
      if (instance.categories?.map((e) => e.toJson()).toList()
          case final value?)
        'categories': value,
      if (instance.id case final value?) 'id': value,
    };

UserDtoApiResult _$UserDtoApiResultFromJson(Map<String, dynamic> json) =>
    UserDtoApiResult(
      data: json['data'] == null
          ? null
          : UserDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserDtoApiResultToJson(UserDtoApiResult instance) =>
    <String, dynamic>{
      if (instance.data?.toJson() case final value?) 'data': value,
      if (instance.isSuccess case final value?) 'isSuccess': value,
      if (apiResultStatusCodeNullableToJson(instance.statusCode)
          case final value?)
        'statusCode': value,
      if (instance.message case final value?) 'message': value,
    };

ApiV1AdminIndexPost$RequestBody _$ApiV1AdminIndexPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiV1AdminIndexPost$RequestBody(
      banner1ImageFile: json['Banner1ImageFile'] as String?,
      banner2ImageFile: json['Banner2ImageFile'] as String?,
      banner3ImageFile: json['Banner3ImageFile'] as String?,
    );

Map<String, dynamic> _$ApiV1AdminIndexPost$RequestBodyToJson(
        ApiV1AdminIndexPost$RequestBody instance) =>
    <String, dynamic>{
      if (instance.banner1ImageFile case final value?)
        'Banner1ImageFile': value,
      if (instance.banner2ImageFile case final value?)
        'Banner2ImageFile': value,
      if (instance.banner3ImageFile case final value?)
        'Banner3ImageFile': value,
    };

ApiV1AuthenticationFreeTokenPost$RequestBody
    _$ApiV1AuthenticationFreeTokenPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthenticationFreeTokenPost$RequestBody(
          grantType: json['grant_type'] as String?,
          username: json['username'] as String?,
          password: json['password'] as String?,
          refreshToken: json['refresh_token'] as String?,
          scope: json['scope'] as String?,
          clientId: json['client_id'] as String?,
          clientSecret: json['client_secret'] as String?,
        );

Map<String, dynamic> _$ApiV1AuthenticationFreeTokenPost$RequestBodyToJson(
        ApiV1AuthenticationFreeTokenPost$RequestBody instance) =>
    <String, dynamic>{
      if (instance.grantType case final value?) 'grant_type': value,
      if (instance.username case final value?) 'username': value,
      if (instance.password case final value?) 'password': value,
      if (instance.refreshToken case final value?) 'refresh_token': value,
      if (instance.scope case final value?) 'scope': value,
      if (instance.clientId case final value?) 'client_id': value,
      if (instance.clientSecret case final value?) 'client_secret': value,
    };

ApiV1AuthenticationCompleteProfilePost$RequestBody
    _$ApiV1AuthenticationCompleteProfilePost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthenticationCompleteProfilePost$RequestBody(
          pofileImage: json['PofileImage'] as String?,
        );

Map<String, dynamic> _$ApiV1AuthenticationCompleteProfilePost$RequestBodyToJson(
        ApiV1AuthenticationCompleteProfilePost$RequestBody instance) =>
    <String, dynamic>{
      if (instance.pofileImage case final value?) 'PofileImage': value,
    };

ApiV1BookAddPost$RequestBody _$ApiV1BookAddPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiV1BookAddPost$RequestBody(
      fehrestFile: json['FehrestFile'] as String?,
      imageFile: json['ImageFile'] as String?,
      pdfFile: json['PdfFile'] as String?,
    );

Map<String, dynamic> _$ApiV1BookAddPost$RequestBodyToJson(
        ApiV1BookAddPost$RequestBody instance) =>
    <String, dynamic>{
      if (instance.fehrestFile case final value?) 'FehrestFile': value,
      if (instance.imageFile case final value?) 'ImageFile': value,
      if (instance.pdfFile case final value?) 'PdfFile': value,
    };

ApiV1BookAddddPost$RequestBody _$ApiV1BookAddddPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiV1BookAddddPost$RequestBody(
      file: json['File'] as String?,
    );

Map<String, dynamic> _$ApiV1BookAddddPost$RequestBodyToJson(
        ApiV1BookAddddPost$RequestBody instance) =>
    <String, dynamic>{
      if (instance.file case final value?) 'File': value,
    };

ApiV1UserUpdateProfilePost$RequestBody
    _$ApiV1UserUpdateProfilePost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1UserUpdateProfilePost$RequestBody(
          userAvatarFile: json['UserAvatarFile'] as String?,
        );

Map<String, dynamic> _$ApiV1UserUpdateProfilePost$RequestBodyToJson(
        ApiV1UserUpdateProfilePost$RequestBody instance) =>
    <String, dynamic>{
      if (instance.userAvatarFile case final value?) 'UserAvatarFile': value,
    };
