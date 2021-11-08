import 'package:flutter/material.dart';
import 'package:soc/ui/widgets/drawer_wrapper.dart';
import 'package:soc/ui/widgets/inbox_card.dart';
import 'package:soc/ui/widgets/ui_helpers.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerWraper(
      animationController: _animationController,
      page: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: appBar(_animationController, 'Inbox'),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return InboxCard(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
