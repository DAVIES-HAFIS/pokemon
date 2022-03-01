import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app_navigator.dart';
import 'package:pokemon_app/bloc/nav_cubit.dart';
import 'package:pokemon_app/bloc/pokemon_bloc.dart';
import 'package:pokemon_app/bloc/pokemon_details_cubit.dart';
import 'package:pokemon_app/bloc/pokemon_event.dart';
import 'package:pokemon_app/screens/pokemon_gallery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: Theme.of(context)
      //     .copyWith(primaryColor: Colors.black, accentColor: Colors.redAccent),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(create: (context)=> NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context) => pokemonDetailsCubit)
        ],
        child: AppNavigator(),
      ),
    );
  }
}
