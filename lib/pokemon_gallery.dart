import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_bloc.dart';
import 'bloc/pokemon_state.dart';
import 'helper_function.dart';

class PokemonGallery extends StatefulWidget {
  @override
  _PokemonGalleryState createState() => _PokemonGalleryState();
}

class _PokemonGalleryState extends State<PokemonGallery> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skyBlue,
        title: Text('Pokemons',style:TextStyle(color: Colors.white),),
      ),
      body:BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return  SingleChildScrollView(
              child: Container(
                height: getScreenHeight(context) * 1,
                width: getScreenWidth(context) * 1,
                color: AppColors.deepBlue,
                child:  Column(
                  children: [
                    addVerticalSpacing(60),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal:60),
                          child: Text("Later this year, Game Freak will release Pokémon Scarlet and Violet, the ninth generation of mainline Pokémon games, rounding out an ...",
                          style: TextStyle(color: AppColors.white,fontSize: 15,fontWeight: FontWeight.w700),)),
                    ),
                    addVerticalSpacing(30),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                      height: 600,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                      ),
                      child: ListView.builder(
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
                      ),
                    ),
                  ],
                ),
              ),
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






