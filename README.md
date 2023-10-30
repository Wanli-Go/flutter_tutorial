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
- 找到类似于Command-line tools的东西，然后下载它。
- **重要**：此时需要配置一些环境变量。具体的做法如下：
  - 添加一个环境变量，名为“ANDROID_HOME”，值为刚才拷贝的SDK路径。
  - 在PATH中添加一个文件夹，即"{刚才拷贝的SDK路径}/cmdline-tools/latest/bin"
- Android Studio还可以管理虚拟设备。下载一个虚拟设备，并把他运行起来。

此时，再在你的flutter项目里重新运行`flutter doctor`。应该可以看到`[√] Android toolchain - ...`。如果没有，说明这个教程还缺环，请你反馈给作者。

### 运行Flutter程序：

现在，你可以把这个代码库克隆到你自己的电脑上尝试了。

在VSCode里打开这个flutter项目，输入```Ctrl + ` ```打开命令行输入`flutter run`。在安卓虚拟设备运行的情况下，应该可以看到程序的build、运行的过程。

## Learn Flutter

在学习Flutter之前，请你先过一遍Dart，因为Dart是我们Flutter使用的编程语言，而Flutter之所以如此强大有很大一部分原因就是Dart。详情请见目录下的“**dart_中文教程.md**”。
