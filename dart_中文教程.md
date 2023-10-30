# Flutter & Dart 中文教程 (Made by Pandaemonium.)



## 1. Flutter Introduction

Flutter 是一个 谷歌支持的、开源的、移动端的 开发工具包(SDK)。

Flutter能够构建跨平台的移动应用程序（iOS，安卓），也支持其他平台如 Web、桌面端等。

Flutter 允许开发者使用单一的代码库来开发 iOS 和 Android 应用程序（即 write once, run anywhere），大大减少了开发时间和成本。

另外，Flutter还支持其它高效的功能，比如热重载（Hot Reload, 即代码修改后，能立刻反映到调试界面中），而Flutter的组件库（按钮、菜单等等）提供了丰富的组件和库，让开发者能快速地进行原型设计和开发。

目前，Flutter已经超过React Native成为最流行的跨平台SDK，有着丰富的社区支持（Community Support）。

Flutter是一个开发框架，框架的意思是为代码提供接口而简化开发流程；而Flutter基于的代码语言为Dart。

高效的能力有一大部分来自于Dart语言本身的优势。



## 2. Dart Introduction

以下几个特性可以描述Dart：

1. **面向对象**（OOP）：Dart 使用类和对象的概念，易于理解和使用。
2. **垃圾回收**（Garbage Collection）：Dart和Java一样都有着垃圾回收机制，这意味着他可以自动管理内存，无需像C一样手动分配和删除空间。
3. **强类型语言**（Strong-Typed）：Dart是强类型语言，类似于Java和C，这意味着变量**在编译时**就会确认其类型，避免了运行时错误。不过，虽然 Dart 是强类型语言，但它的类型推断（Type Inference）让代码更简洁，这意味着在变量声明时，可以直接使用 var 或 const 关键词代替具体的变量类型。
4. **丰富的库支持**：标准库包括异步、文件I/O、JSON 等多种功能。
5. **类似于C和Java的语法结构**：语法结构十分简洁，学习曲线十分平滑。
6. **热重载**（Hot Reload）：Flutter利用的Dart功能之一是热重新加载功能。这使开发人员能够立即看到最新的代码更改的结果，加快开发速度。



## 3. Dart 教程

### 下载Flutter SDK（内含Dart编译工具）

- 下载Flutter: [安装和环境配置 - Flutter 中文文档 - Flutter 中文开发者网站 - Flutter](https://flutter.cn/docs/get-started/install)
- 将flutter安装路径下的bin文件夹添加到**环境变量中的Path变量**中（类似于D:\flutter\bin）
- 此时打开命令行工具，输入 ` dart --version`，如果输出了类似于以下版本的信息：`Dart SDK version: 3.1.1 (stable) (Tue Sep 5 12:20:14 2023 +0000) on "windows_x64"`，说明你已经成功安装dart和flutter。
- 在命令行中创建一个dart项目，如: `C:\Users\xingwanli\Desktop> dart create -t console-simple my_app`。"-t console-simple"意思是只需要创建一个简单的命令行程序，而"my_app"是项目名称。

- 成功后，使用vscode打开dart自动创建的项目文件夹（确保你已经安装vscode并将其添加到Path）：在命令行输入 `code my_app` ，或者先打开vscode然后打开my_app文件夹。
- 在VSCode中下载Flutter扩展包。

- 在VSCode中运行应用程序：按下“Ctrl + \`”，打开命令行工具，然后输入 `dart run`。或者找到一个.dart文件，然后按下F5运行。

- 新建.dart文件：源代码（以.dart结尾的文件）存储在根目录下的 /bin 文件夹中。我们所有需要创建的文件都存储在该目录下。

- 接下来，我们将按照**变量、运算符、控制流、函数、类、接口**的顺序讲解。

### Dart 变量

- 首先，我们的代码在main函数下执行：

```dart
void main(List<String> args){
    // ...代码
}
```

- 基础 Dart 数据类型：

```dart
int num1 = 2;
double num2 = 3.0;
bool isTrue = true;
String str = 'Hello';
```

- 判断变量的数据类型：

```dart
(num1 + num2) is int // 返回一个Bool值
(num1 + num2).runtimeType // 返回一个Type类，print()后显示 'double'
```

- var 关键词：var关键字就像是说“我不想直白地用类型来注释变量”。如果不指定值，它将自动推断为null（尽量避免这种情况）。

```dart
var username; // null
var username = 'fireship'; // 通过Dart类型推断（Type Inference）的特性在编译时成为String类型
print(username.runtimeType) // 显示 'String'
```

- final 和 const 关键词：final关键字用于声明一个常量。只要有可能，就使用final，这是一个很好的习惯。

```dart
final String fullname = 'Jeffrey';
fullname = 'Jefferson' // 报错;
```

​	const 关键词与 final 几乎相同，但它创建了一个不可变的编译时（compile-time）常量。它可以提高应用程序的性能，但只能用于编译时已知的值（不能通过其它 const 变量赋值）。

```dart
const int age = 75;
const int favNumber = num1 + 5; // 报错
```

（以下部分是null值处理）

- 默认情况下，变量不能为null，也不能吧null直接赋值给一个变量。试图分配null值将导致编译时错误（compile-time error）。

```dart
int age = 75; // non-nullable
int age = null; // 报错
```

- optional变量：但是某些情况下，允许变量为null是很有用的，这可以通过在变量类型的末尾添加问号来实现，此时这个变量是一个**optional变量**。为什么有用？我知道你很急，但你先别急。

```dart
int? age; // nullable
```

### Dart 运算符

- 基础数学运算符、逻辑运算符：

```dart
  1 - 2 + 3 * 5 / 4;
  var a = 1 == 2; 
  var b = 1 >= 3;
  1 <=-1;
  if (a || b){
    print("She's Good!");
  } else print("He's Bad!");

  int id = 0;
  id += 1; // 等效于 id++
  id --;
```

- 对optional变量进行处理：

```dart
String? answer;
String result = answer; // 报错，result是String类型，而answer是String?类型
String result = answer!; // 强制转换String?为String。这里会报错，因为answer是null值，此时强制转换会报错。

String? name;
name ??= 'Guest'; // 如果name还没被赋值（是null值），那么将其赋值为'Guest'，否则保持原值不变。
var z = name ?? 'Guest'; // 与上一行等效
```

- 三元运算符：

```dart
String color = 'blue';
var isThisBlue = color == 'blue' ? '是，它是蓝色' : '放屁';
```

- as：类型转换

```dart
Animal animalDog = Dog(); // Animal 为 Dog 的父类
var dog = animalDog as Dog; // 类似于 Java 中的 Dog dog = (Dog) animalDog
```

### Dart 控制流

条件语句：

```dart
var color = 'blue';
if (color == null) print("The color is null!");
else if (color == "red") print("The color is red.");
else if (color.isEmpty) print("We have an empty color.");
else{
   int length = color.length; // .length取字符串长度
   print("The color is: $color, and the length is: $length"); // 在字符串内部使用“$”对其进行格式化
}
```

循环语句：

```dart
for(int i=0; i<5; i++){ // for 循环
  if(i == 1) continue; // continue语句
  print("The i value is $i");
  if(i == 3) break; // break 语句
  while(i > 2){ // while 循环（聪明一点的人会发现这个while一次都不会执行）
    i = i - 1;
  }
}
```

断言语句：

```dart
assert(color == 'red'); // 报错，因为color为blue，断言判定失败
```

### Dart 函数

Dart 中有和 Java、C 类似的函数声明语法：

```dart
String minusFive(int number){
    return '$number minus five equals ${number - 5}';
}
void main(){
    print(minusFive(114514));
}
```

定义函数时，在参数两边加上大括号{}可以使其变为命名变量 (Named Parameters)。命名变量需要加上 "required" 关键字，或者给它一个默认值。

```dart
int val = 9;
mixedParamsFunction(int a, int b, {required int x, int y = 5}){ // 命名变量 需处于 非命名变量 后面。另外注意到我们函数名开头没有声明 返回类型，这也是因 类型推断 省略了
    return a + b * x / y - val; 
}
print(mixedParamsFunction(5, 3, x: 2, y: 1)); // 显示 “3.0”
```

箭头型函数（Arrow Function）：类似于Javascript，可以使用箭头定义一个函数，保证语法简洁。注意，箭头型函数和其上下文完全无关（mixedParamsFunction 利用了上下文中 val = 9 的事实，而箭头型函数不允许这一点。）

```dart
var minusFive(int number) => '$number minus five equals ${number - 5}';
```

函数是对象：函数也是一个对象，可以作为参数传递给某个参数。

```dart
print114514Result(Function func){
  print(func(114514));
}

print114514Result(minusFive); // 显示 “114514 minus five equals 114509”
```

### Dart 类

定义类和子类（注意，类的定义只能写在main函数外）

```dart
class Animal {
  String _code = "ACTIVE FORM OF LIFE ON EARTH"; // 类的属性

  void eat(){ // 类的方法
    print("Animal is eating!");
  }
}

class Human extends Animal{ // 子类
  late String name; // 不带late关键字会报错。late的意思是这个变量在用构造器生成对象时一定会赋值。
  late bool genderClassificationMethod; 

  Human(this.name, this.genderClassificationMethod); // 无名构造器，最多只能有一个
  Human.constructWithCode(this.name, this.genderClassificationMethod, {required String code}){  // 带名构造器
    this._code = code;
  }

  @override
  void eat(){ // 多态
    print("Human $name is having meals!");
  }

  String think(){ // 子类独有方法
    String result = "A human is thinking!";
    return result;
  }
}
```

用类生成对象：

```dart
void main() {
  Human humanCherry = Human.constructWithCode("Cherry", true, code: "I'M SUPERHUMAN!"); // 使用带名构造器构造
  print("Human Cherry's gender classification method: ${
    humanCherry.genderClassificationMethod ? "Binary": "Non-Binary"
    }"); // 取出对象属性
  print("That human's name: ${humanCherry.name}");  // 显示 “That human's name: Cherry”
}
```

注意到Dart中类的属性和方法在一般情况下没有封装，没有private, public, protected关键字。然而，像_code这样以下划线开头的变量仅在当下库下可见，也就是说当另一个.dart文件尝试访问humanCherry.\_code时会报错。

Mixin:

Mixin是类的扩展，可以包括属性和方法。一个类只能继承一个父类，但是可以通过"with"关键字实现多个mixin。

```dart
mixin Sins{
  List<String> sevenDeadlySins = ["wrath", "greed", "sloth", "pride", "lust", "envy", "gluttony"]; // Dart中全部的顺序表都可以用List类进行处理

  void listSins(){
    int index = 1;
    for(var sin in sevenDeadlySins){
      print("sin $index: $sin");
      index++;
    }
  }
}

class Human extends Animal with Sins{
    ...
}

void main(){
    ...
    humanCherry.listSins();
}
```

### 其它：List(见Github)、Map(见Github)、 范类、导入包、异步处理等高级特性
