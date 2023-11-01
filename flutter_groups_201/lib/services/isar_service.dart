import 'package:flutter_groups_201/models/account_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> database;

  IsarService() {
    database = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          AccountEntitySchema,
        ],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  ///Thêm try catch
  Future<bool> createAccount(AccountEntity account) async {
    try {
      final isar = await database;
      isar.writeTxnSync<int>(() => isar.accountEntitys.putSync(account));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<AccountEntity>> getAllAccounts() async {
    final isar = await database;

    final result = await isar.accountEntitys.where().findAll();
    return result;
  }

  ///Thêm try-catch
  Future<bool> deleteAccount(AccountEntity account) async {
    try {
      final isar = await database;
      await isar.writeTxn(() async {
        await isar.accountEntitys.delete(account.id); // delete
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
