import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AppColors {
  AppColors._();
  static const Color deepBlue = Color(0xff051048);
  static const Color skyBlue = Color(0xff1162FF);
  static const Color white = Color(0xffffffff);
  static const Color lightwhite = Color(0xffe5e5e5);
  static const Color deepGrey = Color(0xff212121);
  static const Color lightGrey = Color(0xffC4C4C4);
  static const Color darkWhite = Color(0xffF1EEFC);
  static const Color darkGreen = Color(0xff136A2B);
  static const Color grey = Color(0xffCCCCCC);

}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Widget addSeperator(Color color, double height) {
  return Divider(color: color, height: height);
}

Widget addVerticalSpacing(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpacing(double width) {
  return SizedBox(width: width);
}

class Button extends StatefulWidget {
  String buttonContent;
  Color buttonColor;
  Color contentColor;
  double width;
  Button({
    this.contentColor,this.buttonContent,this.buttonColor,this.width
  }) ;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.07194,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.deepBlue,width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(child: Text(widget.buttonContent,style: TextStyle(color: widget.contentColor,fontSize: 18,fontWeight: FontWeight.w700),)),
    );
  }
}

class LocalWidgets {
  LocalWidgets._();

  //functions
  static void showSnackbar(BuildContext context, String title) {
    final snackBar = SnackBar(content: Text(title));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showToast(
      { String msg,
        Color bgColor = Colors.black,
        bool isLongLength = false}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: isLongLength ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3, // secs
        backgroundColor: bgColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static PreferredSizeWidget produceAppBar(String title) {
    return AppBar(
      title: Text(title),
    );
  }



  // static Widget emptyResponseContainer(BuildContext context, String title) {
  //   return Center(
  //     child: Container(
  //       width: 250,
  //       height: 100,
  //       decoration: BoxDecoration(
  //           color: Theme.of(context).primaryColor,
  //           borderRadius: BorderRadius.circular(10)),
  //       child: Center(
  //           child: Text(
  //             title,
  //             style: TextStyles.appColorNormalStyle,
  //             textAlign: TextAlign.center,
  //           )),
  //     ),
  //   );
  // }


  static Widget produceEndDismissableBgContainer(
      { String title,
        Color bgColor,
        IconData iconData}) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.only(right: 16),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  //non - functions
  static Widget showAppLoader = Center(
    child: CircularProgressIndicator(
      color: Colors.amber,
      backgroundColor: Colors.pink,
    ),
  );
}

class NameTextField extends StatefulWidget {
  NameTextField({
    this.nameTEC,
    this.hint

  });

  final TextEditingController nameTEC;
  String hint;
  @override
  _NameTextFieldState createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      controller: widget.nameTEC,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        hintText: 'Pokemon Name',
        hintStyle: TextStyle(color:AppColors.lightGrey, fontSize: 12),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}


class SpecieRanking extends StatefulWidget {
  SpecieRanking({
    this.rankTEC,
    this.hint

  });

  final TextEditingController rankTEC;
  String hint;
  @override
  _SpecieRankingState createState() => _SpecieRankingState();
}

class _SpecieRankingState extends State<SpecieRanking> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      controller: widget.rankTEC,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        hintText: 'Specie Ranking Number',
        hintStyle: TextStyle(color:AppColors.lightGrey, fontSize: 12),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}


class SpecieWeight extends StatefulWidget {
  SpecieWeight({
    this.weightTEC,
    this.hint

  });

  final TextEditingController weightTEC;
  String hint;
  @override
  _SpecieWeightState createState() => _SpecieWeightState();
}

class _SpecieWeightState extends State<SpecieWeight> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      controller: widget.weightTEC,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        hintText: 'Specie Weight(Kg)',
        hintStyle: TextStyle(color:AppColors.lightGrey, fontSize: 12),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

class SpecieHeight extends StatefulWidget {
  SpecieHeight({
    this.heightTEC,
    this.hint

  });

  final TextEditingController heightTEC;
  String hint;
  @override
  _SpecieHeightState createState() => _SpecieHeightState();
}

class _SpecieHeightState extends State<SpecieHeight> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      controller: widget.heightTEC,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        hintText: 'Specie Height(inches)',
        hintStyle: TextStyle(color:AppColors.lightGrey, fontSize: 12),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

class DescriptionField extends StatefulWidget {
  DescriptionField({
    this.descTEC,
    this.hint

  });

  final TextEditingController descTEC;
  String hint;
  @override
  _DescriptionFieldState createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: 6, // any number you need (It works as the rows for the textarea)
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: widget.descTEC,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        hintText: 'Pokemon Details and Characteristics',
        hintStyle: TextStyle(color:AppColors.lightGrey, fontSize: 12),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}

class TypeTextField extends StatefulWidget {
  TypeTextField({
    this.typeTEC,
    this.hint

  });

  final TextEditingController typeTEC;
  String hint;
  @override
  _TypeTextFieldState createState() => _TypeTextFieldState();
}

class _TypeTextFieldState extends State<TypeTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      controller: widget.typeTEC,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        hintText: 'Pokemon Type',
        hintStyle: TextStyle(color:AppColors.lightGrey, fontSize: 12),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}