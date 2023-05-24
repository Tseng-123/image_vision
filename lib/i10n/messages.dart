import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'zh_CN': zh, 'en_US': en};
}

Map<String, String> zh = {
  'xiaoyan': '小燕智能家居 - HomeKit智能家居，苹果智能家居, 智能家居系统，智能家居产品',
  'home': '主页',
  'product': '产品',
  'app': '应用',
  'blog': '博客',
  'contact_us': '联系我们',
  'about_us': '关于我们',
  'slogan': '改变了一点点，就改变了很多。',
  'slogan_sub': '让生活再简单一点。',
  'download_app': '小燕在家APP',
};
Map<String, String> en = {
  'xiaoyan':
      'Terncy - Smart Home Products, HomeKit Products，Google Home Products, Amazon Home Products.',
  'home': 'HOME',
  'product': 'PRODUCT',
  'app': 'APPLICATION',
  'blog': 'BLOG',
  'contact_us': 'CONTACT US',
  'about_us': 'ABOUT US',
  'slogan': 'Change a little, change a lot.',
  'slogan_sub': 'In the future, every family will use smart home.',
  'download_app': 'Download App',
};
