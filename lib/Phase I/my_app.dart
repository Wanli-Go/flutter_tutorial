import 'package:flutter/material.dart';
import 'package:flutter_app/strings/phase_i_app_strings.dart';
import 'package:provider/provider.dart';
import 'main_column.dart';

class MyApp extends StatelessWidget { // 定义一个无状态组件 MyApp

  const MyApp({super.key}); // 构造器

  @override
  Widget build(BuildContext context) {
    // 每一个组件都有一个 build 方法，主要职责是:
    // 描述如何根据其他子级的 widget 来构建该 widget 的用户界面（UI）;
    // 每当框架需要重新绘制用户界面时，就会调用 build 方法

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageNotifier())
        // 在整个 App 上包装多个 ChangeNotifierProvider。
        // create方法可以把PageNotifier（PageNotifier定义详见下方代码）
        // 保存在context里，方便处理其Consumer（根据Notifier改变的信息重构的组件）。
      ],

      child: MaterialApp(
          // 定义了一个 Material 设计风格 （即谷歌设计语言）的 App 界面
          // 与 Material 设计风格相反的是 Cupertino，对应 CupertinoApp()
    
          theme: ThemeData( 
            // MaterialApp 的 Theme 属性，能够放下一个 ThemeData 对象
            // 定义程序的主题信息。
            // 这里只举了字体和图表
            fontFamily: "StarRail", // 定义 App 的字体
            iconTheme: const IconThemeData( // 定义 图标的颜色
              color: Colors.indigo
            ),
          ), 
    
          home: Consumer<PageNotifier>(
            // MaterialApp 的 Theme 属性，可以放置一个Widget。
            // 这里我们放置一个包装了 Consumer<PageNotifier> 的 Scaffold，
            // Consumer<PageNotifier> 代表这将会是一个聆听 PageNotifier 而重新构建的 Widget。
            
            builder: (context, pageNotifier, child) {
            // Consumer<PageNotifier> 的builder属性
            // 要求一个能够返回一个 Widget 的方法作为重构对象

            return Scaffold(
    
              body: IndexedStack( 
                // body属性： 顶栏和底栏中间的主体部分，
                // 这里我们定义一个 IndexedStack。IndexedStack可以
                // 纳入多个 Widget 作为Children，但是只显示index指向的那一个。

                index: pageNotifier.currentIndex,

                children: const <Widget>[
                  BodyColumnWidget(), // 参考 main_column.dart
                  AlternateColumn(),
                  AlternateColumn2()
                  // Add more screens as children
                ],

              ),
              // Scaffold 是一个 UI 模板，可以帮你定义一系列组件，比如顶栏、底栏、悬浮按钮等
          
              appBar: AppBar( 
              // MaterialApp 的 appBar属性（顶栏）
                backgroundColor: const Color.fromARGB(255, 4, 7, 188).withOpacity(0.6), // 背景颜色
                title: const Text(AppStrings.titleMessage), // 文字组件
              ),
          
              drawer: Drawer( 
              // MaterialApp 的 drawer属性（侧栏）
              // 会自动定义界面左上方的一个侧栏图标，和按下后会显示的一个侧栏
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.air_outlined),
                    TextFade() // 自定义了一个组件，请见代码下方。
                  ]),
              ),
          
              bottomNavigationBar: BottomNavigationBar( // bottomNaviagationBar属性：底栏
                currentIndex: pageNotifier.currentIndex, // 当前在哪个界面下
                onTap:(value) => _handleNavBarIndex(pageNotifier, value),
                items: bottomNavBarItemList, // 自定义了一个列表来存储 bottomNavBarItems，见代码下方
              ),
          
              floatingActionButton: FloatingActionButton( // floatingActionButton属性： 右下角浮动的按钮
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                onPressed: () => print(AppStrings.bottonPressedMessage),
                backgroundColor: Colors.amber.shade300,
                child: const Icon(Icons.add),            
              ),
            );
            } // Consumer builder method
          ),
      ),
    );
  }
}

class TextFade extends StatelessWidget {
  const TextFade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      // 这是用 ChatGPT 生成的一个文本组件，实现了当文本过长时自动淡出的效果。
      // 多多利用 ChatGPT 达到类似的效果、提高开发效率。
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for the container
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Colors.black, Colors.transparent],
            stops: [0.9, 1.0], // 90% of the text will be fully visible, the last 10% will fade out
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn, // This blend mode will apply the gradient as a mask
        child: const Text(
          'Your very long text that should fade out when exceeding the length of the container goes here',
          softWrap: false,
          overflow: TextOverflow.clip, // Clip the overflow to ensure the fade effect
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class PageNotifier extends ChangeNotifier { // Provider 中的 Notifier（发布者）
  int _currentIndex = 0;

  int get currentIndex => _currentIndex; // Getter 方法

  set currentIndex(int index) { // Setter 方法
    _currentIndex = index;
    notifyListeners(); // Notifies all the listeners of this notifier.
  }
}

const bottomNavBarItemList = [ // 为了让代码整洁一点
  BottomNavigationBarItem( // 底栏 Item, 包含一个文字和一个图标
    label: "Home",
    icon: Icon(Icons.home_filled)
  ),
  BottomNavigationBarItem(
    label: "Resources",
    icon: Icon(Icons.deblur)
  ),
  BottomNavigationBarItem(
    label: "My",
    icon: Icon(Icons.radar_rounded)
  )
];

_handleNavBarIndex(PageNotifier notifier, int index) {
  print(AppStrings.indexPressedMessage(index));
  notifier.currentIndex = index;
}


