import 'package:expense_manager/core/constants.dart';
import 'package:expense_manager/data/models/category.dart';
import 'package:expense_manager/data/models/category_with_entry_list.dart';
import 'package:expense_manager/data/models/category_with_sum.dart';
import 'package:expense_manager/data/models/entry.dart';
import 'package:expense_manager/data/models/history.dart';
import 'package:tuple/tuple.dart';

abstract class EntryRepository {
  Stream<List<String>> getMonthListByYear(EntryType entryType, int year);

  Stream<List<int>> getYearList(EntryType entryType);

  Stream<int> addEntry(EntryType entryType, Entry entry);

  Stream<bool> updateEntry(EntryType entryType, Entry entry);

  Stream<int> deleteEntry(EntryType entryType, int id);

  Stream<List<CategoryWithEntryList>> getAllEntryWithCategory(
      DateTime start, DateTime end);

  Stream<List<History>> getAllEntryWithCategoryDateWiseByMonthAndYear(
      EntryType entryType, int month, int year);

  Stream<int> addCategory(EntryType entryType, Category category);

  Stream<bool> updateCategory(EntryType entryType, Category category);

  Stream<int> deleteCategory(EntryType entryType, int id);

  Stream<bool> reorderCategory(int oldIndex, int newIndex);

  Stream<List<Category>> getAllCategory(EntryType entryType);

  Stream<List<CategoryWithSum>> getCategoryDetails(
      Tuple2<String, int> filterType);
}
