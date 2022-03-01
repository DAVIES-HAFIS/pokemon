
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_details_cubit.dart';
import 'helper_function.dart';
import 'model/pokemon_detail.dart';

class PokemonDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.deepBlue ,
        title: Text('Pokemon Bio-Data',style:TextStyle(color: Colors.white),),
      ),
      backgroundColor:AppColors.white,
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetails>(
        builder: (context, details) {
          return details != null
              ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.deepBlue,
                    ),
                    child:  Image.network(details.imageUrl),
                  ),
                  addVerticalSpacing(15),
                  Text(details.name,style: TextStyle(color: AppColors.deepGrey,fontSize: 15,fontWeight: FontWeight.w700),),
                  addVerticalSpacing(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: details.types
                        .map((type) => _pokemonTypeView(type))
                        .toList(),
                  ),
                  addVerticalSpacing(10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                      child: Text(
                          'Species Ranking: ${details.id}   Weight: ${details.weight}   Height: ${details.height}',style: TextStyle(color: AppColors.deepBlue,fontSize: 15,fontWeight: FontWeight.w700),),
                    ),
                  ),
                  addVerticalSpacing(20),
                  Container(
                    height: 150,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.deepBlue,
                    ),
                    child: Center(
                      child: Text(
                                  details.description,
                                  textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.lightGrey),
                                ),
                    ),
                  ),
                ],
              ))
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _pokemonTypeView(String type) {
    Color color;

    switch (type) {
      case 'normal':
        color = Color(0xFFbdbeb0);
        break;
      case 'poison':
        color = Color(0xFF995E98);
        break;
      case 'psychic':
        color = Color(0xFFE96EB0);
        break;
      case 'grass':
        color = Color(0xFF9CD363);
        break;
      case 'ground':
        color = Color(0xFFE3C969);
        break;
      case 'ice':
        color = Color(0xFFAFF4FD);
        break;
      case 'fire':
        color = Color(0xFFE7614D);
        break;
      case 'rock':
        color = Color(0xFFCBBD7C);
        break;
      case 'dragon':
        color = Color(0xFF8475F7);
        break;
      case 'water':
        color = Color(0xFF6DACF8);
        break;
      case 'bug':
        color = Color(0xFFC5D24A);
        break;
      case 'dark':
        color = Color(0xFF886958);
        break;
      case 'fighting':
        color = Color(0xFF9E5A4A);
        break;
      case 'ghost':
        color = Color(0xFF7774CF);
        break;
      case 'steel':
        color = Color(0xFFC3C3D9);
        break;
      case 'flying':
        color = Color(0xFF81A2F8);
        break;
      case 'normal':
        color = Color(0xFFF9E65E);
        break;
      case 'fairy':
        color = Color(0xFFEEB0FA);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
           border: Border.all(color: Colors.black45,width: 1.0),
        ),
        child: Text(
          type.toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
        ),
      ),
    );
  }
}
