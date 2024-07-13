import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/screens/translate_screen/widget/language_item.dart';
import 'package:translate/utils/colors/app_colors.dart';
import 'package:translate/utils/images/app_images.dart';
import 'package:translate/utils/style/app_style.dart';
import 'package:translator/translator.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  final translator = GoogleTranslator();
  var a;
  String language = "uz";
  int lan = 1;

  init(String sentence) async {
    a = await translator.translate(sentence, to: language);
    setState(() {});
  }

  TextEditingController translate1 = TextEditingController();
  TextEditingController translate2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: Text(
          "Language Translator",
          style: AppTextStyle.robotoMedium
              .copyWith(color: Colors.white, fontSize: 18.sp),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16.h,),
          LanguageItem(
            onTap: () {
              if (lan == 1) {
                lan = 2;
                language = "en";
                translate1.clear();
                translate2.clear();
                setState(() {});
              } else {
                lan = 1;
                language = "uz";
                translate1.clear();
                translate2.clear();
                setState(() {});
              }
            },
            lan1: lan == 1 ? "English" : "Uzbek",
            lan2: lan == 1 ? "Uzbek" : "English",
            image1: lan == 1 ? AppImages.english : AppImages.uzb,
            image2: lan == 1 ? AppImages.uzb : AppImages.english,
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(17.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    color: Colors.grey.withOpacity(0.5))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lan == 1 ? "English" : "Uzbek",
                  style: AppTextStyle.robotoMedium
                      .copyWith(color: AppColors.mainColor, fontSize: 20.sp),
                ),
                TextField(
                  controller: translate1,
                  maxLines: 10,
                  onChanged: (v){
                    init(v + " ");
                    setState(() {

                    });
                    setState(() {

                    });
                  },
                  decoration: InputDecoration(
                    hintStyle: AppTextStyle.robotoMedium.copyWith(
                        fontSize: 18.sp,
                        color: Colors.black.withOpacity(0.5)),
                    hintText:
                        lan == 1 ? "Enter text..." : "Matn kiriting ...",
                    contentPadding: const EdgeInsets.all(0),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(17.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    spreadRadius: 1,
                    blurRadius: 4,
                    color: Colors.grey.withOpacity(0.5))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lan != 1 ? "English" : "Uzbek",
                  style: AppTextStyle.robotoMedium
                      .copyWith(color: AppColors.mainColor, fontSize: 20.sp),
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    a != null ? a.toString() : "Translate...",
                    style: AppTextStyle.robotoMedium.copyWith(
                        color: AppColors.mainColor, fontSize: 18.sp),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
