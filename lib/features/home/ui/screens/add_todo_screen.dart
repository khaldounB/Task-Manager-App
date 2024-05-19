import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/core/constants/material_design/k_keys.dart';
import 'package:taskmanager/features/home/data/requests/add_todo_request.dart';
import 'package:taskmanager/features/home/providers/home_provider.dart';

import '../../../../core/constants/material_design/k_colors.dart';
import '../../../../core/constants/material_design/k_fonts.dart';
import '../../../../core/general_ui/input/text_input.dart';
import '../../../../core/general_ui/progress_animated/progress_animated_widget.dart';
import '../../../../core/general_ui/text/text_network.dart';
import '../../../../core/logic/singleton/statics.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(create: (context) => HomeProvider(context: context,load: false),child: Scaffold(
      backgroundColor: KColors().kScaffoldColor,
      appBar: AppBar(
        backgroundColor: KColors().kScaffoldColor,
        surfaceTintColor: KColors().kScaffoldColor,
        centerTitle: true,
        title: TextNetwork(
          text: 'Add ToDo',
          color: KColors().kDarkBlackColor,
          fontFamily: KFonts().kBold,
          fontSize: 18,
        ),
      ),
      body:   Consumer<HomeProvider>(
        builder: (context,provider,child) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: width(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                SizedBox(
                  height: height(30),
                ),
                TextInput(
                    hint: 'ToDo',
                    heighte: height(49),
                    colors: Colors.white,
                    widthe: double.infinity,
                    controller: provider.todoController,
                    textInputType: TextInputType.text,
                    error: provider.todoError),
                SizedBox(
                  height: height(30),
                ),
                GestureDetector(
                  onTap: () async {
                    provider.todoError = false;
                    if(provider.todoController.text.isNotEmpty){
                      provider.loadAddNewTodo = true;
                      await provider.addToDo(context: context, request: AddToDoRequest(provider.todoController.text, false, box.getSaveData(key: KKeys().id))).then((value){
                        provider.loadAddNewTodo = false;
                        context.pop();
                      });
                    }else{
                      provider.todoError = true;
                      snack.showErrorSnack(context: context, message: 'Please fill todo.');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: height(49),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width(8)),
                        color: Colors.cyan),
                    child: provider.loadAddNewTodo?
                    LoadingLine(colors: KColors().kScaffoldColor)
                        : TextNetwork(
                      text: 'Add',
                      color: KColors().kDarkBlackColor,
                      fontFamily: KFonts().kBold,
                      fontSize: 18,
                      align: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    ) ,);
  }
}
