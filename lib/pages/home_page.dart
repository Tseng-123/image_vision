import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xiaoyan_web/const/const.dart';
import 'package:xiaoyan_web/i10n/message_controller.dart';
import 'package:xiaoyan_web/pages/products_page.dart';

import '../widget/text_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  MessagesController messagesController = Get.put(MessagesController());

  List<String> mainTitle = [
    'home',
    'product',
    'app',
    'blog',
    'contact_us',
    'about_us'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe9eaee),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width > 1080 ? 132.w : 0),
          width: 820.w,
          height: 1180.w,
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              //导航栏
              Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 36.w, vertical: 5.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.accessible),
                      Flexible(
                          flex: 2,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: mainTitle
                                  .map((e) => XyTextButton(
                                      onPressed: () async {
                                        // print(S.of(context).home);
                                        // Get.to(() => const ProductsPage());
                                        //
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ProductsPage())).then(
                                            (value) => print('-----$value'));
                                        if (await canLaunchUrl(
                                            Uri.parse(BLOG_URL))) {
                                          await launchUrl(Uri.parse(BLOG_URL));
                                        } else {
                                          throw 'Could not launch $BLOG_URL';
                                        }
                                      },
                                      text: e.tr))
                                  .toList())),
                      Row(children: [
                        GestureDetector(
                            onTap: () {
                              messagesController.changeLanguage('zh', "CN");
                            },
                            child: Container(
                                color: Colors.amber,
                                width: 36.w,
                                height: 16.w)),
                        GestureDetector(
                            onTap: () {
                              // messagesController.changeLanguage('en', "US");
                              var locale = const Locale('en', 'US');

                              Get.updateLocale(locale);
                            },
                            child: Container(
                                color: Colors.blue, width: 36.w, height: 16.w))
                      ])
                    ]),
              ),
              // APP
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.w),
                width: 820.w,
                height: 615.w / 3,
              ),
              //video
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.w),
                width: 820.w,
                height: 615.w / 3,
                color: Colors.black,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.asset('images/movie.gif', fit: BoxFit.fill),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
