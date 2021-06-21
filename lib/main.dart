import 'package:assignment/Functions/get_theme.dart';
import 'package:assignment/Screens/home_screen.dart';
import 'package:assignment/bloc/media/media_bloc.dart';
import 'package:assignment/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Setup HydratedStorage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<NavigationBloc>(
        create: (BuildContext context) => NavigationBloc(),
      ),
      BlocProvider<MediaBloc>(
        create: (BuildContext context) => MediaBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Assignment',
      debugShowCheckedModeBanner: false,
      theme: getTheme(context),
      home: HomeScreen(),
    );
  }
}
