import 'package:flutter/material.dart';
import '../../../../core/blocs/apps/cubit.dart';
import 'cityitem.dart';
import 'nodata_widget.dart';

class OtherLocationsListViewOfDrawer extends StatelessWidget {
  const OtherLocationsListViewOfDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBloc.get(context).dataList.isEmpty
                ? NoDataWidget()
                : RefreshIndicator(
              onRefresh: () async {},
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    CityItem(item: AppBloc.get(context).dataList[index]),
                itemCount: AppBloc.get(context).dataList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}