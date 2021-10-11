library social_utils;

import 'dart:convert';
import 'dart:io';

import 'package:animations/animations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:soc/services/_index.dart';
import 'package:soc/ui/ask_questions/ask_questions.dart';
import 'package:soc/ui/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:soc/ui/auth/sign_in/sign_in.dart';
import 'package:soc/ui/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:soc/ui/auth/sign_up/sign_up.dart';
import 'package:soc/ui/decision.dart';
import 'package:soc/ui/inbox/inbox.dart';
import 'package:soc/ui/learn/learn.dart';
import 'package:soc/ui/privacy_policy/privacy_policy.dart';
import 'package:soc/ui/profile/profile.dart';
import 'package:soc/ui/widgets/cubit/log_out_cubit.dart';

part 'adapt.dart';
part 'app_router.dart';
part 'color_pallette.dart';
part 'text_styles.dart';
part 'network.dart';
part 'singletons.dart';
part 'misc.dart';
part 'constants.dart';
part 'page_route_transitions.dart';
