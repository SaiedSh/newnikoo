// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'tikonline.enums.swagger.dart' as enums;

part 'tikonline.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class AccessToken {
  const AccessToken({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.role,
    this.complete,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  static const toJsonFactory = _$AccessTokenToJson;
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);

  @JsonKey(name: 'access_token', includeIfNull: false)
  final String? accessToken;
  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;
  @JsonKey(name: 'token_type', includeIfNull: false)
  final String? tokenType;
  @JsonKey(name: 'expires_in', includeIfNull: false)
  final int? expiresIn;
  @JsonKey(name: 'role', includeIfNull: false)
  final String? role;
  @JsonKey(name: 'complete', includeIfNull: false)
  final bool? complete;
  static const fromJsonFactory = _$AccessTokenFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AccessToken &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.complete, complete) ||
                const DeepCollectionEquality()
                    .equals(other.complete, complete)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(complete) ^
      runtimeType.hashCode;
}

extension $AccessTokenExtension on AccessToken {
  AccessToken copyWith(
      {String? accessToken,
      String? refreshToken,
      String? tokenType,
      int? expiresIn,
      String? role,
      bool? complete}) {
    return AccessToken(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        role: role ?? this.role,
        complete: complete ?? this.complete);
  }

  AccessToken copyWithWrapped(
      {Wrapped<String?>? accessToken,
      Wrapped<String?>? refreshToken,
      Wrapped<String?>? tokenType,
      Wrapped<int?>? expiresIn,
      Wrapped<String?>? role,
      Wrapped<bool?>? complete}) {
    return AccessToken(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        tokenType: (tokenType != null ? tokenType.value : this.tokenType),
        expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
        role: (role != null ? role.value : this.role),
        complete: (complete != null ? complete.value : this.complete));
  }
}

@JsonSerializable(explicitToJson: true)
class AddBookReviewDto {
  const AddBookReviewDto({
    this.message,
    this.rate,
    this.bookId,
    this.userId,
    this.id,
  });

  factory AddBookReviewDto.fromJson(Map<String, dynamic> json) =>
      _$AddBookReviewDtoFromJson(json);

  static const toJsonFactory = _$AddBookReviewDtoToJson;
  Map<String, dynamic> toJson() => _$AddBookReviewDtoToJson(this);

  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'rate', includeIfNull: false)
  final int? rate;
  @JsonKey(name: 'bookId', includeIfNull: false)
  final String? bookId;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$AddBookReviewDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AddBookReviewDto &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $AddBookReviewDtoExtension on AddBookReviewDto {
  AddBookReviewDto copyWith(
      {String? message,
      int? rate,
      String? bookId,
      String? userId,
      String? id}) {
    return AddBookReviewDto(
        message: message ?? this.message,
        rate: rate ?? this.rate,
        bookId: bookId ?? this.bookId,
        userId: userId ?? this.userId,
        id: id ?? this.id);
  }

  AddBookReviewDto copyWithWrapped(
      {Wrapped<String?>? message,
      Wrapped<int?>? rate,
      Wrapped<String?>? bookId,
      Wrapped<String?>? userId,
      Wrapped<String?>? id}) {
    return AddBookReviewDto(
        message: (message != null ? message.value : this.message),
        rate: (rate != null ? rate.value : this.rate),
        bookId: (bookId != null ? bookId.value : this.bookId),
        userId: (userId != null ? userId.value : this.userId),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiResult {
  const ApiResult({
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) =>
      _$ApiResultFromJson(json);

  static const toJsonFactory = _$ApiResultToJson;
  Map<String, dynamic> toJson() => _$ApiResultToJson(this);

  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$ApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiResult &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ApiResultExtension on ApiResult {
  ApiResult copyWith(
      {bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return ApiResult(
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  ApiResult copyWithWrapped(
      {Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return ApiResult(
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BookCategoryDto {
  const BookCategoryDto({
    this.bookId,
    this.categoryId,
    this.categoryTitle,
    this.id,
  });

  factory BookCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$BookCategoryDtoFromJson(json);

  static const toJsonFactory = _$BookCategoryDtoToJson;
  Map<String, dynamic> toJson() => _$BookCategoryDtoToJson(this);

  @JsonKey(name: 'bookId', includeIfNull: false)
  final String? bookId;
  @JsonKey(name: 'categoryId', includeIfNull: false)
  final String? categoryId;
  @JsonKey(name: 'categoryTitle', includeIfNull: false)
  final String? categoryTitle;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookCategoryDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookCategoryDto &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.categoryTitle, categoryTitle) ||
                const DeepCollectionEquality()
                    .equals(other.categoryTitle, categoryTitle)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(categoryTitle) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookCategoryDtoExtension on BookCategoryDto {
  BookCategoryDto copyWith(
      {String? bookId, String? categoryId, String? categoryTitle, String? id}) {
    return BookCategoryDto(
        bookId: bookId ?? this.bookId,
        categoryId: categoryId ?? this.categoryId,
        categoryTitle: categoryTitle ?? this.categoryTitle,
        id: id ?? this.id);
  }

  BookCategoryDto copyWithWrapped(
      {Wrapped<String?>? bookId,
      Wrapped<String?>? categoryId,
      Wrapped<String?>? categoryTitle,
      Wrapped<String?>? id}) {
    return BookCategoryDto(
        bookId: (bookId != null ? bookId.value : this.bookId),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        categoryTitle:
            (categoryTitle != null ? categoryTitle.value : this.categoryTitle),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookDto {
  const BookDto({
    this.code,
    this.orderCount,
    this.niko,
    this.online,
    this.physical,
    this.discountPercentage,
    this.physicalLink,
    this.samplePdfLink,
    this.fehrestUrl,
    this.fehrestFile,
    this.title,
    this.description,
    this.imageUrl,
    this.imageFile,
    this.pdfLink,
    this.pdfSize,
    this.pdfFile,
    this.like,
    this.read,
    this.shelf,
    this.buy,
    this.shopCard,
    this.nevisande,
    this.entesharat,
    this.motarjem,
    this.moalef,
    this.zirNazar,
    this.sarparastMotarjem,
    this.sarparastMoalef,
    this.baHamkari,
    this.beKooshesh,
    this.gerdAvariVaTaalif,
    this.baMoqadameVaNezarat,
    this.virastar,
    this.virastarElmi,
    this.virayeshElmi,
    this.pages,
    this.nobatChap,
    this.tarikhChap,
    this.rangChap,
    this.qatKetab,
    this.noSahafi,
    this.noKaqaz,
    this.shomareShabak,
    this.formatMohtava,
    this.zamanMotalee,
    this.zaban,
    this.qeymatArzi,
    this.qeymatChapi,
    this.salEnteshar,
    this.rating,
    this.price,
    this.discountPrice,
    this.totalPrice,
    this.viewCount,
    this.categoryId,
    this.categoryTitle,
    this.myReview,
    this.similarBooks,
    this.bookReviewss,
    this.bookCategories,
    this.id,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  static const toJsonFactory = _$BookDtoToJson;
  Map<String, dynamic> toJson() => _$BookDtoToJson(this);

  @JsonKey(name: 'code', includeIfNull: false)
  final String? code;
  @JsonKey(name: 'orderCount', includeIfNull: false)
  final int? orderCount;
  @JsonKey(name: 'niko', includeIfNull: false)
  final bool? niko;
  @JsonKey(name: 'online', includeIfNull: false)
  final bool? online;
  @JsonKey(name: 'physical', includeIfNull: false)
  final bool? physical;
  @JsonKey(name: 'discountPercentage', includeIfNull: false)
  final int? discountPercentage;
  @JsonKey(name: 'physicalLink', includeIfNull: false)
  final String? physicalLink;
  @JsonKey(name: 'samplePdfLink', includeIfNull: false)
  final String? samplePdfLink;
  @JsonKey(name: 'fehrestUrl', includeIfNull: false)
  final String? fehrestUrl;
  @JsonKey(name: 'fehrestFile', includeIfNull: false)
  final String? fehrestFile;
  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'imageUrl', includeIfNull: false)
  final String? imageUrl;
  @JsonKey(name: 'imageFile', includeIfNull: false)
  final String? imageFile;
  @JsonKey(name: 'pdfLink', includeIfNull: false)
  final String? pdfLink;
  @JsonKey(name: 'pdfSize', includeIfNull: false)
  final String? pdfSize;
  @JsonKey(name: 'pdfFile', includeIfNull: false)
  final String? pdfFile;
  @JsonKey(name: 'like', includeIfNull: false)
  final bool? like;
  @JsonKey(name: 'read', includeIfNull: false)
  final bool? read;
  @JsonKey(name: 'shelf', includeIfNull: false)
  final bool? shelf;
  @JsonKey(name: 'buy', includeIfNull: false)
  final bool? buy;
  @JsonKey(name: 'shopCard', includeIfNull: false)
  final bool? shopCard;
  @JsonKey(name: 'nevisande', includeIfNull: false)
  final String? nevisande;
  @JsonKey(name: 'entesharat', includeIfNull: false)
  final String? entesharat;
  @JsonKey(name: 'motarjem', includeIfNull: false)
  final String? motarjem;
  @JsonKey(name: 'moalef', includeIfNull: false)
  final String? moalef;
  @JsonKey(name: 'zirNazar', includeIfNull: false)
  final String? zirNazar;
  @JsonKey(name: 'sarparastMotarjem', includeIfNull: false)
  final String? sarparastMotarjem;
  @JsonKey(name: 'sarparastMoalef', includeIfNull: false)
  final String? sarparastMoalef;
  @JsonKey(name: 'baHamkari', includeIfNull: false)
  final String? baHamkari;
  @JsonKey(name: 'beKooshesh', includeIfNull: false)
  final String? beKooshesh;
  @JsonKey(name: 'gerdAvariVaTaalif', includeIfNull: false)
  final String? gerdAvariVaTaalif;
  @JsonKey(name: 'baMoqadameVaNezarat', includeIfNull: false)
  final String? baMoqadameVaNezarat;
  @JsonKey(name: 'virastar', includeIfNull: false)
  final String? virastar;
  @JsonKey(name: 'virastarElmi', includeIfNull: false)
  final String? virastarElmi;
  @JsonKey(name: 'virayeshElmi', includeIfNull: false)
  final String? virayeshElmi;
  @JsonKey(name: 'pages', includeIfNull: false)
  final int? pages;
  @JsonKey(name: 'nobatChap', includeIfNull: false)
  final String? nobatChap;
  @JsonKey(name: 'tarikhChap', includeIfNull: false)
  final String? tarikhChap;
  @JsonKey(name: 'rangChap', includeIfNull: false)
  final String? rangChap;
  @JsonKey(name: 'qatKetab', includeIfNull: false)
  final String? qatKetab;
  @JsonKey(name: 'noSahafi', includeIfNull: false)
  final String? noSahafi;
  @JsonKey(name: 'noKaqaz', includeIfNull: false)
  final String? noKaqaz;
  @JsonKey(name: 'shomareShabak', includeIfNull: false)
  final String? shomareShabak;
  @JsonKey(name: 'formatMohtava', includeIfNull: false)
  final String? formatMohtava;
  @JsonKey(name: 'zamanMotalee', includeIfNull: false)
  final String? zamanMotalee;
  @JsonKey(name: 'zaban', includeIfNull: false)
  final String? zaban;
  @JsonKey(name: 'qeymatArzi', includeIfNull: false)
  final String? qeymatArzi;
  @JsonKey(name: 'qeymatChapi', includeIfNull: false)
  final int? qeymatChapi;
  @JsonKey(name: 'salEnteshar', includeIfNull: false)
  final String? salEnteshar;
  @JsonKey(name: 'rating', includeIfNull: false)
  final int? rating;
  @JsonKey(name: 'price', includeIfNull: false)
  final int? price;
  @JsonKey(name: 'discountPrice', includeIfNull: false)
  final int? discountPrice;
  @JsonKey(name: 'totalPrice', includeIfNull: false)
  final int? totalPrice;
  @JsonKey(name: 'viewCount', includeIfNull: false)
  final int? viewCount;
  @JsonKey(name: 'categoryId', includeIfNull: false)
  final String? categoryId;
  @JsonKey(name: 'categoryTitle', includeIfNull: false)
  final String? categoryTitle;
  @JsonKey(name: 'myReview', includeIfNull: false)
  final BookReviewDto? myReview;
  @JsonKey(
      name: 'similarBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? similarBooks;
  @JsonKey(
      name: 'bookReviewss',
      includeIfNull: false,
      defaultValue: <BookReviewDto>[])
  final List<BookReviewDto>? bookReviewss;
  @JsonKey(
      name: 'bookCategories',
      includeIfNull: false,
      defaultValue: <BookCategoryDto>[])
  final List<BookCategoryDto>? bookCategories;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookDto &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.orderCount, orderCount) ||
                const DeepCollectionEquality()
                    .equals(other.orderCount, orderCount)) &&
            (identical(other.niko, niko) ||
                const DeepCollectionEquality().equals(other.niko, niko)) &&
            (identical(other.online, online) ||
                const DeepCollectionEquality().equals(other.online, online)) &&
            (identical(other.physical, physical) ||
                const DeepCollectionEquality()
                    .equals(other.physical, physical)) &&
            (identical(other.discountPercentage, discountPercentage) ||
                const DeepCollectionEquality()
                    .equals(other.discountPercentage, discountPercentage)) &&
            (identical(other.physicalLink, physicalLink) ||
                const DeepCollectionEquality()
                    .equals(other.physicalLink, physicalLink)) &&
            (identical(other.samplePdfLink, samplePdfLink) ||
                const DeepCollectionEquality()
                    .equals(other.samplePdfLink, samplePdfLink)) &&
            (identical(other.fehrestUrl, fehrestUrl) ||
                const DeepCollectionEquality()
                    .equals(other.fehrestUrl, fehrestUrl)) &&
            (identical(other.fehrestFile, fehrestFile) ||
                const DeepCollectionEquality()
                    .equals(other.fehrestFile, fehrestFile)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.pdfLink, pdfLink) ||
                const DeepCollectionEquality()
                    .equals(other.pdfLink, pdfLink)) &&
            (identical(other.pdfSize, pdfSize) ||
                const DeepCollectionEquality()
                    .equals(other.pdfSize, pdfSize)) &&
            (identical(other.pdfFile, pdfFile) ||
                const DeepCollectionEquality()
                    .equals(other.pdfFile, pdfFile)) &&
            (identical(other.like, like) ||
                const DeepCollectionEquality().equals(other.like, like)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)) &&
            (identical(other.shelf, shelf) ||
                const DeepCollectionEquality().equals(other.shelf, shelf)) &&
            (identical(other.buy, buy) ||
                const DeepCollectionEquality().equals(other.buy, buy)) &&
            (identical(other.shopCard, shopCard) ||
                const DeepCollectionEquality()
                    .equals(other.shopCard, shopCard)) &&
            (identical(other.nevisande, nevisande) ||
                const DeepCollectionEquality()
                    .equals(other.nevisande, nevisande)) &&
            (identical(other.entesharat, entesharat) ||
                const DeepCollectionEquality()
                    .equals(other.entesharat, entesharat)) &&
            (identical(other.motarjem, motarjem) ||
                const DeepCollectionEquality()
                    .equals(other.motarjem, motarjem)) &&
            (identical(other.moalef, moalef) ||
                const DeepCollectionEquality().equals(other.moalef, moalef)) &&
            (identical(other.zirNazar, zirNazar) || const DeepCollectionEquality().equals(other.zirNazar, zirNazar)) &&
            (identical(other.sarparastMotarjem, sarparastMotarjem) || const DeepCollectionEquality().equals(other.sarparastMotarjem, sarparastMotarjem)) &&
            (identical(other.sarparastMoalef, sarparastMoalef) || const DeepCollectionEquality().equals(other.sarparastMoalef, sarparastMoalef)) &&
            (identical(other.baHamkari, baHamkari) || const DeepCollectionEquality().equals(other.baHamkari, baHamkari)) &&
            (identical(other.beKooshesh, beKooshesh) || const DeepCollectionEquality().equals(other.beKooshesh, beKooshesh)) &&
            (identical(other.gerdAvariVaTaalif, gerdAvariVaTaalif) || const DeepCollectionEquality().equals(other.gerdAvariVaTaalif, gerdAvariVaTaalif)) &&
            (identical(other.baMoqadameVaNezarat, baMoqadameVaNezarat) || const DeepCollectionEquality().equals(other.baMoqadameVaNezarat, baMoqadameVaNezarat)) &&
            (identical(other.virastar, virastar) || const DeepCollectionEquality().equals(other.virastar, virastar)) &&
            (identical(other.virastarElmi, virastarElmi) || const DeepCollectionEquality().equals(other.virastarElmi, virastarElmi)) &&
            (identical(other.virayeshElmi, virayeshElmi) || const DeepCollectionEquality().equals(other.virayeshElmi, virayeshElmi)) &&
            (identical(other.pages, pages) || const DeepCollectionEquality().equals(other.pages, pages)) &&
            (identical(other.nobatChap, nobatChap) || const DeepCollectionEquality().equals(other.nobatChap, nobatChap)) &&
            (identical(other.tarikhChap, tarikhChap) || const DeepCollectionEquality().equals(other.tarikhChap, tarikhChap)) &&
            (identical(other.rangChap, rangChap) || const DeepCollectionEquality().equals(other.rangChap, rangChap)) &&
            (identical(other.qatKetab, qatKetab) || const DeepCollectionEquality().equals(other.qatKetab, qatKetab)) &&
            (identical(other.noSahafi, noSahafi) || const DeepCollectionEquality().equals(other.noSahafi, noSahafi)) &&
            (identical(other.noKaqaz, noKaqaz) || const DeepCollectionEquality().equals(other.noKaqaz, noKaqaz)) &&
            (identical(other.shomareShabak, shomareShabak) || const DeepCollectionEquality().equals(other.shomareShabak, shomareShabak)) &&
            (identical(other.formatMohtava, formatMohtava) || const DeepCollectionEquality().equals(other.formatMohtava, formatMohtava)) &&
            (identical(other.zamanMotalee, zamanMotalee) || const DeepCollectionEquality().equals(other.zamanMotalee, zamanMotalee)) &&
            (identical(other.zaban, zaban) || const DeepCollectionEquality().equals(other.zaban, zaban)) &&
            (identical(other.qeymatArzi, qeymatArzi) || const DeepCollectionEquality().equals(other.qeymatArzi, qeymatArzi)) &&
            (identical(other.qeymatChapi, qeymatChapi) || const DeepCollectionEquality().equals(other.qeymatChapi, qeymatChapi)) &&
            (identical(other.salEnteshar, salEnteshar) || const DeepCollectionEquality().equals(other.salEnteshar, salEnteshar)) &&
            (identical(other.rating, rating) || const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.price, price) || const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) || const DeepCollectionEquality().equals(other.discountPrice, discountPrice)) &&
            (identical(other.totalPrice, totalPrice) || const DeepCollectionEquality().equals(other.totalPrice, totalPrice)) &&
            (identical(other.viewCount, viewCount) || const DeepCollectionEquality().equals(other.viewCount, viewCount)) &&
            (identical(other.categoryId, categoryId) || const DeepCollectionEquality().equals(other.categoryId, categoryId)) &&
            (identical(other.categoryTitle, categoryTitle) || const DeepCollectionEquality().equals(other.categoryTitle, categoryTitle)) &&
            (identical(other.myReview, myReview) || const DeepCollectionEquality().equals(other.myReview, myReview)) &&
            (identical(other.similarBooks, similarBooks) || const DeepCollectionEquality().equals(other.similarBooks, similarBooks)) &&
            (identical(other.bookReviewss, bookReviewss) || const DeepCollectionEquality().equals(other.bookReviewss, bookReviewss)) &&
            (identical(other.bookCategories, bookCategories) || const DeepCollectionEquality().equals(other.bookCategories, bookCategories)) &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(orderCount) ^
      const DeepCollectionEquality().hash(niko) ^
      const DeepCollectionEquality().hash(online) ^
      const DeepCollectionEquality().hash(physical) ^
      const DeepCollectionEquality().hash(discountPercentage) ^
      const DeepCollectionEquality().hash(physicalLink) ^
      const DeepCollectionEquality().hash(samplePdfLink) ^
      const DeepCollectionEquality().hash(fehrestUrl) ^
      const DeepCollectionEquality().hash(fehrestFile) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(pdfLink) ^
      const DeepCollectionEquality().hash(pdfSize) ^
      const DeepCollectionEquality().hash(pdfFile) ^
      const DeepCollectionEquality().hash(like) ^
      const DeepCollectionEquality().hash(read) ^
      const DeepCollectionEquality().hash(shelf) ^
      const DeepCollectionEquality().hash(buy) ^
      const DeepCollectionEquality().hash(shopCard) ^
      const DeepCollectionEquality().hash(nevisande) ^
      const DeepCollectionEquality().hash(entesharat) ^
      const DeepCollectionEquality().hash(motarjem) ^
      const DeepCollectionEquality().hash(moalef) ^
      const DeepCollectionEquality().hash(zirNazar) ^
      const DeepCollectionEquality().hash(sarparastMotarjem) ^
      const DeepCollectionEquality().hash(sarparastMoalef) ^
      const DeepCollectionEquality().hash(baHamkari) ^
      const DeepCollectionEquality().hash(beKooshesh) ^
      const DeepCollectionEquality().hash(gerdAvariVaTaalif) ^
      const DeepCollectionEquality().hash(baMoqadameVaNezarat) ^
      const DeepCollectionEquality().hash(virastar) ^
      const DeepCollectionEquality().hash(virastarElmi) ^
      const DeepCollectionEquality().hash(virayeshElmi) ^
      const DeepCollectionEquality().hash(pages) ^
      const DeepCollectionEquality().hash(nobatChap) ^
      const DeepCollectionEquality().hash(tarikhChap) ^
      const DeepCollectionEquality().hash(rangChap) ^
      const DeepCollectionEquality().hash(qatKetab) ^
      const DeepCollectionEquality().hash(noSahafi) ^
      const DeepCollectionEquality().hash(noKaqaz) ^
      const DeepCollectionEquality().hash(shomareShabak) ^
      const DeepCollectionEquality().hash(formatMohtava) ^
      const DeepCollectionEquality().hash(zamanMotalee) ^
      const DeepCollectionEquality().hash(zaban) ^
      const DeepCollectionEquality().hash(qeymatArzi) ^
      const DeepCollectionEquality().hash(qeymatChapi) ^
      const DeepCollectionEquality().hash(salEnteshar) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(viewCount) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(categoryTitle) ^
      const DeepCollectionEquality().hash(myReview) ^
      const DeepCollectionEquality().hash(similarBooks) ^
      const DeepCollectionEquality().hash(bookReviewss) ^
      const DeepCollectionEquality().hash(bookCategories) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookDtoExtension on BookDto {
  BookDto copyWith(
      {String? code,
      int? orderCount,
      bool? niko,
      bool? online,
      bool? physical,
      int? discountPercentage,
      String? physicalLink,
      String? samplePdfLink,
      String? fehrestUrl,
      String? fehrestFile,
      String? title,
      String? description,
      String? imageUrl,
      String? imageFile,
      String? pdfLink,
      String? pdfSize,
      String? pdfFile,
      bool? like,
      bool? read,
      bool? shelf,
      bool? buy,
      bool? shopCard,
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
      int? qeymatChapi,
      String? salEnteshar,
      int? rating,
      int? price,
      int? discountPrice,
      int? totalPrice,
      int? viewCount,
      String? categoryId,
      String? categoryTitle,
      BookReviewDto? myReview,
      List<BookDto>? similarBooks,
      List<BookReviewDto>? bookReviewss,
      List<BookCategoryDto>? bookCategories,
      String? id}) {
    return BookDto(
        code: code ?? this.code,
        orderCount: orderCount ?? this.orderCount,
        niko: niko ?? this.niko,
        online: online ?? this.online,
        physical: physical ?? this.physical,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        physicalLink: physicalLink ?? this.physicalLink,
        samplePdfLink: samplePdfLink ?? this.samplePdfLink,
        fehrestUrl: fehrestUrl ?? this.fehrestUrl,
        fehrestFile: fehrestFile ?? this.fehrestFile,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        imageFile: imageFile ?? this.imageFile,
        pdfLink: pdfLink ?? this.pdfLink,
        pdfSize: pdfSize ?? this.pdfSize,
        pdfFile: pdfFile ?? this.pdfFile,
        like: like ?? this.like,
        read: read ?? this.read,
        shelf: shelf ?? this.shelf,
        buy: buy ?? this.buy,
        shopCard: shopCard ?? this.shopCard,
        nevisande: nevisande ?? this.nevisande,
        entesharat: entesharat ?? this.entesharat,
        motarjem: motarjem ?? this.motarjem,
        moalef: moalef ?? this.moalef,
        zirNazar: zirNazar ?? this.zirNazar,
        sarparastMotarjem: sarparastMotarjem ?? this.sarparastMotarjem,
        sarparastMoalef: sarparastMoalef ?? this.sarparastMoalef,
        baHamkari: baHamkari ?? this.baHamkari,
        beKooshesh: beKooshesh ?? this.beKooshesh,
        gerdAvariVaTaalif: gerdAvariVaTaalif ?? this.gerdAvariVaTaalif,
        baMoqadameVaNezarat: baMoqadameVaNezarat ?? this.baMoqadameVaNezarat,
        virastar: virastar ?? this.virastar,
        virastarElmi: virastarElmi ?? this.virastarElmi,
        virayeshElmi: virayeshElmi ?? this.virayeshElmi,
        pages: pages ?? this.pages,
        nobatChap: nobatChap ?? this.nobatChap,
        tarikhChap: tarikhChap ?? this.tarikhChap,
        rangChap: rangChap ?? this.rangChap,
        qatKetab: qatKetab ?? this.qatKetab,
        noSahafi: noSahafi ?? this.noSahafi,
        noKaqaz: noKaqaz ?? this.noKaqaz,
        shomareShabak: shomareShabak ?? this.shomareShabak,
        formatMohtava: formatMohtava ?? this.formatMohtava,
        zamanMotalee: zamanMotalee ?? this.zamanMotalee,
        zaban: zaban ?? this.zaban,
        qeymatArzi: qeymatArzi ?? this.qeymatArzi,
        qeymatChapi: qeymatChapi ?? this.qeymatChapi,
        salEnteshar: salEnteshar ?? this.salEnteshar,
        rating: rating ?? this.rating,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        totalPrice: totalPrice ?? this.totalPrice,
        viewCount: viewCount ?? this.viewCount,
        categoryId: categoryId ?? this.categoryId,
        categoryTitle: categoryTitle ?? this.categoryTitle,
        myReview: myReview ?? this.myReview,
        similarBooks: similarBooks ?? this.similarBooks,
        bookReviewss: bookReviewss ?? this.bookReviewss,
        bookCategories: bookCategories ?? this.bookCategories,
        id: id ?? this.id);
  }

  BookDto copyWithWrapped(
      {Wrapped<String?>? code,
      Wrapped<int?>? orderCount,
      Wrapped<bool?>? niko,
      Wrapped<bool?>? online,
      Wrapped<bool?>? physical,
      Wrapped<int?>? discountPercentage,
      Wrapped<String?>? physicalLink,
      Wrapped<String?>? samplePdfLink,
      Wrapped<String?>? fehrestUrl,
      Wrapped<String?>? fehrestFile,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<String?>? imageUrl,
      Wrapped<String?>? imageFile,
      Wrapped<String?>? pdfLink,
      Wrapped<String?>? pdfSize,
      Wrapped<String?>? pdfFile,
      Wrapped<bool?>? like,
      Wrapped<bool?>? read,
      Wrapped<bool?>? shelf,
      Wrapped<bool?>? buy,
      Wrapped<bool?>? shopCard,
      Wrapped<String?>? nevisande,
      Wrapped<String?>? entesharat,
      Wrapped<String?>? motarjem,
      Wrapped<String?>? moalef,
      Wrapped<String?>? zirNazar,
      Wrapped<String?>? sarparastMotarjem,
      Wrapped<String?>? sarparastMoalef,
      Wrapped<String?>? baHamkari,
      Wrapped<String?>? beKooshesh,
      Wrapped<String?>? gerdAvariVaTaalif,
      Wrapped<String?>? baMoqadameVaNezarat,
      Wrapped<String?>? virastar,
      Wrapped<String?>? virastarElmi,
      Wrapped<String?>? virayeshElmi,
      Wrapped<int?>? pages,
      Wrapped<String?>? nobatChap,
      Wrapped<String?>? tarikhChap,
      Wrapped<String?>? rangChap,
      Wrapped<String?>? qatKetab,
      Wrapped<String?>? noSahafi,
      Wrapped<String?>? noKaqaz,
      Wrapped<String?>? shomareShabak,
      Wrapped<String?>? formatMohtava,
      Wrapped<String?>? zamanMotalee,
      Wrapped<String?>? zaban,
      Wrapped<String?>? qeymatArzi,
      Wrapped<int?>? qeymatChapi,
      Wrapped<String?>? salEnteshar,
      Wrapped<int?>? rating,
      Wrapped<int?>? price,
      Wrapped<int?>? discountPrice,
      Wrapped<int?>? totalPrice,
      Wrapped<int?>? viewCount,
      Wrapped<String?>? categoryId,
      Wrapped<String?>? categoryTitle,
      Wrapped<BookReviewDto?>? myReview,
      Wrapped<List<BookDto>?>? similarBooks,
      Wrapped<List<BookReviewDto>?>? bookReviewss,
      Wrapped<List<BookCategoryDto>?>? bookCategories,
      Wrapped<String?>? id}) {
    return BookDto(
        code: (code != null ? code.value : this.code),
        orderCount: (orderCount != null ? orderCount.value : this.orderCount),
        niko: (niko != null ? niko.value : this.niko),
        online: (online != null ? online.value : this.online),
        physical: (physical != null ? physical.value : this.physical),
        discountPercentage: (discountPercentage != null
            ? discountPercentage.value
            : this.discountPercentage),
        physicalLink:
            (physicalLink != null ? physicalLink.value : this.physicalLink),
        samplePdfLink:
            (samplePdfLink != null ? samplePdfLink.value : this.samplePdfLink),
        fehrestUrl: (fehrestUrl != null ? fehrestUrl.value : this.fehrestUrl),
        fehrestFile:
            (fehrestFile != null ? fehrestFile.value : this.fehrestFile),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        imageFile: (imageFile != null ? imageFile.value : this.imageFile),
        pdfLink: (pdfLink != null ? pdfLink.value : this.pdfLink),
        pdfSize: (pdfSize != null ? pdfSize.value : this.pdfSize),
        pdfFile: (pdfFile != null ? pdfFile.value : this.pdfFile),
        like: (like != null ? like.value : this.like),
        read: (read != null ? read.value : this.read),
        shelf: (shelf != null ? shelf.value : this.shelf),
        buy: (buy != null ? buy.value : this.buy),
        shopCard: (shopCard != null ? shopCard.value : this.shopCard),
        nevisande: (nevisande != null ? nevisande.value : this.nevisande),
        entesharat: (entesharat != null ? entesharat.value : this.entesharat),
        motarjem: (motarjem != null ? motarjem.value : this.motarjem),
        moalef: (moalef != null ? moalef.value : this.moalef),
        zirNazar: (zirNazar != null ? zirNazar.value : this.zirNazar),
        sarparastMotarjem: (sarparastMotarjem != null
            ? sarparastMotarjem.value
            : this.sarparastMotarjem),
        sarparastMoalef: (sarparastMoalef != null
            ? sarparastMoalef.value
            : this.sarparastMoalef),
        baHamkari: (baHamkari != null ? baHamkari.value : this.baHamkari),
        beKooshesh: (beKooshesh != null ? beKooshesh.value : this.beKooshesh),
        gerdAvariVaTaalif: (gerdAvariVaTaalif != null
            ? gerdAvariVaTaalif.value
            : this.gerdAvariVaTaalif),
        baMoqadameVaNezarat: (baMoqadameVaNezarat != null
            ? baMoqadameVaNezarat.value
            : this.baMoqadameVaNezarat),
        virastar: (virastar != null ? virastar.value : this.virastar),
        virastarElmi:
            (virastarElmi != null ? virastarElmi.value : this.virastarElmi),
        virayeshElmi:
            (virayeshElmi != null ? virayeshElmi.value : this.virayeshElmi),
        pages: (pages != null ? pages.value : this.pages),
        nobatChap: (nobatChap != null ? nobatChap.value : this.nobatChap),
        tarikhChap: (tarikhChap != null ? tarikhChap.value : this.tarikhChap),
        rangChap: (rangChap != null ? rangChap.value : this.rangChap),
        qatKetab: (qatKetab != null ? qatKetab.value : this.qatKetab),
        noSahafi: (noSahafi != null ? noSahafi.value : this.noSahafi),
        noKaqaz: (noKaqaz != null ? noKaqaz.value : this.noKaqaz),
        shomareShabak:
            (shomareShabak != null ? shomareShabak.value : this.shomareShabak),
        formatMohtava:
            (formatMohtava != null ? formatMohtava.value : this.formatMohtava),
        zamanMotalee:
            (zamanMotalee != null ? zamanMotalee.value : this.zamanMotalee),
        zaban: (zaban != null ? zaban.value : this.zaban),
        qeymatArzi: (qeymatArzi != null ? qeymatArzi.value : this.qeymatArzi),
        qeymatChapi:
            (qeymatChapi != null ? qeymatChapi.value : this.qeymatChapi),
        salEnteshar:
            (salEnteshar != null ? salEnteshar.value : this.salEnteshar),
        rating: (rating != null ? rating.value : this.rating),
        price: (price != null ? price.value : this.price),
        discountPrice:
            (discountPrice != null ? discountPrice.value : this.discountPrice),
        totalPrice: (totalPrice != null ? totalPrice.value : this.totalPrice),
        viewCount: (viewCount != null ? viewCount.value : this.viewCount),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        categoryTitle:
            (categoryTitle != null ? categoryTitle.value : this.categoryTitle),
        myReview: (myReview != null ? myReview.value : this.myReview),
        similarBooks:
            (similarBooks != null ? similarBooks.value : this.similarBooks),
        bookReviewss:
            (bookReviewss != null ? bookReviewss.value : this.bookReviewss),
        bookCategories: (bookCategories != null
            ? bookCategories.value
            : this.bookCategories),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookDtoApiResult {
  const BookDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookDtoApiResultFromJson(json);

  static const toJsonFactory = _$BookDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$BookDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final BookDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$BookDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $BookDtoApiResultExtension on BookDtoApiResult {
  BookDtoApiResult copyWith(
      {BookDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookDtoApiResult copyWithWrapped(
      {Wrapped<BookDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BookDtoListApiResult {
  const BookDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookDtoListApiResultFromJson(json);

  static const toJsonFactory = _$BookDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$BookDtoListApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$BookDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $BookDtoListApiResultExtension on BookDtoListApiResult {
  BookDtoListApiResult copyWith(
      {List<BookDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookDtoListApiResult copyWithWrapped(
      {Wrapped<List<BookDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BookOrderDto {
  const BookOrderDto({
    this.totalPrice,
    this.rawPrice,
    this.userId,
    this.bookOrderItems,
    this.id,
  });

  factory BookOrderDto.fromJson(Map<String, dynamic> json) =>
      _$BookOrderDtoFromJson(json);

  static const toJsonFactory = _$BookOrderDtoToJson;
  Map<String, dynamic> toJson() => _$BookOrderDtoToJson(this);

  @JsonKey(name: 'totalPrice', includeIfNull: false)
  final int? totalPrice;
  @JsonKey(name: 'rawPrice', includeIfNull: false)
  final int? rawPrice;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(
      name: 'bookOrderItems',
      includeIfNull: false,
      defaultValue: <BookOrderItemDto>[])
  final List<BookOrderItemDto>? bookOrderItems;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookOrderDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookOrderDto &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)) &&
            (identical(other.rawPrice, rawPrice) ||
                const DeepCollectionEquality()
                    .equals(other.rawPrice, rawPrice)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.bookOrderItems, bookOrderItems) ||
                const DeepCollectionEquality()
                    .equals(other.bookOrderItems, bookOrderItems)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(rawPrice) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(bookOrderItems) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookOrderDtoExtension on BookOrderDto {
  BookOrderDto copyWith(
      {int? totalPrice,
      int? rawPrice,
      String? userId,
      List<BookOrderItemDto>? bookOrderItems,
      String? id}) {
    return BookOrderDto(
        totalPrice: totalPrice ?? this.totalPrice,
        rawPrice: rawPrice ?? this.rawPrice,
        userId: userId ?? this.userId,
        bookOrderItems: bookOrderItems ?? this.bookOrderItems,
        id: id ?? this.id);
  }

  BookOrderDto copyWithWrapped(
      {Wrapped<int?>? totalPrice,
      Wrapped<int?>? rawPrice,
      Wrapped<String?>? userId,
      Wrapped<List<BookOrderItemDto>?>? bookOrderItems,
      Wrapped<String?>? id}) {
    return BookOrderDto(
        totalPrice: (totalPrice != null ? totalPrice.value : this.totalPrice),
        rawPrice: (rawPrice != null ? rawPrice.value : this.rawPrice),
        userId: (userId != null ? userId.value : this.userId),
        bookOrderItems: (bookOrderItems != null
            ? bookOrderItems.value
            : this.bookOrderItems),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookOrderDtoListApiResult {
  const BookOrderDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookOrderDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookOrderDtoListApiResultFromJson(json);

  static const toJsonFactory = _$BookOrderDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$BookOrderDtoListApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <BookOrderDto>[])
  final List<BookOrderDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$BookOrderDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookOrderDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $BookOrderDtoListApiResultExtension on BookOrderDtoListApiResult {
  BookOrderDtoListApiResult copyWith(
      {List<BookOrderDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookOrderDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookOrderDtoListApiResult copyWithWrapped(
      {Wrapped<List<BookOrderDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookOrderDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BookOrderItemDto {
  const BookOrderItemDto({
    this.bookId,
    this.bookCode,
    this.bookNiko,
    this.bookOnline,
    this.bookTitle,
    this.bookDescription,
    this.bookImageUrl,
    this.bookLike,
    this.bookRead,
    this.bookShelf,
    this.bookBuy,
    this.bookNevisande,
    this.bookRating,
    this.bookPrice,
    this.bookDiscountPrice,
    this.bookTotalPrice,
    this.bookViewCount,
    this.bookOrderId,
    this.id,
  });

  factory BookOrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$BookOrderItemDtoFromJson(json);

  static const toJsonFactory = _$BookOrderItemDtoToJson;
  Map<String, dynamic> toJson() => _$BookOrderItemDtoToJson(this);

  @JsonKey(name: 'bookId', includeIfNull: false)
  final String? bookId;
  @JsonKey(name: 'bookCode', includeIfNull: false)
  final String? bookCode;
  @JsonKey(name: 'bookNiko', includeIfNull: false)
  final bool? bookNiko;
  @JsonKey(name: 'bookOnline', includeIfNull: false)
  final bool? bookOnline;
  @JsonKey(name: 'bookTitle', includeIfNull: false)
  final String? bookTitle;
  @JsonKey(name: 'bookDescription', includeIfNull: false)
  final String? bookDescription;
  @JsonKey(name: 'bookImageUrl', includeIfNull: false)
  final String? bookImageUrl;
  @JsonKey(name: 'bookLike', includeIfNull: false)
  final bool? bookLike;
  @JsonKey(name: 'bookRead', includeIfNull: false)
  final bool? bookRead;
  @JsonKey(name: 'bookShelf', includeIfNull: false)
  final bool? bookShelf;
  @JsonKey(name: 'bookBuy', includeIfNull: false)
  final bool? bookBuy;
  @JsonKey(name: 'bookNevisande', includeIfNull: false)
  final String? bookNevisande;
  @JsonKey(name: 'bookRating', includeIfNull: false)
  final int? bookRating;
  @JsonKey(name: 'bookPrice', includeIfNull: false)
  final int? bookPrice;
  @JsonKey(name: 'bookDiscountPrice', includeIfNull: false)
  final int? bookDiscountPrice;
  @JsonKey(name: 'bookTotalPrice', includeIfNull: false)
  final int? bookTotalPrice;
  @JsonKey(name: 'bookViewCount', includeIfNull: false)
  final int? bookViewCount;
  @JsonKey(name: 'bookOrderId', includeIfNull: false)
  final String? bookOrderId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookOrderItemDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookOrderItemDto &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.bookCode, bookCode) ||
                const DeepCollectionEquality()
                    .equals(other.bookCode, bookCode)) &&
            (identical(other.bookNiko, bookNiko) ||
                const DeepCollectionEquality()
                    .equals(other.bookNiko, bookNiko)) &&
            (identical(other.bookOnline, bookOnline) ||
                const DeepCollectionEquality()
                    .equals(other.bookOnline, bookOnline)) &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)) &&
            (identical(other.bookDescription, bookDescription) ||
                const DeepCollectionEquality()
                    .equals(other.bookDescription, bookDescription)) &&
            (identical(other.bookImageUrl, bookImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bookImageUrl, bookImageUrl)) &&
            (identical(other.bookLike, bookLike) ||
                const DeepCollectionEquality()
                    .equals(other.bookLike, bookLike)) &&
            (identical(other.bookRead, bookRead) ||
                const DeepCollectionEquality()
                    .equals(other.bookRead, bookRead)) &&
            (identical(other.bookShelf, bookShelf) ||
                const DeepCollectionEquality()
                    .equals(other.bookShelf, bookShelf)) &&
            (identical(other.bookBuy, bookBuy) ||
                const DeepCollectionEquality()
                    .equals(other.bookBuy, bookBuy)) &&
            (identical(other.bookNevisande, bookNevisande) ||
                const DeepCollectionEquality()
                    .equals(other.bookNevisande, bookNevisande)) &&
            (identical(other.bookRating, bookRating) ||
                const DeepCollectionEquality()
                    .equals(other.bookRating, bookRating)) &&
            (identical(other.bookPrice, bookPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookPrice, bookPrice)) &&
            (identical(other.bookDiscountPrice, bookDiscountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookDiscountPrice, bookDiscountPrice)) &&
            (identical(other.bookTotalPrice, bookTotalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookTotalPrice, bookTotalPrice)) &&
            (identical(other.bookViewCount, bookViewCount) ||
                const DeepCollectionEquality()
                    .equals(other.bookViewCount, bookViewCount)) &&
            (identical(other.bookOrderId, bookOrderId) ||
                const DeepCollectionEquality()
                    .equals(other.bookOrderId, bookOrderId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(bookCode) ^
      const DeepCollectionEquality().hash(bookNiko) ^
      const DeepCollectionEquality().hash(bookOnline) ^
      const DeepCollectionEquality().hash(bookTitle) ^
      const DeepCollectionEquality().hash(bookDescription) ^
      const DeepCollectionEquality().hash(bookImageUrl) ^
      const DeepCollectionEquality().hash(bookLike) ^
      const DeepCollectionEquality().hash(bookRead) ^
      const DeepCollectionEquality().hash(bookShelf) ^
      const DeepCollectionEquality().hash(bookBuy) ^
      const DeepCollectionEquality().hash(bookNevisande) ^
      const DeepCollectionEquality().hash(bookRating) ^
      const DeepCollectionEquality().hash(bookPrice) ^
      const DeepCollectionEquality().hash(bookDiscountPrice) ^
      const DeepCollectionEquality().hash(bookTotalPrice) ^
      const DeepCollectionEquality().hash(bookViewCount) ^
      const DeepCollectionEquality().hash(bookOrderId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookOrderItemDtoExtension on BookOrderItemDto {
  BookOrderItemDto copyWith(
      {String? bookId,
      String? bookCode,
      bool? bookNiko,
      bool? bookOnline,
      String? bookTitle,
      String? bookDescription,
      String? bookImageUrl,
      bool? bookLike,
      bool? bookRead,
      bool? bookShelf,
      bool? bookBuy,
      String? bookNevisande,
      int? bookRating,
      int? bookPrice,
      int? bookDiscountPrice,
      int? bookTotalPrice,
      int? bookViewCount,
      String? bookOrderId,
      String? id}) {
    return BookOrderItemDto(
        bookId: bookId ?? this.bookId,
        bookCode: bookCode ?? this.bookCode,
        bookNiko: bookNiko ?? this.bookNiko,
        bookOnline: bookOnline ?? this.bookOnline,
        bookTitle: bookTitle ?? this.bookTitle,
        bookDescription: bookDescription ?? this.bookDescription,
        bookImageUrl: bookImageUrl ?? this.bookImageUrl,
        bookLike: bookLike ?? this.bookLike,
        bookRead: bookRead ?? this.bookRead,
        bookShelf: bookShelf ?? this.bookShelf,
        bookBuy: bookBuy ?? this.bookBuy,
        bookNevisande: bookNevisande ?? this.bookNevisande,
        bookRating: bookRating ?? this.bookRating,
        bookPrice: bookPrice ?? this.bookPrice,
        bookDiscountPrice: bookDiscountPrice ?? this.bookDiscountPrice,
        bookTotalPrice: bookTotalPrice ?? this.bookTotalPrice,
        bookViewCount: bookViewCount ?? this.bookViewCount,
        bookOrderId: bookOrderId ?? this.bookOrderId,
        id: id ?? this.id);
  }

  BookOrderItemDto copyWithWrapped(
      {Wrapped<String?>? bookId,
      Wrapped<String?>? bookCode,
      Wrapped<bool?>? bookNiko,
      Wrapped<bool?>? bookOnline,
      Wrapped<String?>? bookTitle,
      Wrapped<String?>? bookDescription,
      Wrapped<String?>? bookImageUrl,
      Wrapped<bool?>? bookLike,
      Wrapped<bool?>? bookRead,
      Wrapped<bool?>? bookShelf,
      Wrapped<bool?>? bookBuy,
      Wrapped<String?>? bookNevisande,
      Wrapped<int?>? bookRating,
      Wrapped<int?>? bookPrice,
      Wrapped<int?>? bookDiscountPrice,
      Wrapped<int?>? bookTotalPrice,
      Wrapped<int?>? bookViewCount,
      Wrapped<String?>? bookOrderId,
      Wrapped<String?>? id}) {
    return BookOrderItemDto(
        bookId: (bookId != null ? bookId.value : this.bookId),
        bookCode: (bookCode != null ? bookCode.value : this.bookCode),
        bookNiko: (bookNiko != null ? bookNiko.value : this.bookNiko),
        bookOnline: (bookOnline != null ? bookOnline.value : this.bookOnline),
        bookTitle: (bookTitle != null ? bookTitle.value : this.bookTitle),
        bookDescription: (bookDescription != null
            ? bookDescription.value
            : this.bookDescription),
        bookImageUrl:
            (bookImageUrl != null ? bookImageUrl.value : this.bookImageUrl),
        bookLike: (bookLike != null ? bookLike.value : this.bookLike),
        bookRead: (bookRead != null ? bookRead.value : this.bookRead),
        bookShelf: (bookShelf != null ? bookShelf.value : this.bookShelf),
        bookBuy: (bookBuy != null ? bookBuy.value : this.bookBuy),
        bookNevisande:
            (bookNevisande != null ? bookNevisande.value : this.bookNevisande),
        bookRating: (bookRating != null ? bookRating.value : this.bookRating),
        bookPrice: (bookPrice != null ? bookPrice.value : this.bookPrice),
        bookDiscountPrice: (bookDiscountPrice != null
            ? bookDiscountPrice.value
            : this.bookDiscountPrice),
        bookTotalPrice: (bookTotalPrice != null
            ? bookTotalPrice.value
            : this.bookTotalPrice),
        bookViewCount:
            (bookViewCount != null ? bookViewCount.value : this.bookViewCount),
        bookOrderId:
            (bookOrderId != null ? bookOrderId.value : this.bookOrderId),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookOrderItemDtoListApiResult {
  const BookOrderItemDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookOrderItemDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookOrderItemDtoListApiResultFromJson(json);

  static const toJsonFactory = _$BookOrderItemDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$BookOrderItemDtoListApiResultToJson(this);

  @JsonKey(
      name: 'data', includeIfNull: false, defaultValue: <BookOrderItemDto>[])
  final List<BookOrderItemDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$BookOrderItemDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookOrderItemDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $BookOrderItemDtoListApiResultExtension
    on BookOrderItemDtoListApiResult {
  BookOrderItemDtoListApiResult copyWith(
      {List<BookOrderItemDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookOrderItemDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookOrderItemDtoListApiResult copyWithWrapped(
      {Wrapped<List<BookOrderItemDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookOrderItemDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BookReviewDto {
  const BookReviewDto({
    this.creationDateTime,
    this.message,
    this.rate,
    this.bookId,
    this.bookTitle,
    this.bookImageUrl,
    this.bookNevisande,
    this.bookEntesharat,
    this.bookMotarjem,
    this.bookSalEnteshar,
    this.bookPages,
    this.bookRating,
    this.bookPrice,
    this.bookDiscountPrice,
    this.bookViewCount,
    this.bookCategoryId,
    this.bookCategoryName,
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.id,
  });

  factory BookReviewDto.fromJson(Map<String, dynamic> json) =>
      _$BookReviewDtoFromJson(json);

  static const toJsonFactory = _$BookReviewDtoToJson;
  Map<String, dynamic> toJson() => _$BookReviewDtoToJson(this);

  @JsonKey(name: 'creationDateTime', includeIfNull: false)
  final DateTime? creationDateTime;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'rate', includeIfNull: false)
  final int? rate;
  @JsonKey(name: 'bookId', includeIfNull: false)
  final String? bookId;
  @JsonKey(name: 'bookTitle', includeIfNull: false)
  final String? bookTitle;
  @JsonKey(name: 'bookImageUrl', includeIfNull: false)
  final String? bookImageUrl;
  @JsonKey(name: 'bookNevisande', includeIfNull: false)
  final String? bookNevisande;
  @JsonKey(name: 'bookEntesharat', includeIfNull: false)
  final String? bookEntesharat;
  @JsonKey(name: 'bookMotarjem', includeIfNull: false)
  final String? bookMotarjem;
  @JsonKey(name: 'bookSalEnteshar', includeIfNull: false)
  final String? bookSalEnteshar;
  @JsonKey(name: 'bookPages', includeIfNull: false)
  final int? bookPages;
  @JsonKey(name: 'bookRating', includeIfNull: false)
  final int? bookRating;
  @JsonKey(name: 'bookPrice', includeIfNull: false)
  final int? bookPrice;
  @JsonKey(name: 'bookDiscountPrice', includeIfNull: false)
  final int? bookDiscountPrice;
  @JsonKey(name: 'bookViewCount', includeIfNull: false)
  final int? bookViewCount;
  @JsonKey(name: 'bookCategoryId', includeIfNull: false)
  final String? bookCategoryId;
  @JsonKey(name: 'bookCategoryName', includeIfNull: false)
  final String? bookCategoryName;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'userFirstName', includeIfNull: false)
  final String? userFirstName;
  @JsonKey(name: 'userLastName', includeIfNull: false)
  final String? userLastName;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookReviewDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookReviewDto &&
            (identical(other.creationDateTime, creationDateTime) ||
                const DeepCollectionEquality()
                    .equals(other.creationDateTime, creationDateTime)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)) &&
            (identical(other.bookImageUrl, bookImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bookImageUrl, bookImageUrl)) &&
            (identical(other.bookNevisande, bookNevisande) ||
                const DeepCollectionEquality()
                    .equals(other.bookNevisande, bookNevisande)) &&
            (identical(other.bookEntesharat, bookEntesharat) ||
                const DeepCollectionEquality()
                    .equals(other.bookEntesharat, bookEntesharat)) &&
            (identical(other.bookMotarjem, bookMotarjem) ||
                const DeepCollectionEquality()
                    .equals(other.bookMotarjem, bookMotarjem)) &&
            (identical(other.bookSalEnteshar, bookSalEnteshar) ||
                const DeepCollectionEquality()
                    .equals(other.bookSalEnteshar, bookSalEnteshar)) &&
            (identical(other.bookPages, bookPages) ||
                const DeepCollectionEquality()
                    .equals(other.bookPages, bookPages)) &&
            (identical(other.bookRating, bookRating) ||
                const DeepCollectionEquality()
                    .equals(other.bookRating, bookRating)) &&
            (identical(other.bookPrice, bookPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookPrice, bookPrice)) &&
            (identical(other.bookDiscountPrice, bookDiscountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookDiscountPrice, bookDiscountPrice)) &&
            (identical(other.bookViewCount, bookViewCount) ||
                const DeepCollectionEquality()
                    .equals(other.bookViewCount, bookViewCount)) &&
            (identical(other.bookCategoryId, bookCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.bookCategoryId, bookCategoryId)) &&
            (identical(other.bookCategoryName, bookCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.bookCategoryName, bookCategoryName)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userFirstName, userFirstName) ||
                const DeepCollectionEquality()
                    .equals(other.userFirstName, userFirstName)) &&
            (identical(other.userLastName, userLastName) ||
                const DeepCollectionEquality()
                    .equals(other.userLastName, userLastName)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(creationDateTime) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(bookTitle) ^
      const DeepCollectionEquality().hash(bookImageUrl) ^
      const DeepCollectionEquality().hash(bookNevisande) ^
      const DeepCollectionEquality().hash(bookEntesharat) ^
      const DeepCollectionEquality().hash(bookMotarjem) ^
      const DeepCollectionEquality().hash(bookSalEnteshar) ^
      const DeepCollectionEquality().hash(bookPages) ^
      const DeepCollectionEquality().hash(bookRating) ^
      const DeepCollectionEquality().hash(bookPrice) ^
      const DeepCollectionEquality().hash(bookDiscountPrice) ^
      const DeepCollectionEquality().hash(bookViewCount) ^
      const DeepCollectionEquality().hash(bookCategoryId) ^
      const DeepCollectionEquality().hash(bookCategoryName) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userFirstName) ^
      const DeepCollectionEquality().hash(userLastName) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookReviewDtoExtension on BookReviewDto {
  BookReviewDto copyWith(
      {DateTime? creationDateTime,
      String? message,
      int? rate,
      String? bookId,
      String? bookTitle,
      String? bookImageUrl,
      String? bookNevisande,
      String? bookEntesharat,
      String? bookMotarjem,
      String? bookSalEnteshar,
      int? bookPages,
      int? bookRating,
      int? bookPrice,
      int? bookDiscountPrice,
      int? bookViewCount,
      String? bookCategoryId,
      String? bookCategoryName,
      String? userId,
      String? userFirstName,
      String? userLastName,
      String? id}) {
    return BookReviewDto(
        creationDateTime: creationDateTime ?? this.creationDateTime,
        message: message ?? this.message,
        rate: rate ?? this.rate,
        bookId: bookId ?? this.bookId,
        bookTitle: bookTitle ?? this.bookTitle,
        bookImageUrl: bookImageUrl ?? this.bookImageUrl,
        bookNevisande: bookNevisande ?? this.bookNevisande,
        bookEntesharat: bookEntesharat ?? this.bookEntesharat,
        bookMotarjem: bookMotarjem ?? this.bookMotarjem,
        bookSalEnteshar: bookSalEnteshar ?? this.bookSalEnteshar,
        bookPages: bookPages ?? this.bookPages,
        bookRating: bookRating ?? this.bookRating,
        bookPrice: bookPrice ?? this.bookPrice,
        bookDiscountPrice: bookDiscountPrice ?? this.bookDiscountPrice,
        bookViewCount: bookViewCount ?? this.bookViewCount,
        bookCategoryId: bookCategoryId ?? this.bookCategoryId,
        bookCategoryName: bookCategoryName ?? this.bookCategoryName,
        userId: userId ?? this.userId,
        userFirstName: userFirstName ?? this.userFirstName,
        userLastName: userLastName ?? this.userLastName,
        id: id ?? this.id);
  }

  BookReviewDto copyWithWrapped(
      {Wrapped<DateTime?>? creationDateTime,
      Wrapped<String?>? message,
      Wrapped<int?>? rate,
      Wrapped<String?>? bookId,
      Wrapped<String?>? bookTitle,
      Wrapped<String?>? bookImageUrl,
      Wrapped<String?>? bookNevisande,
      Wrapped<String?>? bookEntesharat,
      Wrapped<String?>? bookMotarjem,
      Wrapped<String?>? bookSalEnteshar,
      Wrapped<int?>? bookPages,
      Wrapped<int?>? bookRating,
      Wrapped<int?>? bookPrice,
      Wrapped<int?>? bookDiscountPrice,
      Wrapped<int?>? bookViewCount,
      Wrapped<String?>? bookCategoryId,
      Wrapped<String?>? bookCategoryName,
      Wrapped<String?>? userId,
      Wrapped<String?>? userFirstName,
      Wrapped<String?>? userLastName,
      Wrapped<String?>? id}) {
    return BookReviewDto(
        creationDateTime: (creationDateTime != null
            ? creationDateTime.value
            : this.creationDateTime),
        message: (message != null ? message.value : this.message),
        rate: (rate != null ? rate.value : this.rate),
        bookId: (bookId != null ? bookId.value : this.bookId),
        bookTitle: (bookTitle != null ? bookTitle.value : this.bookTitle),
        bookImageUrl:
            (bookImageUrl != null ? bookImageUrl.value : this.bookImageUrl),
        bookNevisande:
            (bookNevisande != null ? bookNevisande.value : this.bookNevisande),
        bookEntesharat: (bookEntesharat != null
            ? bookEntesharat.value
            : this.bookEntesharat),
        bookMotarjem:
            (bookMotarjem != null ? bookMotarjem.value : this.bookMotarjem),
        bookSalEnteshar: (bookSalEnteshar != null
            ? bookSalEnteshar.value
            : this.bookSalEnteshar),
        bookPages: (bookPages != null ? bookPages.value : this.bookPages),
        bookRating: (bookRating != null ? bookRating.value : this.bookRating),
        bookPrice: (bookPrice != null ? bookPrice.value : this.bookPrice),
        bookDiscountPrice: (bookDiscountPrice != null
            ? bookDiscountPrice.value
            : this.bookDiscountPrice),
        bookViewCount:
            (bookViewCount != null ? bookViewCount.value : this.bookViewCount),
        bookCategoryId: (bookCategoryId != null
            ? bookCategoryId.value
            : this.bookCategoryId),
        bookCategoryName: (bookCategoryName != null
            ? bookCategoryName.value
            : this.bookCategoryName),
        userId: (userId != null ? userId.value : this.userId),
        userFirstName:
            (userFirstName != null ? userFirstName.value : this.userFirstName),
        userLastName:
            (userLastName != null ? userLastName.value : this.userLastName),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookReviewDtoListApiResult {
  const BookReviewDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookReviewDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookReviewDtoListApiResultFromJson(json);

  static const toJsonFactory = _$BookReviewDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$BookReviewDtoListApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <BookReviewDto>[])
  final List<BookReviewDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$BookReviewDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookReviewDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $BookReviewDtoListApiResultExtension on BookReviewDtoListApiResult {
  BookReviewDtoListApiResult copyWith(
      {List<BookReviewDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookReviewDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookReviewDtoListApiResult copyWithWrapped(
      {Wrapped<List<BookReviewDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookReviewDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BookSearchDto {
  const BookSearchDto({
    this.categoryId,
    this.name,
    this.minPrice,
    this.maxPrice,
    this.nevisande,
    this.entesharat,
    this.motarjem,
    this.moalef,
  });

  factory BookSearchDto.fromJson(Map<String, dynamic> json) =>
      _$BookSearchDtoFromJson(json);

  static const toJsonFactory = _$BookSearchDtoToJson;
  Map<String, dynamic> toJson() => _$BookSearchDtoToJson(this);

  @JsonKey(name: 'categoryId', includeIfNull: false)
  final String? categoryId;
  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'minPrice', includeIfNull: false)
  final int? minPrice;
  @JsonKey(name: 'maxPrice', includeIfNull: false)
  final int? maxPrice;
  @JsonKey(name: 'nevisande', includeIfNull: false)
  final String? nevisande;
  @JsonKey(name: 'entesharat', includeIfNull: false)
  final String? entesharat;
  @JsonKey(name: 'motarjem', includeIfNull: false)
  final String? motarjem;
  @JsonKey(name: 'moalef', includeIfNull: false)
  final String? moalef;
  static const fromJsonFactory = _$BookSearchDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookSearchDto &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.minPrice, minPrice) ||
                const DeepCollectionEquality()
                    .equals(other.minPrice, minPrice)) &&
            (identical(other.maxPrice, maxPrice) ||
                const DeepCollectionEquality()
                    .equals(other.maxPrice, maxPrice)) &&
            (identical(other.nevisande, nevisande) ||
                const DeepCollectionEquality()
                    .equals(other.nevisande, nevisande)) &&
            (identical(other.entesharat, entesharat) ||
                const DeepCollectionEquality()
                    .equals(other.entesharat, entesharat)) &&
            (identical(other.motarjem, motarjem) ||
                const DeepCollectionEquality()
                    .equals(other.motarjem, motarjem)) &&
            (identical(other.moalef, moalef) ||
                const DeepCollectionEquality().equals(other.moalef, moalef)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(minPrice) ^
      const DeepCollectionEquality().hash(maxPrice) ^
      const DeepCollectionEquality().hash(nevisande) ^
      const DeepCollectionEquality().hash(entesharat) ^
      const DeepCollectionEquality().hash(motarjem) ^
      const DeepCollectionEquality().hash(moalef) ^
      runtimeType.hashCode;
}

extension $BookSearchDtoExtension on BookSearchDto {
  BookSearchDto copyWith(
      {String? categoryId,
      String? name,
      int? minPrice,
      int? maxPrice,
      String? nevisande,
      String? entesharat,
      String? motarjem,
      String? moalef}) {
    return BookSearchDto(
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        nevisande: nevisande ?? this.nevisande,
        entesharat: entesharat ?? this.entesharat,
        motarjem: motarjem ?? this.motarjem,
        moalef: moalef ?? this.moalef);
  }

  BookSearchDto copyWithWrapped(
      {Wrapped<String?>? categoryId,
      Wrapped<String?>? name,
      Wrapped<int?>? minPrice,
      Wrapped<int?>? maxPrice,
      Wrapped<String?>? nevisande,
      Wrapped<String?>? entesharat,
      Wrapped<String?>? motarjem,
      Wrapped<String?>? moalef}) {
    return BookSearchDto(
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        name: (name != null ? name.value : this.name),
        minPrice: (minPrice != null ? minPrice.value : this.minPrice),
        maxPrice: (maxPrice != null ? maxPrice.value : this.maxPrice),
        nevisande: (nevisande != null ? nevisande.value : this.nevisande),
        entesharat: (entesharat != null ? entesharat.value : this.entesharat),
        motarjem: (motarjem != null ? motarjem.value : this.motarjem),
        moalef: (moalef != null ? moalef.value : this.moalef));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  const CategoryDto({
    this.title,
    this.motherId,
    this.id,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  static const toJsonFactory = _$CategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'motherId', includeIfNull: false)
  final String? motherId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$CategoryDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.motherId, motherId) ||
                const DeepCollectionEquality()
                    .equals(other.motherId, motherId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(motherId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $CategoryDtoExtension on CategoryDto {
  CategoryDto copyWith({String? title, String? motherId, String? id}) {
    return CategoryDto(
        title: title ?? this.title,
        motherId: motherId ?? this.motherId,
        id: id ?? this.id);
  }

  CategoryDto copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? motherId,
      Wrapped<String?>? id}) {
    return CategoryDto(
        title: (title != null ? title.value : this.title),
        motherId: (motherId != null ? motherId.value : this.motherId),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDtoListApiResult {
  const CategoryDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory CategoryDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoListApiResultFromJson(json);

  static const toJsonFactory = _$CategoryDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoListApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <CategoryDto>[])
  final List<CategoryDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$CategoryDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $CategoryDtoListApiResultExtension on CategoryDtoListApiResult {
  CategoryDtoListApiResult copyWith(
      {List<CategoryDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return CategoryDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  CategoryDtoListApiResult copyWithWrapped(
      {Wrapped<List<CategoryDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return CategoryDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ClientLoginDto {
  const ClientLoginDto({
    this.nationalCode,
    this.phoneNumber,
    this.otp,
    this.compeleteProfile,
  });

  factory ClientLoginDto.fromJson(Map<String, dynamic> json) =>
      _$ClientLoginDtoFromJson(json);

  static const toJsonFactory = _$ClientLoginDtoToJson;
  Map<String, dynamic> toJson() => _$ClientLoginDtoToJson(this);

  @JsonKey(name: 'nationalCode', includeIfNull: false)
  final String? nationalCode;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'otp', includeIfNull: false)
  final String? otp;
  @JsonKey(name: 'compeleteProfile', includeIfNull: false)
  final bool? compeleteProfile;
  static const fromJsonFactory = _$ClientLoginDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ClientLoginDto &&
            (identical(other.nationalCode, nationalCode) ||
                const DeepCollectionEquality()
                    .equals(other.nationalCode, nationalCode)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.compeleteProfile, compeleteProfile) ||
                const DeepCollectionEquality()
                    .equals(other.compeleteProfile, compeleteProfile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(nationalCode) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(compeleteProfile) ^
      runtimeType.hashCode;
}

extension $ClientLoginDtoExtension on ClientLoginDto {
  ClientLoginDto copyWith(
      {String? nationalCode,
      String? phoneNumber,
      String? otp,
      bool? compeleteProfile}) {
    return ClientLoginDto(
        nationalCode: nationalCode ?? this.nationalCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otp: otp ?? this.otp,
        compeleteProfile: compeleteProfile ?? this.compeleteProfile);
  }

  ClientLoginDto copyWithWrapped(
      {Wrapped<String?>? nationalCode,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? otp,
      Wrapped<bool?>? compeleteProfile}) {
    return ClientLoginDto(
        nationalCode:
            (nationalCode != null ? nationalCode.value : this.nationalCode),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        otp: (otp != null ? otp.value : this.otp),
        compeleteProfile: (compeleteProfile != null
            ? compeleteProfile.value
            : this.compeleteProfile));
  }
}

@JsonSerializable(explicitToJson: true)
class ClientLoginDtoApiResult {
  const ClientLoginDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory ClientLoginDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$ClientLoginDtoApiResultFromJson(json);

  static const toJsonFactory = _$ClientLoginDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$ClientLoginDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final ClientLoginDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$ClientLoginDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ClientLoginDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ClientLoginDtoApiResultExtension on ClientLoginDtoApiResult {
  ClientLoginDtoApiResult copyWith(
      {ClientLoginDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return ClientLoginDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  ClientLoginDtoApiResult copyWithWrapped(
      {Wrapped<ClientLoginDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return ClientLoginDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ExpertiseDto {
  const ExpertiseDto({
    this.name,
    this.id,
  });

  factory ExpertiseDto.fromJson(Map<String, dynamic> json) =>
      _$ExpertiseDtoFromJson(json);

  static const toJsonFactory = _$ExpertiseDtoToJson;
  Map<String, dynamic> toJson() => _$ExpertiseDtoToJson(this);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$ExpertiseDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ExpertiseDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ExpertiseDtoExtension on ExpertiseDto {
  ExpertiseDto copyWith({String? name, String? id}) {
    return ExpertiseDto(name: name ?? this.name, id: id ?? this.id);
  }

  ExpertiseDto copyWithWrapped({Wrapped<String?>? name, Wrapped<String?>? id}) {
    return ExpertiseDto(
        name: (name != null ? name.value : this.name),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class IndexDto {
  const IndexDto({
    this.discountBooks,
    this.nikooBooks,
    this.freeBooks,
    this.mostViewedBooks,
    this.indexInfo,
  });

  factory IndexDto.fromJson(Map<String, dynamic> json) =>
      _$IndexDtoFromJson(json);

  static const toJsonFactory = _$IndexDtoToJson;
  Map<String, dynamic> toJson() => _$IndexDtoToJson(this);

  @JsonKey(
      name: 'discountBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? discountBooks;
  @JsonKey(name: 'nikooBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? nikooBooks;
  @JsonKey(name: 'freeBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? freeBooks;
  @JsonKey(
      name: 'mostViewedBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? mostViewedBooks;
  @JsonKey(name: 'indexInfo', includeIfNull: false)
  final SettingDto? indexInfo;
  static const fromJsonFactory = _$IndexDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is IndexDto &&
            (identical(other.discountBooks, discountBooks) ||
                const DeepCollectionEquality()
                    .equals(other.discountBooks, discountBooks)) &&
            (identical(other.nikooBooks, nikooBooks) ||
                const DeepCollectionEquality()
                    .equals(other.nikooBooks, nikooBooks)) &&
            (identical(other.freeBooks, freeBooks) ||
                const DeepCollectionEquality()
                    .equals(other.freeBooks, freeBooks)) &&
            (identical(other.mostViewedBooks, mostViewedBooks) ||
                const DeepCollectionEquality()
                    .equals(other.mostViewedBooks, mostViewedBooks)) &&
            (identical(other.indexInfo, indexInfo) ||
                const DeepCollectionEquality()
                    .equals(other.indexInfo, indexInfo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discountBooks) ^
      const DeepCollectionEquality().hash(nikooBooks) ^
      const DeepCollectionEquality().hash(freeBooks) ^
      const DeepCollectionEquality().hash(mostViewedBooks) ^
      const DeepCollectionEquality().hash(indexInfo) ^
      runtimeType.hashCode;
}

extension $IndexDtoExtension on IndexDto {
  IndexDto copyWith(
      {List<BookDto>? discountBooks,
      List<BookDto>? nikooBooks,
      List<BookDto>? freeBooks,
      List<BookDto>? mostViewedBooks,
      SettingDto? indexInfo}) {
    return IndexDto(
        discountBooks: discountBooks ?? this.discountBooks,
        nikooBooks: nikooBooks ?? this.nikooBooks,
        freeBooks: freeBooks ?? this.freeBooks,
        mostViewedBooks: mostViewedBooks ?? this.mostViewedBooks,
        indexInfo: indexInfo ?? this.indexInfo);
  }

  IndexDto copyWithWrapped(
      {Wrapped<List<BookDto>?>? discountBooks,
      Wrapped<List<BookDto>?>? nikooBooks,
      Wrapped<List<BookDto>?>? freeBooks,
      Wrapped<List<BookDto>?>? mostViewedBooks,
      Wrapped<SettingDto?>? indexInfo}) {
    return IndexDto(
        discountBooks:
            (discountBooks != null ? discountBooks.value : this.discountBooks),
        nikooBooks: (nikooBooks != null ? nikooBooks.value : this.nikooBooks),
        freeBooks: (freeBooks != null ? freeBooks.value : this.freeBooks),
        mostViewedBooks: (mostViewedBooks != null
            ? mostViewedBooks.value
            : this.mostViewedBooks),
        indexInfo: (indexInfo != null ? indexInfo.value : this.indexInfo));
  }
}

@JsonSerializable(explicitToJson: true)
class IndexDtoApiResult {
  const IndexDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory IndexDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$IndexDtoApiResultFromJson(json);

  static const toJsonFactory = _$IndexDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$IndexDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final IndexDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$IndexDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is IndexDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $IndexDtoApiResultExtension on IndexDtoApiResult {
  IndexDtoApiResult copyWith(
      {IndexDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return IndexDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  IndexDtoApiResult copyWithWrapped(
      {Wrapped<IndexDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return IndexDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class LoginDto {
  const LoginDto({
    this.userName,
    this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  static const toJsonFactory = _$LoginDtoToJson;
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @JsonKey(name: 'userName', includeIfNull: false)
  final String? userName;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  static const fromJsonFactory = _$LoginDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LoginDto &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginDtoExtension on LoginDto {
  LoginDto copyWith({String? userName, String? password}) {
    return LoginDto(
        userName: userName ?? this.userName,
        password: password ?? this.password);
  }

  LoginDto copyWithWrapped(
      {Wrapped<String?>? userName, Wrapped<String?>? password}) {
    return LoginDto(
        userName: (userName != null ? userName.value : this.userName),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class NationalLoginDto {
  const NationalLoginDto({
    this.nationalCode,
    this.phoneNumber,
    this.otp,
  });

  factory NationalLoginDto.fromJson(Map<String, dynamic> json) =>
      _$NationalLoginDtoFromJson(json);

  static const toJsonFactory = _$NationalLoginDtoToJson;
  Map<String, dynamic> toJson() => _$NationalLoginDtoToJson(this);

  @JsonKey(name: 'nationalCode', includeIfNull: false)
  final String? nationalCode;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'otp', includeIfNull: false)
  final String? otp;
  static const fromJsonFactory = _$NationalLoginDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NationalLoginDto &&
            (identical(other.nationalCode, nationalCode) ||
                const DeepCollectionEquality()
                    .equals(other.nationalCode, nationalCode)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(nationalCode) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      runtimeType.hashCode;
}

extension $NationalLoginDtoExtension on NationalLoginDto {
  NationalLoginDto copyWith(
      {String? nationalCode, String? phoneNumber, String? otp}) {
    return NationalLoginDto(
        nationalCode: nationalCode ?? this.nationalCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otp: otp ?? this.otp);
  }

  NationalLoginDto copyWithWrapped(
      {Wrapped<String?>? nationalCode,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? otp}) {
    return NationalLoginDto(
        nationalCode:
            (nationalCode != null ? nationalCode.value : this.nationalCode),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        otp: (otp != null ? otp.value : this.otp));
  }
}

@JsonSerializable(explicitToJson: true)
class NationalLoginDtoApiResult {
  const NationalLoginDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory NationalLoginDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$NationalLoginDtoApiResultFromJson(json);

  static const toJsonFactory = _$NationalLoginDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$NationalLoginDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final NationalLoginDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$NationalLoginDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NationalLoginDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $NationalLoginDtoApiResultExtension on NationalLoginDtoApiResult {
  NationalLoginDtoApiResult copyWith(
      {NationalLoginDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return NationalLoginDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  NationalLoginDtoApiResult copyWithWrapped(
      {Wrapped<NationalLoginDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return NationalLoginDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationDto {
  const NotificationDto({
    this.title,
    this.message,
    this.userId,
    this.dueDate,
    this.id,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  static const toJsonFactory = _$NotificationDtoToJson;
  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'dueDate', includeIfNull: false)
  final DateTime? dueDate;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$NotificationDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NotificationDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.dueDate, dueDate) ||
                const DeepCollectionEquality()
                    .equals(other.dueDate, dueDate)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(dueDate) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $NotificationDtoExtension on NotificationDto {
  NotificationDto copyWith(
      {String? title,
      String? message,
      String? userId,
      DateTime? dueDate,
      String? id}) {
    return NotificationDto(
        title: title ?? this.title,
        message: message ?? this.message,
        userId: userId ?? this.userId,
        dueDate: dueDate ?? this.dueDate,
        id: id ?? this.id);
  }

  NotificationDto copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? message,
      Wrapped<String?>? userId,
      Wrapped<DateTime?>? dueDate,
      Wrapped<String?>? id}) {
    return NotificationDto(
        title: (title != null ? title.value : this.title),
        message: (message != null ? message.value : this.message),
        userId: (userId != null ? userId.value : this.userId),
        dueDate: (dueDate != null ? dueDate.value : this.dueDate),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationDtoApiResult {
  const NotificationDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory NotificationDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoApiResultFromJson(json);

  static const toJsonFactory = _$NotificationDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$NotificationDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final NotificationDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$NotificationDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is NotificationDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $NotificationDtoApiResultExtension on NotificationDtoApiResult {
  NotificationDtoApiResult copyWith(
      {NotificationDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return NotificationDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  NotificationDtoApiResult copyWithWrapped(
      {Wrapped<NotificationDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return NotificationDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentTransactionsDto {
  const PaymentTransactionsDto({
    this.amount,
    this.description,
    this.refId,
    this.userId,
    this.id,
  });

  factory PaymentTransactionsDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentTransactionsDtoFromJson(json);

  static const toJsonFactory = _$PaymentTransactionsDtoToJson;
  Map<String, dynamic> toJson() => _$PaymentTransactionsDtoToJson(this);

  @JsonKey(name: 'amount', includeIfNull: false)
  final int? amount;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'refId', includeIfNull: false)
  final String? refId;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$PaymentTransactionsDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PaymentTransactionsDto &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.refId, refId) ||
                const DeepCollectionEquality().equals(other.refId, refId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(refId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $PaymentTransactionsDtoExtension on PaymentTransactionsDto {
  PaymentTransactionsDto copyWith(
      {int? amount,
      String? description,
      String? refId,
      String? userId,
      String? id}) {
    return PaymentTransactionsDto(
        amount: amount ?? this.amount,
        description: description ?? this.description,
        refId: refId ?? this.refId,
        userId: userId ?? this.userId,
        id: id ?? this.id);
  }

  PaymentTransactionsDto copyWithWrapped(
      {Wrapped<int?>? amount,
      Wrapped<String?>? description,
      Wrapped<String?>? refId,
      Wrapped<String?>? userId,
      Wrapped<String?>? id}) {
    return PaymentTransactionsDto(
        amount: (amount != null ? amount.value : this.amount),
        description:
            (description != null ? description.value : this.description),
        refId: (refId != null ? refId.value : this.refId),
        userId: (userId != null ? userId.value : this.userId),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentTransactionsDtoListApiResult {
  const PaymentTransactionsDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory PaymentTransactionsDtoListApiResult.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentTransactionsDtoListApiResultFromJson(json);

  static const toJsonFactory = _$PaymentTransactionsDtoListApiResultToJson;
  Map<String, dynamic> toJson() =>
      _$PaymentTransactionsDtoListApiResultToJson(this);

  @JsonKey(
      name: 'data',
      includeIfNull: false,
      defaultValue: <PaymentTransactionsDto>[])
  final List<PaymentTransactionsDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$PaymentTransactionsDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PaymentTransactionsDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $PaymentTransactionsDtoListApiResultExtension
    on PaymentTransactionsDtoListApiResult {
  PaymentTransactionsDtoListApiResult copyWith(
      {List<PaymentTransactionsDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return PaymentTransactionsDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  PaymentTransactionsDtoListApiResult copyWithWrapped(
      {Wrapped<List<PaymentTransactionsDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return PaymentTransactionsDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class SettingDto {
  const SettingDto({
    this.banner1ImageUrl,
    this.banner1ImageFile,
    this.banner1Title,
    this.banner1SubTitle,
    this.banner1Description,
    this.banner1ButtonText,
    this.banner1ButtonLink,
    this.banner2ImageUrl,
    this.banner2ImageFile,
    this.banner2Title,
    this.banner2SubTitle,
    this.banner2Description,
    this.banner2ButtonText,
    this.banner2ButtonLink,
    this.banner3ImageUrl,
    this.banner3ImageFile,
    this.banner3Title,
    this.banner3SubTitle,
    this.banner3Description,
    this.banner3ButtonText,
    this.banner3ButtonLink,
    this.id,
  });

  factory SettingDto.fromJson(Map<String, dynamic> json) =>
      _$SettingDtoFromJson(json);

  static const toJsonFactory = _$SettingDtoToJson;
  Map<String, dynamic> toJson() => _$SettingDtoToJson(this);

  @JsonKey(name: 'banner1ImageUrl', includeIfNull: false)
  final String? banner1ImageUrl;
  @JsonKey(name: 'banner1ImageFile', includeIfNull: false)
  final String? banner1ImageFile;
  @JsonKey(name: 'banner1Title', includeIfNull: false)
  final String? banner1Title;
  @JsonKey(name: 'banner1SubTitle', includeIfNull: false)
  final String? banner1SubTitle;
  @JsonKey(name: 'banner1Description', includeIfNull: false)
  final String? banner1Description;
  @JsonKey(name: 'banner1ButtonText', includeIfNull: false)
  final String? banner1ButtonText;
  @JsonKey(name: 'banner1ButtonLink', includeIfNull: false)
  final String? banner1ButtonLink;
  @JsonKey(name: 'banner2ImageUrl', includeIfNull: false)
  final String? banner2ImageUrl;
  @JsonKey(name: 'banner2ImageFile', includeIfNull: false)
  final String? banner2ImageFile;
  @JsonKey(name: 'banner2Title', includeIfNull: false)
  final String? banner2Title;
  @JsonKey(name: 'banner2SubTitle', includeIfNull: false)
  final String? banner2SubTitle;
  @JsonKey(name: 'banner2Description', includeIfNull: false)
  final String? banner2Description;
  @JsonKey(name: 'banner2ButtonText', includeIfNull: false)
  final String? banner2ButtonText;
  @JsonKey(name: 'banner2ButtonLink', includeIfNull: false)
  final String? banner2ButtonLink;
  @JsonKey(name: 'banner3ImageUrl', includeIfNull: false)
  final String? banner3ImageUrl;
  @JsonKey(name: 'banner3ImageFile', includeIfNull: false)
  final String? banner3ImageFile;
  @JsonKey(name: 'banner3Title', includeIfNull: false)
  final String? banner3Title;
  @JsonKey(name: 'banner3SubTitle', includeIfNull: false)
  final String? banner3SubTitle;
  @JsonKey(name: 'banner3Description', includeIfNull: false)
  final String? banner3Description;
  @JsonKey(name: 'banner3ButtonText', includeIfNull: false)
  final String? banner3ButtonText;
  @JsonKey(name: 'banner3ButtonLink', includeIfNull: false)
  final String? banner3ButtonLink;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$SettingDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SettingDto &&
            (identical(other.banner1ImageUrl, banner1ImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ImageUrl, banner1ImageUrl)) &&
            (identical(other.banner1ImageFile, banner1ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ImageFile, banner1ImageFile)) &&
            (identical(other.banner1Title, banner1Title) ||
                const DeepCollectionEquality()
                    .equals(other.banner1Title, banner1Title)) &&
            (identical(other.banner1SubTitle, banner1SubTitle) ||
                const DeepCollectionEquality()
                    .equals(other.banner1SubTitle, banner1SubTitle)) &&
            (identical(other.banner1Description, banner1Description) ||
                const DeepCollectionEquality()
                    .equals(other.banner1Description, banner1Description)) &&
            (identical(other.banner1ButtonText, banner1ButtonText) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ButtonText, banner1ButtonText)) &&
            (identical(other.banner1ButtonLink, banner1ButtonLink) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ButtonLink, banner1ButtonLink)) &&
            (identical(other.banner2ImageUrl, banner2ImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ImageUrl, banner2ImageUrl)) &&
            (identical(other.banner2ImageFile, banner2ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ImageFile, banner2ImageFile)) &&
            (identical(other.banner2Title, banner2Title) ||
                const DeepCollectionEquality()
                    .equals(other.banner2Title, banner2Title)) &&
            (identical(other.banner2SubTitle, banner2SubTitle) ||
                const DeepCollectionEquality()
                    .equals(other.banner2SubTitle, banner2SubTitle)) &&
            (identical(other.banner2Description, banner2Description) ||
                const DeepCollectionEquality()
                    .equals(other.banner2Description, banner2Description)) &&
            (identical(other.banner2ButtonText, banner2ButtonText) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ButtonText, banner2ButtonText)) &&
            (identical(other.banner2ButtonLink, banner2ButtonLink) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ButtonLink, banner2ButtonLink)) &&
            (identical(other.banner3ImageUrl, banner3ImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ImageUrl, banner3ImageUrl)) &&
            (identical(other.banner3ImageFile, banner3ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ImageFile, banner3ImageFile)) &&
            (identical(other.banner3Title, banner3Title) ||
                const DeepCollectionEquality()
                    .equals(other.banner3Title, banner3Title)) &&
            (identical(other.banner3SubTitle, banner3SubTitle) ||
                const DeepCollectionEquality()
                    .equals(other.banner3SubTitle, banner3SubTitle)) &&
            (identical(other.banner3Description, banner3Description) ||
                const DeepCollectionEquality()
                    .equals(other.banner3Description, banner3Description)) &&
            (identical(other.banner3ButtonText, banner3ButtonText) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ButtonText, banner3ButtonText)) &&
            (identical(other.banner3ButtonLink, banner3ButtonLink) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ButtonLink, banner3ButtonLink)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(banner1ImageUrl) ^
      const DeepCollectionEquality().hash(banner1ImageFile) ^
      const DeepCollectionEquality().hash(banner1Title) ^
      const DeepCollectionEquality().hash(banner1SubTitle) ^
      const DeepCollectionEquality().hash(banner1Description) ^
      const DeepCollectionEquality().hash(banner1ButtonText) ^
      const DeepCollectionEquality().hash(banner1ButtonLink) ^
      const DeepCollectionEquality().hash(banner2ImageUrl) ^
      const DeepCollectionEquality().hash(banner2ImageFile) ^
      const DeepCollectionEquality().hash(banner2Title) ^
      const DeepCollectionEquality().hash(banner2SubTitle) ^
      const DeepCollectionEquality().hash(banner2Description) ^
      const DeepCollectionEquality().hash(banner2ButtonText) ^
      const DeepCollectionEquality().hash(banner2ButtonLink) ^
      const DeepCollectionEquality().hash(banner3ImageUrl) ^
      const DeepCollectionEquality().hash(banner3ImageFile) ^
      const DeepCollectionEquality().hash(banner3Title) ^
      const DeepCollectionEquality().hash(banner3SubTitle) ^
      const DeepCollectionEquality().hash(banner3Description) ^
      const DeepCollectionEquality().hash(banner3ButtonText) ^
      const DeepCollectionEquality().hash(banner3ButtonLink) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $SettingDtoExtension on SettingDto {
  SettingDto copyWith(
      {String? banner1ImageUrl,
      String? banner1ImageFile,
      String? banner1Title,
      String? banner1SubTitle,
      String? banner1Description,
      String? banner1ButtonText,
      String? banner1ButtonLink,
      String? banner2ImageUrl,
      String? banner2ImageFile,
      String? banner2Title,
      String? banner2SubTitle,
      String? banner2Description,
      String? banner2ButtonText,
      String? banner2ButtonLink,
      String? banner3ImageUrl,
      String? banner3ImageFile,
      String? banner3Title,
      String? banner3SubTitle,
      String? banner3Description,
      String? banner3ButtonText,
      String? banner3ButtonLink,
      String? id}) {
    return SettingDto(
        banner1ImageUrl: banner1ImageUrl ?? this.banner1ImageUrl,
        banner1ImageFile: banner1ImageFile ?? this.banner1ImageFile,
        banner1Title: banner1Title ?? this.banner1Title,
        banner1SubTitle: banner1SubTitle ?? this.banner1SubTitle,
        banner1Description: banner1Description ?? this.banner1Description,
        banner1ButtonText: banner1ButtonText ?? this.banner1ButtonText,
        banner1ButtonLink: banner1ButtonLink ?? this.banner1ButtonLink,
        banner2ImageUrl: banner2ImageUrl ?? this.banner2ImageUrl,
        banner2ImageFile: banner2ImageFile ?? this.banner2ImageFile,
        banner2Title: banner2Title ?? this.banner2Title,
        banner2SubTitle: banner2SubTitle ?? this.banner2SubTitle,
        banner2Description: banner2Description ?? this.banner2Description,
        banner2ButtonText: banner2ButtonText ?? this.banner2ButtonText,
        banner2ButtonLink: banner2ButtonLink ?? this.banner2ButtonLink,
        banner3ImageUrl: banner3ImageUrl ?? this.banner3ImageUrl,
        banner3ImageFile: banner3ImageFile ?? this.banner3ImageFile,
        banner3Title: banner3Title ?? this.banner3Title,
        banner3SubTitle: banner3SubTitle ?? this.banner3SubTitle,
        banner3Description: banner3Description ?? this.banner3Description,
        banner3ButtonText: banner3ButtonText ?? this.banner3ButtonText,
        banner3ButtonLink: banner3ButtonLink ?? this.banner3ButtonLink,
        id: id ?? this.id);
  }

  SettingDto copyWithWrapped(
      {Wrapped<String?>? banner1ImageUrl,
      Wrapped<String?>? banner1ImageFile,
      Wrapped<String?>? banner1Title,
      Wrapped<String?>? banner1SubTitle,
      Wrapped<String?>? banner1Description,
      Wrapped<String?>? banner1ButtonText,
      Wrapped<String?>? banner1ButtonLink,
      Wrapped<String?>? banner2ImageUrl,
      Wrapped<String?>? banner2ImageFile,
      Wrapped<String?>? banner2Title,
      Wrapped<String?>? banner2SubTitle,
      Wrapped<String?>? banner2Description,
      Wrapped<String?>? banner2ButtonText,
      Wrapped<String?>? banner2ButtonLink,
      Wrapped<String?>? banner3ImageUrl,
      Wrapped<String?>? banner3ImageFile,
      Wrapped<String?>? banner3Title,
      Wrapped<String?>? banner3SubTitle,
      Wrapped<String?>? banner3Description,
      Wrapped<String?>? banner3ButtonText,
      Wrapped<String?>? banner3ButtonLink,
      Wrapped<String?>? id}) {
    return SettingDto(
        banner1ImageUrl: (banner1ImageUrl != null
            ? banner1ImageUrl.value
            : this.banner1ImageUrl),
        banner1ImageFile: (banner1ImageFile != null
            ? banner1ImageFile.value
            : this.banner1ImageFile),
        banner1Title:
            (banner1Title != null ? banner1Title.value : this.banner1Title),
        banner1SubTitle: (banner1SubTitle != null
            ? banner1SubTitle.value
            : this.banner1SubTitle),
        banner1Description: (banner1Description != null
            ? banner1Description.value
            : this.banner1Description),
        banner1ButtonText: (banner1ButtonText != null
            ? banner1ButtonText.value
            : this.banner1ButtonText),
        banner1ButtonLink: (banner1ButtonLink != null
            ? banner1ButtonLink.value
            : this.banner1ButtonLink),
        banner2ImageUrl: (banner2ImageUrl != null
            ? banner2ImageUrl.value
            : this.banner2ImageUrl),
        banner2ImageFile: (banner2ImageFile != null
            ? banner2ImageFile.value
            : this.banner2ImageFile),
        banner2Title:
            (banner2Title != null ? banner2Title.value : this.banner2Title),
        banner2SubTitle: (banner2SubTitle != null
            ? banner2SubTitle.value
            : this.banner2SubTitle),
        banner2Description: (banner2Description != null
            ? banner2Description.value
            : this.banner2Description),
        banner2ButtonText: (banner2ButtonText != null
            ? banner2ButtonText.value
            : this.banner2ButtonText),
        banner2ButtonLink: (banner2ButtonLink != null
            ? banner2ButtonLink.value
            : this.banner2ButtonLink),
        banner3ImageUrl: (banner3ImageUrl != null
            ? banner3ImageUrl.value
            : this.banner3ImageUrl),
        banner3ImageFile: (banner3ImageFile != null
            ? banner3ImageFile.value
            : this.banner3ImageFile),
        banner3Title:
            (banner3Title != null ? banner3Title.value : this.banner3Title),
        banner3SubTitle: (banner3SubTitle != null
            ? banner3SubTitle.value
            : this.banner3SubTitle),
        banner3Description: (banner3Description != null
            ? banner3Description.value
            : this.banner3Description),
        banner3ButtonText: (banner3ButtonText != null
            ? banner3ButtonText.value
            : this.banner3ButtonText),
        banner3ButtonLink: (banner3ButtonLink != null
            ? banner3ButtonLink.value
            : this.banner3ButtonLink),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class ShopCardDto {
  const ShopCardDto({
    this.totalPrice,
    this.rawPrice,
    this.userId,
    this.walletAmount,
    this.shopCardItems,
    this.id,
  });

  factory ShopCardDto.fromJson(Map<String, dynamic> json) =>
      _$ShopCardDtoFromJson(json);

  static const toJsonFactory = _$ShopCardDtoToJson;
  Map<String, dynamic> toJson() => _$ShopCardDtoToJson(this);

  @JsonKey(name: 'totalPrice', includeIfNull: false)
  final int? totalPrice;
  @JsonKey(name: 'rawPrice', includeIfNull: false)
  final int? rawPrice;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'walletAmount', includeIfNull: false)
  final int? walletAmount;
  @JsonKey(
      name: 'shopCardItems',
      includeIfNull: false,
      defaultValue: <ShopCardItemDto>[])
  final List<ShopCardItemDto>? shopCardItems;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$ShopCardDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ShopCardDto &&
            (identical(other.totalPrice, totalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.totalPrice, totalPrice)) &&
            (identical(other.rawPrice, rawPrice) ||
                const DeepCollectionEquality()
                    .equals(other.rawPrice, rawPrice)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.walletAmount, walletAmount) ||
                const DeepCollectionEquality()
                    .equals(other.walletAmount, walletAmount)) &&
            (identical(other.shopCardItems, shopCardItems) ||
                const DeepCollectionEquality()
                    .equals(other.shopCardItems, shopCardItems)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(totalPrice) ^
      const DeepCollectionEquality().hash(rawPrice) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(walletAmount) ^
      const DeepCollectionEquality().hash(shopCardItems) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ShopCardDtoExtension on ShopCardDto {
  ShopCardDto copyWith(
      {int? totalPrice,
      int? rawPrice,
      String? userId,
      int? walletAmount,
      List<ShopCardItemDto>? shopCardItems,
      String? id}) {
    return ShopCardDto(
        totalPrice: totalPrice ?? this.totalPrice,
        rawPrice: rawPrice ?? this.rawPrice,
        userId: userId ?? this.userId,
        walletAmount: walletAmount ?? this.walletAmount,
        shopCardItems: shopCardItems ?? this.shopCardItems,
        id: id ?? this.id);
  }

  ShopCardDto copyWithWrapped(
      {Wrapped<int?>? totalPrice,
      Wrapped<int?>? rawPrice,
      Wrapped<String?>? userId,
      Wrapped<int?>? walletAmount,
      Wrapped<List<ShopCardItemDto>?>? shopCardItems,
      Wrapped<String?>? id}) {
    return ShopCardDto(
        totalPrice: (totalPrice != null ? totalPrice.value : this.totalPrice),
        rawPrice: (rawPrice != null ? rawPrice.value : this.rawPrice),
        userId: (userId != null ? userId.value : this.userId),
        walletAmount:
            (walletAmount != null ? walletAmount.value : this.walletAmount),
        shopCardItems:
            (shopCardItems != null ? shopCardItems.value : this.shopCardItems),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class ShopCardDtoApiResult {
  const ShopCardDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory ShopCardDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$ShopCardDtoApiResultFromJson(json);

  static const toJsonFactory = _$ShopCardDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$ShopCardDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final ShopCardDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$ShopCardDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ShopCardDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ShopCardDtoApiResultExtension on ShopCardDtoApiResult {
  ShopCardDtoApiResult copyWith(
      {ShopCardDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return ShopCardDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  ShopCardDtoApiResult copyWithWrapped(
      {Wrapped<ShopCardDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return ShopCardDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ShopCardItemDto {
  const ShopCardItemDto({
    this.bookId,
    this.bookPrice,
    this.bookDiscountPrice,
    this.bookTotalPrice,
    this.bookNevisande,
    this.bookMotarjem,
    this.bookTitle,
    this.bookDescription,
    this.bookImageUrl,
    this.shopCardId,
    this.id,
  });

  factory ShopCardItemDto.fromJson(Map<String, dynamic> json) =>
      _$ShopCardItemDtoFromJson(json);

  static const toJsonFactory = _$ShopCardItemDtoToJson;
  Map<String, dynamic> toJson() => _$ShopCardItemDtoToJson(this);

  @JsonKey(name: 'bookId', includeIfNull: false)
  final String? bookId;
  @JsonKey(name: 'bookPrice', includeIfNull: false)
  final int? bookPrice;
  @JsonKey(name: 'bookDiscountPrice', includeIfNull: false)
  final int? bookDiscountPrice;
  @JsonKey(name: 'bookTotalPrice', includeIfNull: false)
  final int? bookTotalPrice;
  @JsonKey(name: 'bookNevisande', includeIfNull: false)
  final String? bookNevisande;
  @JsonKey(name: 'bookMotarjem', includeIfNull: false)
  final String? bookMotarjem;
  @JsonKey(name: 'bookTitle', includeIfNull: false)
  final String? bookTitle;
  @JsonKey(name: 'bookDescription', includeIfNull: false)
  final String? bookDescription;
  @JsonKey(name: 'bookImageUrl', includeIfNull: false)
  final String? bookImageUrl;
  @JsonKey(name: 'shopCardId', includeIfNull: false)
  final String? shopCardId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$ShopCardItemDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ShopCardItemDto &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.bookPrice, bookPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookPrice, bookPrice)) &&
            (identical(other.bookDiscountPrice, bookDiscountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookDiscountPrice, bookDiscountPrice)) &&
            (identical(other.bookTotalPrice, bookTotalPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookTotalPrice, bookTotalPrice)) &&
            (identical(other.bookNevisande, bookNevisande) ||
                const DeepCollectionEquality()
                    .equals(other.bookNevisande, bookNevisande)) &&
            (identical(other.bookMotarjem, bookMotarjem) ||
                const DeepCollectionEquality()
                    .equals(other.bookMotarjem, bookMotarjem)) &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)) &&
            (identical(other.bookDescription, bookDescription) ||
                const DeepCollectionEquality()
                    .equals(other.bookDescription, bookDescription)) &&
            (identical(other.bookImageUrl, bookImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bookImageUrl, bookImageUrl)) &&
            (identical(other.shopCardId, shopCardId) ||
                const DeepCollectionEquality()
                    .equals(other.shopCardId, shopCardId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(bookPrice) ^
      const DeepCollectionEquality().hash(bookDiscountPrice) ^
      const DeepCollectionEquality().hash(bookTotalPrice) ^
      const DeepCollectionEquality().hash(bookNevisande) ^
      const DeepCollectionEquality().hash(bookMotarjem) ^
      const DeepCollectionEquality().hash(bookTitle) ^
      const DeepCollectionEquality().hash(bookDescription) ^
      const DeepCollectionEquality().hash(bookImageUrl) ^
      const DeepCollectionEquality().hash(shopCardId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ShopCardItemDtoExtension on ShopCardItemDto {
  ShopCardItemDto copyWith(
      {String? bookId,
      int? bookPrice,
      int? bookDiscountPrice,
      int? bookTotalPrice,
      String? bookNevisande,
      String? bookMotarjem,
      String? bookTitle,
      String? bookDescription,
      String? bookImageUrl,
      String? shopCardId,
      String? id}) {
    return ShopCardItemDto(
        bookId: bookId ?? this.bookId,
        bookPrice: bookPrice ?? this.bookPrice,
        bookDiscountPrice: bookDiscountPrice ?? this.bookDiscountPrice,
        bookTotalPrice: bookTotalPrice ?? this.bookTotalPrice,
        bookNevisande: bookNevisande ?? this.bookNevisande,
        bookMotarjem: bookMotarjem ?? this.bookMotarjem,
        bookTitle: bookTitle ?? this.bookTitle,
        bookDescription: bookDescription ?? this.bookDescription,
        bookImageUrl: bookImageUrl ?? this.bookImageUrl,
        shopCardId: shopCardId ?? this.shopCardId,
        id: id ?? this.id);
  }

  ShopCardItemDto copyWithWrapped(
      {Wrapped<String?>? bookId,
      Wrapped<int?>? bookPrice,
      Wrapped<int?>? bookDiscountPrice,
      Wrapped<int?>? bookTotalPrice,
      Wrapped<String?>? bookNevisande,
      Wrapped<String?>? bookMotarjem,
      Wrapped<String?>? bookTitle,
      Wrapped<String?>? bookDescription,
      Wrapped<String?>? bookImageUrl,
      Wrapped<String?>? shopCardId,
      Wrapped<String?>? id}) {
    return ShopCardItemDto(
        bookId: (bookId != null ? bookId.value : this.bookId),
        bookPrice: (bookPrice != null ? bookPrice.value : this.bookPrice),
        bookDiscountPrice: (bookDiscountPrice != null
            ? bookDiscountPrice.value
            : this.bookDiscountPrice),
        bookTotalPrice: (bookTotalPrice != null
            ? bookTotalPrice.value
            : this.bookTotalPrice),
        bookNevisande:
            (bookNevisande != null ? bookNevisande.value : this.bookNevisande),
        bookMotarjem:
            (bookMotarjem != null ? bookMotarjem.value : this.bookMotarjem),
        bookTitle: (bookTitle != null ? bookTitle.value : this.bookTitle),
        bookDescription: (bookDescription != null
            ? bookDescription.value
            : this.bookDescription),
        bookImageUrl:
            (bookImageUrl != null ? bookImageUrl.value : this.bookImageUrl),
        shopCardId: (shopCardId != null ? shopCardId.value : this.shopCardId),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class StringApiResult {
  const StringApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory StringApiResult.fromJson(Map<String, dynamic> json) =>
      _$StringApiResultFromJson(json);

  static const toJsonFactory = _$StringApiResultToJson;
  Map<String, dynamic> toJson() => _$StringApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final String? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$StringApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is StringApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $StringApiResultExtension on StringApiResult {
  StringApiResult copyWith(
      {String? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return StringApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  StringApiResult copyWithWrapped(
      {Wrapped<String?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return StringApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionDto {
  const SubscriptionDto({
    this.name,
    this.duration,
    this.price,
    this.discountPrice,
    this.id,
  });

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoFromJson(json);

  static const toJsonFactory = _$SubscriptionDtoToJson;
  Map<String, dynamic> toJson() => _$SubscriptionDtoToJson(this);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'duration', includeIfNull: false)
  final int? duration;
  @JsonKey(name: 'price', includeIfNull: false)
  final int? price;
  @JsonKey(name: 'discountPrice', includeIfNull: false)
  final int? discountPrice;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$SubscriptionDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubscriptionDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $SubscriptionDtoExtension on SubscriptionDto {
  SubscriptionDto copyWith(
      {String? name,
      int? duration,
      int? price,
      int? discountPrice,
      String? id}) {
    return SubscriptionDto(
        name: name ?? this.name,
        duration: duration ?? this.duration,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        id: id ?? this.id);
  }

  SubscriptionDto copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<int?>? duration,
      Wrapped<int?>? price,
      Wrapped<int?>? discountPrice,
      Wrapped<String?>? id}) {
    return SubscriptionDto(
        name: (name != null ? name.value : this.name),
        duration: (duration != null ? duration.value : this.duration),
        price: (price != null ? price.value : this.price),
        discountPrice:
            (discountPrice != null ? discountPrice.value : this.discountPrice),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionDtoApiResult {
  const SubscriptionDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory SubscriptionDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoApiResultFromJson(json);

  static const toJsonFactory = _$SubscriptionDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$SubscriptionDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final SubscriptionDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$SubscriptionDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubscriptionDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $SubscriptionDtoApiResultExtension on SubscriptionDtoApiResult {
  SubscriptionDtoApiResult copyWith(
      {SubscriptionDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return SubscriptionDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  SubscriptionDtoApiResult copyWithWrapped(
      {Wrapped<SubscriptionDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return SubscriptionDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionDtoListApiResult {
  const SubscriptionDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory SubscriptionDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoListApiResultFromJson(json);

  static const toJsonFactory = _$SubscriptionDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$SubscriptionDtoListApiResultToJson(this);

  @JsonKey(
      name: 'data', includeIfNull: false, defaultValue: <SubscriptionDto>[])
  final List<SubscriptionDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$SubscriptionDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubscriptionDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $SubscriptionDtoListApiResultExtension
    on SubscriptionDtoListApiResult {
  SubscriptionDtoListApiResult copyWith(
      {List<SubscriptionDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return SubscriptionDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  SubscriptionDtoListApiResult copyWithWrapped(
      {Wrapped<List<SubscriptionDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return SubscriptionDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class TempUserDto {
  const TempUserDto({
    required this.phoneNumber,
    this.otp,
    this.fname,
    this.lname,
    this.creationDate,
    this.exist,
    this.id,
  });

  factory TempUserDto.fromJson(Map<String, dynamic> json) =>
      _$TempUserDtoFromJson(json);

  static const toJsonFactory = _$TempUserDtoToJson;
  Map<String, dynamic> toJson() => _$TempUserDtoToJson(this);

  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String phoneNumber;
  @JsonKey(name: 'otp', includeIfNull: false)
  final String? otp;
  @JsonKey(name: 'fname', includeIfNull: false)
  final String? fname;
  @JsonKey(name: 'lname', includeIfNull: false)
  final String? lname;
  @JsonKey(name: 'creationDate', includeIfNull: false)
  final DateTime? creationDate;
  @JsonKey(name: 'exist', includeIfNull: false)
  final bool? exist;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$TempUserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TempUserDto &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.fname, fname) ||
                const DeepCollectionEquality().equals(other.fname, fname)) &&
            (identical(other.lname, lname) ||
                const DeepCollectionEquality().equals(other.lname, lname)) &&
            (identical(other.creationDate, creationDate) ||
                const DeepCollectionEquality()
                    .equals(other.creationDate, creationDate)) &&
            (identical(other.exist, exist) ||
                const DeepCollectionEquality().equals(other.exist, exist)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(fname) ^
      const DeepCollectionEquality().hash(lname) ^
      const DeepCollectionEquality().hash(creationDate) ^
      const DeepCollectionEquality().hash(exist) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $TempUserDtoExtension on TempUserDto {
  TempUserDto copyWith(
      {String? phoneNumber,
      String? otp,
      String? fname,
      String? lname,
      DateTime? creationDate,
      bool? exist,
      String? id}) {
    return TempUserDto(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otp: otp ?? this.otp,
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        creationDate: creationDate ?? this.creationDate,
        exist: exist ?? this.exist,
        id: id ?? this.id);
  }

  TempUserDto copyWithWrapped(
      {Wrapped<String>? phoneNumber,
      Wrapped<String?>? otp,
      Wrapped<String?>? fname,
      Wrapped<String?>? lname,
      Wrapped<DateTime?>? creationDate,
      Wrapped<bool?>? exist,
      Wrapped<String?>? id}) {
    return TempUserDto(
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        otp: (otp != null ? otp.value : this.otp),
        fname: (fname != null ? fname.value : this.fname),
        lname: (lname != null ? lname.value : this.lname),
        creationDate:
            (creationDate != null ? creationDate.value : this.creationDate),
        exist: (exist != null ? exist.value : this.exist),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class TempUserDtoApiResult {
  const TempUserDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory TempUserDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$TempUserDtoApiResultFromJson(json);

  static const toJsonFactory = _$TempUserDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$TempUserDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final TempUserDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$TempUserDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TempUserDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $TempUserDtoApiResultExtension on TempUserDtoApiResult {
  TempUserDtoApiResult copyWith(
      {TempUserDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return TempUserDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  TempUserDtoApiResult copyWithWrapped(
      {Wrapped<TempUserDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return TempUserDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class UserDto {
  const UserDto({
    this.seatNumber,
    this.certificateUrl,
    this.conId,
    this.sex,
    this.userName,
    this.code,
    this.phoneNumber,
    this.firstName,
    this.chap,
    this.lastName,
    this.nationalCode,
    this.userAvatar,
    this.userBarcode,
    this.barcodeNumber,
    this.likedCategories,
    this.expertiseId,
    this.addUserRole,
    this.showUserRole,
    this.password,
    this.walletAmount,
    this.foodDayOne,
    this.foodDayTwo,
    this.foodDayThree,
    this.foodDayFour,
    this.foodDay1Code,
    this.foodDay2Code,
    this.foodDay3Code,
    this.foodDay4Code,
    this.hasGift,
    this.role,
    this.stepTwo,
    this.hasSub,
    this.subDueDate,
    this.subName,
    this.subPrice,
    this.isActive,
    this.reshte,
    this.takhasos,
    this.expertises,
    this.categories,
    this.id,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  static const toJsonFactory = _$UserDtoToJson;
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(name: 'seatNumber', includeIfNull: false)
  final String? seatNumber;
  @JsonKey(name: 'certificateUrl', includeIfNull: false)
  final String? certificateUrl;
  @JsonKey(name: 'conId', includeIfNull: false)
  final String? conId;
  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: sexNullableToJson,
    fromJson: sexNullableFromJson,
  )
  final enums.Sex? sex;
  @JsonKey(name: 'userName', includeIfNull: false)
  final String? userName;
  @JsonKey(name: 'code', includeIfNull: false)
  final String? code;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'chap', includeIfNull: false)
  final bool? chap;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'nationalCode', includeIfNull: false)
  final String? nationalCode;
  @JsonKey(name: 'userAvatar', includeIfNull: false)
  final String? userAvatar;
  @JsonKey(name: 'userBarcode', includeIfNull: false)
  final String? userBarcode;
  @JsonKey(name: 'barcodeNumber', includeIfNull: false)
  final String? barcodeNumber;
  @JsonKey(name: 'likedCategories', includeIfNull: false)
  final String? likedCategories;
  @JsonKey(name: 'expertiseId', includeIfNull: false)
  final String? expertiseId;
  @JsonKey(
    name: 'addUserRole',
    includeIfNull: false,
    toJson: userRolesNullableToJson,
    fromJson: userRolesNullableFromJson,
  )
  final enums.UserRoles? addUserRole;
  @JsonKey(name: 'showUserRole', includeIfNull: false)
  final String? showUserRole;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'walletAmount', includeIfNull: false)
  final int? walletAmount;
  @JsonKey(name: 'foodDayOne', includeIfNull: false)
  final bool? foodDayOne;
  @JsonKey(name: 'foodDayTwo', includeIfNull: false)
  final bool? foodDayTwo;
  @JsonKey(name: 'foodDayThree', includeIfNull: false)
  final bool? foodDayThree;
  @JsonKey(name: 'foodDayFour', includeIfNull: false)
  final bool? foodDayFour;
  @JsonKey(name: 'foodDay1Code', includeIfNull: false)
  final String? foodDay1Code;
  @JsonKey(name: 'foodDay2Code', includeIfNull: false)
  final String? foodDay2Code;
  @JsonKey(name: 'foodDay3Code', includeIfNull: false)
  final String? foodDay3Code;
  @JsonKey(name: 'foodDay4Code', includeIfNull: false)
  final String? foodDay4Code;
  @JsonKey(name: 'hasGift', includeIfNull: false)
  final bool? hasGift;
  @JsonKey(name: 'role', includeIfNull: false)
  final String? role;
  @JsonKey(name: 'stepTwo', includeIfNull: false)
  final bool? stepTwo;
  @JsonKey(name: 'hasSub', includeIfNull: false)
  final bool? hasSub;
  @JsonKey(name: 'subDueDate', includeIfNull: false)
  final DateTime? subDueDate;
  @JsonKey(name: 'subName', includeIfNull: false)
  final String? subName;
  @JsonKey(name: 'subPrice', includeIfNull: false)
  final int? subPrice;
  @JsonKey(name: 'isActive', includeIfNull: false)
  final bool? isActive;
  @JsonKey(name: 'reshte', includeIfNull: false)
  final String? reshte;
  @JsonKey(name: 'takhasos', includeIfNull: false)
  final String? takhasos;
  @JsonKey(
      name: 'expertises', includeIfNull: false, defaultValue: <ExpertiseDto>[])
  final List<ExpertiseDto>? expertises;
  @JsonKey(
      name: 'categories', includeIfNull: false, defaultValue: <CategoryDto>[])
  final List<CategoryDto>? categories;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$UserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserDto &&
            (identical(other.seatNumber, seatNumber) ||
                const DeepCollectionEquality()
                    .equals(other.seatNumber, seatNumber)) &&
            (identical(other.certificateUrl, certificateUrl) ||
                const DeepCollectionEquality()
                    .equals(other.certificateUrl, certificateUrl)) &&
            (identical(other.conId, conId) ||
                const DeepCollectionEquality().equals(other.conId, conId)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.chap, chap) ||
                const DeepCollectionEquality().equals(other.chap, chap)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.nationalCode, nationalCode) ||
                const DeepCollectionEquality()
                    .equals(other.nationalCode, nationalCode)) &&
            (identical(other.userAvatar, userAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.userAvatar, userAvatar)) &&
            (identical(other.userBarcode, userBarcode) ||
                const DeepCollectionEquality()
                    .equals(other.userBarcode, userBarcode)) &&
            (identical(other.barcodeNumber, barcodeNumber) ||
                const DeepCollectionEquality()
                    .equals(other.barcodeNumber, barcodeNumber)) &&
            (identical(other.likedCategories, likedCategories) ||
                const DeepCollectionEquality()
                    .equals(other.likedCategories, likedCategories)) &&
            (identical(other.expertiseId, expertiseId) ||
                const DeepCollectionEquality()
                    .equals(other.expertiseId, expertiseId)) &&
            (identical(other.addUserRole, addUserRole) ||
                const DeepCollectionEquality()
                    .equals(other.addUserRole, addUserRole)) &&
            (identical(other.showUserRole, showUserRole) ||
                const DeepCollectionEquality()
                    .equals(other.showUserRole, showUserRole)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.walletAmount, walletAmount) ||
                const DeepCollectionEquality()
                    .equals(other.walletAmount, walletAmount)) &&
            (identical(other.foodDayOne, foodDayOne) ||
                const DeepCollectionEquality()
                    .equals(other.foodDayOne, foodDayOne)) &&
            (identical(other.foodDayTwo, foodDayTwo) ||
                const DeepCollectionEquality()
                    .equals(other.foodDayTwo, foodDayTwo)) &&
            (identical(other.foodDayThree, foodDayThree) ||
                const DeepCollectionEquality()
                    .equals(other.foodDayThree, foodDayThree)) &&
            (identical(other.foodDayFour, foodDayFour) ||
                const DeepCollectionEquality().equals(other.foodDayFour, foodDayFour)) &&
            (identical(other.foodDay1Code, foodDay1Code) || const DeepCollectionEquality().equals(other.foodDay1Code, foodDay1Code)) &&
            (identical(other.foodDay2Code, foodDay2Code) || const DeepCollectionEquality().equals(other.foodDay2Code, foodDay2Code)) &&
            (identical(other.foodDay3Code, foodDay3Code) || const DeepCollectionEquality().equals(other.foodDay3Code, foodDay3Code)) &&
            (identical(other.foodDay4Code, foodDay4Code) || const DeepCollectionEquality().equals(other.foodDay4Code, foodDay4Code)) &&
            (identical(other.hasGift, hasGift) || const DeepCollectionEquality().equals(other.hasGift, hasGift)) &&
            (identical(other.role, role) || const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.stepTwo, stepTwo) || const DeepCollectionEquality().equals(other.stepTwo, stepTwo)) &&
            (identical(other.hasSub, hasSub) || const DeepCollectionEquality().equals(other.hasSub, hasSub)) &&
            (identical(other.subDueDate, subDueDate) || const DeepCollectionEquality().equals(other.subDueDate, subDueDate)) &&
            (identical(other.subName, subName) || const DeepCollectionEquality().equals(other.subName, subName)) &&
            (identical(other.subPrice, subPrice) || const DeepCollectionEquality().equals(other.subPrice, subPrice)) &&
            (identical(other.isActive, isActive) || const DeepCollectionEquality().equals(other.isActive, isActive)) &&
            (identical(other.reshte, reshte) || const DeepCollectionEquality().equals(other.reshte, reshte)) &&
            (identical(other.takhasos, takhasos) || const DeepCollectionEquality().equals(other.takhasos, takhasos)) &&
            (identical(other.expertises, expertises) || const DeepCollectionEquality().equals(other.expertises, expertises)) &&
            (identical(other.categories, categories) || const DeepCollectionEquality().equals(other.categories, categories)) &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(seatNumber) ^
      const DeepCollectionEquality().hash(certificateUrl) ^
      const DeepCollectionEquality().hash(conId) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(chap) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(nationalCode) ^
      const DeepCollectionEquality().hash(userAvatar) ^
      const DeepCollectionEquality().hash(userBarcode) ^
      const DeepCollectionEquality().hash(barcodeNumber) ^
      const DeepCollectionEquality().hash(likedCategories) ^
      const DeepCollectionEquality().hash(expertiseId) ^
      const DeepCollectionEquality().hash(addUserRole) ^
      const DeepCollectionEquality().hash(showUserRole) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(walletAmount) ^
      const DeepCollectionEquality().hash(foodDayOne) ^
      const DeepCollectionEquality().hash(foodDayTwo) ^
      const DeepCollectionEquality().hash(foodDayThree) ^
      const DeepCollectionEquality().hash(foodDayFour) ^
      const DeepCollectionEquality().hash(foodDay1Code) ^
      const DeepCollectionEquality().hash(foodDay2Code) ^
      const DeepCollectionEquality().hash(foodDay3Code) ^
      const DeepCollectionEquality().hash(foodDay4Code) ^
      const DeepCollectionEquality().hash(hasGift) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(stepTwo) ^
      const DeepCollectionEquality().hash(hasSub) ^
      const DeepCollectionEquality().hash(subDueDate) ^
      const DeepCollectionEquality().hash(subName) ^
      const DeepCollectionEquality().hash(subPrice) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(reshte) ^
      const DeepCollectionEquality().hash(takhasos) ^
      const DeepCollectionEquality().hash(expertises) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $UserDtoExtension on UserDto {
  UserDto copyWith(
      {String? seatNumber,
      String? certificateUrl,
      String? conId,
      enums.Sex? sex,
      String? userName,
      String? code,
      String? phoneNumber,
      String? firstName,
      bool? chap,
      String? lastName,
      String? nationalCode,
      String? userAvatar,
      String? userBarcode,
      String? barcodeNumber,
      String? likedCategories,
      String? expertiseId,
      enums.UserRoles? addUserRole,
      String? showUserRole,
      String? password,
      int? walletAmount,
      bool? foodDayOne,
      bool? foodDayTwo,
      bool? foodDayThree,
      bool? foodDayFour,
      String? foodDay1Code,
      String? foodDay2Code,
      String? foodDay3Code,
      String? foodDay4Code,
      bool? hasGift,
      String? role,
      bool? stepTwo,
      bool? hasSub,
      DateTime? subDueDate,
      String? subName,
      int? subPrice,
      bool? isActive,
      String? reshte,
      String? takhasos,
      List<ExpertiseDto>? expertises,
      List<CategoryDto>? categories,
      String? id}) {
    return UserDto(
        seatNumber: seatNumber ?? this.seatNumber,
        certificateUrl: certificateUrl ?? this.certificateUrl,
        conId: conId ?? this.conId,
        sex: sex ?? this.sex,
        userName: userName ?? this.userName,
        code: code ?? this.code,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        chap: chap ?? this.chap,
        lastName: lastName ?? this.lastName,
        nationalCode: nationalCode ?? this.nationalCode,
        userAvatar: userAvatar ?? this.userAvatar,
        userBarcode: userBarcode ?? this.userBarcode,
        barcodeNumber: barcodeNumber ?? this.barcodeNumber,
        likedCategories: likedCategories ?? this.likedCategories,
        expertiseId: expertiseId ?? this.expertiseId,
        addUserRole: addUserRole ?? this.addUserRole,
        showUserRole: showUserRole ?? this.showUserRole,
        password: password ?? this.password,
        walletAmount: walletAmount ?? this.walletAmount,
        foodDayOne: foodDayOne ?? this.foodDayOne,
        foodDayTwo: foodDayTwo ?? this.foodDayTwo,
        foodDayThree: foodDayThree ?? this.foodDayThree,
        foodDayFour: foodDayFour ?? this.foodDayFour,
        foodDay1Code: foodDay1Code ?? this.foodDay1Code,
        foodDay2Code: foodDay2Code ?? this.foodDay2Code,
        foodDay3Code: foodDay3Code ?? this.foodDay3Code,
        foodDay4Code: foodDay4Code ?? this.foodDay4Code,
        hasGift: hasGift ?? this.hasGift,
        role: role ?? this.role,
        stepTwo: stepTwo ?? this.stepTwo,
        hasSub: hasSub ?? this.hasSub,
        subDueDate: subDueDate ?? this.subDueDate,
        subName: subName ?? this.subName,
        subPrice: subPrice ?? this.subPrice,
        isActive: isActive ?? this.isActive,
        reshte: reshte ?? this.reshte,
        takhasos: takhasos ?? this.takhasos,
        expertises: expertises ?? this.expertises,
        categories: categories ?? this.categories,
        id: id ?? this.id);
  }

  UserDto copyWithWrapped(
      {Wrapped<String?>? seatNumber,
      Wrapped<String?>? certificateUrl,
      Wrapped<String?>? conId,
      Wrapped<enums.Sex?>? sex,
      Wrapped<String?>? userName,
      Wrapped<String?>? code,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? firstName,
      Wrapped<bool?>? chap,
      Wrapped<String?>? lastName,
      Wrapped<String?>? nationalCode,
      Wrapped<String?>? userAvatar,
      Wrapped<String?>? userBarcode,
      Wrapped<String?>? barcodeNumber,
      Wrapped<String?>? likedCategories,
      Wrapped<String?>? expertiseId,
      Wrapped<enums.UserRoles?>? addUserRole,
      Wrapped<String?>? showUserRole,
      Wrapped<String?>? password,
      Wrapped<int?>? walletAmount,
      Wrapped<bool?>? foodDayOne,
      Wrapped<bool?>? foodDayTwo,
      Wrapped<bool?>? foodDayThree,
      Wrapped<bool?>? foodDayFour,
      Wrapped<String?>? foodDay1Code,
      Wrapped<String?>? foodDay2Code,
      Wrapped<String?>? foodDay3Code,
      Wrapped<String?>? foodDay4Code,
      Wrapped<bool?>? hasGift,
      Wrapped<String?>? role,
      Wrapped<bool?>? stepTwo,
      Wrapped<bool?>? hasSub,
      Wrapped<DateTime?>? subDueDate,
      Wrapped<String?>? subName,
      Wrapped<int?>? subPrice,
      Wrapped<bool?>? isActive,
      Wrapped<String?>? reshte,
      Wrapped<String?>? takhasos,
      Wrapped<List<ExpertiseDto>?>? expertises,
      Wrapped<List<CategoryDto>?>? categories,
      Wrapped<String?>? id}) {
    return UserDto(
        seatNumber: (seatNumber != null ? seatNumber.value : this.seatNumber),
        certificateUrl: (certificateUrl != null
            ? certificateUrl.value
            : this.certificateUrl),
        conId: (conId != null ? conId.value : this.conId),
        sex: (sex != null ? sex.value : this.sex),
        userName: (userName != null ? userName.value : this.userName),
        code: (code != null ? code.value : this.code),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        firstName: (firstName != null ? firstName.value : this.firstName),
        chap: (chap != null ? chap.value : this.chap),
        lastName: (lastName != null ? lastName.value : this.lastName),
        nationalCode:
            (nationalCode != null ? nationalCode.value : this.nationalCode),
        userAvatar: (userAvatar != null ? userAvatar.value : this.userAvatar),
        userBarcode:
            (userBarcode != null ? userBarcode.value : this.userBarcode),
        barcodeNumber:
            (barcodeNumber != null ? barcodeNumber.value : this.barcodeNumber),
        likedCategories: (likedCategories != null
            ? likedCategories.value
            : this.likedCategories),
        expertiseId:
            (expertiseId != null ? expertiseId.value : this.expertiseId),
        addUserRole:
            (addUserRole != null ? addUserRole.value : this.addUserRole),
        showUserRole:
            (showUserRole != null ? showUserRole.value : this.showUserRole),
        password: (password != null ? password.value : this.password),
        walletAmount:
            (walletAmount != null ? walletAmount.value : this.walletAmount),
        foodDayOne: (foodDayOne != null ? foodDayOne.value : this.foodDayOne),
        foodDayTwo: (foodDayTwo != null ? foodDayTwo.value : this.foodDayTwo),
        foodDayThree:
            (foodDayThree != null ? foodDayThree.value : this.foodDayThree),
        foodDayFour:
            (foodDayFour != null ? foodDayFour.value : this.foodDayFour),
        foodDay1Code:
            (foodDay1Code != null ? foodDay1Code.value : this.foodDay1Code),
        foodDay2Code:
            (foodDay2Code != null ? foodDay2Code.value : this.foodDay2Code),
        foodDay3Code:
            (foodDay3Code != null ? foodDay3Code.value : this.foodDay3Code),
        foodDay4Code:
            (foodDay4Code != null ? foodDay4Code.value : this.foodDay4Code),
        hasGift: (hasGift != null ? hasGift.value : this.hasGift),
        role: (role != null ? role.value : this.role),
        stepTwo: (stepTwo != null ? stepTwo.value : this.stepTwo),
        hasSub: (hasSub != null ? hasSub.value : this.hasSub),
        subDueDate: (subDueDate != null ? subDueDate.value : this.subDueDate),
        subName: (subName != null ? subName.value : this.subName),
        subPrice: (subPrice != null ? subPrice.value : this.subPrice),
        isActive: (isActive != null ? isActive.value : this.isActive),
        reshte: (reshte != null ? reshte.value : this.reshte),
        takhasos: (takhasos != null ? takhasos.value : this.takhasos),
        expertises: (expertises != null ? expertises.value : this.expertises),
        categories: (categories != null ? categories.value : this.categories),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class UserDtoApiResult {
  const UserDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory UserDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$UserDtoApiResultFromJson(json);

  static const toJsonFactory = _$UserDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$UserDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final UserDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$UserDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $UserDtoApiResultExtension on UserDtoApiResult {
  UserDtoApiResult copyWith(
      {UserDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return UserDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  UserDtoApiResult copyWithWrapped(
      {Wrapped<UserDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return UserDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AdminIndexPost$RequestBody {
  const ApiV1AdminIndexPost$RequestBody({
    this.banner1ImageFile,
    this.banner2ImageFile,
    this.banner3ImageFile,
  });

  factory ApiV1AdminIndexPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ApiV1AdminIndexPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1AdminIndexPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AdminIndexPost$RequestBodyToJson(this);

  @JsonKey(name: 'Banner1ImageFile', includeIfNull: false)
  final String? banner1ImageFile;
  @JsonKey(name: 'Banner2ImageFile', includeIfNull: false)
  final String? banner2ImageFile;
  @JsonKey(name: 'Banner3ImageFile', includeIfNull: false)
  final String? banner3ImageFile;
  static const fromJsonFactory = _$ApiV1AdminIndexPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1AdminIndexPost$RequestBody &&
            (identical(other.banner1ImageFile, banner1ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ImageFile, banner1ImageFile)) &&
            (identical(other.banner2ImageFile, banner2ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ImageFile, banner2ImageFile)) &&
            (identical(other.banner3ImageFile, banner3ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ImageFile, banner3ImageFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(banner1ImageFile) ^
      const DeepCollectionEquality().hash(banner2ImageFile) ^
      const DeepCollectionEquality().hash(banner3ImageFile) ^
      runtimeType.hashCode;
}

extension $ApiV1AdminIndexPost$RequestBodyExtension
    on ApiV1AdminIndexPost$RequestBody {
  ApiV1AdminIndexPost$RequestBody copyWith(
      {String? banner1ImageFile,
      String? banner2ImageFile,
      String? banner3ImageFile}) {
    return ApiV1AdminIndexPost$RequestBody(
        banner1ImageFile: banner1ImageFile ?? this.banner1ImageFile,
        banner2ImageFile: banner2ImageFile ?? this.banner2ImageFile,
        banner3ImageFile: banner3ImageFile ?? this.banner3ImageFile);
  }

  ApiV1AdminIndexPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? banner1ImageFile,
      Wrapped<String?>? banner2ImageFile,
      Wrapped<String?>? banner3ImageFile}) {
    return ApiV1AdminIndexPost$RequestBody(
        banner1ImageFile: (banner1ImageFile != null
            ? banner1ImageFile.value
            : this.banner1ImageFile),
        banner2ImageFile: (banner2ImageFile != null
            ? banner2ImageFile.value
            : this.banner2ImageFile),
        banner3ImageFile: (banner3ImageFile != null
            ? banner3ImageFile.value
            : this.banner3ImageFile));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AuthenticationFreeTokenPost$RequestBody {
  const ApiV1AuthenticationFreeTokenPost$RequestBody({
    this.grantType,
    this.username,
    this.password,
    this.refreshToken,
    this.scope,
    this.clientId,
    this.clientSecret,
  });

  factory ApiV1AuthenticationFreeTokenPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyToJson(this);

  @JsonKey(name: 'grant_type', includeIfNull: false)
  final String? grantType;
  @JsonKey(name: 'username', includeIfNull: false)
  final String? username;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;
  @JsonKey(name: 'scope', includeIfNull: false)
  final String? scope;
  @JsonKey(name: 'client_id', includeIfNull: false)
  final String? clientId;
  @JsonKey(name: 'client_secret', includeIfNull: false)
  final String? clientSecret;
  static const fromJsonFactory =
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1AuthenticationFreeTokenPost$RequestBody &&
            (identical(other.grantType, grantType) ||
                const DeepCollectionEquality()
                    .equals(other.grantType, grantType)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.clientSecret, clientSecret) ||
                const DeepCollectionEquality()
                    .equals(other.clientSecret, clientSecret)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(grantType) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(clientSecret) ^
      runtimeType.hashCode;
}

extension $ApiV1AuthenticationFreeTokenPost$RequestBodyExtension
    on ApiV1AuthenticationFreeTokenPost$RequestBody {
  ApiV1AuthenticationFreeTokenPost$RequestBody copyWith(
      {String? grantType,
      String? username,
      String? password,
      String? refreshToken,
      String? scope,
      String? clientId,
      String? clientSecret}) {
    return ApiV1AuthenticationFreeTokenPost$RequestBody(
        grantType: grantType ?? this.grantType,
        username: username ?? this.username,
        password: password ?? this.password,
        refreshToken: refreshToken ?? this.refreshToken,
        scope: scope ?? this.scope,
        clientId: clientId ?? this.clientId,
        clientSecret: clientSecret ?? this.clientSecret);
  }

  ApiV1AuthenticationFreeTokenPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? grantType,
      Wrapped<String?>? username,
      Wrapped<String?>? password,
      Wrapped<String?>? refreshToken,
      Wrapped<String?>? scope,
      Wrapped<String?>? clientId,
      Wrapped<String?>? clientSecret}) {
    return ApiV1AuthenticationFreeTokenPost$RequestBody(
        grantType: (grantType != null ? grantType.value : this.grantType),
        username: (username != null ? username.value : this.username),
        password: (password != null ? password.value : this.password),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        scope: (scope != null ? scope.value : this.scope),
        clientId: (clientId != null ? clientId.value : this.clientId),
        clientSecret:
            (clientSecret != null ? clientSecret.value : this.clientSecret));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AuthenticationCompleteProfilePost$RequestBody {
  const ApiV1AuthenticationCompleteProfilePost$RequestBody({
    this.pofileImage,
  });

  factory ApiV1AuthenticationCompleteProfilePost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1AuthenticationCompleteProfilePost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$ApiV1AuthenticationCompleteProfilePost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AuthenticationCompleteProfilePost$RequestBodyToJson(this);

  @JsonKey(name: 'PofileImage', includeIfNull: false)
  final String? pofileImage;
  static const fromJsonFactory =
      _$ApiV1AuthenticationCompleteProfilePost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1AuthenticationCompleteProfilePost$RequestBody &&
            (identical(other.pofileImage, pofileImage) ||
                const DeepCollectionEquality()
                    .equals(other.pofileImage, pofileImage)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(pofileImage) ^ runtimeType.hashCode;
}

extension $ApiV1AuthenticationCompleteProfilePost$RequestBodyExtension
    on ApiV1AuthenticationCompleteProfilePost$RequestBody {
  ApiV1AuthenticationCompleteProfilePost$RequestBody copyWith(
      {String? pofileImage}) {
    return ApiV1AuthenticationCompleteProfilePost$RequestBody(
        pofileImage: pofileImage ?? this.pofileImage);
  }

  ApiV1AuthenticationCompleteProfilePost$RequestBody copyWithWrapped(
      {Wrapped<String?>? pofileImage}) {
    return ApiV1AuthenticationCompleteProfilePost$RequestBody(
        pofileImage:
            (pofileImage != null ? pofileImage.value : this.pofileImage));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1BookAddPost$RequestBody {
  const ApiV1BookAddPost$RequestBody({
    this.fehrestFile,
    this.imageFile,
    this.pdfFile,
  });

  factory ApiV1BookAddPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ApiV1BookAddPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1BookAddPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$ApiV1BookAddPost$RequestBodyToJson(this);

  @JsonKey(name: 'FehrestFile', includeIfNull: false)
  final String? fehrestFile;
  @JsonKey(name: 'ImageFile', includeIfNull: false)
  final String? imageFile;
  @JsonKey(name: 'PdfFile', includeIfNull: false)
  final String? pdfFile;
  static const fromJsonFactory = _$ApiV1BookAddPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1BookAddPost$RequestBody &&
            (identical(other.fehrestFile, fehrestFile) ||
                const DeepCollectionEquality()
                    .equals(other.fehrestFile, fehrestFile)) &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.pdfFile, pdfFile) ||
                const DeepCollectionEquality().equals(other.pdfFile, pdfFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(fehrestFile) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(pdfFile) ^
      runtimeType.hashCode;
}

extension $ApiV1BookAddPost$RequestBodyExtension
    on ApiV1BookAddPost$RequestBody {
  ApiV1BookAddPost$RequestBody copyWith(
      {String? fehrestFile, String? imageFile, String? pdfFile}) {
    return ApiV1BookAddPost$RequestBody(
        fehrestFile: fehrestFile ?? this.fehrestFile,
        imageFile: imageFile ?? this.imageFile,
        pdfFile: pdfFile ?? this.pdfFile);
  }

  ApiV1BookAddPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? fehrestFile,
      Wrapped<String?>? imageFile,
      Wrapped<String?>? pdfFile}) {
    return ApiV1BookAddPost$RequestBody(
        fehrestFile:
            (fehrestFile != null ? fehrestFile.value : this.fehrestFile),
        imageFile: (imageFile != null ? imageFile.value : this.imageFile),
        pdfFile: (pdfFile != null ? pdfFile.value : this.pdfFile));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1BookAddddPost$RequestBody {
  const ApiV1BookAddddPost$RequestBody({
    this.file,
  });

  factory ApiV1BookAddddPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ApiV1BookAddddPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1BookAddddPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$ApiV1BookAddddPost$RequestBodyToJson(this);

  @JsonKey(name: 'File', includeIfNull: false)
  final String? file;
  static const fromJsonFactory = _$ApiV1BookAddddPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1BookAddddPost$RequestBody &&
            (identical(other.file, file) ||
                const DeepCollectionEquality().equals(other.file, file)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(file) ^ runtimeType.hashCode;
}

extension $ApiV1BookAddddPost$RequestBodyExtension
    on ApiV1BookAddddPost$RequestBody {
  ApiV1BookAddddPost$RequestBody copyWith({String? file}) {
    return ApiV1BookAddddPost$RequestBody(file: file ?? this.file);
  }

  ApiV1BookAddddPost$RequestBody copyWithWrapped({Wrapped<String?>? file}) {
    return ApiV1BookAddddPost$RequestBody(
        file: (file != null ? file.value : this.file));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1UserUpdateProfilePost$RequestBody {
  const ApiV1UserUpdateProfilePost$RequestBody({
    this.userAvatarFile,
  });

  factory ApiV1UserUpdateProfilePost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1UserUpdateProfilePost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1UserUpdateProfilePost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1UserUpdateProfilePost$RequestBodyToJson(this);

  @JsonKey(name: 'UserAvatarFile', includeIfNull: false)
  final String? userAvatarFile;
  static const fromJsonFactory =
      _$ApiV1UserUpdateProfilePost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1UserUpdateProfilePost$RequestBody &&
            (identical(other.userAvatarFile, userAvatarFile) ||
                const DeepCollectionEquality()
                    .equals(other.userAvatarFile, userAvatarFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userAvatarFile) ^
      runtimeType.hashCode;
}

extension $ApiV1UserUpdateProfilePost$RequestBodyExtension
    on ApiV1UserUpdateProfilePost$RequestBody {
  ApiV1UserUpdateProfilePost$RequestBody copyWith({String? userAvatarFile}) {
    return ApiV1UserUpdateProfilePost$RequestBody(
        userAvatarFile: userAvatarFile ?? this.userAvatarFile);
  }

  ApiV1UserUpdateProfilePost$RequestBody copyWithWrapped(
      {Wrapped<String?>? userAvatarFile}) {
    return ApiV1UserUpdateProfilePost$RequestBody(
        userAvatarFile: (userAvatarFile != null
            ? userAvatarFile.value
            : this.userAvatarFile));
  }
}

String? apiResultStatusCodeNullableToJson(
    enums.ApiResultStatusCode? apiResultStatusCode) {
  return apiResultStatusCode?.value;
}

String? apiResultStatusCodeToJson(
    enums.ApiResultStatusCode apiResultStatusCode) {
  return apiResultStatusCode.value;
}

enums.ApiResultStatusCode apiResultStatusCodeFromJson(
  Object? apiResultStatusCode, [
  enums.ApiResultStatusCode? defaultValue,
]) {
  return enums.ApiResultStatusCode.values
          .firstWhereOrNull((e) => e.value == apiResultStatusCode) ??
      defaultValue ??
      enums.ApiResultStatusCode.swaggerGeneratedUnknown;
}

enums.ApiResultStatusCode? apiResultStatusCodeNullableFromJson(
  Object? apiResultStatusCode, [
  enums.ApiResultStatusCode? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return null;
  }
  return enums.ApiResultStatusCode.values
          .firstWhereOrNull((e) => e.value == apiResultStatusCode) ??
      defaultValue;
}

String apiResultStatusCodeExplodedListToJson(
    List<enums.ApiResultStatusCode>? apiResultStatusCode) {
  return apiResultStatusCode?.map((e) => e.value!).join(',') ?? '';
}

List<String> apiResultStatusCodeListToJson(
    List<enums.ApiResultStatusCode>? apiResultStatusCode) {
  if (apiResultStatusCode == null) {
    return [];
  }

  return apiResultStatusCode.map((e) => e.value!).toList();
}

List<enums.ApiResultStatusCode> apiResultStatusCodeListFromJson(
  List? apiResultStatusCode, [
  List<enums.ApiResultStatusCode>? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return defaultValue ?? [];
  }

  return apiResultStatusCode
      .map((e) => apiResultStatusCodeFromJson(e.toString()))
      .toList();
}

List<enums.ApiResultStatusCode>? apiResultStatusCodeNullableListFromJson(
  List? apiResultStatusCode, [
  List<enums.ApiResultStatusCode>? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return defaultValue;
  }

  return apiResultStatusCode
      .map((e) => apiResultStatusCodeFromJson(e.toString()))
      .toList();
}

String? saveTypeNullableToJson(enums.SaveType? saveType) {
  return saveType?.value;
}

String? saveTypeToJson(enums.SaveType saveType) {
  return saveType.value;
}

enums.SaveType saveTypeFromJson(
  Object? saveType, [
  enums.SaveType? defaultValue,
]) {
  return enums.SaveType.values.firstWhereOrNull((e) => e.value == saveType) ??
      defaultValue ??
      enums.SaveType.swaggerGeneratedUnknown;
}

enums.SaveType? saveTypeNullableFromJson(
  Object? saveType, [
  enums.SaveType? defaultValue,
]) {
  if (saveType == null) {
    return null;
  }
  return enums.SaveType.values.firstWhereOrNull((e) => e.value == saveType) ??
      defaultValue;
}

String saveTypeExplodedListToJson(List<enums.SaveType>? saveType) {
  return saveType?.map((e) => e.value!).join(',') ?? '';
}

List<String> saveTypeListToJson(List<enums.SaveType>? saveType) {
  if (saveType == null) {
    return [];
  }

  return saveType.map((e) => e.value!).toList();
}

List<enums.SaveType> saveTypeListFromJson(
  List? saveType, [
  List<enums.SaveType>? defaultValue,
]) {
  if (saveType == null) {
    return defaultValue ?? [];
  }

  return saveType.map((e) => saveTypeFromJson(e.toString())).toList();
}

List<enums.SaveType>? saveTypeNullableListFromJson(
  List? saveType, [
  List<enums.SaveType>? defaultValue,
]) {
  if (saveType == null) {
    return defaultValue;
  }

  return saveType.map((e) => saveTypeFromJson(e.toString())).toList();
}

String? sexNullableToJson(enums.Sex? sex) {
  return sex?.value;
}

String? sexToJson(enums.Sex sex) {
  return sex.value;
}

enums.Sex sexFromJson(
  Object? sex, [
  enums.Sex? defaultValue,
]) {
  return enums.Sex.values.firstWhereOrNull((e) => e.value == sex) ??
      defaultValue ??
      enums.Sex.swaggerGeneratedUnknown;
}

enums.Sex? sexNullableFromJson(
  Object? sex, [
  enums.Sex? defaultValue,
]) {
  if (sex == null) {
    return null;
  }
  return enums.Sex.values.firstWhereOrNull((e) => e.value == sex) ??
      defaultValue;
}

String sexExplodedListToJson(List<enums.Sex>? sex) {
  return sex?.map((e) => e.value!).join(',') ?? '';
}

List<String> sexListToJson(List<enums.Sex>? sex) {
  if (sex == null) {
    return [];
  }

  return sex.map((e) => e.value!).toList();
}

List<enums.Sex> sexListFromJson(
  List? sex, [
  List<enums.Sex>? defaultValue,
]) {
  if (sex == null) {
    return defaultValue ?? [];
  }

  return sex.map((e) => sexFromJson(e.toString())).toList();
}

List<enums.Sex>? sexNullableListFromJson(
  List? sex, [
  List<enums.Sex>? defaultValue,
]) {
  if (sex == null) {
    return defaultValue;
  }

  return sex.map((e) => sexFromJson(e.toString())).toList();
}

String? userRolesNullableToJson(enums.UserRoles? userRoles) {
  return userRoles?.value;
}

String? userRolesToJson(enums.UserRoles userRoles) {
  return userRoles.value;
}

enums.UserRoles userRolesFromJson(
  Object? userRoles, [
  enums.UserRoles? defaultValue,
]) {
  return enums.UserRoles.values.firstWhereOrNull((e) => e.value == userRoles) ??
      defaultValue ??
      enums.UserRoles.swaggerGeneratedUnknown;
}

enums.UserRoles? userRolesNullableFromJson(
  Object? userRoles, [
  enums.UserRoles? defaultValue,
]) {
  if (userRoles == null) {
    return null;
  }
  return enums.UserRoles.values.firstWhereOrNull((e) => e.value == userRoles) ??
      defaultValue;
}

String userRolesExplodedListToJson(List<enums.UserRoles>? userRoles) {
  return userRoles?.map((e) => e.value!).join(',') ?? '';
}

List<String> userRolesListToJson(List<enums.UserRoles>? userRoles) {
  if (userRoles == null) {
    return [];
  }

  return userRoles.map((e) => e.value!).toList();
}

List<enums.UserRoles> userRolesListFromJson(
  List? userRoles, [
  List<enums.UserRoles>? defaultValue,
]) {
  if (userRoles == null) {
    return defaultValue ?? [];
  }

  return userRoles.map((e) => userRolesFromJson(e.toString())).toList();
}

List<enums.UserRoles>? userRolesNullableListFromJson(
  List? userRoles, [
  List<enums.UserRoles>? defaultValue,
]) {
  if (userRoles == null) {
    return defaultValue;
  }

  return userRoles.map((e) => userRolesFromJson(e.toString())).toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
