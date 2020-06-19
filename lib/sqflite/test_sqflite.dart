import 'package:flutter/material.dart';
import 'bookManager.dart';
import 'book.dart';
class SqfliteTest extends StatefulWidget {
  @override
  _SqfliteTestState createState() => _SqfliteTestState();
}

class _SqfliteTestState extends State<SqfliteTest> {
  BookSqlite bookSqlite = new BookSqlite();
  var bookName = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    insertData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('fold/expand'),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        RaisedButton(
        child: Text('增加'),
        onPressed: (){},
        textColor: Colors.blue,
//        color: Colors.blue[200],
         ),
            RaisedButton(
              child: Text('删除'),
              onPressed: (){},
              textColor: Colors.blue,
//              color: Colors.blue[200],
            ),
            RaisedButton(
              child: Text('查找'),
              onPressed: (){},
              textColor: Colors.blue,
//              color: Colors.blue[200],
            ),
            RaisedButton(
              child: Text('修改'),
              onPressed: (){},
              textColor: Colors.blue,
//              color: Colors.blue[200],
            ),

//            Text(
//              "点击右下角按钮就可以获得id为1的书的书名:",
//            ),
//            Text(
//              bookName,
//            )
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: getBookName,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )// Thi
    );
  }
  //启动先插入4条数据
  void insertData() async{
    await bookSqlite.openSqlite();
    await bookSqlite.insert(new Book(0,"flutter大全0","flutter",0.1,"中国出版"));
    await bookSqlite.insert(new Book(1,"flutter大全1","flutter",0.1,"中国出版"));
    await bookSqlite.insert(new Book(2,"flutter大全2","flutter",0.1,"中国出版"));
    await bookSqlite.insert(new Book(3,"flutter大全3","flutter",0.1,"中国出版"));
    //切记用完就close
    await bookSqlite.close();
  }

  //获取编号为1的书
  void getBookName() async{
    await bookSqlite.openSqlite();
    Book book = await bookSqlite.getBook(1);
    await bookSqlite.close();
    setState(() {
      bookName = book.name;
    });
  }
}
