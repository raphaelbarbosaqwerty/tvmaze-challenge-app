import 'package:flutter/material.dart';

import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';

class CustomErrorWidget extends StatelessWidget {
  final Failure error;
  const CustomErrorWidget({
    Key key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nothing found'),
      );
    } else if (error is ErrorSearch) {
      return Center(
        child: Text('Error in TVMaze'),
      );
    } else {
      return Center(
        child: Text('Internal Error'),
      );
    }
  }
}
