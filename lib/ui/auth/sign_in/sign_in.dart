import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:soc/ui/auth/sign_in/cubit/facebook_sign_in_cubit.dart';
import 'package:soc/ui/auth/sign_in/cubit/google_sign_in_cubit.dart';
import 'package:soc/ui/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:soc/ui/auth/widgets/auth_helpers.dart';
import 'package:soc/utils/_index.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(create: (context) => locator<SignInCubit>()),
        BlocProvider<GoogleSignInCubit>(
            create: (context) => locator<GoogleSignInCubit>()),
        BlocProvider<FacebookSignInCubit>(
            create: (context) => locator<FacebookSignInCubit>()),
      ],
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
    locator<FacebookSignInCubit>().reset();
    locator<GoogleSignInCubit>().reset();
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
    locator
      ..resetLazySingleton<GoogleSignInCubit>()
      ..resetLazySingleton<FacebookSignInCubit>()
      ..resetLazySingleton<SignInCubit>();
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
        loaded: () =>
            Navigator.pushReplacementNamed(context, AppRouter.learnRoute),
        error: (error) {
          final snackBar = SnackBar(content: Text(error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          locator<SignInCubit>().reset();
        },
      ),
      builder: (context, state) {
        return BlocConsumer<FacebookSignInCubit, FacebookSignInState>(
          listener: (context, state) => state.when(
            initial: () {},
            loading: () {},
            loaded: () =>
                Navigator.pushReplacementNamed(context, AppRouter.learnRoute),
            error: (error) {
              final snackBar = SnackBar(content: Text(error));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              locator<FacebookSignInCubit>().reset();
            },
          ),
          builder: (context, state) {
            return BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
              listener: (context, state) => state.when(
                initial: () {},
                loading: () {},
                loaded: () => Navigator.pushReplacementNamed(
                    context, AppRouter.learnRoute),
                error: (error) {
                  final snackBar = SnackBar(content: Text(error));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  locator<FacebookSignInCubit>().reset();
                },
              ),
              builder: (context, state) {
                return Scaffold(
                  appBar: appBar('Welcome, Sign In'),
                  body: FractionallySizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: Color(0xFFEFEFEF),
                      ),
                      child: Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            labelTxt('Email Address'),
                            textField(
                              hintText: 'example@gmail.com',
                              controller: _emailController,
                              icon: Icons.mail,
                            ),
                            labelTxt('Password'),
                            textField(
                              hintText: 'password',
                              controller: _passwordController,
                              icon: Icons.lock,
                            ),
                            actionButton(
                              voidCallBack: () {
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
                              child: BlocBuilder<SignInCubit, SignInState>(
                                  builder: (context, state) {
                                return state.when(
                                  initial: () => buttonTxt('Sign In'),
                                  loading: () => SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      backgroundColor:
                                          AppTheme.appTheme(context).greyWeak,
                                    ),
                                  ),
                                  loaded: () => buttonTxt('Sign In'),
                                  error: (err) => buttonTxt('Sign In'),
                                );
                              }),
                            ),
                            switchBetweenSignInAndSignUp(
                              title: 'Dont have an account? ',
                              subTitle: 'Sign Up',
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Adapt.px(20),
                                bottom: Adapt.px(20),
                                left: Adapt.px(30),
                                right: Adapt.px(30),
                              ),
                              child: Center(
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                    color:
                                        AppTheme.appTheme(context).quickSilver,
                                  ),
                                ),
                              ),
                            ),
                            socialAuthButton(
                              voidCallBack: () {
                                FocusScope.of(context).unfocus();
                                locator<GoogleSignInCubit>().signInwithGoogle();
                              },
                              child: BlocBuilder<GoogleSignInCubit,
                                  GoogleSignInState>(
                                builder: (context, state) {
                                  Widget _default = socialAuthButtonChild(
                                      imageUrl: 'images/google.png',
                                      title: 'Google Sign In');
                                  return state.when(
                                    initial: () => _default,
                                    loading: () => progressIndicator(),
                                    loaded: () => _default,
                                    error: (err) => _default,
                                  );
                                },
                              ),
                            ),
                            socialAuthButton(
                              voidCallBack: () {
                                FocusScope.of(context).unfocus();
                                locator<FacebookSignInCubit>()
                                    .signInWithFacebook();
                              },
                              child: BlocBuilder<FacebookSignInCubit,
                                  FacebookSignInState>(
                                builder: (context, state) {
                                  Widget _default = socialAuthButtonChild(
                                      imageUrl: 'images/facebook.png',
                                      title: 'Facebook Sign In');
                                  return state.when(
                                    initial: () => _default,
                                    loading: () => progressIndicator(),
                                    loaded: () => _default,
                                    error: (err) => _default,
                                  );
                                },
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
          },
        );
      },
    );
  }
}
