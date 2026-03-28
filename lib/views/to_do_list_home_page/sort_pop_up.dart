import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/view_models/to_do_vm.dart';

import '../../utils/theme/appTheme.dart';

class SortPopupMenu extends StatelessWidget {
  final String searchText;
  const SortPopupMenu({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Sorting>(
      icon: const Icon(Icons.sort, color: AppThemes.white),
      tooltip: 'Sort',
      onSelected: (sortValue) async {
        await context.read<ToDoVm>().fetchToDoList(
          sortValue: sortValue,
          searchText: searchText,
          statusValue: context.read<ToDoVm>().status,
        );
      },
      itemBuilder: (_) => const [
        PopupMenuItem(value: Sorting.az, child: Text('Title A → Z')),
        PopupMenuItem(value: Sorting.za, child: Text('Title Z → A')),
        PopupMenuItem(
          value: Sorting.firstCompleted,
          child: Text('Completed first'),
        ),
        PopupMenuItem(
          value: Sorting.lastCompleted,
          child: Text('Incomplete first'),
        ),
        PopupMenuItem(value: Sorting.none, child: Text('Default order')),
      ],
    );
  }
}
