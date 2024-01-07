

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idoc/viewmodels/auth_vm/auth_viewmodel.dart';

final authProvider = ChangeNotifierProvider<AuthViewmodel>((ref) {
  return AuthViewmodel();
});


