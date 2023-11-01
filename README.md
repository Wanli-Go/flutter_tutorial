# flutter_app | Made by Pandaemonium.

这是用于教学的一个Flutter工程。



## Introduction

要运行起来Flutter**不是**一件容易的事，学习它也不是。但是Flutter确实非常棒，当你一旦掌握了用Flutter开发的秘诀，你会发现应用开发如此得心应手。另外，很明显的是，Flutter是全球最火爆的**跨平台开发框架**，它提供了尽可能最简单、最Intuitive的开发过程，并且能根据**单一代码（Single Codebase）**生成跨平台的前端软件，比如Web, Android, iOS, 甚至Windows和Linux。如果你大致能看懂我现在在说什么东西（看不懂也没关系），我下面会利用这个工程帮你对Flutter进行一个Walkthrough，从一个纯小白的视角。



## Configuration

要运行起来这个Flutter工程，你得先配置一下下环境，并掌握一点点基础知识。我懒得发送给你一个docker镜像，所以请你慢慢学。

### 什么是环境变量？

这个问题是不是太突兀了？我承认，但是它真的很重要。（如果你已经懂什么是环境变量，请跳转到下一个小标题。）**环境变量（Enviromental Variables）**其实就是存储在Windows大脑里的一些知识，它们以**键值对（Key-Value Pairs）**的形式存在。比如，如果你使用过Java，你可能配置过JAVA_HOME，“JAVA_HOME”就是键，而下面JDK的文件夹的路径就是值。**这样，你的系统就知道你的JDK存储在哪里了，你的程序自然也能从系统里获取这个知识**。在Flutter的配置过程中，我们会牵扯到一系列环境变量，一部分是为了能让你的Flutter能在中国大陆地区内流畅运行，一部分是Flutter本身的要求。

要打开环境变量，请按Win + Q键，然后输入“env”，显示的第一个选项就应该是“编辑系统环境变量”。

### 什么是命令行（CLI, Command-Line Interface）？

（如果你已经懂命令行的重要性，请跳转到下一个小标题。）如果你想使用好Flutter，那么是时候走出使用**GUI（图形用户界面）**的舒适圈了，因为Flutter提供的**命令行**工具不仅是创建、运行Flutter的必备技能，而且也是为什么Flutter这么受人喜欢的原因。因为，命令行 = 效率；命令行 = 精确。相信我，作为一个程序员，你总有一天会爱上命令行。

### 安装Flutter：

从这上面把货下到电脑上: [安装和环境配置 - Flutter 中文文档 - Flutter 中文开发者网站 - Flutter](https://flutter.cn/docs/get-started/install)

你会发现这货没有一个“安装程序”。笑死了！谁告诉你所有软件都需要一个图形化的安装程序？当然，这不是你的错。Anyway，请把它（压缩包中的flutter文件夹）解压到一个地方，然后把/flutter/bin的绝对路径添加到PATH。bin文件夹中存储着一些可以被windows直接执行的批处理文件（即程序），而添加到PATH之后，你的系统就能识别出这个文件夹下的程序，比如**flutter.bat**。

哦，忘了讲什么是PATH了，还记得刚才的环境变量吗，环境变量就是操作系统脑子里存储的一些知识，以键值对的形式存在。PATH也是一个环境变量，可以在环境变量列表中找到。PATH的值是一系列目录，这样，Windows就知道在运行程序时就要从这些目录里寻找了，这就是PATH的作用。比如，在你把/flutter/bin这个文件夹的路径添加到PATH之后，你在Windows命令行（Powershell）上敲`flutter`，你会发现它有反应！你可以看看它输出了什么。

现在，你就可以创建一个flutter项目了。怎么做？当然是命令行。如果你想在桌面上创建一个project，可以这么干：

- 打开Windows CLI：按下`Win + R`，然后输入`cmd`，然后回车。这个能够打开Windows CLI。

- 输入 `cd Desktop`。这个能定向到你的桌面文件夹。

- 输入`flutter create new_pro`。创建一个工程“new_project”，在一个新文件夹下。如果没有问题说明很好，如果有问题，先别急，继续往下看。

- 创建好flutter工程之后，输入`cd new_proj`定向到你的工程文件夹。

- 输入`code .`这样能在VSCode中打开这个flutter工程。如果你还没下载VSCode，那么emmm快去啊！

- 在VSCode中，按下```Ctrl + ` ```，打开Terminal（终端）。其实就是另一个Windows命令行。你会发现目前的工作目录是工程文件夹。

- 输入`flutter doctor`，这样能检查你缺些什么组件来运行这个程序。首先我们必须要一个Android SDK或者Android Toolchain。下面我会详细讲这意味着什么。

- 在以上的步骤中，如果出现卡死等情况，是因为我们在中国大陆无法快速获取我们需要的东西。只需要添加以下两个环境变量：

  `FLUTTER_STORAGE_BASE_URL` = `https://storage.flutter-io.cn`

  `PUB_HOSTED_URL`= `https://pub.flutter-io.cn`

### 安装Android SDK：

欢迎来到最费劲的一集。

这里，你需要完整的Android SDK，包括命令行工具，用于给Flutter把代码转换成Android应用程序；和一个虚拟安卓设备（AVD, Android Virtual Device）。最简单的做法如下：

- 下载Android Studio：[下载 Android Studio 和应用工具 - Android 开发者  | Android Developers](https://developer.android.com/studio?hl=zh-cn)
- 在Android Studio中创建一个最简单的项目。如果你发现在项目创建之后还在一直下载东西，请你关闭它，因为我们不需要那么多东西。
- 在工具栏里找到SDK Manager，点开它，然后**把SDK的路径复制到剪切板**。
- 点开SDK Manager后在"SDK Tools一栏"找到类似于Command-line tools的东西，然后下载它。
- **重要**：此时需要配置一些环境变量。具体的做法如下：
  - 添加一个环境变量，名为“ANDROID_HOME”，值为刚才拷贝的SDK路径。
  - 在PATH中添加一个文件夹，即"{刚才拷贝的SDK路径}/cmdline-tools/latest/bin"
  - 在PATH中添加一个文件夹，即"{刚才拷贝的SDK路径}/platform-tools"
- Android Studio还可以管理安卓虚拟设备（AVD）。下载一个虚拟设备，并把他运行起来，作为我们测试Flutter程序的系统。

此时，再在你的flutter项目里重新运行`flutter doctor`。应该可以看到`[√] Android toolchain - ...`。如果没有，说明这个教程还缺环，请你反馈给作者。

### 运行Flutter程序：

不要关闭你刚才打开的AVD。现在，你可以把这个代码库克隆到你自己的电脑上尝试了。

在VSCode里打开这个flutter项目，输入```Ctrl + ` ```打开命令行输入`flutter run`。在上述安卓虚拟设备运行的情况下，应该可以看到程序的build、运行的过程。



# Learn Flutter - Phase I

在学习Flutter之前，请你先过一遍Dart，因为Dart是我们Flutter使用的编程语言，而Flutter之所以如此强大有很大一部分原因就是Dart。详情请见目录下的“**dart_中文教程.md**”。

## 前端UI设计基础

在UI设计中，界面是由一个个**组件（Widget）**构成的，每一个Widget都是用户界面的一个不可分割的部分，例如一个按钮（Button）、一个文本（Text）、图片（Image）或容器（Container）等。**Widgets 可以嵌套**起来，比如在行（Row Widget）下可以**嵌套多个 Widget,** 把他们竖着排列起来；一些 Widget 可以**嵌套一个 Widget**，来定义他们的结构或属性，比如 不透明度（Opacity Widget）可以嵌套任意 Widget 来决定他它的不透明度。 通过构建复杂的 Widget 布局结构。到最后，我们可以形成一个组件树（Widget Tree），也就是整个应用全部组件的树形继承结构。

## 基础组件

基础组件通常是构建UI时处于Widget树底层的Widget，它们是UI的基本构建块。这些组件通常不会再嵌套新的Widget。以下是几种基本的基础组件的详细说明：

### Text

`Text` Widget是最基础的Widget之一，用于在屏幕上显示简单的文本。

- 参数：
  - `data`: 这是一个必须的参数，需要一个字符串，表示要显示的文本。例如，`Text("Hello, World!")`。
  - `style`: 这是一个可选参数，它接受一个`TextStyle`对象，可以用来定义文本的样式，如字体、大小、颜色、字重等：
- 示例：

```dart
Text(
  'Example Text',
  style: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey,
  ),
)
```

### Icon

`Icon` Widget用于在UI中展示图标，Flutter内置了大量的图标供我们使用。

- 参数：

  - `icon`: 必须的参数，通常是`Icons`类中的一个属性，表示要显示哪个图标。例如，`Icon(Icons.star)`。
  - `size`: 可选，用于设置图标的大小。
  - `color`: 可选，用于设置图标的颜色。

  ```dart
  Icon(
    Icons.star,
    color: Colors.red[500],
    size: 24.0,
  )
  ```

### Image

`Image` Widget用于在应用中显示图片。

- 参数：

  - `image`: 必须的参数，需要一个图片提供者，如`AssetImage`或`NetworkImage`，来告诉Flutter图片的来源。
  - `width`, `height`: 可选，用于设置图片的宽和高。
  - `fit`: 可选，类似于CSS中的`object-fit`属性，常用的值有`BoxFit.cover`、`BoxFit.contain`等，用于控制图片的填充方式。

  ```dart
  Image.asset(
    'path/to/asset.png',
    width: 100.0,
    height: 100.0,
    fit: BoxFit.cover,
  )
  ```

  或者

  ```image
  Image.network(
    'https://example.com/images/cat.png',
    width: 100.0,
    height: 100.0,
    fit: BoxFit.cover,
  )
  ```

- 使用场景：当你需要在应用中展示**本地资源**或**网络图片**时，可以使用`Image` Widget。

## 嵌套组件

嵌套组件允许开发者通过将简单的Widget组合在一起来创建复杂的UI。这些组件可以是

- 布局类的，用于控制整个App的布局，能够吸纳多个children进行布局；
- 显示类的，用于以不同方式显示组件的，能够吸纳一个child改变其显示方式。

### Container（显示）

`Container`是一个多用途的装饰性容器，你可以用它来设置背景色、边框、边距、填充等。它可以包含一个子Widget。

```dart
Container(
  padding: EdgeInsets.all(8.0), // 内边距
  color: Colors.tealAccent, // 背景颜色
  width: MediaQuery.of(context).size.width * 0.5, // 宽度
  height: MediaQuery.of(context).size.width * 0.3, // 高度
  alignment: Alignment.center, // 对齐方式
  child: Text('Inside Container'), // 子组件
)
```

### Row（布局）

`Row`是一个布局Widget，用于在水平方向上排列子Widget。它可以包含多个子Widget。

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 在主轴（横轴）上均匀排列
  crossAxisAlignment: CrossAxisAlignment.end, // 在交叉轴（竖轴）上贴近最后方
  children: [
    Icon(Icons.share),
    Icon(Icons.thumb_up),
    Icon(Icons.thumb_down),
  ],
)
```

### Column（布局）

`Column`与Row类似，但是它在垂直方向上排列子Widget。

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center, // 在主轴上靠近中间排列
  children: <Widget>[
    Text('First Item'),
    Text('Second Item'),
    Text('Third Item'),
  ],
)
```

### Opacity（显示）

`Opacity`Widget可以改变其子Widget的不透明度。

```dart
Opacity(
  opacity: 0.5,
  child: Text('Half Visible Text'),
)
```

### Button（显示）

在Flutter中，按钮是用户交互的一种基础Widget。以下是几种常见的按钮：

#### ElevatedButton

`ElevatedButton`创建一个带有阴影和升高效果的按钮。

```dart
ElevatedButton(
  onPressed: () {
    // 操作
  },
  child: Text('ElevatedButton'),
)
```

#### TextButton

`TextButton`则通常用于不需要升高效果的场景，比如对话框中的文本操作。

```dart
TextButton(
  onPressed: () {
    // 操作
  },
  child: Text('TextButton'),
)
```

#### IconButton

`IconButton`通常用于工具栏中，只包含图标的按钮。

```dart
IconButton(
  icon: Icon(Icons.volume_up),
  tooltip: 'Increase volume by 10%',
  onPressed: () {
    // 操作
  },
)
```

### Flexible（显示）

`Flexible` Widget可以让其子Widget具有灵活的维度。

需要在`Row`、`Column`等布局中，与其它Flexible组件共同使用。

```dart
Row(
  children: <Widget>[
    Flexible(
      flex: 2,
      child: Container(
        color: Colors.cyan,
        height: 100,
      ),
    ),
    Flexible(
      flex: 3,
      child: Container(
        color: Colors.teal,
        height: 100,
      ),
    ),
  ],
)
```

### Expanded（显示）

`Expanded`可以使子Widget填充全部剩余可用的空间。在`Row`或`Column`组件中，与其它固定长度的组件使用。

```dart
Column(
  children: <Widget>[
    Expanded(
      child: Container(
        color: Colors.amber,
        child: Text('Item 1'),
      ),
    ),
    Container(
      color: Colors.blue,
      height: 100,
      child: Text('Item 2'),
    ),
  ],
)
```

### SingleChildScrollView（布局）

当你有一个需要滚动的内容时，`SingleChildScrollView`可以确保用户可以滚动查看所有的内容。注意，SingleChildScrollView不能使用任何使用flex进行布局的组件（i.e. Flexible, Expanded, Flex）

```dart
SingleChildScrollView(
  child: Column(
    children: <Widget>[
      SizedBox(
          Text('Line 1'),
          width: 100,
          height: 50
      ),
      SizedBox(
          Text('Line 2'),
          width: 100,
          height: 200
      ),
      // 更多...
    ],
  ),
)
```

### Stack（布局）

`Stack`允许你堆叠多个子Widget，一个在另一个上面。你可以使用`Positioned`来放置每一个子Widget。

```dart
Stack(
  alignment: Alignment.center,
  children: <Widget>[
    Container(
      width: 300,
      height: 300,
      color: Colors.red,
    ),
    Text('Hello, World!', style: TextStyle(fontSize: 20)),
  ],
)
```

### Padding（显示）

`Padding` Widget用来给子Widget周围添加指定大小的填充空间。

```dart
Padding(
  padding: EdgeInsets.all(8.0),
  child: Column(
    children: <Widget>[
      Text('This is a text widget'),
      ElevatedButton(
        onPressed: () {},
        child: Text('This is a button'),
      ),
    ],
  ),
)
```

### GridView（布局）

`GridView`可以创建一个二维网格列表，它的每个子Widget都被强制具有相同的宽度和高度。

它是一个可以滚动的布局组件。

```dart
GridView.count(
  crossAxisCount: 2, // 在交叉轴上只能放置两个，类似手机淘宝
  children: <Widget>[
    Container(
      color: Colors.teal,
      child: Center(child: Text('Item 1')),
    ),
    Container(
      color: Colors.cyan,
      child: Center(child: Text('Item 2')),
    ),
    // 更多容器...
  ],
)
```

#### 可滚动特性

`GridView`自带滚动支持，无论列表内容的长度如何，用户都可以通过滚动来查看所有的项。这意味着`GridView`在内部已经包含了一个`Scrollable` Widget，因此你不需要额外添加滚动逻辑。

#### Builder方法

`GridView.builder`方法可以高效地构建一个网格列表。它只会为实际在屏幕上渲染的Widgets分配资源，而不是一次性为所有项分配资源。这种方法可以提高大列表的性能，因为只有那些在视口中的Widgets才会被创建。

```dart
List<int> lis = [1, 2, 3]

GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3, // 每行三个项
  ),
  itemBuilder: (BuildContext context, int index) {
    return Text("${lis[index]}"); // 返回一个需要显示的Widget
  },
  itemCount: lis.length, // 项的总数
)
```

### ListView

`ListView`是一个创建滚动列表的组件。它在一维空间上显示其子Widgets。ListView是最常见的滚动组件，用于展示一个长列表，如设置菜单、新闻文章等。

#### 可滚动特性

`ListView`也自带滚动支持，当内容超出屏幕范围时，用户可以滚动列表来查看更多的内容。它处理了所有与滚动相关的用户输入，例如触摸滑动，甚至可以通过滚动控制器（ScrollController）来控制滚动位置。

#### Builder方法

`ListView.builder`方法同样提供了一个高效的方式来构建列表，它适用于项数较多的列表。它的工作原理与`GridView.builder`类似，也是只为当前在视口中的项创建Widget。

```dart
ListView.builder(
  itemBuilder: (BuildContext context, int index) {
    return ListTile(
      title: Text('Item $index'),
    );
  },
  itemCount: yourItemCount, // 项的总数
)
```

`ListView.builder`还有`ListView.separated`的变种，它允许在列表项之间添加分隔符。

```dart
ListView.separated(
  itemBuilder: (BuildContext context, int index) {
    return ListTile(title: Text('Item $index'));
  },
  separatorBuilder: (BuildContext context, int index) => Divider(),
  itemCount: yourItemCount,
)
```

在使用`GridView`和`ListView`时，通过使用builder方法，你可以确保即使列表非常长，应用的性能也不会下降，因为Flutter只会构建并保持那些实际显示在视口中的Widgets。

### ListTile（布局）

`ListTile`是一个固定高度的行，通常包含一些文本以及一个前导或尾随图标。

```dart
ListTile(
  leading: Icon(Icons.album),
  title: Text('The Enchanted Nightingale'),
  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
  trailing: Icon(Icons.play_arrow),
)
```

## 状态转换

一个 Widget 在默认情况下是不可变（immutable）的，这意味着它们一旦显示出来就不能再改变其内部的属性，比如其文字；而要使一个Widget的属性发生变化，我们需要明白状态（State）这个概念。

状态是指Widget在某个时刻可能会变化的数据。每次数据更新时，状态就会发生变化，这样我们就**需要重构整个组件**。

Flutter对状态管理有不同的管理方法，最常用的是Provider框架。

Provider框架使用了**观察者模式（Observer Pattern）**。首先，我们有一个Notifier，其中定义了一些**可变的数据**。当这些数据改变时，Provider会把这个消息告诉它全部的Consumer（Listener）的Widget，使其按照新的数据重新构建。

### 定义 Notifier（发布者）

```dart
class Counter with ChangeNotifier {
  int _count = 0; // 上文所说的“可变数据”
  int get count => _count; // 获取数据

  void increment() { // 对数据进行操作
    _count++;
    notifyListeners(); // 通知依赖的Widgets更新
  }
}
```

### 定义 NotifierProvider

然后，为了让整个App里设置Consumer Widget，我们需要先配置一个NotifierProvider。

```dart
class CounterProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(), // 新建一个Counter，把它保存在Context里
      child: MyApp(),
    );
  }
}
```

这样，我们就把这个Notifier存储进了Context里，方便其Consumer进行使用。注意，我们现在还没有配置Consumer，只是把Notifier存到了Context中。

### 定义 Consumer （观察者）

下面，我们利用Consumer包装一个Widget。这样，当Notifier中的数据改变时，Consumer下面的组件进行整个重新构建：

```dart
Consumer<Counter>(
    // 一个包装了 Consumer<Counter> 的 SomeWidget。
    // Consumer<Counter> 代表这将会是一个聆听 Counter 而重新构建的 Widget。

    builder: (context, notifier, child) {
        // Consumer<PageNotifier> 的builder属性
        // 要求一个能够返回一个 Widget 的方法作为重构对象
        return SomeWidget(
            someAttribute: notifier.count // 因builder重新构建，因此能够显示最新的count数据
        )
    }
)
```

利用状态转换，我们可以改变一个组件应该显示的内容。这个最明显的用处就是在一个Scaffold中，按下底栏的不同按钮，然后调整界面（例如Home，My，Find等等）。**本工程的源代码中便实施了这一功能，并提供了详细的注释**。

## 工程文件结构

现在我们完成了基础了理论知识学习，是时候来看一下一个flutter项目的工程文件组织结构。

首先，`/lib`文件夹下存储了我们用来编写前端代码的所有.dart文件，而`/test`文件夹下存储了所有用来测试这些代码的代码。

其它文件夹，如`/android`, `/ios`,`/web`，指明了我们程序的目标平台。这里面的文件是固定的，能够吧源代码编译成对应平台的可执行文件。这些文件夹里面的文件不需要我们去调整；如果你的目标平台不包括web端或者ios端，可以把对应的文件夹直接删掉。

有时候，我们需要创建一些额外的文件夹来存储资源，如字体、图片等。但是，让我们先移步到这个十分重要的文件——`pubspec.yaml`。

### pubspec.yaml

在Flutter项目中，`pubspec.yaml`是一个非常关键的文件，用于定义项目的配置和依赖项。它的作用包括但不限于以下几点（参考本项目中的这个文件）：

1. **项目元数据**：它包含项目名称、描述、版本号以及作者信息等元数据:

   ```yaml
   name: flutter_app
   description: A new Flutter project.
   publish_to: 'none' 
   version: 1.0.0+1
   environment:
     sdk: '>=3.1.1 <4.0.0'
   ```

2. **依赖管理**：它列出了项目所依赖的所有第三方库和包，包括Flutter SDK本身和任何外部的Pub包。这允许`pub`工具，Flutter的包管理器，自动下载和管理这些依赖项。

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     cupertino_icons: ^1.0.2
     google_fonts: 3.0.1
     # 我们使用的 Provider 状态管理框架
     provider: 6.0.3
     json_annotation: 4.5.0
     rxdart: 0.27.4
     crypto: 3.0.1
     font_awesome_flutter: 10.1.0
   
   dev_dependencies:
     flutter_test:
       sdk: flutter
     flutter_lints: ^2.0.0
   ```

3. **资源管理**：在`pubspec.yaml`中指定项目资源，如图片、字体和本地化文件。这些资源在构建时会被包含在项目中。

   ```yaml
   flutter:
     # 使用 Material Design 风格
     uses-material-design: true
     
     # 自定义字体
     fonts:  
       - family: StarRail
         fonts:
           - asset: fonts\Honkai.ttf
             weight: 700
     # 自定义资源
     assets:
       - assets/
   ```

   pubspec.yaml 与 pom.xml 都能自动从网络上获取 Dependencies，但不同在于pubspec.yaml 还可以进行资源管理。例如，我们在项目根文件夹下可以**新建一个fonts目录**，存储项目可能用到的字体；**新建一个assets目录**，存储项目可能用到的照片等资源。然后，再向如图的方式添加到 pubspec.yaml 文件夹下，就可以利用这些资源了。例如在MaterialApp中定义整个App的字体风格：

   ```dart
             theme: ThemeData( 
               // MaterialApp 的 Theme 属性，能够放下一个 ThemeData 对象
               fontFamily: "StarRail", // 定义 App 的字体
               iconTheme: const IconThemeData( // 定义 图标的颜色
                 color: Colors.indigo
               ),
               // ... other theme info
             ), 
   ```

### /lib 文件夹

lib文件夹下首先应该有一个main.dart，作为整个程序的切入点；

可以添加一个strings目录，里面放一些存储字符串信息的静态类，例如：

phase_i_app_strings.dart:

```dart
class AppStrings{
  static const titleMessage = "Flutter 太好丸辣！";
  static const bottonPressedMessage = "恭喜你按下了按钮！";

  static String indexPressedMessage(int index) => "**Widget ${index+1} Pressed!**";
}
```

在需要使用字符串的地方，通过`import 'package:flutter_app/strings/phase_i_app_strings.dart'`语句，便可以调用AppString中的静态方法。

在`/lib`文件夹下，我们可以根据我们所用的架构创建我们所需的文件。可以看到，本工程创建了 Phase I, Phase II, Phase III 三个文件夹。

Phase I 中只有两个文件：`my_app.dart` 和 `main_column.dart`。my_app.dart 中包含了一个 MyApp 类，作为整个程序的顶层组件。在 MyApp 类里，我们定义了一系列常见组件（详情请见文件）。一些组件和方法被单独拿出，放到 MyApp 类的下方，比如`class TextFade`，`const bottomNavBarItemList`，以**让 MyApp 的代码看起来不那么臃肿**。而 Scaffold 中显示的主界面更是**被提取到了另一个文件中**，也就是`main_column.dart`。要使用在`main_column.dart`中的内容，只需在`my_app.dart`的开头`import 'main_column.dart'`，（对比刚才的`import 'package:flutter_app/strings/phase_i_app_strings.dart'`），因为他们在同一个文件夹下。

Phase II 我们会学习不同界面的导航，对每一个界面创建单独的文件，然后添加到不同的目录中。

Phase III 我们会利用MVVM模型构建全新的工程文件组织结构。

## Phase I 完成

Phase I 的代码中提供了详细的注解，这也是为了能够提供相对平滑的学习曲线。请尝试完全理解它，这会让你对代码有一个比较深刻的印象，但是看不如自己写，所以大家尽可能动手尝试。如果时间充裕，可以利用所学知识编写一个单界面游戏。

至此我们已经完成了Phase I的学习内容。现在你已经学会了如何定义UI布局，利用Provider改变组件的状态，并明白了如何利用pubspec.yaml导入项目依赖和外部资源，还学会了连通不同文件下的代码。

下面，在Phase II和Phase III中，既然我们已经对Flutter的基本概念有了相当充足的理解，我们会加快速度！做好准备吧！
