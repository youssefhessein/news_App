import 'package:bot_toast/bot_toast.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
Widget defaultButton({
  double width = double.infinity,

  TextStyle? style,
   String ? label,
  TextStyle? labelStyle,
  required String labelText,
  bool isUpperCase = true,
  double radius = 10,
  required Function function,
   String? text,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),

      ),
      child: MaterialButton(
        // ignore: unnecessary_statements
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? labelText.toUpperCase() : labelText ,

        ),
      ),
    );

Widget defaultFormField({
   context,
  required TextEditingController controller,
  required TextInputType keyboardType,
   TextInputType ? type,
  bool isPassword = false,
  bool enabled = true,
   onSubmit,
   onChange,
  onTap,
  required FormFieldValidator validate,
   String ? label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClikable = true,
  String? labelText,
  BorderRadius borderRadius = BorderRadius.zero,
  Color? fillColor,
  Color? enabledBorderColor,
  Color? focusedBorderColor,
  TextStyle? style,
  TextStyle? labelStyle,
  bool hasBorder = true,
  OutlineInputBorder ? focusedBorder,
  OutlineInputBorder?  enabledBorder,



}) =>
    TextFormField(


      controller: controller,
      keyboardType: type,
      obscureText: isPassword,

      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      style: style ?? const TextStyle(),

      decoration: InputDecoration(

        focusedBorder: focusedBorder,

        enabledBorder: enabledBorder,
        labelText:labelText,
        labelStyle: labelStyle ?? const TextStyle(),

        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ))
            : null,
      ),




    );

Widget defaultTextButton({
  bool isUpperCase = true,
  TextStyle? style,
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: (){function();},
      child: Text(text.toUpperCase(),),
);





Widget myDivider() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

Widget buildArticleItem(article, context,index) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              image: DecorationImage(
                image:article['urlToImage'] ==null? const AssetImage("assets/noImage.jpg")  :NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,

                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(
                      color: Colors.grey,

                      fontSize: 18,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) =>

    ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context,index),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch ? Container() :const Center(child: CircularProgressIndicator.adaptive()),
    );

// ignore: non_constant_identifier_names
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

// ignore: non_constant_identifier_names
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
    (route)
    {
      return false;
    },

);


void showToast({
  required String text,
  required ToastStates state,
  double fontSize = 16,
  int seconds = 5,
}) =>
    BotToast.showText(
        text: text,
        duration: Duration(seconds: seconds),
        contentColor: toastColor(state),
        clickClose: true,
        align: const Alignment(0, -0.9));

enum ToastStates { SUCCESS, ERROR, WARNING }

Color toastColor(ToastStates state) {
  switch (state) {
    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.yellow;
  }
}




Widget buildIconWithNumber({
  required bool condition,
  number,
  icon,
  iconColor,
  double size = 30,
  double radius = 12,
  double fontSize = 13,
  VoidCallback? onPressed,
  alignment = const Alignment(1.6, -0.8),
}) =>
    Column(
      children: [
      Stack(
      alignment: alignment,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
            size: size,
          ),
        ),
        if (condition)
          CircleAvatar(
            radius: radius,
            backgroundColor:const Color(0xFF182140),
            child: Text(
              number.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: Colors.white,
              ),
            ),
          ),
      ],
    ),
]
    );




Widget backButton(context) => Row(children: [
  IconButton(
    icon: const Icon(
      Icons.arrow_back,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
  const Text(
    "Back",
    style: TextStyle(

      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
]);