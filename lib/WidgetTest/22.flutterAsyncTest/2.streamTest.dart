import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
/// 异步事件序列 称之为 Stream流
/// 1.future事件的诞生注定了只有一个结果，在我们多数的请求中都是一个因对应一个果。
/// 2.对于订阅的来说一个因对应多个果是future中的短板，在一个因开始之后，期间可能有多个结果，要相应多次通知，而这就是future的短板


/// 对于文件的读取，我们通过readAsString异步方法读取文件内容，返回Future<String>的内容，Future异步任务只有一次响应机会，通过then 回调，将所有内容读出。
/// 但是有时没有必要或者不能全部读取。比如在一个大文件中寻找一些字符，找到后就停止读取，读取文件的过程中显示进度，这个时候future就满足不了我们的需求了,stream就出生了
/// File类中有openRead方法返回Stream对象，
/// Stream<List<int>> openRead([int? start, int? end]);
/// stream中有两个角色 发布者  订阅者。操作系统、服务器等作为发布者他们有发送通知的义务，订阅者并不参与到执行过程中，可以监听通知来获取需要的结果数据。
/// stream对象使用Listener方法监听通知
/// StreamSubscription<T> listen(void onData(T event)?,{Function? onError,void onDone()?,bool? cancelOnError});
///
/// listen返回一个StreamSubscription对象，表示对流的订阅，通过这个对象 可以暂停或恢复对流的监听，以及cancel 取消对流的监听
///
///
///
///





int fileLength = 0;
int currentCount = 0;

late StreamSubscription<List<int>> subscription;

void readFile() async {
  File file = File(path.join(Directory.current.path,'assets',"Jane Eyre.txt"));
  print("开始读取文件");
  fileLength = await file.length();
  Stream<List<int>> stream = file.openRead();
  /// listen中监听事件回调
  subscription = stream.listen(_onData , onDone:_onDone);
}

void _onData(List<int> bytes){
  currentCount += bytes.length;
  double progress = currentCount * 100 / fileLength;
  DateTime time = DateTime.now();
  String timeStr = "[${time.hour}:${time.minute}:${time.second}:${time.millisecond}]";
  print(timeStr + "=" * (progress ~/ 2) + '[${progress.toStringAsFixed(2)}]');
  /// 进度大于50% 取消订阅，此时onDone方法也不会走
  if(progress > 50) {
    subscription.cancel();
  }
}

void _onDone(){
  print("读取 Jane Eyre.txt");
}

void main(){

}