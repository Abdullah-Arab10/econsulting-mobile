// ignore_for_file: prefer_const_constructors
import 'package:e_consulting_flutter/presentation/widgets/consultants_cards.dart';
import 'package:flutter/cupertino.dart';

Widget listViewCard({
  screen,
  NeverScrollableScrollPhysics? scroll,
  bool shrinkWrap = false,
}) => ListView.separated(
    physics: scroll,
    shrinkWrap: shrinkWrap,
    itemBuilder: (context, index) => buildCardsItem(
      screen[index],
      context
    ),
    separatorBuilder: (context, index) => SizedBox(height: 20,),
    itemCount: screen.length
);

Widget title(title) => Column(
  children: [
    SizedBox(height: 10,),
    Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20
      ),
    ),
    SizedBox(height: 10,),
  ],
);

// Widget listViewUserCard() => ListView.separated(
//     physics: NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     itemBuilder: (context, index) => buildUserCardsItem(),
//     separatorBuilder: (context, index) => SizedBox(height: 20,),
//     itemCount: 5
// );