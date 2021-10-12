import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/ui/widgets/drawer_wrapper.dart';
import 'package:soc/ui/widgets/question_card.dart';
import 'package:soc/utils/_index.dart';

class AskQuestionsPage extends StatefulWidget {
  const AskQuestionsPage({Key? key}) : super(key: key);

  @override
  _AskQuestionsPageState createState() => _AskQuestionsPageState();
}

class _AskQuestionsPageState extends State<AskQuestionsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final questionController = TextEditingController();
  final _questionFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _questionFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerWraper(
      animationController: _animationController,
      page: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: Adapt.px(100),
          backgroundColor: Color(0xFFEFEFEF),
          centerTitle: true,
          title: Text(
            'Ask Questions',
            style: TextStyles.appBarTextStyle,
          ),
          leading: IconButton(
            splashRadius: Adapt.px(10),
            onPressed: () {
              FocusScope.of(context).unfocus();
              SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: _animationController.value == 0
                      ? Brightness.light
                      : Brightness.dark,
                ),
              );
              _toggleAnimation();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight * 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Adapt.px(10),
                    left: Adapt.px(20),
                    right: Adapt.px(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: Adapt.px(10),
                          bottom: Adapt.px(10),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Image.asset(
                                  'images/person.jpg',
                                ),
                              ),
                              backgroundColor: Colors.black12,
                            ),
                            Text(
                              '\t\tPosting as David',
                              style: TextStyles.standard
                                  .copyWith(fontSize: Adapt.px(24)),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        focusNode: _questionFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Write Question here',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                              right: Adapt.px(10),
                            ),
                            child: Container(
                              width: Adapt.px(100),
                              child: MaterialButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                },
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        controller: questionController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: Adapt.px(10),
                          left: Adapt.px(20),
                          right: Adapt.px(20),
                        ),
                        child: Row(
                          children: [
                            Text('All Questions', style: TextStyles.heading),
                            Spacer(),
                            Icon(
                              Icons.filter_alt_rounded,
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(
                index: index,
              );
            }),
      ),
    );
  }
}
