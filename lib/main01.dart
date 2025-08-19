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
            // MyButton(),
            // MyImage(),
            // SizedBox(height: 20,),
            // ClipImage(),
            // SizedBox(height: 20,),
            // LocalImage(),
            // Icon(CustomIcon.gouwuche,size: 40,color: Colors.orange),
            // Icon(CustomIcon.weixin,size: 40,color: Colors.orange),
            MyList(),
            ListViewBuilderExample(),
            MapMethodExample(),


          ],
        ),
        )
      )
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.blue,
            width: 2
          ),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Colors.yellow,blurRadius: 10)
          ],
          gradient: LinearGradient(colors: [
            Colors.cyanAccent,Colors.pink
          ])

        ),
        child: const Center(child: Text("大家好，我叫涂睿睿",textDirection: TextDirection.ltr,style: TextStyle(color: Color.fromRGBO(255, 255,255 , 1),fontSize: 40),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,)),
      ),
    );
    // throw UnimplementedError();
  }
  
}


class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text("按钮",style: TextStyle(color: Colors.white),),
      
    );
  }
}


class MyImage extends StatelessWidget {
  const MyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(image: NetworkImage("https://p0.ssl.img.360kuai.com/dmfd/158_88_75/t11508c75c88f7b04509ee60efb.webp?size=474x264"),fit: BoxFit.cover)
      ),
      
      // child: Image.network("https://p0.ssl.img.360kuai.com/dmfd/158_88_75/t11508c75c88f7b04509ee60efb.webp?size=474x264",fit: BoxFit.cover,),
    );
  }
}



class ClipImage extends StatelessWidget {
  const ClipImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network("https://p0.ssl.img.360kuai.com/dmfd/158_88_75/t11508c75c88f7b04509ee60efb.webp?size=474x264",width: 150,height: 150,fit: BoxFit.cover,),
      
    );
  }
}

class LocalImage extends StatelessWidget {
  const LocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
      decoration: BoxDecoration(color: Colors.yellow),
      child:
      
      SingleChildScrollView(
        child: Column(
          children: [
          Image.asset("images/2.0x/a.jpg",fit: BoxFit.cover,),
          Icon(Icons.home,size: 40,color: Colors.red,),

        ],
      ),
      ) 
    );
  }
}


class MyList extends StatelessWidget {
  const MyList({super.key});

  

  List<Widget> _initListData(){
    List<Widget> list = [];
    for(var i = 0 ; i< A.length; i++ ) {
      list.add(ListTile(title: Text("${A[i]["text"]}"),subtitle: Text("${A[i]["subtitle"]}"),leading: Image.network("${A[i]["img"]}"),));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    print(A);
    return Column(
      // children: [
      //   ListTile(leading: Icon(Icons.attach_file), title: Text("我是列表"),),
      //   Divider(),
      //   ListTile(title: Text("我是列表2"),trailing: Icon(Icons.bedtime),subtitle: Text("我是副标题我是副标题我是副标题"),),
      //   Divider(),
        
      // ],
      children: _initListData(),
    );
  }
}

// 使用 ListView.builder 实现的列表
class ListViewBuilderExample extends StatelessWidget {
  const ListViewBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // 添加此属性
      physics: NeverScrollableScrollPhysics(), // 禁止内部滚动
      itemCount: A.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(A[index]["text"]),
          subtitle: Text(A[index]["subtitle"]),
          leading: Image.network(A[index]["img"]),
        );
      },
    );
  }
}

// 使用 map 方法实现的列表
class MapMethodExample extends StatelessWidget {
  const MapMethodExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // 添加此属性
      physics: NeverScrollableScrollPhysics(), // 禁止内部滚动
      children: A.map((item) {
        return ListTile(
          title: Text(item["text"]),
          subtitle: Text(item["subtitle"]),
          leading: Image.network(item["img"]),
        );
      }).toList(),
    );
  }
}