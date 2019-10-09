# DART
- 1.强类型语言，但是定义时可以不指定类型，自动推导类型，会进行类型检查。dynamic是动态类型，编译后，实际是一个object类型，编译时不进行类型检查，运行时进行类型检查。变量要先定义后使用。
- 2.函数的写法：
    ```dart
    void test(){
      print('ee');
    }
    test(){
      print('ee');
    }
    //只有一个语句时
    test()=> print('ee'); 
    //匿名函数
    var test = (){
    print('ee');
    };
    var test = ()=>print('ee');
    //参数可以选择是否指定类型,可选位置参数和可选命名参数不同时存在
    void test(String s1,[String s2='23']){
      print('----$s1----{$s2}');
    }
    void main(){
      test('12');
      test('12','23');
    }
    void test(String s1,{String s2='23'}){
      print('----{$s1}----{$s2}');
    }
    void main(){
      test('12');
      test('12',s2:'23');
    }
    ```
- 3.入口函数main：
    ```dart
    void main(List<String> arguments){
      print('34');
    }
    ```
- 4.import引用包
- 5.继承exteds和mixins,interfaces
  - 1.例子：
      ```dart
        class Spacecraft{
          static final age = 23;
        }
        class Manned{
          int astronauts;
          void describeCrew(){
            print('232323---$astronauts');
          }
        }
        //dart单继承,mixins可重用，接口必须重写所有方法，mixins的优先级高于接口,with 应该放在implements前面，mixins内部的优先级后面的覆盖前面的，
        class Orbiter extends Spacecraft with Manned{
            static final name;
        }
        //每一个类都隐式的定义了一个包含所有成员的接口
        class test implements Manned,Spacecraft{
          static final age = 12;
        
          int astronauts = 12;
          @override
          void describeCrew(){
            print('232323---$astronauts');
          }
        }
    
      ```
  - 2.mixins的线性化：mixins通过创建一个类来实现，该类将mixins的实现层叠在一个超类之上以创建一个新类，
- 6.抽象类定义一个不能被实例化的类。通常用来定义接口，如果希望实例化，定义一个工厂构造函数。有抽象方法的类可以不是抽象类，可以被实例化，但是会有警告。
- 7.async、await，异步调用：
    ```dart
    Future<Null> printWithDelay(String message) async{
      await new Future.delay(const Duration(seconds:1));
      print(message);
    }
    ```
- 8.const和final：
    - 1.一个final只能赋值一次，一个const变量是编译时常量。
    - 2.const变量同时也是final变量。
    - 3.顶级的final变量和类中的final变量在第一次使用的时候初始化。
    - 4.**实例变量可以实final但是不能是const**
    - 5.const在类中，必须定义为static const
- 9.Booleans：**只有true才是true，其他的1、"asdsds"都是false**
- 10.Symbols，操作符或标识符，在前面加#
- 11.类型判定操作符；as：类型转换，is：如果对象是指定对象返回true，is!：如果对象不是指定对象返回true
- 12.??=：如果值为null，赋值，如果不为null，则保持原值
- 13.条件表达式：??，a??b，a不为bull，返回a，否则返回b
- 14.?. ：可以避免左边对象为null时抛出异常
- 15.常量构造函数
- 16.覆写==的时候同时覆写hashcode
- 17.Numbers：int、num、double
  ```dart
  main(){
    //int、double转换为指定的类型
    assert(int.parse('42') == 42);
    assert(int.parse('42',radix:16) == 66); //radix是基数
    assert(int.parse('0x42') == 66);
    assert(double.parse('0.50') == 0.5);
    //num先尝试转换为整数，无法转换时会解析为浮点数
    assert(num.parse('42') is int);
    assert(num.parse('0x42') is int);
    assert(num.parse('0.50') is double);
    //toString()转换为字符串
    assert(42.toString()=='42');
    assert(123.456.toString()=='123.456');
    assert(123.456.toString()=='123.456');
    //toStringAsFixed()转换为指定小数位的字符串
    assert(123.456.toStringAsFixed(2)=='123.45');
    //toStringAsPrecision()转换为指定有效位的科学计数法字符串
    assert(123.456.toStringAsPrecision(2)=='1.2e+2');
    assert(double.parse('1.2e+2')==120.0);
  }
   ```
- 18.Strings：不可变的UTF-16序列
  - 1.操作函数：
  ```dart
  main(){
    //contains()字符串包含
    assert('Never odd or even'.contains('odd'));
    //startsWith()字符串以子字符串开头
    assert('Never odd or even'.startsWith('Never'));
    //endsWith()字符串以子字符串结尾
    assert('Never odd or even'.endsWith('even'));
    //indexOf()子字符串在字符串的位置
    assert('Never odd or even'.indexOf('odd')==6);
    //subString()截取指定位置的子字符串
    assert('Nerver odd or even'.subString(6,9) == 'odd');
    //split()分割字符串
    var parts = 'structured web apps'.split(' ');
    assert(parts.length == 3);
    assert(parts[0]=='structured');
    //按位置获取单个字符
    assert('Nerver odd or even'[0] == 'N');
    //获取字符串的每个字符的UTF-16码
    var codeUnitList = 'Never odd or even'.codeUnits.toList();
    assert(codeUniList[0] == 78);
    //toUpperCase()转换为大写
    assert('structured web apps'.toUpperCase() == 'STRUCTURED WEB APPS');
    //toLowerCase()转化为小写
    assert('STRUCTURED WEB APPS'.toLowerCase == 'structured web apps');
    //trim()删除字符串前后的空白字符
    assert('  hello  '.trim() == 'hello');
    //isEmpty判断字符串是否为空，长度为0
    assert(''.isEmpty);
    //replaceAll()替换子字符串，但是不改变原字符串，返回一个新字符串
    var greetingTemplate = 'Hello, NAME!';
    var greeting = greetingTemplate.replaceAll(new RegExp('NAME'),'Bob');
    assert(greeting != greetingTemplate);
    //使用StringBuffer创建字符串，只有当调用toString()函数的时候，才会创建一个新的string对象。writeAll可以有一个可选参数指定每个字符串的分隔符
    var sb = new StringBuffer();
    sb..write('Use a StringBuffer for ')
      ..writeAll(['efficient', 'string', 'creation'],' ')
      ..write('.');
    var fullString = sb.toString();
    //使用正则表达式搜索匹配字符串
    var numbers = new RegExp(r'\d+');
    var someDigits = 'llamas live 15 to 20 years';
    assert(someDigits.contains(numbers));
    someDigits.replaceAll(numbers,'2x');
    assert(someDigits.hasMatch(someDigits));
    for(var match in numbers.allMatch(someDigits)){
      ptint(match.group(0));
    }
  }
  ```
  - **2.对于字符串的操作尤其注意：对某些语言是有问题的**
  - **3.string是不可变的对象，可以创建，但是无法修改，所有的操作函数都是返回新的String对象**
- 19.Lists:列表
  - 1.操作函数：
    ```dart
    main(){
      var vegetables = new List();
      var fruits = ['apples','oranges'];
      fruits.add('kiwis');
      fruits.addAll(['grapes','bananas']);
      assert(fruits.length == 5);
      assert(fruits.indexOf('apples')==0);
      fruits.removeAt(0);
      assert(fruits.length == 4);
      fruits.clear();
      assert(fruits.length==0);
      fruits = ['bananas','apples','oranges'];
      fruits.sort((a,b)=>a.compareTo(b));
    }
    ```
- 20.Sets:无序集合，数据不重复
  - 1.操作函数：
  ```dart
  main(){
    var ingredients = new Set();
    ingredients.addAll(['gold','titanium','xenon']);
    assert(ongredients.length == 3);
    ingredients.add('gold');
    assert(ingredients.length == 3);
    ingredients.remove('gold');
    assert(ingredients.length == 2);
    assert(ingrediwnts.contains('titanium'));
    assert(ingredients.containsAll(['titanium','xenon']));
    var nobleGases = new Set.from(['xenon','argon']);
    var intersection = ingredients.intersection(nobleGases);
    assert(intersection.length ==1);
    assert(intersection[0] == 'xenon');
  }
  ```
- 21.Maps:字典，无序集合，包含一个key-value对
  - 1.dart中objects不是maps
  - 2.操作函数：
  ```dart
  main(){
    var hawaiianBeaches = {
      'Oahu':['Waikiki','Kailua','Waimanalo'],
      'Kauai':['Hanalei','Poipu']
    };
    var searchTerms = new Map();
    var nobleGases = new Map<int,String>();
    nobleGases[54] = 'xenon';
    assert(nobleGases.containsKey(54));
    nobleGases.remove(54);
    assert(!nobleGases.containKey(54));
    var keys = hawaiianBeaches.keys;
    assert(keys.length==3);
    var values = hawaiianBeaches.values;
    assert(values.length ==3);
    assert(values.any((v)=>v.contains('Waikiki')));
    assert(hawaiianBeaches.containsKey('Oahu'));
    //putIfAbsent()来设置key的值，只有该key在map中不存在的时候才设置，否则key的值保持不变
    hawaiianBeaches.putIfAbsent('43',()=>'43'.length);
  }
  ```
- 22.List、Set、Map上可以使用的集合函数；Iterable类定义了一些常用的功能，List和Set实现了Iterable。Map没有实现，但是Map的keys和values实现了
  - 1.函数示例：
  ```dart
  main(){
    //isEmpty判断集合是否为空
    var teas = ['green','black'];
    assert(!teas.isEmpty);
    //forEach
    teas.forEach((tea)=>print('I drink $tea'));
    var hawaiianBeaches = {
          'Oahu':['Waikiki','Kailua','Waimanalo'],
          'Kauai':['Hanalei','Poipu']
        };
    hawaiianBeaches.forEach((k,v){print('I want to visit $k and swim at $v');});
    //map返回一个包含所有经过函数处理数据的对象
    var loudTeas = teas.map((tea)=>tea.toUpperCase());
    //**map函数返回的对象也是Iterable，但是该对象是懒求值的，当访问里面的值时，map的方法才会被调用，可以使用map().toList()或者map().toList()来强制立刻执行map的方法**
    var loudTeaList = teas.map((tea)=>tea.toUpperCase).toList();
    //where返回所有满足特定条件的数据，any判断是否有数据满足特定条件，every判断是否所有数据都满足特定条件
    teas = ['green','black','chamomile','earl grey'];
    bool isDecaffeinated(String teaName)=>teaName == 'chamomile';
    var decaffeinatedTeas = teas.where((tea)=>isDecaffeinated(tea));
    assert(teas.any(isDecaffeinated));
    assert(!teas.every(isDecaffeinated));
  }
  ```
- 23.URIS
  代码示例：
  ```dart
  main(){
    //encodeFull、decodeFull可以编解码整个URI，并且保留URI特殊意义字符（/，&，：等）不变
    var uri = 'http://example.org/api?foo=some message';
    var encoded = Uri.encodeFull(uri);
    assert(encoded == 'http://example.org/api?foo=some%20message');
    var decoded = Uri.decodeFull(encoded);
    assert(decoded == uri);
    //encodeComponent、decodeComponent可以编解码URI中的所有字符，特殊意义字符（/，&，：等）也会编码
    encoded = Uri.encodeComponent(uri);
    assert(encoded == 'http%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
    decoded = Uri.decodeComponent(encoded);
    assert(decoded == uri);
    //parse可以从一个字符串中解析一个uri对象
    var uri = Uri.parse('http://example.org:8080/foo/bar#frag');
    assert(uri.scheme == 'htpp');
    assert(uri.host == 'example.org');
    assert(uri.path == '/foo/bar');
    assert(uri.fragment == 'frag');
    assert(uri.origin == 'http://example.org:8080');
    //构造一个Uri对象
    var uri = new Uri(scheme:'http',host:'example.org',path:'/foo/bar',fragment:'frag');
    assert(uri.toString() == 'http://example.org/foo/bar#frag');
  }
  ```