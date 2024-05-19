// Flutter imports:
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:taskmanager/core/constants/material_design/k_colors.dart';
import 'package:taskmanager/core/general_ui/bottom_sheet/bottom_sheet.dart';
import 'package:taskmanager/core/general_ui/input/text_input.dart';
import 'package:taskmanager/core/logic/singleton/statics.dart';

// Project imports:
import 'package:taskmanager/features/home/providers/home_provider.dart';

import '../../../../core/constants/material_design/k_fonts.dart';
import '../../../../core/general_ui/progress_animated/progress_animated_widget.dart';
import '../../../../core/general_ui/text/text_network.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(box.getSaveData(key: 'token'));
    return ListenableProvider<HomeProvider>(
      create: (context) => HomeProvider(context: context, load: true),
      child: Scaffold(
        backgroundColor: KColors().kScaffoldColor,
        appBar: AppBar(
          backgroundColor: KColors().kScaffoldColor,
          surfaceTintColor: KColors().kScaffoldColor,
          centerTitle: true,
          title: TextNetwork(
            text: 'ToDos',
            color: KColors().kDarkBlackColor,
            fontFamily: KFonts().kBold,
            fontSize: 18,
          ),
        ),
        body: Consumer<HomeProvider>(builder: (context, provider, child) {
          return provider.load
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: width(16)),
                  itemBuilder: (context, index) => Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width(12)),
                            border: Border.all(
                                color:
                                   (provider.toDosModel.todos![index].isDeleted ??false) ?Colors.red: provider.toDosModel.todos![index].completed!
                                        ? Colors.green
                                        : Colors.yellow)),
                        child: TextNetwork(
                          text: provider.toDosModel.todos![index].todo!,
                          color: KColors().kDarkBlackColor,
                          fontFamily: KFonts().kBold,
                          fontSize: 18,
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: height(10),
                      ),
                  itemCount: provider.toDosModel.todos!.length);
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/home/add');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
