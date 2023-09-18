library com.rick_and_morty.auth.core.state;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../cross-modules/core/services/services.dart';
import '../../../../../cross-modules/typing/typing.dart';
import '../../../../navigator/navigator.dart';
import '../../../dashboard/ui/views/views.dart';
import '../services/services.dart';

part './login/view_model.dart';
part './login/provider.dart';
part './login/state.dart';
