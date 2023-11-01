import 'package:isar/isar.dart';

part 'account_entity.g.dart';

@collection
class AccountEntity {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  final String? username;
  final String? password;

  AccountEntity({
    this.username,
    this.password,
  });
}

//flutter clean
//flutter pub get