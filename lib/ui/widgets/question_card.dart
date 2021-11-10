import 'package:flutter/material.dart';
import 'package:soc/utils/_index.dart';

class QuestionCard extends StatefulWidget {
  QuestionCard({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Adapt.px(20), horizontal: Adapt.px(30)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: Adapt.px(3), horizontal: Adapt.px(3)),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.white,
                  trailing: Padding(
                    padding: EdgeInsets.only(
                      top: Adapt.px(30),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.profileRoute);
                      },
                      child: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            widget.index % 2 == 0
                                ? 'images/person2.jpg'
                                : 'images/person.jpg',
                          ),
                        ),
                        backgroundColor: Colors.black12,
                      ),
                    ),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(
                        top: Adapt.px(30), bottom: Adapt.px(20)),
                    child: Text(
                      'This is a question',
                      style: TextStyles.subHeading,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(bottom: Adapt.px(20)),
                    child: Text(
                      '''LoreTempor minim ut dolore velit incididunt aliquip tempor reprehenderit.''',
                      style: TextStyles.medium,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Adapt.px(20)),
                  child: Divider(
                    height: Adapt.px(1),
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  trailing: Text('3 Comments',
                      style:
                          TextStyles.standard.copyWith(fontSize: Adapt.px(28))),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          children: [
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color:
                                        AppTheme.appTheme(context).quickSilver,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {},
                                )),
                            TextSpan(
                              text: ' Like\t\t\t',
                              style: TextStyles.medium
                                  .copyWith(fontSize: Adapt.px(28)),
                            ),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.message_outlined,
                                    color:
                                        AppTheme.appTheme(context).quickSilver,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {},
                                )),
                            TextSpan(
                              text: ' Comment',
                              style: TextStyles.medium
                                  .copyWith(fontSize: Adapt.px(28)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
