// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "welcome_text": "اصنع المقطع التشويقي الخاص بك",
  "uploadtext": "ارفع فلماً من جهازك",
  "streamText": "بث فلم من رابط",
  "chooseText": "اختر عملية",
  "dialog": {
    "enterText": "ادخل رابط الفلم ",
    "hintText": "ادخل الرابط هنا",
    "okText": "موافق",
    "Cancel": "رجوع",
    "validationText": "الرجاء إدخال رابط"
  },
  "drawer": {
    "themeText": "النمط",
    "langText": "اللغة",
    "aboutText": "عن التطبيق",
    "reportText": "إبلاغ عن مشكلة"
  },
  "suggestedtext": "الأفلام المقترحة",
  "confirmation": {
    "selected_text": "تم اختيار الفلم بنجاح ! 🎉",
    "subsuploadtext": "يرجى رفع ترجمة الفلم باللغة الإنكليزية على شكل ملف SRT : ",
    "nofiletext": "لم يتم اختيار الملف",
    "descText": "- وجدنا الفلم الذي تريده و الآن التطبيق سوف يقوم بتحليله و العمل ✨",
    "betterText": "للحصول على نتائج أفضل : ",
    "FastnetText": "اتصال على إنترنت سريع.",
    "subText": "ترجمة متناسقة و ملائمة .",
    "ProcessText": "العملية قد تستغرق 15 - 20 دقيقة ⌛",
    "startText": "ابدأ"
  },
  "plottext": "ملخص الأحداث",
  "plots": {
    "batmanPlot": "عندما يتسبب الخطر المعروف باسم الجوكر في الدمار والفوضى على شعب جوثام ، يجب أن يقبل باتمان أحد أعظم الاختبارات النفسية والجسدية لقدرته على محاربة الظلم و منع الجوكر من تدمير المدينة .",
    "takenPlot": "يسافر عميل متقاعد من وكالة المخابرات المركزية عبر أوروبا ويعتمد على مهاراته القديمة لإنقاذ ابنته الوحيدة التي اختطفت أثناء رحلة إلى باريس .",
    "fastPlot": "يجب على ضابط شرطة لوس أنجلوس برايان أو كونر أن يقرر أين يكمن ولائه عندما يصبح مفتونًا بعالم سباقات الشوارع الذي تم إرساله متخفيًا لتدميره .",
    "hacksawPlot": "يرفض الطبيب العسكري الأمريكي في الحرب العالمية الثانية ديزموند تي دوس ، الذي خدم أثناء معركة أوكيناوا ، قتل الناس ويصبح أول رجل في التاريخ الأمريكي يحصل على وسام الشرف دون إطلاق رصاصة واحدة."
  },
  "displayText": {
    "doneText": "تم صنع المقطع بنجاح !",
    "saveText": "حفظ المقطع",
    "shareText": "مشاركة المقطع",
    "deleteText": "حذف المقطع",
    "AnotherText": "جرب فلماً آخر !",
    "deleteDialog": "هل تريد حذف المقطع ؟ "
  }
};
static const Map<String,dynamic> en = {
  "welcome_text": "Make Your Own Movie Trailer",
  "uploadtext": "Upload a Movie",
  "streamText": "Stream a URL",
  "chooseText": "Choose a Process",
  "dialog": {
    "enterText": "Enter Your Movie's URL",
    "hintText": "enter URL here",
    "okText": "OK",
    "Cancel": "Cancel",
    "validationText": "Please enter a URL"
  },
  "drawer": {
    "themeText": "Theme",
    "langText": "Language",
    "aboutText": "About us",
    "reportText": "Report a Problem"
  },
  "suggestedtext": "Suggested Movies",
  "confirmation": {
    "selected_text": "Your Movie was Selected Successfully ! 🎉",
    "subsuploadtext": "Please upload English Subtitles for your Movie as an SRT file :",
    "nofiletext": "No File is Selected",
    "descText": "- We have found your desired Movie and now The app will start to analyze it and do the Trick✨",
    "betterText": "For a Better Result :",
    "FastnetText": "Fast Internet Connection.",
    "subText": "Synchronized movie subtitles.",
    "ProcessText": "Process might take 15 - 20 minutes ⌛",
    "startText": "Start"
  },
  "plottext": "Plot Summary",
  "plots": {
    "batmanPlot": "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
    "takenPlot": "A retired CIA agent travels across Europe and relies on his old skills to save his estranged daughter, who has been kidnapped while on a trip to Paris.",
    "fastPlot": "Los Angeles police officer Brian O'Conner must decide where his loyalty really lies when he becomes enamored with the street racing world he has been sent undercover to destroy.",
    "hacksawPlot": "World War II American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people and becomes the first man in American history to receive the Medal of Honor without firing a shot."
  },
  "displayText": {
    "doneText": "Your trailer was generated !",
    "saveText": "Save to Gallery",
    "shareText": "Share Trailer",
    "deleteText": "Delete Trailer",
    "AnotherText": "Try Another Movie !",
    "deleteDialog": "Are you sure you want to delete the trailer ?"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
