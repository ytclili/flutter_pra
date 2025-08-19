import 'package:flutter/material.dart';
import 'customIcon.dart';
import 'tets.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello flutter"),),
        body: 
        ListView(
          children: [
            // MyApp(),
            // 使用新类实现
            MyGridViewApp(),
          ],
        ),
        )
      )
  );
}

// 新类实现，保持与原MyApp类相同的功能
class MyGridViewApp extends StatelessWidget {
  const MyGridViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // 添加此属性
      physics: NeverScrollableScrollPhysics(), // 禁止内部滚动
      padding: EdgeInsets.all(10), // 添加内边距
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行显示3个
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.2, // 设置宽高比为1:1
      ),
      itemCount: 10, // 共10个项目
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Center(
            child: Text("添加${index}", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        );
      },
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 定义变量循环十个container 
  List _getData(){
    List list = [];
    for(int i=0;i<10;i++){
      list.add( Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child:  Center(
            child: Text("添加${i}", style: TextStyle(color: Colors.white, fontSize: 16)),


          ),
        ));
    }
    return list;
  }



  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   shrinkWrap: true, // 添加此属性
    //   physics: NeverScrollableScrollPhysics(), // 禁止内部滚动
    //   crossAxisCount: 3,
    //   mainAxisSpacing: 10,
    //   crossAxisSpacing: 10,
    //   padding: EdgeInsets.all(10),
    //   childAspectRatio: 1.2, // 设置宽高比为1:1

    //   children: _getData().cast<Widget>(),
    // );


    return GridView.extent(
      shrinkWrap: true, // 添加此属性
      physics: NeverScrollableScrollPhysics(), // 禁止内部滚动
      // crossAxisCount: 3,
      maxCrossAxisExtent: 200,

      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      childAspectRatio: 1.2, // 设置宽高比为1:1

      children: _getData().cast<Widget>(),
    );
  }
}

