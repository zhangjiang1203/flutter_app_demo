import 'dart:math';

/// 定义类  实例化
/// 成员变量表示一个类又那些数据
/// 成员方法表示一个类又那些功能
class Vec2 {
  /// 成员变量
  double x;
  double y;

  /// get与 set关键字修饰的是成员方法，其本质上就是他们的一种简写方式，常用于对变量的维护
  double get length => sqrt(x * x + y * y);

  /// 成员方法
  String getPrint() => "Vec2($x,$y)";

  Vec2(this.x,this.y);
}


void main() {
  Vec2 p0 = Vec2(30,80);
  print(p0.getPrint());


  p0.x = 40;
  print(p0.getPrint());

  print(p0.length);
}