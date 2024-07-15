import 'package:bootstrap_flutter_plus/bootstrap_flutter_plus.dart';
import 'package:flutter/material.dart';
import 'package:qyt_client/qyt_client.dart';
import 'package:qyt_flutter/Controllers/Database/question_controller.dart';
import 'package:qyt_flutter/Extensions/context.dart';
import 'package:qyt_flutter/Helpers/ext.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';
import 'package:qyt_flutter/Views/Widgets/custom_button.dart';
import 'package:qyt_flutter/Views/Widgets/custom_text_field.dart';
import 'package:qyt_flutter/Views/Widgets/global_app_Bar.dart';

class QuestionCrud extends StatefulWidget {
  const QuestionCrud({super.key, this.question});
  final Question? question;

  @override
  State<QuestionCrud> createState() => _QuestionCrudState();
}

class _QuestionCrudState extends State<QuestionCrud> with StateTools {
  bool get edit => widget.question != null;
  Question? question;

  final qc = QuestionDbController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    question = widget.question;
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GlobalAppBar(title: "Question ${edit ? "Edit" : "Add"}"),
            Expanded(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: BsContainer(
                      children: [
                        CustomTextInput(
                          name: "content",
                          hintText: "Content",
                          initialData: question?.content,
                          maxLines: 10,
                          required: true,
                        ),
                        BsRow(
                          children: [
                            BsCol(
                              child: CustomTextInput(
                                name: "qA",
                                hintText: "A",
                                initialData: question?.a,
                                required: true,
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "qB",
                                hintText: "B",
                                initialData: question?.b,
                                required: true,
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "qC",
                                hintText: "C",
                                initialData: question?.c,
                                required: true,
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "qD",
                                hintText: "D",
                                initialData: question?.d,
                                required: true,
                              ),
                            ),
                          ],
                        ),
                        BsRow(
                          children: [
                            BsCol(
                              child: CustomTextInput(
                                name: "answer",
                                hintText: "Answer",
                                initialData: question?.answer,
                                required: true,
                              ),
                            ),
                            BsCol(
                              child: CustomTextInput(
                                name: "point",
                                hintText: "Point",
                                initialData: question?.point.toString(),
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              if (edit) {
                                question!.content = ic.getValue("content");
                                question!.a = ic.getValue("qA");
                                question!.b = ic.getValue("qB");
                                question!.c = ic.getValue("qC");
                                question!.d = ic.getValue("qD");
                                question!.answer = ic.getValue("answer");
                                question!.point =
                                    int.tryParse(ic.getValue("point")) ?? 0;
                                question!.updatedAt = DateTime.now();
                              } else {
                                question = Question(
                                  content: ic.getValue("content"),
                                  a: ic.getValue("qA"),
                                  b: ic.getValue("qB"),
                                  c: ic.getValue("qC"),
                                  d: ic.getValue("qD"),
                                  answer: ic.getValue("answer"),
                                  point:
                                      int.tryParse(ic.getValue("point")) ?? 0,
                                  createdAt: DateTime.now(),
                                );
                              }
                              var result = await (edit
                                  ? qc.update(question!)
                                  : qc.add(question!));

                              if (result.$2 != null) {
                                bottomMessage(context, result.$2?.message);
                                return;
                              }

                              context.back();
                            }
                          },
                          title: "Save",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
