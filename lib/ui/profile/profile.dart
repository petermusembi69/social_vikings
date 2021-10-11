import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/utils/_index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: Adapt.px(100),
        backgroundColor: Color(0x000000),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyles.appBarTextStyle.copyWith(color: Colors.white),
        ),
        leading: IconButton(
          splashRadius: Adapt.px(10),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: Adapt.px(40)),
            child: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.asset(
                    'images/person.jpg',
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              radius: Adapt.px(80),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('David O\'Regeon',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    )),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Adapt.px(40)),
            child: Text(
              'Sensei',
              style: TextStyles.createShopPlaceHolderStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Adapt.px(60)),
            child: Text(
              '''Elit irure consequat consequat incididunt eu dolore officia aliquip eiusmod dolore non dolor enim. Anim amet do minim ut. Pariatur tempor fugiat sit incididunt ea amet deserunt duis cillum anim sint nostrud exercitation. Incididunt exercitation esse duis veniam sunt nostrud. Qui consectetur deserunt consequat pariatur fugiat et adipisicing consectetur occaecat ullamco. Irure ullamco velit occaecat cillum eu do ut reprehenderit et magna reprehenderit.''',
              textAlign: TextAlign.center,
              style: TextStyles.createShopPlaceHolderStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Adapt.screenW() * 0.5,
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    minWidth: double.infinity,
                    height: Adapt.px(90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Text('Follow',
                        style: TextStyles.createShopPlaceHolderStyle
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  width: Adapt.px(20),
                ),
                Container(
                  width: Adapt.screenW() * 0.15,
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    minWidth: double.infinity,
                    height: Adapt.px(90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.message_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
