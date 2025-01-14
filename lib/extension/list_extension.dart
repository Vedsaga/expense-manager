import 'package:expense_manager/data/models/entry_with_category.dart';
import 'package:fimber/fimber.dart';

extension ListExtension<T> on List<EntryWithCategory> {
  Map<int, List<EntryWithCategory>> groupListsByMonth(int currentMonth) {
    var result = <int,List<EntryWithCategory>>{};

    for (int i = 1; i <= currentMonth; i++) {
      result[i] = <EntryWithCategory>[];
    }
Fimber.e(result.toString());
    for (var element in this) {
      if(element.entry.modifiedDate.month<=currentMonth)
      (result[element.entry.modifiedDate.month])..add(element);
    }
    return result;
  }
}
