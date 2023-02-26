import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services{
  static Future<void> showModalSheet ({required BuildContext context})async{
    await showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15)
                  ),
                ),
                backgroundColor: scaffoldBackgroundColor,
                context: context, 
                builder: (context){
                  return const Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        // ignore: unnecessary_const
                        const Flexible(
                          child: TextWidget(
                            label: "Chosen Model:",
                            fontsize: 16,),),
                      ],
                    ),
                    );
                },
                );
  }
}