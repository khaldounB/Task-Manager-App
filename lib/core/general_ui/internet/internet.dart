// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_offline/flutter_offline.dart';

// Project imports:
import '../../logic/singleton/statics.dart';

class Internet extends StatelessWidget {
  const Internet({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
           bool connected = connectivity != ConnectivityResult.none;
          return connected
              ? child
              : Padding(
                padding:  EdgeInsets.symmetric(horizontal: width(20)),
                child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: double.infinity,
                        height: height(181),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/no-internet-image.png'))),
                      ),
                    SizedBox(
                      height: height(10),
                    ),

                  ],
                ),
              );
        },
        child: child,
      ),
    );
  }
}
