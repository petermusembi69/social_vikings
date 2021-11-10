import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:soc/utils/_index.dart';

class InboxCard extends StatefulWidget {
  InboxCard({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  _InboxCardState createState() => _InboxCardState();
}

class _InboxCardState extends State<InboxCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Adapt.px(20), horizontal: Adapt.px(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.12,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Color(0xffFFB339),
                      height: Adapt.px(150),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Adapt.px(150),
                      color: Color(0xffFF3939),
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: Adapt.px(150),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    trailing: widget.index % 2 == 0
                        ? SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.only(
                              top: Adapt.px(30),
                            ),
                            child: Text('\u2022'),
                          ),
                    leading: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.profileRoute);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: Adapt.px(5),
                        ),
                        child: CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            child: Image.asset(
                              widget.index % 2 == 0
                                  ? 'images/person2.jpg'
                                  : 'images/person.jpg',
                            ),
                          ),
                          backgroundColor: Colors.black12,
                          radius: Adapt.px(50),
                        ),
                      ),
                    ),
                    title: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Adapt.px(5),
                      ),
                      child: Text.rich(
                        TextSpan(
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Jessica',
                                  style: TextStyles.subHeading),
                              TextSpan(
                                text: '\t\t\u2022\t\t',
                              ),
                              TextSpan(
                                  text: '12:00am', style: TextStyles.standard),
                            ]),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Adapt.px(5),
                      ),
                      child: Text(
                        '''LoreTempor minim ut dolore velit incididunt aliquip tempor reprehenderit.''',
                        style: TextStyles.medium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconSlideAction(
              color: Color(0xffFFB339),
              icon: Icons.star,
              foregroundColor: Colors.white,
              onTap: () => {},
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              color: Color(0xffFF3939),
              icon: Icons.delete,
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
