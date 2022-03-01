import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/pokemon_gallery.dart';

import '../helper_function.dart';

class NewPokemonEntryForm extends StatefulWidget {

  @override
  _NewPokemonEntryFormState createState() => _NewPokemonEntryFormState();
}

class _NewPokemonEntryFormState extends State<NewPokemonEntryForm> {
  TextEditingController _pokemonName = TextEditingController();
  TextEditingController _specieRanking = TextEditingController();
  TextEditingController _typeSlot1 = TextEditingController();
  TextEditingController _typeSlot2 = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  TextEditingController _description = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic validate() {
    if (_formKey.currentState.validate()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PokemonGallery()));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpacing(getScreenHeight(context) * 0.0407),
              Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                    size: 26,
                  ),
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    addVerticalSpacing(getScreenHeight(context) * 0.03477),
                    Text("POKEMON ENTRY FORM",style: TextStyle(color: AppColors.deepGrey,fontSize: 18,fontWeight: FontWeight.w700),),
                    addVerticalSpacing(getScreenHeight(context) * 0.0693),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.0),
                      child: NameTextField(nameTEC: _pokemonName,),
                    ),
                    addVerticalSpacing(getScreenHeight(context) * 0.0263),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.0),
                      child: SpecieRanking(rankTEC: _specieRanking,),
                    ),
                    addVerticalSpacing(getScreenHeight(context) * 0.0263),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.0),
                      child: SpecieWeight(weightTEC: _weight,),
                    ),
                    addVerticalSpacing(getScreenHeight(context) * 0.0263),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.0),
                      child: SpecieHeight(heightTEC: _height,),
                    ),
                    addVerticalSpacing(getScreenHeight(context) * 0.0263),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.0),
                      child: TypeTextField(typeTEC: _typeSlot1,),
                    ),
                    addVerticalSpacing(getScreenHeight(context) * 0.0263),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.0),
                      child: TypeTextField(typeTEC: _typeSlot2,),
                    ),
                    addVerticalSpacing(getScreenHeight(context) * 0.0263),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.0),
                      child: DescriptionField(descTEC: _description,),
                    ),
                    addVerticalSpacing(getScreenHeight(context) * 0.0467),
                    GestureDetector(
                        onTap: ()  {
                          if (_formKey.currentState.validate() && _pokemonName.value.text.isNotEmpty && _specieRanking.value.text.isNotEmpty && _description.value.text.isNotEmpty&& _height.value.text.isNotEmpty&& _weight.value.text.isNotEmpty) {
                            LocalWidgets.showSnackbar(
                                context, "New pokemon entry added to list successfully");
                            Future.delayed(
                                Duration(seconds: 5),
                                    () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PokemonGallery())));
                          } else {
                            LocalWidgets.showSnackbar(
                                context, "Fill in fields correctly");
                          }
                        },
                        child: Button(contentColor: AppColors.white,buttonColor: AppColors.deepBlue,buttonContent: "Continue",width: getScreenWidth(context)*0.773,)),
                    addVerticalSpacing(getScreenHeight(context) * 0.09712),
                    Center(
                      child: Text(
                        "This species form is a demo \n a POST endpoint would be required to add a new species to the pokemon list\n which is not available as all the endpoints are GET endpoints",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.deepBlue,fontSize: 12,fontWeight: FontWeight.w500),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}