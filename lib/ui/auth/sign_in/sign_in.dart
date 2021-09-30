import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:soc/ui/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:soc/utils/_index.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => locator<SignInCubit>(),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    locator<SignInCubit>().reset();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.removeListener(() {
      setState(() {});
    });
    _passwordController.removeListener(() {
      setState(() {});
    });
    locator.resetLazySingleton<SignInCubit>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    TextStyles.initContext(context);
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) => state.when(
        initial: () {},
        loading: () {},
        loaded: () {
          FocusScope.of(context).unfocus();
          locator<SignInCubit>().reset();
        },
        error: (error) {
          final snackBar = SnackBar(content: Text(error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          locator<SignInCubit>().reset();
        },
      ),
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
              Adapt.screenH() * 0.25,
            ),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 12),
                      child: Text(
                        'Welcome, Sign In',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'images/brain.png',
                  height: Adapt.screenH() * 0.1,
                ),
              ],
            ),
          ),
          body: FractionallySizedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Color(0xFFEFEFEF),
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: Adapt.px(50),
                        left: Adapt.px(30),
                        right: Adapt.px(30),
                      ),
                      child: Text(
                        'Email Address',
                        style: TextStyles.appBarTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Adapt.px(30),
                        right: Adapt.px(30),
                        top: Adapt.px(10),
                      ),
                      child: Material(
                        shadowColor: AppTheme.appTheme(context).grey,
                        borderRadius: BorderRadius.circular(12),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mail),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'example@gmail.com',
                            hintStyle: TextStyles.createShopPlaceHolderStyle,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Adapt.px(50),
                        left: Adapt.px(30),
                        right: Adapt.px(30),
                      ),
                      child: Text(
                        'Password',
                        style: TextStyles.appBarTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Adapt.px(30),
                        right: Adapt.px(30),
                        top: Adapt.px(10),
                      ),
                      child: Material(
                        shadowColor: AppTheme.appTheme(context).grey,
                        borderRadius: BorderRadius.circular(12),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'password',
                            hintStyle: TextStyles.createShopPlaceHolderStyle,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Adapt.px(80),
                        left: Adapt.px(30),
                        right: Adapt.px(30),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            locator<SignInCubit>().signIn(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          } else {
                            _formKey.currentState!.validate();
                          }
                        },
                        color: AppTheme.appTheme(context).accent1,
                        minWidth: double.infinity,
                        height: Adapt.px(90),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: BlocBuilder<SignInCubit, SignInState>(
                          builder: (context, state) => state.when(
                            initial: () => Text(
                              'Sign In',
                              style: TextStyles.shopBtnTextStyle,
                            ),
                            loading: () => SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                backgroundColor:
                                    AppTheme.appTheme(context).greyWeak,
                              ),
                            ),
                            loaded: () => Text(
                              'Sign In',
                              style: TextStyles.shopBtnTextStyle,
                            ),
                            error: (err) => Text(
                              'Sign In',
                              style: TextStyles.shopBtnTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Adapt.px(40),
                        left: Adapt.px(30),
                        right: Adapt.px(30),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRouter.signUpRoute);
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: AppTheme.appTheme(context)
                                  .accent1!
                                  .withOpacity(0.8),
                            ),
                            children: [
                              const TextSpan(
                                text: 'Dont have an account? ',
                              ),
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color:
                                      AppTheme.appTheme(context).accent1Lighter,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
