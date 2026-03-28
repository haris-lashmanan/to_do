import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/utils/theme/appTheme.dart';
import 'package:todolist/views/to_do_list_home_page/sort_pop_up.dart';
import 'package:todolist/views/to_do_list_home_page/to_do_card.dart';

import '../../view_models/to_do_vm.dart';

class ToDoListHomepage extends StatefulWidget {
  const ToDoListHomepage({super.key});

  @override
  State<ToDoListHomepage> createState() => _ToDoListHomepageState();
}

class _ToDoListHomepageState extends State<ToDoListHomepage> {
  final TextEditingController _myController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final toDoList = context.watch<ToDoVm>().toDoList;
    return Scaffold(
      backgroundColor: AppThemes.black12,
      appBar: AppBar(
        title: Text(
          'To Do Items',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: AppThemes.white,
          ),
        ),
        actions: [SortPopupMenu(searchText: _myController.text)],
        actionsPadding: EdgeInsetsDirectional.only(end: 8.0),
        backgroundColor: AppThemes.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isAppSize = (MediaQuery.of(context).size.width < 500);
              return Column(
                crossAxisAlignment: (isAppSize)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: (isAppSize)
                        ? double.infinity
                        : (MediaQuery.of(context).size.width * 0.35),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppThemes.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: AppThemes.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(
                              0,
                              4,
                            ), // Position of the shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _myController,
                        onChanged: (value) async {
                          await context.read<ToDoVm>().fetchToDoList(
                            searchText: _myController.text,
                          );
                        },
                        decoration: InputDecoration(
                          hintText: 'Search your ToDo Item...',
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () async {
                              _myController.clear();
                              await context.read<ToDoVm>().fetchToDoList(
                                searchText: _myController.text,
                              );
                            },
                            // This creates the circular "halo" effect on hover
                            hoverColor: AppThemes.grey.withValues(alpha: 0.1),
                            splashRadius:
                                20, // Keeps the ripple/hover effect tight around the icon
                            icon: Icon(
                              Icons.clear,
                              color: AppThemes.black,
                              size: 20,
                            ),
                            tooltip:
                                'Clear text', // Good for accessibility and shows on long hover
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: AppThemes.grey,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(
                              color: AppThemes.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: AppThemes.blue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: isAppSize
                        ? WrapAlignment.start
                        : WrapAlignment.center,
                    children: [
                      statusWidget(Status.all),
                      statusWidget(Status.completed),
                      statusWidget(Status.pending),
                    ],
                  ),
                  Expanded(
                    child: (toDoList == null || toDoList.isEmpty)
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('No todos found.'),
                                SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () async {
                                    await context.read<ToDoVm>().fetchToDoList(
                                      searchText: _myController.text,
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight
                                          .w700, // Use FontWeight constants
                                      fontSize: 16,
                                    ),
                                  ),
                                  child: const Text("Retry"),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: ListView.builder(
                              // shrinkWrap: true, // No longer needed with Expanded
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              itemCount: toDoList.length,
                              itemBuilder: (context, index) {
                                final todo = toDoList[index];
                                return TodoCard(todo: todo);
                              },
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget statusWidget(Status status) {
    return InkWell(
      onTap: () async {
        await context.read<ToDoVm>().fetchToDoList(
          statusValue: status,
          searchText: _myController.text,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppThemes.black,
          border: Border.all(color: AppThemes.white),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            bottom: 12.0,
            left: 4,
            right: 4,
          ),
          child: Center(
            child: Text(
              ToDoVm.returnStatus(status),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppThemes.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
