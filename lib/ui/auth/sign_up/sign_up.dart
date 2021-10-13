import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soc/ui/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:soc/utils/_index.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => locator<SignUpCubit>(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.addListener(() {
      setState(() {});
    });
    _passwordController.addListener(() {
      setState(() {});
    });
    locator<SignUpCubit>().reset();
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
    locator.resetLazySingleton<SignUpCubit>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) => state.when(
        initial: () {},
        loading: () {},
        loaded: () {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRouter.learnRoute);
          locator.resetLazySingleton<SignUpCubit>();
        },
        error: (error) {
          final snackBar = SnackBar(content: Text(error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          locator<SignUpCubit>().reset();
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
                        'Sign Up, to proceed.',
                        style: Theme.of(context).textTheme.headline5,
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
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppTheme.appTheme(context).quickSilver,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'example@gmail.com',
                            hintStyle: TextStyles.medium,
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
                        top: Adapt.px(0),
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
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppTheme.appTheme(context).quickSilver,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'password',
                            hintStyle: TextStyles.medium,
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
                            locator<SignUpCubit>().signUp(
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          } else {
                            _formKey.currentState!.validate();
                          }
                        },
                        color: Colors.orange,
                        minWidth: double.infinity,
                        height: Adapt.px(90),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) => state.when(
                            initial: () => Text(
                              'Sign Up',
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
                              'Sign Up',
                              style: TextStyles.shopBtnTextStyle,
                            ),
                            error: (err) => Text(
                              'Sign Up',
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
                          Navigator.pushReplacementNamed(
                              context, AppRouter.logInRoute);
                        },
                        child: RichText(
                          text: TextSpan(
                            style: TextStyles.standard,
                            children: [
                              const TextSpan(
                                text: 'Already have an account? ',
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyles.standard.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
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
