import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soc/ui/widgets/cubit/log_out_cubit.dart';
import 'package:soc/utils/_index.dart';

class DrawerData extends StatefulWidget {
  const DrawerData();

  @override
  _DrawerDataState createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawer = [
      DrawerItem('Learn', Icons.account_circle),
      DrawerItem('Ask a question', Icons.message),
      DrawerItem('Inbox', Icons.compare_arrows),
      DrawerItem('Privacy Policy', Icons.bookmark),
      DrawerItem('logOut', Icons.exit_to_app),
    ];
    return BlocProvider<LogOutCubit>(
      create: (context) => locator<LogOutCubit>(),
      child: BlocConsumer<LogOutCubit, LogOutState>(
        listener: (context, state) => state.when(
          initial: () {},
          loading: () {},
          loaded: () {
            Navigator.pushReplacementNamed(context, AppRouter.intialRoute);
            locator<LogOutCubit>().reset();
          },
          error: (error) {
            final snackBar = SnackBar(content: Text(error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            locator<LogOutCubit>().reset();
          },
        ),
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person),
                        radius: Adapt.px(100),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('David O\'Regeon',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.white,
                                    )),
                      ),
                      Wrap(
                        children: [
                          Text(
                            'Sensei  -',
                            style:
                                TextStyles.createShopPlaceHolderStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(' Admin',
                              style: TextStyles.createShopPlaceHolderStyle
                                  .copyWith(
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                ListView.builder(
                    itemCount: drawer.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12, left: 12),
                        child: InkWell(
                          onTap: () {
                            if (drawer[index].name == 'logOut') {
                              locator<LogOutCubit>().logOut();
                            }
                          },
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
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DrawerItem {
  final String name;
  final IconData icon;

  const DrawerItem(this.name, this.icon);
}
