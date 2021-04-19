  /*
* ZJRegExpTool created by zhangjiang 
* on 2020/4/6 1:23 PM
* copyright on zhangjiang
*/

class ZJRegExpTool {
  ///手机号验证
  static bool isChinaPhoneLegal(String str) {
    return RegExp(
        r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$")
        .hasMatch(str);
  }

  ///邮箱验证
  static bool isEmail(String str) {
    return RegExp(
        r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$")
        .hasMatch(str);
  }
  ///验证URL
  static bool isUrl(String value) {
    return RegExp(
        r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+")
        .hasMatch(value);
  }

  /// 获取匹配的所有值
  static Iterable<Match> allMatchUrl(String value){
    return RegExp(r"((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+").allMatches(value);
  }

  ///验证身份证
  static bool isIdCard(String value) {
    return RegExp(
        r"\d{17}[\d|x]|\d{15}")
        .hasMatch(value);
  }

  ///验证中文
  static bool isChinese(String value) {
    return RegExp(
        r"[\u4e00-\u9fa5]")
        .hasMatch(value);
  }

  /// 验证是英文
  static bool isEnglist(String value){
    return RegExp(r"[]").hasMatch(value);
  }
}


