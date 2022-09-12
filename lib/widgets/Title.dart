import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_ui/assets.dart';
import 'package:video_ui/translations/local_keys.g.dart';

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lang = Localizations.localeOf(context).languageCode;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        width: ScreenUtil.defaultSize.width * 2,
        height: ScreenUtil.defaultSize.height * 0.2,
        child: Row(
          children: [
            Container(
              width: 250,
              child: Text(
                LocaleKeys.welcome_text.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: lang == 'ar' ? 25 : 45,
                  color: Colors.white,
                  // fontFamily: 'Graphique-W01-Regular'
                ),
              ),
            ),
            lang == 'en'
                ? SizedBox(
                    width: 10,
                  )
                : SizedBox(),
            VerticalDivider(
              color: Colors.white,
              thickness: 2,
              endIndent: 10,
              indent: 10,
              width: 20,
            ),
            lang == 'en'
                ? SizedBox(
                    width: 10,
                  )
                : SizedBox(
                    width: 10,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: lang == 'en' ? 100 : 80,
                width: ScreenUtil.defaultSize.width * 0.2,
                child: Image.asset(
                  Assets.logo,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
