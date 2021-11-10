import 'package:flutter/material.dart';
import 'package:soc/utils/_index.dart';

final learnTabTitle = <int, Widget>{
  0: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
    child: Text(
      'Documents',
      style: TextStyles.subHeading,
    ),
  ),
  1: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
    child: Text(
      'Videos',
      style: TextStyles.subHeading,
    ),
  ),
};

List<String> title = [
  'Tying in Knots',
  'The Point Flow and Rhythm',
  'The blade and brush stroke',
  'Knitting and sorting',
  'Tying in Knots',
];

Widget videoCard(String title) {
  return Builder(builder: (context) {
    return Wrap(
      children: <Widget>[
        FractionallySizedBox(
            widthFactor: 0.4,
            child: Padding(
              padding: EdgeInsets.all(Adapt.px(20)),
              child: Stack(
                children: [
                  Container(
                    width: Adapt.px(200),
                    height: Adapt.px(140),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.05),
                            spreadRadius: 0.5,
                            blurRadius: 6,
                            offset: Offset(2, 6),
                          ),
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        'images/videoimage.png',
                        width: Adapt.px(200),
                        height: Adapt.px(140),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: Adapt.px(195),
                      height: Adapt.px(135),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).dividerColor.withOpacity(0.1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.white.withOpacity(0.8),
                            size: Adapt.px(80),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: kToolbarHeight * 1.8,
            child: Padding(
              padding: EdgeInsets.only(
                top: Adapt.px(20),
                bottom: Adapt.px(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyles.subHeading,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Text(
                    'Brass bringing joy into surgical training. This concept is derived from',
                    style: TextStyles.medium,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: Colors.black,
                        size: Adapt.px(28),
                      ),
                      SizedBox(
                        width: Adapt.px(4),
                      ),
                      Text(
                        '19m 15s',
                        style: TextStyles.standard,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  });
}

final learnTabchildren = <int, Widget>{
  1: ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(20.0),
          child: videoCard(title[index]),
        );
      }),
  0: Center(
    child: Text(
      'No Documents',
      style: TextStyles.tabStyle,
    ),
  )
};
