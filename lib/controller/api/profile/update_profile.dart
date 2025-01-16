import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:bookapp/model/services/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResult> updateProfile({
  required BuildContext context,
  Sex? sex,
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
}) async {
  final api = Tikonline.create(interceptors: [TokenInterceptor('accessToken')]);

  final postResult = await api.apiV1UserUpdateProfilePost(
      UserAvatarFile: UserAvatarFile,
      birthDay: birthDay,
      categories: categories,
      expertiesId: expertiesId,
      expertises: expertises,
      firstName: firstName,
      id: id,
      lastName: lastName,
      likedCategories: likedCategories,
      nationalCode: nationalCode,
      password: password,
      phoneNumber: phoneNumber,
      sex: sex,
      userAvatar: userAvatar,
      userName: userName);
  print(postResult);
  if (postResult.isSuccessful == true) {
    print('Right');
    // loader maybe <====
    // QuickAlert.show(
    //   context: context,
    //   type: QuickAlertType.confirm,
    //   title: 'Oops1...',
    //   text: dto.toString(),
    // );
  } else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops2...',
      text: postResult.toString(),
    );
  }
  final response = ApiResult.fromJson(postResult.body!.toJson());

  return response;
}

Future<void> filesHTTP(
    {String? phoneNumber,
    String? firstName,
    // Sex? sex,
    String? lastName,
    String? nationalCode,
    // String? birthDay,
    // String? likedCategories,
    // String? expertiesId,
    XFile? UserAvatarFile,
    required BuildContext context}) async {
  try {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

//for main image
    Uint8List? bytes;
    if (UserAvatarFile != null) {
      var stream = http.ByteStream(UserAvatarFile.openRead());
      bytes = await UserAvatarFile.readAsBytes();
      final int length = await UserAvatarFile.length();
      print("$bytes" + "THis is lengthhhh");
    }

//for gallery image

    final request = http.MultipartRequest('post',
        Uri.parse("https://api.tikonline.net/api/v1/User/UpdateProfile"))
      ..fields['FirstName'] = firstName ?? ""
      ..fields['LastName'] = lastName ?? ""
      ..fields['NationalCode'] = nationalCode ?? ""
      ..fields['PhoneNumber'] = phoneNumber ?? "";
    // ..fields['BirthDay'] = birthDay.toString() ?? "";
    // ..fields['Sex'] = sex.toString() ?? "";
    // ..fields['LikedCategories'] = likedCategories.toString() ?? ""
    // ..fields['ExpertiesId'] = expertiesId.toString() ?? "";
    // ..fields['Expertises'] = expertises.toString() ?? ""
    // ..fields['Categories'] = categories.toString() ?? "";
    // if (id != null) {
    //   request.fields["Id"] = id;
    // }

    if (bytes != null) {
      request.files.add(http.MultipartFile.fromBytes(
        "UserAvatarFile",
        bytes,
        filename: '.png',
      ));
      print("ey vay");
    }

    request.headers['authorization'] =
        'Bearer ${sharedPreferences.getString('accessToken')}';

    request.headers['Content-Type'] = 'multipart/form-data';

    http.Response response =
        await http.Response.fromStream(await request.send());
    print(response.body);
  } catch (e) {
    print(e);
  }
}
