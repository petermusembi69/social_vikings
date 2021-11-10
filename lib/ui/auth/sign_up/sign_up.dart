import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soc/ui/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:soc/ui/auth/widgets/auth_helpers.dart';
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
          Navigator.popAndPushNamed(context, AppRouter.learnRoute);
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
          appBar: appBar('Sign Up, to proceed.'),
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
                          locator<SignUpCubit>().signUp(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        } else {
                          _formKey.currentState!.validate();
                        }
                      },
                      child: BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) => state.when(
                          initial: () => buttonTxt('Sign Up'),
                          loading: () => progressIndicator(),
                          loaded: () => buttonTxt('Sign Up'),
                          error: (err) => buttonTxt('Sign Up'),
                        ),
                      ),
                    ),
                    switchBetweenSignInAndSignUp(
                      title: 'Already have an account? ',
                      subTitle: 'Sign In',
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
