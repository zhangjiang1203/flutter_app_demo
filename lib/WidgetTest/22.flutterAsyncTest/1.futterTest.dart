
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(){

}

/// 写入文件
void saveToFile(String result) {
  // String filePath = path.join(Directory.current.path,'out.json');
  // File file = File(filePath);
  // String content = json.encode(result);
  // Future<File> futureFile = file.writeAsString(content);
  // /// future中 then 监听任务完成的时机，并回调方法中的参数
  // futureFile.then((value){
  //   print("写入成功:${file.path}");
  // }).catchError((error){
  //   /// catchError 监听方法异常结束的时机，对异常结果进行处理
  //   print("catch error:$error");
  //   return File('this is error file');
  // }).whenComplete(() {
  //   /// 不论成功失败都会执行
  // });


  /// 类似于代码中的try...catch...finally 代码异常抓取
  /// 代码中的catchError中返回的error第一参是Function类型，可以是下面的两类函数中的任意一种
  /// Function (dynamic,StackTrace) 第二参是_stackTree对象，可以根据它定位到出错代码的位置：
  // futureFile.catchError((error,stack){
  //    print("catchError:[${error.runtimeType}] : $error");
  //    print("stack at :: [${stack.runtimeType}] : $stack");
  //    return File("this is error file");
  //  });

  /// then的使用细节 then方法有两个入参，第一个是必传的回调函数，第二个onError的可选回调，该错误回调参数也是异常和堆栈的信息
  /// 需要注意的是 在then中提供了onError回调之后，then返回值之后的catchError就会没有效果
  /// whenComplete方法 该方法的回调中没有任何参数，更像一个时机的监听，

  /// async/await 是为了简化then回调嵌套定义的语法形式，await关键字只能在async修饰的方法中使用。
  /// await的价值是简化异步任务完成监听，让依赖于任务结果的后续任务摆脱回调监听，从而用一种同步的简单方式书写
  /// async/await 使用注意点，使用是会阻塞其他任务进行，当上下任务并没有依赖时不要使用阻塞的方式



  /// future.delayed 创建模拟异步任务
  Future.delayed(Duration(seconds: 3)).then((value) {
    print("开始执行");
  });

  /// delayed设置两个参数，
  Future.delayed(Duration(seconds: 3),computation).then((value) {
    print("error throw");
  });
}
/// 返回执行的方法 Future任务
FutureOr<int> computation(){
  int count = 1;
  if(count % 3 == 0){
    throw 'error';
  }
  return count;
}

