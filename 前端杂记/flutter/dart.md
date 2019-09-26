# DART
- 1.强类型语言，但是定义时可以不指定类型，自动推导类型，会进行类型检查。dynamic是动态类型，编译后，实际是一个object类型，编译时不进行类型检查，运行时进行类型检查。
- 2.函数的写法：
```dart
void test(){
  print('ee');
}
test(){
  print('ee');
}
test()=> print('ee');
```
- 3.入口函数main：
```dart
void main(List<String> arguments){
  print('34');
}
```