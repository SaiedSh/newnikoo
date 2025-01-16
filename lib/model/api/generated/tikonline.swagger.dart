// ignore_for_file: type=lint

import 'dart:async';

import 'package:chopper/chopper.dart' as chopper;
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

import 'client_mapping.dart';
import 'tikonline.enums.swagger.dart' as enums;
import 'tikonline.models.swagger.dart';

export 'tikonline.enums.swagger.dart';
export 'tikonline.models.swagger.dart';

part 'tikonline.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Tikonline extends ChopperService {
  static Tikonline create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$Tikonline(client);
    }

    final newClient = ChopperClient(
        services: [_$Tikonline()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Tikonline(newClient);
  }

  ///
  ///@param Banner1ImageUrl
  ///@param Banner1Title
  ///@param Banner1SubTitle
  ///@param Banner1Description
  ///@param Banner1ButtonText
  ///@param Banner1ButtonLink
  ///@param Banner2ImageUrl
  ///@param Banner2Title
  ///@param Banner2SubTitle
  ///@param Banner2Description
  ///@param Banner2ButtonText
  ///@param Banner2ButtonLink
  ///@param Banner3ImageUrl
  ///@param Banner3Title
  ///@param Banner3SubTitle
  ///@param Banner3Description
  ///@param Banner3ButtonText
  ///@param Banner3ButtonLink
  ///@param Id
  Future<chopper.Response> apiV1AdminIndexPost({
    String? banner1ImageUrl,
    String? banner1Title,
    String? banner1SubTitle,
    String? banner1Description,
    String? banner1ButtonText,
    String? banner1ButtonLink,
    String? banner2ImageUrl,
    String? banner2Title,
    String? banner2SubTitle,
    String? banner2Description,
    String? banner2ButtonText,
    String? banner2ButtonLink,
    String? banner3ImageUrl,
    String? banner3Title,
    String? banner3SubTitle,
    String? banner3Description,
    String? banner3ButtonText,
    String? banner3ButtonLink,
    String? id,
    List<int>? Banner1ImageFile,
    List<int>? Banner2ImageFile,
    List<int>? Banner3ImageFile,
  }) {
    return _apiV1AdminIndexPost(
        banner1ImageUrl: banner1ImageUrl,
        banner1Title: banner1Title,
        banner1SubTitle: banner1SubTitle,
        banner1Description: banner1Description,
        banner1ButtonText: banner1ButtonText,
        banner1ButtonLink: banner1ButtonLink,
        banner2ImageUrl: banner2ImageUrl,
        banner2Title: banner2Title,
        banner2SubTitle: banner2SubTitle,
        banner2Description: banner2Description,
        banner2ButtonText: banner2ButtonText,
        banner2ButtonLink: banner2ButtonLink,
        banner3ImageUrl: banner3ImageUrl,
        banner3Title: banner3Title,
        banner3SubTitle: banner3SubTitle,
        banner3Description: banner3Description,
        banner3ButtonText: banner3ButtonText,
        banner3ButtonLink: banner3ButtonLink,
        id: id,
        Banner1ImageFile: Banner1ImageFile,
        Banner2ImageFile: Banner2ImageFile,
        Banner3ImageFile: Banner3ImageFile);
  }

  ///
  ///@param Banner1ImageUrl
  ///@param Banner1Title
  ///@param Banner1SubTitle
  ///@param Banner1Description
  ///@param Banner1ButtonText
  ///@param Banner1ButtonLink
  ///@param Banner2ImageUrl
  ///@param Banner2Title
  ///@param Banner2SubTitle
  ///@param Banner2Description
  ///@param Banner2ButtonText
  ///@param Banner2ButtonLink
  ///@param Banner3ImageUrl
  ///@param Banner3Title
  ///@param Banner3SubTitle
  ///@param Banner3Description
  ///@param Banner3ButtonText
  ///@param Banner3ButtonLink
  ///@param Id
  @Post(
    path: 'https://api.tikonline.net/api/v1/Admin/Index',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1AdminIndexPost({
    @Query('Banner1ImageUrl') String? banner1ImageUrl,
    @Query('Banner1Title') String? banner1Title,
    @Query('Banner1SubTitle') String? banner1SubTitle,
    @Query('Banner1Description') String? banner1Description,
    @Query('Banner1ButtonText') String? banner1ButtonText,
    @Query('Banner1ButtonLink') String? banner1ButtonLink,
    @Query('Banner2ImageUrl') String? banner2ImageUrl,
    @Query('Banner2Title') String? banner2Title,
    @Query('Banner2SubTitle') String? banner2SubTitle,
    @Query('Banner2Description') String? banner2Description,
    @Query('Banner2ButtonText') String? banner2ButtonText,
    @Query('Banner2ButtonLink') String? banner2ButtonLink,
    @Query('Banner3ImageUrl') String? banner3ImageUrl,
    @Query('Banner3Title') String? banner3Title,
    @Query('Banner3SubTitle') String? banner3SubTitle,
    @Query('Banner3Description') String? banner3Description,
    @Query('Banner3ButtonText') String? banner3ButtonText,
    @Query('Banner3ButtonLink') String? banner3ButtonLink,
    @Query('Id') String? id,
    @PartFile() List<int>? Banner1ImageFile,
    @PartFile() List<int>? Banner2ImageFile,
    @PartFile() List<int>? Banner3ImageFile,
  });

  ///
  Future<chopper.Response<NotificationDtoApiResult>>
      apiV1AuthenticationNotifListGet() {
    generatedMapping.putIfAbsent(NotificationDtoApiResult,
        () => NotificationDtoApiResult.fromJsonFactory);

    return _apiV1AuthenticationNotifListGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/Authentication/NotifList')
  Future<chopper.Response<NotificationDtoApiResult>>
      _apiV1AuthenticationNotifListGet();

  ///
  Future<chopper.Response<AccessToken>> apiV1AuthenticationFreeTokenPost({
    String? grantType,
    String? username,
    String? password,
    String? refreshToken,
    String? scope,
    String? clientId,
    String? clientSecret,
  }) {
    generatedMapping.putIfAbsent(
        AccessToken, () => AccessToken.fromJsonFactory);

    return _apiV1AuthenticationFreeTokenPost(
        grantType: grantType,
        username: username,
        password: password,
        refreshToken: refreshToken,
        scope: scope,
        clientId: clientId,
        clientSecret: clientSecret);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Authentication/FreeToken',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<AccessToken>> _apiV1AuthenticationFreeTokenPost({
    @Part('grant_type') String? grantType,
    @Part('username') String? username,
    @Part('password') String? password,
    @Part('refresh_token') String? refreshToken,
    @Part('scope') String? scope,
    @Part('client_id') String? clientId,
    @Part('client_secret') String? clientSecret,
  });

  ///
  Future<chopper.Response<TempUserDtoApiResult>>
      apiV1AuthenticationLoginSignUpPost({required TempUserDto? body}) {
    generatedMapping.putIfAbsent(
        TempUserDtoApiResult, () => TempUserDtoApiResult.fromJsonFactory);

    return _apiV1AuthenticationLoginSignUpPost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Authentication/Login_SignUp',
    optionalBody: true,
  )
  Future<chopper.Response<TempUserDtoApiResult>>
      _apiV1AuthenticationLoginSignUpPost({@Body() required TempUserDto? body});

  ///
  Future<chopper.Response<AccessToken>>
      apiV1AuthenticationLoginSignUpValidationPost(
          {required TempUserDto? body}) {
    generatedMapping.putIfAbsent(
        AccessToken, () => AccessToken.fromJsonFactory);

    return _apiV1AuthenticationLoginSignUpValidationPost(body: body);
  }

  ///
  @Post(
    path:
        'https://api.tikonline.net/api/v1/Authentication/Login_SignUpValidation',
    optionalBody: true,
  )
  Future<chopper.Response<AccessToken>>
      _apiV1AuthenticationLoginSignUpValidationPost(
          {@Body() required TempUserDto? body});

  ///
  Future<chopper.Response<NationalLoginDtoApiResult>>
      apiV1AuthenticationNationalLoginPost({required NationalLoginDto? body}) {
    generatedMapping.putIfAbsent(NationalLoginDtoApiResult,
        () => NationalLoginDtoApiResult.fromJsonFactory);

    return _apiV1AuthenticationNationalLoginPost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Authentication/NationalLogin',
    optionalBody: true,
  )
  Future<chopper.Response<NationalLoginDtoApiResult>>
      _apiV1AuthenticationNationalLoginPost(
          {@Body() required NationalLoginDto? body});

  ///
  Future<chopper.Response<UserDtoApiResult>>
      apiV1AuthenticationNationalLoginValidationPost(
          {required NationalLoginDto? body}) {
    generatedMapping.putIfAbsent(
        UserDtoApiResult, () => UserDtoApiResult.fromJsonFactory);

    return _apiV1AuthenticationNationalLoginValidationPost(body: body);
  }

  ///
  @Post(
    path:
        'https://api.tikonline.net/api/v1/Authentication/NationalLoginValidation',
    optionalBody: true,
  )
  Future<chopper.Response<UserDtoApiResult>>
      _apiV1AuthenticationNationalLoginValidationPost(
          {@Body() required NationalLoginDto? body});

  ///
  Future<chopper.Response> apiV1AuthenticationSignOutGet() {
    return _apiV1AuthenticationSignOutGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/Authentication/SignOut')
  Future<chopper.Response> _apiV1AuthenticationSignOutGet();

  ///
  Future<chopper.Response<AccessToken>> apiV1AuthenticationStaffAuthPost(
      {required LoginDto? body}) {
    generatedMapping.putIfAbsent(
        AccessToken, () => AccessToken.fromJsonFactory);

    return _apiV1AuthenticationStaffAuthPost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Authentication/StaffAuth',
    optionalBody: true,
  )
  Future<chopper.Response<AccessToken>> _apiV1AuthenticationStaffAuthPost(
      {@Body() required LoginDto? body});

  ///
  Future<chopper.Response<ClientLoginDtoApiResult>>
      apiV1AuthenticationClientLoginPost({required ClientLoginDto? body}) {
    generatedMapping.putIfAbsent(
        ClientLoginDtoApiResult, () => ClientLoginDtoApiResult.fromJsonFactory);

    return _apiV1AuthenticationClientLoginPost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Authentication/ClientLogin',
    optionalBody: true,
  )
  Future<chopper.Response<ClientLoginDtoApiResult>>
      _apiV1AuthenticationClientLoginPost(
          {@Body() required ClientLoginDto? body});

  ///
  Future<chopper.Response<AccessToken>>
      apiV1AuthenticationClientLoginValidatePost(
          {required ClientLoginDto? body}) {
    generatedMapping.putIfAbsent(
        AccessToken, () => AccessToken.fromJsonFactory);

    return _apiV1AuthenticationClientLoginValidatePost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Authentication/ClientLoginValidate',
    optionalBody: true,
  )
  Future<chopper.Response<AccessToken>>
      _apiV1AuthenticationClientLoginValidatePost(
          {@Body() required ClientLoginDto? body});

  ///
  ///@param FirstName
  ///@param LastName
  ///@param PhoneNumber
  ///@param NationalCode
  ///@param Reshte
  ///@param Takhasos
  Future<chopper.Response<ApiResult>> apiV1AuthenticationCompleteProfilePost({
    required String? firstName,
    required String? lastName,
    required String? phoneNumber,
    required String? nationalCode,
    String? reshte,
    String? takhasos,
    List<int>? PofileImage,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1AuthenticationCompleteProfilePost(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        nationalCode: nationalCode,
        reshte: reshte,
        takhasos: takhasos,
        PofileImage: PofileImage);
  }

  ///
  ///@param FirstName
  ///@param LastName
  ///@param PhoneNumber
  ///@param NationalCode
  ///@param Reshte
  ///@param Takhasos
  @Post(
    path: 'https://api.tikonline.net/api/v1/Authentication/CompleteProfile',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ApiResult>> _apiV1AuthenticationCompleteProfilePost({
    @Query('FirstName') required String? firstName,
    @Query('LastName') required String? lastName,
    @Query('PhoneNumber') required String? phoneNumber,
    @Query('NationalCode') required String? nationalCode,
    @Query('Reshte') String? reshte,
    @Query('Takhasos') String? takhasos,
    @PartFile() List<int>? PofileImage,
  });

  ///
  ///@param CategortyId
  Future<chopper.Response<BookDtoListApiResult>> apiV1BookListGet(
      {String? categortyId}) {
    generatedMapping.putIfAbsent(
        BookDtoListApiResult, () => BookDtoListApiResult.fromJsonFactory);

    return _apiV1BookListGet(categortyId: categortyId);
  }

  ///
  ///@param CategortyId
  @Get(path: 'https://api.tikonline.net/api/v1/Book/List')
  Future<chopper.Response<BookDtoListApiResult>> _apiV1BookListGet(
      {@Query('CategortyId') String? categortyId});

  ///
  Future<chopper.Response<IndexDtoApiResult>> apiV1BookIndexGet() {
    generatedMapping.putIfAbsent(
        IndexDtoApiResult, () => IndexDtoApiResult.fromJsonFactory);

    return _apiV1BookIndexGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/Book/Index')
  Future<chopper.Response<IndexDtoApiResult>> _apiV1BookIndexGet();

  ///
  ///@param BookId
  Future<chopper.Response<BookDtoApiResult>> apiV1BookDetailGet(
      {String? bookId}) {
    generatedMapping.putIfAbsent(
        BookDtoApiResult, () => BookDtoApiResult.fromJsonFactory);

    return _apiV1BookDetailGet(bookId: bookId);
  }

  ///
  ///@param BookId
  @Get(path: 'https://api.tikonline.net/api/v1/Book/Detail')
  Future<chopper.Response<BookDtoApiResult>> _apiV1BookDetailGet(
      {@Query('BookId') String? bookId});

  ///
  ///@param Code
  ///@param Niko
  ///@param Online
  ///@param Physical
  ///@param DiscountPercentage
  ///@param PhysicalLink
  ///@param SamplePdfLink
  ///@param Title
  ///@param Description
  ///@param ImageUrl
  ///@param PdfLink
  ///@param PdfSize
  ///@param Like
  ///@param Read
  ///@param Shelf
  ///@param Buy
  ///@param Nevisande
  ///@param Entesharat
  ///@param Motarjem
  ///@param Moalef
  ///@param ZirNazar
  ///@param SarparastMotarjem
  ///@param SarparastMoalef
  ///@param BaHamkari
  ///@param BeKooshesh
  ///@param GerdAvariVaTaalif
  ///@param BaMoqadameVaNezarat
  ///@param Virastar
  ///@param VirastarElmi
  ///@param VirayeshElmi
  ///@param Pages
  ///@param NobatChap
  ///@param TarikhChap
  ///@param RangChap
  ///@param QatKetab
  ///@param NoSahafi
  ///@param NoKaqaz
  ///@param ShomareShabak
  ///@param FormatMohtava
  ///@param ZamanMotalee
  ///@param Zaban
  ///@param QeymatArzi
  ///@param QeymatChapi
  ///@param SalEnteshar
  ///@param Rating
  ///@param Price
  ///@param DiscountPrice
  ///@param TotalPrice
  ///@param ViewCount
  ///@param CategoryId
  ///@param CategoryTitle
  ///@param MyReview.CreationDateTime
  ///@param MyReview.Message
  ///@param MyReview.Rate
  ///@param MyReview.BookId
  ///@param MyReview.BookTitle
  ///@param MyReview.BookImageUrl
  ///@param MyReview.BookNevisande
  ///@param MyReview.BookEntesharat
  ///@param MyReview.BookMotarjem
  ///@param MyReview.BookSalEnteshar
  ///@param MyReview.BookPages
  ///@param MyReview.BookRating
  ///@param MyReview.BookPrice
  ///@param MyReview.BookDiscountPrice
  ///@param MyReview.BookViewCount
  ///@param MyReview.BookCategoryId
  ///@param MyReview.BookCategoryName
  ///@param MyReview.UserId
  ///@param MyReview.UserFirstName
  ///@param MyReview.UserLastName
  ///@param MyReview.Id
  ///@param SimilarBooks
  ///@param BookReviewss
  ///@param BookCategories
  ///@param Id
  Future<chopper.Response<ApiResult>> apiV1BookAddPost({
    String? code,
    bool? niko,
    bool? online,
    bool? physical,
    int? discountPercentage,
    String? physicalLink,
    String? samplePdfLink,
    String? title,
    String? description,
    String? imageUrl,
    String? pdfLink,
    String? pdfSize,
    bool? like,
    bool? read,
    bool? shelf,
    bool? buy,
    String? nevisande,
    String? entesharat,
    String? motarjem,
    String? moalef,
    String? zirNazar,
    String? sarparastMotarjem,
    String? sarparastMoalef,
    String? baHamkari,
    String? beKooshesh,
    String? gerdAvariVaTaalif,
    String? baMoqadameVaNezarat,
    String? virastar,
    String? virastarElmi,
    String? virayeshElmi,
    int? pages,
    String? nobatChap,
    String? tarikhChap,
    String? rangChap,
    String? qatKetab,
    String? noSahafi,
    String? noKaqaz,
    String? shomareShabak,
    String? formatMohtava,
    String? zamanMotalee,
    String? zaban,
    String? qeymatArzi,
    String? qeymatChapi,
    String? salEnteshar,
    int? rating,
    int? price,
    int? discountPrice,
    int? totalPrice,
    int? viewCount,
    String? categoryId,
    String? categoryTitle,
    DateTime? myReviewCreationDateTime,
    String? myReviewMessage,
    int? myReviewRate,
    String? myReviewBookId,
    String? myReviewBookTitle,
    String? myReviewBookImageUrl,
    String? myReviewBookNevisande,
    String? myReviewBookEntesharat,
    String? myReviewBookMotarjem,
    String? myReviewBookSalEnteshar,
    int? myReviewBookPages,
    int? myReviewBookRating,
    int? myReviewBookPrice,
    int? myReviewBookDiscountPrice,
    int? myReviewBookViewCount,
    String? myReviewBookCategoryId,
    String? myReviewBookCategoryName,
    String? myReviewUserId,
    String? myReviewUserFirstName,
    String? myReviewUserLastName,
    String? myReviewId,
    List<BookDto>? similarBooks,
    List<BookReviewDto>? bookReviewss,
    List<BookCategoryDto>? bookCategories,
    String? id,
    List<int>? ImageFile,
    List<int>? PdfFile,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1BookAddPost(
        code: code,
        niko: niko,
        online: online,
        physical: physical,
        discountPercentage: discountPercentage,
        physicalLink: physicalLink,
        samplePdfLink: samplePdfLink,
        title: title,
        description: description,
        imageUrl: imageUrl,
        pdfLink: pdfLink,
        pdfSize: pdfSize,
        like: like,
        read: read,
        shelf: shelf,
        buy: buy,
        nevisande: nevisande,
        entesharat: entesharat,
        motarjem: motarjem,
        moalef: moalef,
        zirNazar: zirNazar,
        sarparastMotarjem: sarparastMotarjem,
        sarparastMoalef: sarparastMoalef,
        baHamkari: baHamkari,
        beKooshesh: beKooshesh,
        gerdAvariVaTaalif: gerdAvariVaTaalif,
        baMoqadameVaNezarat: baMoqadameVaNezarat,
        virastar: virastar,
        virastarElmi: virastarElmi,
        virayeshElmi: virayeshElmi,
        pages: pages,
        nobatChap: nobatChap,
        tarikhChap: tarikhChap,
        rangChap: rangChap,
        qatKetab: qatKetab,
        noSahafi: noSahafi,
        noKaqaz: noKaqaz,
        shomareShabak: shomareShabak,
        formatMohtava: formatMohtava,
        zamanMotalee: zamanMotalee,
        zaban: zaban,
        qeymatArzi: qeymatArzi,
        qeymatChapi: qeymatChapi,
        salEnteshar: salEnteshar,
        rating: rating,
        price: price,
        discountPrice: discountPrice,
        totalPrice: totalPrice,
        viewCount: viewCount,
        categoryId: categoryId,
        categoryTitle: categoryTitle,
        myReviewCreationDateTime: myReviewCreationDateTime,
        myReviewMessage: myReviewMessage,
        myReviewRate: myReviewRate,
        myReviewBookId: myReviewBookId,
        myReviewBookTitle: myReviewBookTitle,
        myReviewBookImageUrl: myReviewBookImageUrl,
        myReviewBookNevisande: myReviewBookNevisande,
        myReviewBookEntesharat: myReviewBookEntesharat,
        myReviewBookMotarjem: myReviewBookMotarjem,
        myReviewBookSalEnteshar: myReviewBookSalEnteshar,
        myReviewBookPages: myReviewBookPages,
        myReviewBookRating: myReviewBookRating,
        myReviewBookPrice: myReviewBookPrice,
        myReviewBookDiscountPrice: myReviewBookDiscountPrice,
        myReviewBookViewCount: myReviewBookViewCount,
        myReviewBookCategoryId: myReviewBookCategoryId,
        myReviewBookCategoryName: myReviewBookCategoryName,
        myReviewUserId: myReviewUserId,
        myReviewUserFirstName: myReviewUserFirstName,
        myReviewUserLastName: myReviewUserLastName,
        myReviewId: myReviewId,
        similarBooks: similarBooks,
        bookReviewss: bookReviewss,
        bookCategories: bookCategories,
        id: id,
        ImageFile: ImageFile,
        PdfFile: PdfFile);
  }

  ///
  ///@param Code
  ///@param Niko
  ///@param Online
  ///@param Physical
  ///@param DiscountPercentage
  ///@param PhysicalLink
  ///@param SamplePdfLink
  ///@param Title
  ///@param Description
  ///@param ImageUrl
  ///@param PdfLink
  ///@param PdfSize
  ///@param Like
  ///@param Read
  ///@param Shelf
  ///@param Buy
  ///@param Nevisande
  ///@param Entesharat
  ///@param Motarjem
  ///@param Moalef
  ///@param ZirNazar
  ///@param SarparastMotarjem
  ///@param SarparastMoalef
  ///@param BaHamkari
  ///@param BeKooshesh
  ///@param GerdAvariVaTaalif
  ///@param BaMoqadameVaNezarat
  ///@param Virastar
  ///@param VirastarElmi
  ///@param VirayeshElmi
  ///@param Pages
  ///@param NobatChap
  ///@param TarikhChap
  ///@param RangChap
  ///@param QatKetab
  ///@param NoSahafi
  ///@param NoKaqaz
  ///@param ShomareShabak
  ///@param FormatMohtava
  ///@param ZamanMotalee
  ///@param Zaban
  ///@param QeymatArzi
  ///@param QeymatChapi
  ///@param SalEnteshar
  ///@param Rating
  ///@param Price
  ///@param DiscountPrice
  ///@param TotalPrice
  ///@param ViewCount
  ///@param CategoryId
  ///@param CategoryTitle
  ///@param MyReview.CreationDateTime
  ///@param MyReview.Message
  ///@param MyReview.Rate
  ///@param MyReview.BookId
  ///@param MyReview.BookTitle
  ///@param MyReview.BookImageUrl
  ///@param MyReview.BookNevisande
  ///@param MyReview.BookEntesharat
  ///@param MyReview.BookMotarjem
  ///@param MyReview.BookSalEnteshar
  ///@param MyReview.BookPages
  ///@param MyReview.BookRating
  ///@param MyReview.BookPrice
  ///@param MyReview.BookDiscountPrice
  ///@param MyReview.BookViewCount
  ///@param MyReview.BookCategoryId
  ///@param MyReview.BookCategoryName
  ///@param MyReview.UserId
  ///@param MyReview.UserFirstName
  ///@param MyReview.UserLastName
  ///@param MyReview.Id
  ///@param SimilarBooks
  ///@param BookReviewss
  ///@param BookCategories
  ///@param Id
  @Post(
    path: 'https://api.tikonline.net/api/v1/Book/Add',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ApiResult>> _apiV1BookAddPost({
    @Query('Code') String? code,
    @Query('Niko') bool? niko,
    @Query('Online') bool? online,
    @Query('Physical') bool? physical,
    @Query('DiscountPercentage') int? discountPercentage,
    @Query('PhysicalLink') String? physicalLink,
    @Query('SamplePdfLink') String? samplePdfLink,
    @Query('Title') String? title,
    @Query('Description') String? description,
    @Query('ImageUrl') String? imageUrl,
    @Query('PdfLink') String? pdfLink,
    @Query('PdfSize') String? pdfSize,
    @Query('Like') bool? like,
    @Query('Read') bool? read,
    @Query('Shelf') bool? shelf,
    @Query('Buy') bool? buy,
    @Query('Nevisande') String? nevisande,
    @Query('Entesharat') String? entesharat,
    @Query('Motarjem') String? motarjem,
    @Query('Moalef') String? moalef,
    @Query('ZirNazar') String? zirNazar,
    @Query('SarparastMotarjem') String? sarparastMotarjem,
    @Query('SarparastMoalef') String? sarparastMoalef,
    @Query('BaHamkari') String? baHamkari,
    @Query('BeKooshesh') String? beKooshesh,
    @Query('GerdAvariVaTaalif') String? gerdAvariVaTaalif,
    @Query('BaMoqadameVaNezarat') String? baMoqadameVaNezarat,
    @Query('Virastar') String? virastar,
    @Query('VirastarElmi') String? virastarElmi,
    @Query('VirayeshElmi') String? virayeshElmi,
    @Query('Pages') int? pages,
    @Query('NobatChap') String? nobatChap,
    @Query('TarikhChap') String? tarikhChap,
    @Query('RangChap') String? rangChap,
    @Query('QatKetab') String? qatKetab,
    @Query('NoSahafi') String? noSahafi,
    @Query('NoKaqaz') String? noKaqaz,
    @Query('ShomareShabak') String? shomareShabak,
    @Query('FormatMohtava') String? formatMohtava,
    @Query('ZamanMotalee') String? zamanMotalee,
    @Query('Zaban') String? zaban,
    @Query('QeymatArzi') String? qeymatArzi,
    @Query('QeymatChapi') String? qeymatChapi,
    @Query('SalEnteshar') String? salEnteshar,
    @Query('Rating') int? rating,
    @Query('Price') int? price,
    @Query('DiscountPrice') int? discountPrice,
    @Query('TotalPrice') int? totalPrice,
    @Query('ViewCount') int? viewCount,
    @Query('CategoryId') String? categoryId,
    @Query('CategoryTitle') String? categoryTitle,
    @Query('MyReview.CreationDateTime') DateTime? myReviewCreationDateTime,
    @Query('MyReview.Message') String? myReviewMessage,
    @Query('MyReview.Rate') int? myReviewRate,
    @Query('MyReview.BookId') String? myReviewBookId,
    @Query('MyReview.BookTitle') String? myReviewBookTitle,
    @Query('MyReview.BookImageUrl') String? myReviewBookImageUrl,
    @Query('MyReview.BookNevisande') String? myReviewBookNevisande,
    @Query('MyReview.BookEntesharat') String? myReviewBookEntesharat,
    @Query('MyReview.BookMotarjem') String? myReviewBookMotarjem,
    @Query('MyReview.BookSalEnteshar') String? myReviewBookSalEnteshar,
    @Query('MyReview.BookPages') int? myReviewBookPages,
    @Query('MyReview.BookRating') int? myReviewBookRating,
    @Query('MyReview.BookPrice') int? myReviewBookPrice,
    @Query('MyReview.BookDiscountPrice') int? myReviewBookDiscountPrice,
    @Query('MyReview.BookViewCount') int? myReviewBookViewCount,
    @Query('MyReview.BookCategoryId') String? myReviewBookCategoryId,
    @Query('MyReview.BookCategoryName') String? myReviewBookCategoryName,
    @Query('MyReview.UserId') String? myReviewUserId,
    @Query('MyReview.UserFirstName') String? myReviewUserFirstName,
    @Query('MyReview.UserLastName') String? myReviewUserLastName,
    @Query('MyReview.Id') String? myReviewId,
    @Query('SimilarBooks') List<BookDto>? similarBooks,
    @Query('BookReviewss') List<BookReviewDto>? bookReviewss,
    @Query('BookCategories') List<BookCategoryDto>? bookCategories,
    @Query('Id') String? id,
    @PartFile() List<int>? ImageFile,
    @PartFile() List<int>? PdfFile,
  });

  ///
  Future<chopper.Response<ApiResult>> apiV1BookAddddPost({List<int>? File}) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1BookAddddPost(File: File);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Book/adddd',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ApiResult>> _apiV1BookAddddPost(
      {@PartFile() List<int>? File});

  ///
  ///@param st
  Future<chopper.Response<BookDtoListApiResult>> apiV1BookSavedBooksGet(
      {enums.SaveType? st}) {
    generatedMapping.putIfAbsent(
        BookDtoListApiResult, () => BookDtoListApiResult.fromJsonFactory);

    return _apiV1BookSavedBooksGet(st: st?.value?.toString());
  }

  ///
  ///@param st
  @Get(path: 'https://api.tikonline.net/api/v1/Book/SavedBooks')
  Future<chopper.Response<BookDtoListApiResult>> _apiV1BookSavedBooksGet(
      {@Query('st') String? st});

  ///
  ///@param BookId
  ///@param st
  Future<chopper.Response<ApiResult>> apiV1BookSaveBookPost({
    String? bookId,
    enums.SaveType? st,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1BookSaveBookPost(bookId: bookId, st: st?.value?.toString());
  }

  ///
  ///@param BookId
  ///@param st
  @Post(
    path: 'https://api.tikonline.net/api/v1/Book/SaveBook',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1BookSaveBookPost({
    @Query('BookId') String? bookId,
    @Query('st') String? st,
  });

  ///
  Future<chopper.Response<ApiResult>> apiV1BookAddBookReviewPost(
      {required AddBookReviewDto? body}) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1BookAddBookReviewPost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Book/AddBookReview',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1BookAddBookReviewPost(
      {@Body() required AddBookReviewDto? body});

  ///
  Future<chopper.Response<BookReviewDtoListApiResult>> apiV1BookMyReviewsGet() {
    generatedMapping.putIfAbsent(BookReviewDtoListApiResult,
        () => BookReviewDtoListApiResult.fromJsonFactory);

    return _apiV1BookMyReviewsGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/Book/MyReviews')
  Future<chopper.Response<BookReviewDtoListApiResult>> _apiV1BookMyReviewsGet();

  ///
  Future<chopper.Response<BookDtoListApiResult>> apiV1BookSearchandFilterPost(
      {required BookSearchDto? body}) {
    generatedMapping.putIfAbsent(
        BookDtoListApiResult, () => BookDtoListApiResult.fromJsonFactory);

    return _apiV1BookSearchandFilterPost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Book/SearchandFilter',
    optionalBody: true,
  )
  Future<chopper.Response<BookDtoListApiResult>> _apiV1BookSearchandFilterPost(
      {@Body() required BookSearchDto? body});

  ///
  ///@param MotherId
  Future<chopper.Response<CategoryDtoListApiResult>> apiV1CategoryListGet(
      {String? motherId}) {
    generatedMapping.putIfAbsent(CategoryDtoListApiResult,
        () => CategoryDtoListApiResult.fromJsonFactory);

    return _apiV1CategoryListGet(motherId: motherId);
  }

  ///
  ///@param MotherId
  @Get(path: 'https://api.tikonline.net/api/v1/Category/List')
  Future<chopper.Response<CategoryDtoListApiResult>> _apiV1CategoryListGet(
      {@Query('MotherId') String? motherId});

  ///
  Future<chopper.Response<ApiResult>> apiV1CategoryAddPost(
      {required CategoryDto? body}) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1CategoryAddPost(body: body);
  }

  ///
  @Post(
    path: 'https://api.tikonline.net/api/v1/Category/Add',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1CategoryAddPost(
      {@Body() required CategoryDto? body});

  ///
  ///@param Price
  Future<chopper.Response<StringApiResult>> apiV1PaymentWalletChargeGet(
      {int? price}) {
    generatedMapping.putIfAbsent(
        StringApiResult, () => StringApiResult.fromJsonFactory);

    return _apiV1PaymentWalletChargeGet(price: price);
  }

  ///
  ///@param Price
  @Get(path: 'https://api.tikonline.net/api/v1/Payment/WalletCharge')
  Future<chopper.Response<StringApiResult>> _apiV1PaymentWalletChargeGet(
      {@Query('Price') int? price});

  ///
  ///@param Status
  ///@param authority
  ///@param am
  ///@param UserId
  Future<chopper.Response> apiV1PaymentVerifyPaymentWalletGet({
    String? status,
    String? authority,
    String? am,
    String? userId,
  }) {
    return _apiV1PaymentVerifyPaymentWalletGet(
        status: status, authority: authority, am: am, userId: userId);
  }

  ///
  ///@param Status
  ///@param authority
  ///@param am
  ///@param UserId
  @Get(path: 'https://api.tikonline.net/api/v1/Payment/VerifyPaymentWallet')
  Future<chopper.Response> _apiV1PaymentVerifyPaymentWalletGet({
    @Query('Status') String? status,
    @Query('authority') String? authority,
    @Query('am') String? am,
    @Query('UserId') String? userId,
  });

  ///
  ///@param SubId
  ///@param Wallet
  Future<chopper.Response<StringApiResult>> apiV1PaymentBuySubscriptionPost({
    String? subId,
    bool? wallet,
  }) {
    generatedMapping.putIfAbsent(
        StringApiResult, () => StringApiResult.fromJsonFactory);

    return _apiV1PaymentBuySubscriptionPost(subId: subId, wallet: wallet);
  }

  ///
  ///@param SubId
  ///@param Wallet
  @Post(
    path: 'https://api.tikonline.net/api/v1/Payment/BuySubscription',
    optionalBody: true,
  )
  Future<chopper.Response<StringApiResult>> _apiV1PaymentBuySubscriptionPost({
    @Query('SubId') String? subId,
    @Query('Wallet') bool? wallet,
  });

  ///
  ///@param Status
  ///@param authority
  ///@param SubId
  ///@param UserId
  Future<chopper.Response> apiV1PaymentVerifyPaymentSubGet({
    String? status,
    String? authority,
    String? subId,
    String? userId,
  }) {
    return _apiV1PaymentVerifyPaymentSubGet(
        status: status, authority: authority, subId: subId, userId: userId);
  }

  ///
  ///@param Status
  ///@param authority
  ///@param SubId
  ///@param UserId
  @Get(path: 'https://api.tikonline.net/api/v1/Payment/VerifyPaymentSub')
  Future<chopper.Response> _apiV1PaymentVerifyPaymentSubGet({
    @Query('Status') String? status,
    @Query('authority') String? authority,
    @Query('SubId') String? subId,
    @Query('UserId') String? userId,
  });

  ///
  Future<chopper.Response<SubscriptionDtoListApiResult>>
      apiV1PaymentSubscriptionListGet() {
    generatedMapping.putIfAbsent(SubscriptionDtoListApiResult,
        () => SubscriptionDtoListApiResult.fromJsonFactory);

    return _apiV1PaymentSubscriptionListGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/Payment/SubscriptionList')
  Future<chopper.Response<SubscriptionDtoListApiResult>>
      _apiV1PaymentSubscriptionListGet();

  ///
  Future<chopper.Response<PaymentTransactionsDtoListApiResult>>
      apiV1PaymentUserTransactionsGet() {
    generatedMapping.putIfAbsent(PaymentTransactionsDtoListApiResult,
        () => PaymentTransactionsDtoListApiResult.fromJsonFactory);

    return _apiV1PaymentUserTransactionsGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/Payment/UserTransactions')
  Future<chopper.Response<PaymentTransactionsDtoListApiResult>>
      _apiV1PaymentUserTransactionsGet();

  ///
  ///@param Takhasos
  ///@param Kargah
  Future<chopper.Response<StringApiResult>> apiV1PaymentPaymentGet({
    bool? takhasos,
    bool? kargah,
  }) {
    generatedMapping.putIfAbsent(
        StringApiResult, () => StringApiResult.fromJsonFactory);

    return _apiV1PaymentPaymentGet(takhasos: takhasos, kargah: kargah);
  }

  ///
  ///@param Takhasos
  ///@param Kargah
  @Get(path: 'https://api.tikonline.net/api/v1/Payment/Payment')
  Future<chopper.Response<StringApiResult>> _apiV1PaymentPaymentGet({
    @Query('Takhasos') bool? takhasos,
    @Query('Kargah') bool? kargah,
  });

  ///
  ///@param Status
  ///@param authority
  ///@param Takhasos
  ///@param Kargah
  ///@param UserId
  Future<chopper.Response> apiV1PaymentVerifyPaymentGet({
    String? status,
    String? authority,
    bool? takhasos,
    bool? kargah,
    String? userId,
  }) {
    return _apiV1PaymentVerifyPaymentGet(
        status: status,
        authority: authority,
        takhasos: takhasos,
        kargah: kargah,
        userId: userId);
  }

  ///
  ///@param Status
  ///@param authority
  ///@param Takhasos
  ///@param Kargah
  ///@param UserId
  @Get(path: 'https://api.tikonline.net/api/v1/Payment/VerifyPayment')
  Future<chopper.Response> _apiV1PaymentVerifyPaymentGet({
    @Query('Status') String? status,
    @Query('authority') String? authority,
    @Query('Takhasos') bool? takhasos,
    @Query('Kargah') bool? kargah,
    @Query('UserId') String? userId,
  });

  ///Retrieves a ShopCard by unique id
  Future<chopper.Response<ShopCardDtoApiResult>> apiV1ShopCardGetShopCardGet() {
    generatedMapping.putIfAbsent(
        ShopCardDtoApiResult, () => ShopCardDtoApiResult.fromJsonFactory);

    return _apiV1ShopCardGetShopCardGet();
  }

  ///Retrieves a ShopCard by unique id
  @Get(path: 'https://api.tikonline.net/api/v1/ShopCard/GetShopCard')
  Future<chopper.Response<ShopCardDtoApiResult>> _apiV1ShopCardGetShopCardGet();

  ///
  ///@param BookId
  ///@param Remove
  Future<chopper.Response<ApiResult>> apiV1ShopCardAddorRemoveItemPost({
    String? bookId,
    bool? remove,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1ShopCardAddorRemoveItemPost(bookId: bookId, remove: remove);
  }

  ///
  ///@param BookId
  ///@param Remove
  @Post(
    path: 'https://api.tikonline.net/api/v1/ShopCard/AddorRemoveItem',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1ShopCardAddorRemoveItemPost({
    @Query('BookId') String? bookId,
    @Query('Remove') bool? remove,
  });

  ///
  ///@param Wallet
  ///@param DiscountCode
  Future<chopper.Response<ApiResult>> apiV1ShopCardPayShopCardPost({
    bool? wallet,
    String? discountCode,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1ShopCardPayShopCardPost(
        wallet: wallet, discountCode: discountCode);
  }

  ///
  ///@param Wallet
  ///@param DiscountCode
  @Post(
    path: 'https://api.tikonline.net/api/v1/ShopCard/PayShopCard',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1ShopCardPayShopCardPost({
    @Query('Wallet') bool? wallet,
    @Query('DiscountCode') String? discountCode,
  });

  ///
  Future<chopper.Response<BookOrderDtoListApiResult>>
      apiV1ShopCardGetUserOrdersGet() {
    generatedMapping.putIfAbsent(BookOrderDtoListApiResult,
        () => BookOrderDtoListApiResult.fromJsonFactory);

    return _apiV1ShopCardGetUserOrdersGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/ShopCard/GetUserOrders')
  Future<chopper.Response<BookOrderDtoListApiResult>>
      _apiV1ShopCardGetUserOrdersGet();

  ///
  ///@param OrderId
  Future<chopper.Response<BookOrderItemDtoListApiResult>>
      apiV1ShopCardGetItemsOfOrderGet({String? orderId}) {
    generatedMapping.putIfAbsent(BookOrderItemDtoListApiResult,
        () => BookOrderItemDtoListApiResult.fromJsonFactory);

    return _apiV1ShopCardGetItemsOfOrderGet(orderId: orderId);
  }

  ///
  ///@param OrderId
  @Get(path: 'https://api.tikonline.net/api/v1/ShopCard/GetItemsOfOrder')
  Future<chopper.Response<BookOrderItemDtoListApiResult>>
      _apiV1ShopCardGetItemsOfOrderGet({@Query('OrderId') String? orderId});

  ///
  Future<chopper.Response<UserDtoApiResult>> apiV1UserGetProfileGet() {
    generatedMapping.putIfAbsent(
        UserDtoApiResult, () => UserDtoApiResult.fromJsonFactory);

    return _apiV1UserGetProfileGet();
  }

  ///
  @Get(path: 'https://api.tikonline.net/api/v1/User/getProfile')
  Future<chopper.Response<UserDtoApiResult>> _apiV1UserGetProfileGet();

  ///
  ///@param Sex
  ///@param UserName
  ///@param PhoneNumber
  ///@param FirstName
  ///@param LastName
  ///@param NationalCode
  ///@param UserAvatar
  ///@param Password
  ///@param BirthDay
  ///@param LikedCategories
  ///@param ExpertiesId
  ///@param Expertises
  ///@param Categories
  ///@param Id
  Future<chopper.Response<ApiResult>> apiV1UserUpdateProfilePost({
    enums.Sex? sex,
    String? userName,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? nationalCode,
    String? userAvatar,
    String? password,
    DateTime? birthDay,
    String? likedCategories,
    String? expertiesId,
    List<ExpertiseDto>? expertises,
    List<CategoryDto>? categories,
    String? id,
    List<int>? UserAvatarFile,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1UserUpdateProfilePost(
        sex: sex?.value?.toString(),
        userName: userName,
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        nationalCode: nationalCode,
        userAvatar: userAvatar,
        password: password,
        birthDay: birthDay,
        likedCategories: likedCategories,
        expertiesId: expertiesId,
        expertises: expertises,
        categories: categories,
        id: id,
        UserAvatarFile: UserAvatarFile);
  }

  ///
  ///@param Sex
  ///@param UserName
  ///@param PhoneNumber
  ///@param FirstName
  ///@param LastName
  ///@param NationalCode
  ///@param UserAvatar
  ///@param Password
  ///@param BirthDay
  ///@param LikedCategories
  ///@param ExpertiesId
  ///@param Expertises
  ///@param Categories
  ///@param Id
  @Post(
    path: 'https://api.tikonline.net/api/v1/User/UpdateProfile',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ApiResult>> _apiV1UserUpdateProfilePost({
    @Query('Sex') String? sex,
    @Query('UserName') String? userName,
    @Query('PhoneNumber') String? phoneNumber,
    @Query('FirstName') String? firstName,
    @Query('LastName') String? lastName,
    @Query('NationalCode') String? nationalCode,
    @Query('UserAvatar') String? userAvatar,
    @Query('Password') String? password,
    @Query('BirthDay') DateTime? birthDay,
    @Query('LikedCategories') String? likedCategories,
    @Query('ExpertiesId') String? expertiesId,
    @Query('Expertises') List<ExpertiseDto>? expertises,
    @Query('Categories') List<CategoryDto>? categories,
    @Query('Id') String? id,
    @PartFile() List<int>? UserAvatarFile,
  });
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
