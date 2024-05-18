import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: library_private_types_in_public_api

class Style {
  static final _Colors colors = _Colors();
  static final _TextStyles textStyles = _TextStyles();
  static final _Gradient gradient = _Gradient();
  static final _Decoration customDecoration = _Decoration();
}

class _Colors {
  final Color primary = const Color(0xFFFFB13D);
  final Color primaryAlt = const Color(0xFFFFD597);
  final Color primaryfade = const Color(0xFFFFF1DC);
  final Color brown = const Color.fromARGB(255, 78, 47, 0);
  final Color card = const Color(0x003ce6ac);
  final Color card2 = const Color.fromARGB(255, 60, 137, 230);
  final Color card2light = const Color.fromARGB(255, 103, 163, 236);
  final Color primaryLight = const Color(0xffFFD9B8);
  final Color scaffold = const Color(0xffFFF8F2);
  final Color secondary = const Color(0xff1C312A);
  final Color textBox = const Color(0xffFFF0DB);
  final Color textField = const Color(0xffFFFFFF);
  final Color title = const Color(0xff1C312A);
  final Color subtitle = const Color(0xff717171);
  final Color greyCard = const Color(0xff7E8C88);
  final Color darkCard = const Color(0xFF001A67);
  final Color hintText = const Color(0xff8F6A48);
  final Color rcButton = const Color(0xffFFDAB9);
  final Color black = const Color(0xff000000);
  final Color white = const Color(0xffFFFFFF);
  final Color error = const Color(0xffEB4E4E);
  final Color green = Colors.green;
  final Color borderGrey = const Color(0xffB0B0B0);
  final Color uploadGrey = const Color(0xffBBBBBB);
  final Color grey = Colors.grey;
  final Color greyFade = const Color.fromARGB(255, 231, 231, 231);
  final Color yellowbg = const Color(0xFFFFF7DA);
  final Color yellow = Colors.amber;
  //piechart
  final Color chartColor1 = const Color(0xFFFFC600);
  final Color chartColor2 = const Color(0xFF6EEFF5);
  final Color chartColor3 = const Color(0xFF67DF9C);
  final Color chartColor4 = const Color(0xFF3F8CF4);
}

class _Gradient {
  LinearGradient buildLinearGradient({begin, end}) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: [Style.colors.primary, Style.colors.primary],
    );
  }

  LinearGradient card2LinearGradient({begin, end}) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: [Style.colors.card2, Style.colors.card2light],
    );
  }
}

class _Decoration {
  BoxDecoration buildBoxDecoration({color, radius}) {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(24, 54, 54, 54),
          blurRadius: 20,
          offset: Offset(1, 1),
          spreadRadius: 0,
        ),
      ],
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  ShapeDecoration buildAccoutsDecoration() {
    return ShapeDecoration(
      gradient: LinearGradient(
        begin: const Alignment(0.97, -0.26),
        end: const Alignment(-0.97, 0.26),
        colors: [
          Style.colors.primaryAlt,
          Colors.white,
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 5,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    );
  }

  BoxDecoration buildCustomNotch({color, radius, fill}) {
    return BoxDecoration(
      border: fill
          ? Border.all(
              color: Style.colors.primary.withOpacity(0.5),
              width: 1,
              style: BorderStyle.solid)
          : Border.all(),
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  BoxDecoration buildCustomNotch1({color, radius, fill, borderColor}) {
    return BoxDecoration(
      border: fill
          ? Border.all(color: borderColor, width: 1.5, style: BorderStyle.solid)
          : Border.all(),
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  BoxDecoration buildCustomNotchImage(
      {color, radius, fill, borderColor, String? image}) {
    return BoxDecoration(
        border: fill
            ? Border.all(
                color: borderColor, width: 1.5, style: BorderStyle.solid)
            : Border.all(),
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        image: DecorationImage(
            image: CachedNetworkImageProvider(
              image!,
            ),
            fit: BoxFit.fill));
  }

  BoxDecoration buildCustomlogo(image) {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2.sp,
            color: Style.colors.black.withOpacity(.2),
            offset: Offset(0.sp, 2.sp),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        image: DecorationImage(
            image: CachedNetworkImageProvider(
              image,
            ),
            fit: BoxFit.fill));
  }

  BoxDecoration buildBoxDecorationNoShadow({color, radius}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  BoxDecoration buildBoxDecorationRadius({color, topleft, topRight}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(topLeft: topleft, topRight: topRight),
    );
  }

  InputDecoration buildDropDownDecoration({String? hinttext}) {
    return InputDecoration(
        focusedErrorBorder: InputBorder.none,
        hintText: hinttext,
        hintStyle: Style.textStyles
            .poppins(color: Style.colors.primary, fontSize: 10.sp),
        fillColor: Style.colors.white,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.only(right: 0, left: 0),
        errorBorder: InputBorder.none);
  }

  InputDecoration buildCustomDropDownDecoration({String? hinttext}) {
    return InputDecoration(
        hintText: hinttext,
        hintStyle: Style.textStyles
            .poppins(color: Style.colors.primary, fontSize: 10.sp),
        fillColor: Style.colors.white,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        filled: true,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.only(right: 0, left: 0),
        errorBorder: InputBorder.none);
  }

  InputDecoration buildTextfieldDcoration({String? hintext, dynamic suffIcon}) {
    return InputDecoration(
      counterText: '',
      hintText: hintext,
      suffixIcon: suffIcon,
      hintStyle:
          Style.textStyles.poppins(fontSize: 12.sp, color: Style.colors.grey),
      fillColor: Style.colors.white,
      filled: true,
      contentPadding:
          EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 10.0.sp),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        borderSide: BorderSide(color: Style.colors.primary, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        borderSide: BorderSide(color: Style.colors.grey, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        borderSide: BorderSide(color: Style.colors.grey, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        borderSide: BorderSide(width: 1, color: Style.colors.error),
      ),
    );
  }
}

class _TextStyles {
  TextStyle poppins(
      {fontSize, fontWeight, Color? color, letterSpacing, height, decoration}) {
    return GoogleFonts.poppins(
      decoration: decoration,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  TextStyle inter(
      {fontSize,
      fontWeight,
      Color? color,
      letterSpacing,
      height,
      decorationColor,
      decoration,
      fontStyle}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationColor: decorationColor,
      fontStyle: fontStyle,
    );
  }

  TextStyle roboto(
      {fontSize,
      fontWeight,
      Color? color,
      letterSpacing,
      height,
      decorationColor,
      decoration,
      fontStyle}) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationColor: decorationColor,
      fontStyle: fontStyle,
    );
  }

  TextStyle raleWay(
      {fontSize,
      fontWeight,
      Color? color,
      letterSpacing,
      height,
      decorationColor,
      decoration,
      fontStyle}) {
    return GoogleFonts.raleway(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: color,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationColor: decorationColor,
      fontStyle: fontStyle,
    );
  }
}
