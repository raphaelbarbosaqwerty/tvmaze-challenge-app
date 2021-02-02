import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/components/card_home/card_home_widget.dart';

class CustomGridView extends StatelessWidget {
  final state;
  
  const CustomGridView({
    Key key,
    @required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.value.list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: !orientation ? 4 : 3,
        childAspectRatio:!orientation ? 0.80 : 0.60,
      ), 
      itemBuilder: (context, index) {
        var item = state.value.list[index];
        return InkWell(
          child: CardHomeWidget(
            name: item.name,
            image: item?.image?.medium == null ? 'https://bitsofco.de/content/images/2018/12/broken-1.png' : item.image.medium,
          ),
          onTap: () {
            Modular.to.pushNamed('/details/${item.name}');
          },
        );
      }
    );
  }
}