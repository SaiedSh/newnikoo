import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum ApiResultStatusCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Success')
  success('Success'),
  @JsonValue('ServerError')
  servererror('ServerError'),
  @JsonValue('BadRequest')
  badrequest('BadRequest'),
  @JsonValue('NotFound')
  notfound('NotFound'),
  @JsonValue('ListEmpty')
  listempty('ListEmpty'),
  @JsonValue('LogicError')
  logicerror('LogicError'),
  @JsonValue('UnAuthorized')
  unauthorized('UnAuthorized');

  final String? value;

  const ApiResultStatusCode(this.value);
}

enum SaveType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Read')
  read('Read'),
  @JsonValue('Like')
  like('Like'),
  @JsonValue('Shelf')
  shelf('Shelf');

  final String? value;

  const SaveType(this.value);
}

enum Sex {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Male')
  male('Male'),
  @JsonValue('Female')
  female('Female');

  final String? value;

  const Sex(this.value);
}

enum UserRoles {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Admin')
  admin('Admin'),
  @JsonValue('Food')
  food('Food'),
  @JsonValue('Gift')
  gift('Gift'),
  @JsonValue('Entrance')
  entrance('Entrance'),
  @JsonValue('Vip')
  vip('Vip'),
  @JsonValue('Speaker')
  speaker('Speaker'),
  @JsonValue('Contributor')
  contributor('Contributor'),
  @JsonValue('Shop')
  shop('Shop'),
  @JsonValue('Guest')
  guest('Guest'),
  @JsonValue('Team')
  team('Team'),
  @JsonValue('Student')
  student('Student');

  final String? value;

  const UserRoles(this.value);
}
