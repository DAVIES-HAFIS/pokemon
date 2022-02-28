import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_event.dart';
import 'package:pokemon_app/pokemon_gallery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: Theme.of(context)
      //     .copyWith(primaryColor: Colors.black, accentColor: Colors.redAccent),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0)))],
        child: PokemonGallery(),
      ),
    );
  }
}
