import 'package:flutter/material.dart';
import 'package:qyt_client/qyt_client.dart';
import 'package:qyt_flutter/Const/const.dart';
import 'package:qyt_flutter/Controllers/Database/question_controller.dart';
import 'package:qyt_flutter/Extensions/context.dart';
import 'package:qyt_flutter/Extensions/num.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Models/table_model.dart';
import 'package:qyt_flutter/Views/Admin/Question/add_edit.dart';
import 'package:qyt_flutter/Views/Widgets/confirm_dialog.dart';
import 'package:qyt_flutter/Views/Widgets/custom_button.dart';
import 'package:qyt_flutter/Views/Widgets/future_builder_handling.dart';
import 'package:qyt_flutter/Views/Widgets/global_app_bar.dart';
import 'package:qyt_flutter/Views/Widgets/table_widget.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({super.key, this.category, this.quiz});
  final Category? category;
  final Quiz? quiz;

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> with StateTools {
  final qc = QuestionDbController();
  (List<Question>?, DbException?) data = (null, null);

  fetchData({bool direct = false}) async {
    if (direct) {
      data = await action();
      data = await qc.getAll(categoryId: widget.category?.id, quizId: widget.quiz?.id);
      return;
    }
    data = await run(() => qc.getAll(categoryId: widget.category?.id, quizId: widget.quiz?.id));
    data = await run(() => action());
  }

  action() {
    return qc.getAll();
  }

  Future<void> refresh() async {
    await fetchData(direct: true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.to(const QuestionCrud());
            await refresh();
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            GlobalAppBar(title: titleGenerate()),
            10.h,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    return FutureBuilderHandling(
                      data: data,
                      snapshot: snapshot,
                      success: () {
                        var list = data.$1!;
                        List<TableColumnModel> columns = [
                          TableColumnModel(title: "Question"),
                          TableColumnModel(title: "A"),
                          TableColumnModel(title: "B"),
                          TableColumnModel(title: "C"),
                          TableColumnModel(title: "D"),
                          TableColumnModel(title: "Answer"),
                          TableColumnModel(title: "Point"),
                          TableColumnModel(title: "Action", type: ColType.Widget),
                        ];

                        List<TableRowModel> rows = [];

                        int index = -1;

                        for (var e in list) {
                          rows.add(
                            TableRowModel(
                              cells: [
                                TableCellModel(data: e.content),
                                TableCellModel(data: e.a),
                                TableCellModel(data: e.b),
                                TableCellModel(data: e.c),
                                TableCellModel(data: e.d),
                                TableCellModel(data: e.answer),
                                TableCellModel(data: e.point.toString()),
                                TableCellModel(
                                  data: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        onTap: () async {
                                          await context.to(QuestionCrud(question: e));
                                          await refresh();
                                        },
                                        bgColor: greenColor,
                                        icon: Icons.edit,
                                      ),
                                      10.w,
                                      CustomButton(
                                        onTap: () async {
                                          confirmDialog(
                                              context: context,
                                              message: "Are you sure you want to delete this question?",
                                              onConfirm: () async {
                                                var result = await qc.delete(e);
                                                if (result.$2 != null) {
                                                  bottomMessage(context, result.$2!.message);
                                                } else {
                                                  data.$1!.removeAt(index);
                                                  setState(() {});
                                                  bottomMessage(context, "Deleted successfully",
                                                      type: MessageType.success);
                                                }
                                                context.back();
                                              });
                                        },
                                        bgColor: redColor,
                                        icon: Icons.delete_forever_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );

                          index++;
                        }

                        return TablePartial(columns: columns, rows: rows);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String titleGenerate() {
    String title = "Question List";

    if (widget.quiz != null) {
      title = "Quiz: ${widget.quiz?.title}";
    } else if (widget.category != null) {
      title = "Category: ${widget.category?.name}";
    }

    return title;
  }
}
