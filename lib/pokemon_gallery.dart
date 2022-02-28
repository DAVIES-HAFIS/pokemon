import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_bloc.dart';
import 'bloc/pokemon_state.dart';

class PokemonGallery extends StatefulWidget {
  @override
  _PokemonGalleryState createState() => _PokemonGalleryState();
}

class _PokemonGalleryState extends State<PokemonGallery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons'),
      ),
      body:BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return  ListView.builder(
                itemCount: state.pokemonListings.length,
                itemBuilder: (BuildContext context,int index){
                  return Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shadowColor: Colors.blueGrey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                      child: Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(state.pokemonListings[index].imageUrl),
                            Text(state.pokemonListings[index].name)
                          ],
                        ),
                      ),
                    ),
                  );
                }
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          onPressed: (){},
          icon: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}






