import 'package:flutter/material.dart';
import 'package:flutter_app/strings/phase_i_app_strings.dart';

class MyApp extends StatelessWidget { // 定义一个无状态组件

  const MyApp({super.key}); // 构造器

  @override
  Widget build(BuildContext context) {
    // 每一个组件都有一个 build 方法，主要职责是:
    // 描述如何根据其他子级的 widget 来构建该 widget 的用户界面（UI）;
    // 每当框架需要重新绘制用户界面时，就会调用 build 方法

    return MaterialApp(
        // 定义了一个 Material 设计风格（即谷歌设计语言）的 App 界面
        // 与 Material 设计风格相反的是 Cupertino，对应 CupertinoApp()

        theme: ThemeData( // MaterialApp 的 Theme 属性，能够放下一个 ThemeData 对象，定义程序主题
          fontFamily: "StarRail", // 定义 App 的字体
          iconTheme: const IconThemeData( // 定义 图标的颜色
            color: Colors.indigo,
          ),
        ), 

        home: Scaffold(
          // Scaffold 是一个 UI 模板，可以帮你定义一系列组件，比如顶栏、底栏、悬浮按钮等

          appBar: AppBar( // 顶栏
            backgroundColor: Color.fromARGB(255, 213, 75, 16),
            title: const Text(AppStrings.titleMessage), // 文字组件
          ),

          drawer: const Drawer( // 侧栏
            child: Icon(Icons.air_outlined),
          ),

          bottomNavigationBar: BottomNavigationBar( // 底栏
            items: const [
              BottomNavigationBarItem(
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

          body: Column( // 主题部分，我们这里定义了一个
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Center(
                child: SizedBox(               
                  height: 60,
                  width: 150,
                  child: Text("Inside body container"),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.amber,
                      width: 123,
                      height: 123,
                    ),
                    const Center(
                      child: Icon(Icons.abc_outlined))
                  ],
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: Text("Data"),
                ),
              ),
              const Icon(Icons.access_alarm),
              const Expanded(
                flex: 4,
                child: Icon(Icons.kayaking)
              )
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () => {},
            child: Icon(Icons.add),
            focusColor: Colors.blueGrey,
          ),

        ),

    );
  }
}