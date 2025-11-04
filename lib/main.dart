import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/data/auth.dart';
import 'auth/logic/login_cubit.dart';
import 'app.dart';
import 'api.dart';

void main() {
  final api = Api(baseUrl: 'https://rociny-auth-back.onrender.com/');
  final repo = AuthRepository(api);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit(repo)),
      ],
      child: const RocinyApp(),
    ),
  );
}
