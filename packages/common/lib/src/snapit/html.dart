import 'package:flutter/material.dart';
import 'dart:ui' as ui; // 导入 dart:ui 库
import 'dart:html' as html; // 导入 dart:html 库

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Web HtmlElementView Example'),
        ),
        body: CustomHtmlElement(), // 嵌入自定义 HTML 元素
      ),
    );
  }
}

class CustomHtmlElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建一个自定义的 HTML 元素
    final divElement = html.DivElement()
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.backgroundColor = 'lightblue'
      ..style.display = 'flex'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..innerHtml = '''
        <h1 style="color: white;">Hello, Flutter Web!</h1>
        <button onclick="alert('Button Clicked!')">Click Me</button>
      ''';

    // 将自定义 HTML 元素注册为 Platform View
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'custom-html-element', // 视图的唯一标识符
      (int viewId) => divElement,
    );

    // 使用 HtmlElementView 嵌入自定义 HTML 元素
    return HtmlElementView(
      viewType: 'custom-html-element', // 必须与 registerViewFactory 中的标识符一致
    );
  }
}

class CustomHtmlElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建一个 iframe 元素来嵌入 YouTube 视频
    final iframeElement = html.IFrameElement()
      ..src = 'https://www.youtube.com/embed/dQw4w9WgXcQ' // YouTube 视频链接
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%';

    // 将 iframe 注册为 Platform View
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'custom-html-element',
      (int viewId) => iframeElement,
    );

    // 使用 HtmlElementView 嵌入 iframe
    return HtmlElementView(
      viewType: 'custom-html-element',
    );
  }
}