import 'package:flutter/material.dart';

import '../../../../core/blocs/apps/cubit.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No data available',
        style:Theme.of(context).textTheme.bodyText1,


        textAlign: TextAlign.center,
      ),
    );
  }
}