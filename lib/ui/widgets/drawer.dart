import 'package:flutter/material.dart';
import 'package:soc/services/_index.dart';
import 'package:soc/ui/widgets/cubit/log_out_cubit.dart';
import 'package:soc/utils/_index.dart';
import 'package:octo_image/octo_image.dart';

class DrawerData extends StatefulWidget {
  const DrawerData();

  @override
  _DrawerDataState createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  @override
  void dispose() {
    locator.resetLazySingleton<LogOutCubit>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawer = [
      DrawerItem('Learn', Icons.account_circle,
          () => Navigator.pushReplacementNamed(context, AppRouter.learnRoute)),
      DrawerItem(
          'Ask a question',
          Icons.message,
          () => Navigator.pushReplacementNamed(
              context, AppRouter.askQuestionsRoute)),
      DrawerItem('Inbox', Icons.compare_arrows,
          () => Navigator.pushNamed(context, AppRouter.inboxRoute)),
      DrawerItem(
          'Privacy Policy',
          Icons.bookmark,
          () => Navigator.pushReplacementNamed(
              context, AppRouter.privacyPolicyRoute)),
      DrawerItem('logOut', Icons.exit_to_app, () async {
        await locator<AuthService>().signOut();
        locator<HiveService>().clearPrefs();
        Navigator.pop(context);
        Navigator.pushNamed(context, AppRouter.intialRoute);
      }),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(
            flex: 4,
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: locator<HiveService>().retrieveMember() != null
                            ? locator<HiveService>().retrieveMember()!.image !=
                                    null
                                ? OctoImage(
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(locator<HiveService>()
                                        .retrieveMember()!
                                        .image!),
                                    progressIndicatorBuilder:
                                        (context, progress) {
                                      double? value;
                                      var expectedBytes =
                                          progress?.expectedTotalBytes;
                                      if (progress != null &&
                                          expectedBytes != null) {
                                        value = progress.cumulativeBytesLoaded /
                                            expectedBytes;
                                      }
                                      return Align(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator(
                                          value: value,
                                          strokeWidth: 2,
                                          backgroundColor:
                                              AppTheme.appTheme(context)
                                                  .greyWeak,
                                        ),
                                      );
                                    },
                                    errorBuilder:
                                        (context, error, stacktrace) =>
                                            const Icon(Icons.error),
                                  )
                                : Image.asset(
                                    'images/person.jpg',
                                  )
                            : Image.asset(
                                'images/person.jpg',
                              )),
                  ),
                  backgroundColor: Colors.white,
                  radius: Adapt.px(80),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                      locator<HiveService>().retrieveMember() != null
                          ? locator<HiveService>().retrieveMember()!.name !=
                                  null
                              ? locator<HiveService>().retrieveMember()!.name!
                              : locator<HiveService>().retrieveMember()!.email
                          : 'User Name',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                          )),
                ),
                Wrap(
                  children: [
                    Text(
                      'Sensei \u2022',
                      style: TextStyles.createShopPlaceHolderStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(' Admin',
                        style: TextStyles.createShopPlaceHolderStyle.copyWith(
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          ListView.builder(
              itemCount: drawer.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12, left: 12),
                  child: InkWell(
                    onTap: drawer[index].action,
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              drawer[index].icon,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              drawer[index].name,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
          Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String name;
  final IconData icon;
  final Function()? action;

  const DrawerItem(this.name, this.icon, this.action);
}
