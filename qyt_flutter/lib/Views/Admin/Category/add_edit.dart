import 'package:bootstrap_flutter_plus/bootstrap_flutter_plus.dart';
import 'package:flutter/material.dart';
import 'package:qyt_client/qyt_client.dart';
import 'package:qyt_flutter/Controllers/Database/category_controller.dart';
import 'package:qyt_flutter/Controllers/Database/question_controller.dart';
import 'package:qyt_flutter/Extensions/context.dart';
import 'package:qyt_flutter/Extensions/num.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Admin/Category/list.dart';
import 'package:qyt_flutter/Views/Widgets/custom_button.dart';
import 'package:qyt_flutter/Views/Widgets/custom_text_field.dart';
import 'package:qyt_flutter/Views/Widgets/dropdown.dart';
import 'package:qyt_flutter/Views/Widgets/future_builder_handling.dart';
import 'package:qyt_flutter/Views/Widgets/global_app_Bar.dart';

class CategoryCrud extends StatefulWidget {
  const CategoryCrud({super.key, this.category});
  final Category? category;

  @override
  State<CategoryCrud> createState() => _CategoryCrudState();
}

class _CategoryCrudState extends State<CategoryCrud> with StateTools {
  bool get edit => widget.category != null;
  final qc = QuestionDbController();
  final cc = CategoryController();
  (List<Question>?, DbException?) data = (null, null);
  Map<String, String> questionList = {};

  Category category = Category(name: "");

  fetchData() async {
    return await run(
      () async {
        data = await qc.getAll();

        if (data.$1 == null) {
          return;
        }

        for (var el in data.$1!) {
          questionList[el.id.toString()] = el.content;
        }

        for (CategoryQuestion el in category.questions ?? []) {
          if (category.questionIds == null) {
            category.questionIds = [];
          }
          category.questionIds?.add(el.questionId.toString());
        }
        print(category.questionIds);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (edit) {
      category = widget.category!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              GlobalAppBar(title: "Category ${edit ? "Edit" : "Add"}"),
              15.h,
              Expanded(
                child: Column(
                  children: [
                    BsRow(
                      children: [
                        BsCol(
                          child: CustomTextInput(
                            name: "catName",
                            hintText: "Name",
                            initialData: category.name,
                            onChanged: (value) {
                              category.name = value ?? "";
                            },
                          ),
                        ),
                        BsCol(
                          child: FutureBuilder(
                            future: fetchData(),
                            builder: (context, snapshot) {
                              return FutureBuilderHandling(
                                snapshot: snapshot,
                                data: data,
                                success: () {
                                  return CustomDropDown(
                                    multiple: true,
                                    selectedKeys: category.questionIds,
                                    items: questionList,
                                    onMultiChanged: (Map<String, String> data) {
                                      category.questionIds = data.keys.toList();
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    10.h,
                    CustomButton(
                      onTap: () async {
                        var result = await (edit ? cc.update(category) : cc.add(category));
                        if (result.$2 != null) {
                          bottomMessage(context, result.$2!.message);
                          return;
                        }

                        context.toReplace(const AdminCategoryList());
                      },
                      title: "Save",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
