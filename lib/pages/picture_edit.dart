import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PictureEditPage extends StatefulWidget {
  const PictureEditPage({Key? key}) : super(key: key);

  @override
  State<PictureEditPage> createState() => _PictureEditPageState();
}

class _PictureEditPageState extends State<PictureEditPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //图片编辑部分
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: 120.0.w, vertical: 80.0.w),
            color: const Color(0xff828789),
            child: Column(
              children: [
                SizedBox(
                  width: 500.w,
                  height: 500.w,
                  child: CachedNetworkImage(
                    imageUrl: "http://via.placeholder.com/200x150",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Container(
                        color: Colors.amber,
                        alignment: Alignment.center,
                        child: const Icon(Icons.error, color: Colors.white)),
                  ),
                ),
                Container(
                  width: 500.w,
                  height: 100.w,
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '左上角文字',
                            style: TextStyle(
                                fontSize: 16.0.sp, color: Colors.black),
                          ),
                          Text(
                            '左下角文字',
                            style: TextStyle(
                                fontSize: 10.0.sp, color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 180.w,
                            child: Image.asset(
                                'images/icons/Fujifilm_logo_logotype.png'),
                          ),
                          VerticalDivider(color: Colors.black.withOpacity(.5)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '右上角文字',
                                style: TextStyle(
                                    fontSize: 16.0.sp, color: Colors.black),
                              ),
                              Text(
                                '右下角文字',
                                style: TextStyle(
                                    fontSize: 10.0.sp, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //操作部分
          Container(
            color: Colors.grey.withOpacity(.2),
            height: 400.w,
            child: Column(),
          )
        ],
      ),
    );
  }
}

class Picture {
  String? url; //图片文件地址
  String? logo; // logo
  double? logoSize; // logo大小
  double? borderSize; // 边框大小
  double? borderContentSize; // 边框内容大小
  Color? colorThemeMainTextColor; // 颜色主题-主文本色
  Color? colorThemeSubTextColor; // 颜色主题-副文本色
  Color? colorThemeBorderColor; // 颜色主题-边框颜色
  String? leftTopText; // 左上角文字
  String? leftBottomText; // 左下角文字
  String? rightTopText; // 右上角文字
  String? rightBottomText; // 右下角文字
  Picture(
      {this.url,
      this.logo,
      this.logoSize,
      this.borderSize,
      this.borderContentSize,
      this.colorThemeMainTextColor,
      this.colorThemeSubTextColor,
      this.colorThemeBorderColor,
      this.leftTopText,
      this.leftBottomText,
      this.rightTopText,
      this.rightBottomText});
}
