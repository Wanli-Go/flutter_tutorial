import 'package:flutter/material.dart';
import 'package:flutter_app/strings/phase_i_app_strings.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget { // 定义一个无状态组件

  const MyApp({super.key}); // 构造器

  @override
  Widget build(BuildContext context) {
    // 每一个组件都有一个 build 方法，主要职责是:
    // 描述如何根据其他子级的 widget 来构建该 widget 的用户界面（UI）;
    // 每当框架需要重新绘制用户界面时，就会调用 build 方法

    return MaterialApp(
        // 定义了一个 Material 设计风格 （即谷歌设计语言）的 App 界面
        // 与 Material 设计风格相反的是 Cupertino，对应 CupertinoApp()

        theme: ThemeData( // MaterialApp 的 Theme 属性，能够放下一个 ThemeData 对象，定义程序主题
          fontFamily: "StarRail", // 定义 App 的字体
          iconTheme: const IconThemeData( // 定义 图标的颜色
            color: Colors.indigo,
          ),
        ), 

        home: Consumer<PageNotifier>(
          builder: (context, pageNotifier, child) {
          return Scaffold(

            body: IndexedStack( // body属性： 顶栏和底栏中间的主体部分
              index: pageNotifier.currentIndex,
              children: const <Widget>[
                _BodyColumnWidget(),
                Expanded(child: Text("123")),
                Expanded(child: Text("234"))
                // Add more screens as children
              ],
            ),
            // Scaffold 是一个 UI 模板，可以帮你定义一系列组件，比如顶栏、底栏、悬浮按钮等
        
            appBar: AppBar( // appBar属性：顶栏
              backgroundColor: const Color.fromARGB(255, 4, 7, 188).withOpacity(0.6), // 背景颜色
              title: const Text(AppStrings.titleMessage), // 文字组件
            ),
        
            drawer: const Drawer( // drawer属性：侧栏
              child: Icon(Icons.air_outlined),
            ),
        
            bottomNavigationBar: BottomNavigationBar( // bottomNaviagationBar属性：底栏
              onTap:(value) => _handleNavBarIndex(pageNotifier, value),
              items: const [
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
              ],
            ),
        
            floatingActionButton: FloatingActionButton( // floatingActionButton属性： 一个
              onPressed: () => {
                print("Floating Button Pressed!")
              },
              backgroundColor: Colors.amber.shade300,
              child: const Icon(Icons.add),            
            ),
          );
          }
        ),

    );
  }
  
  _handleNavBarIndex(PageNotifier notifier, int index) {
    print(AppStrings.indexPressedMessage(index));
    notifier.currentIndex = index;
  }
}

class _BodyColumnWidget extends StatelessWidget {
  const _BodyColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column( // 主题部分，我们这里定义了一个
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            color: Colors.tealAccent.withOpacity(0.7)
          ),
          width: 200,
          height: 120,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(50),
          child: const Center(child: Text("Inside the Container!")),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                color: Colors.purple.withOpacity(0.6),
                width: 123,
                height: 123,
              ),
              const Center(
                child: Icon(
                  Icons.abc_outlined,
                  size: 100,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: ElevatedButton(
            onPressed: (){
              print("Middle Button Pressed!");
            },
            child: const Text("Middle Button")
            ),
        ),
        Expanded(
          flex: 5,
          child: Image.asset(
            "assets/NEU.icon.jpeg",
            width: MediaQuery.of(context).size.width * 0.4)
        )
      ],
    );
  }
}

class PageNotifier extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Notifies all the listeners of this notifier.
  }
}
