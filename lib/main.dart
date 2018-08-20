import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

/**
 * 1. TapboxA  [管理自身状态.]
 * 2. gradient_V [线性渐变(垂直渐变色)]
 * 3. gradient_H [线性渐变(水平渐变色)]
 * 4. ParentWidget [TapboxB:Parent管理状态State, TapboxC:混合管理状态State] 
 * 5. rect_radius [圆角]
 * 6. shadow  [阴影]
 * 7. circle_shap [圆和椭圆]
 * 8. textDeal  [调整文本间距, 转换文本大小写:toLowerCase]
 * 9. richText  [内联样式(即:富文本)]
 * 19.  overflow_text [创建文本摘要(文本溢出处理)]
 */

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Home page~',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Home page~'),
          ),
          body: new Center(
            child: TapboxA(),
          ),
        ));
  }
}

/**
 * TapboxA 管理自身状态.
 */
class TapboxA extends StatefulWidget {
  TapboxA({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        // child: new Center(
        //   child: new Text(
        //     _active ? 'Active' : 'Inactive',
        //     style: new TextStyle(fontSize: 32.0, color: Colors.white)
        //   )
        // ),
        child: new Center(child: overflow_text),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  /**
   * 线性渐变(垂直渐变色)
   */
  var gradient_V = new Container(
    // grey box
    child: new Center(
      child: new Container(
        // red box
        child: new Text(
          "Lorem ipsum",
          style: new TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: const Alignment(0.0, -1.0),
            end: const Alignment(0.0, 0.6),
            colors: <Color>[const Color(0xffef5350), const Color(0x00ef5350)],
          ),
        ),
        padding: new EdgeInsets.all(16.0),
      ),
    ),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[300],
  );

  /**
   * 线性渐变(水平渐变)
   */
  var gradient_H = new Container(
    // grey box
    child: new Center(
      child: new Container(
        // red box
        child: new Text(
          "Lorem ipsum",
          style: new TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: const Alignment(-1.0, 0.0),
            end: const Alignment(0.6, 0.0),
            colors: <Color>[const Color(0xffef5350), const Color(0x00ef5350)],
          ),
        ),
        padding: new EdgeInsets.all(16.0),
      ),
    ),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[300],
  );

  /**
   * 圆角
   */
  var rect_radius = new Container(
    child: new Center(
        child: new Container(
      child: new Text('设置圆角',
          style: new TextStyle(
              color: Colors.blue[500],
              fontWeight: FontWeight.bold,
              fontSize: 24.0)),
      decoration: BoxDecoration(
          color: Colors.red[400],
          borderRadius: new BorderRadius.all(const Radius.circular(8.0))),
      padding: new EdgeInsets.all(16.0),
    )),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[300],
  );

  /**
   * 阴影 shadow
   */
  var shadow = new Container(
    child: new Center(
        child: Container(
      child: new Text('添加阴影',
          style: new TextStyle(
              color: Colors.blue[500],
              fontWeight: FontWeight.bold,
              fontSize: 24.0)),
      decoration: BoxDecoration(color: Colors.red[400], boxShadow: <BoxShadow>[
        new BoxShadow(
            color: const Color(0xcc000000),
            offset: new Offset(0.0, 2.0),
            blurRadius: 4.0),
        new BoxShadow(
            color: const Color(0x80000000),
            offset: new Offset(0.0, 6.0),
            blurRadius: 20.0)
      ]),
      padding: new EdgeInsets.all(16.0),
    )),
    width: 320.0,
    height: 240.0,
    decoration: BoxDecoration(color: Colors.grey[300]),
    margin: new EdgeInsets.only(bottom: 16.0),
  );

  /**
   * 圆和椭圆
   */
  var circle_shap = new Container(
    child: new Center(
        child: new Container(
      child: new Text('圆和椭圆',
          style: new TextStyle(
              color: Colors.blue[500],
              fontWeight: FontWeight.bold,
              fontSize: 24.0)),
      decoration: BoxDecoration(color: Colors.red[400], shape: BoxShape.circle),
      padding: new EdgeInsets.all(16.0),
      width: 160.0,
      height: 160.0,
    )),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[300],
  );

  /**
   * 文本操作
   */
  var textDeal = new Container(
    // grey box
    child: new Center(
      child: new Container(
        // red box
        child: new Text(
          "大小写转换:\nHave A Good Dream!".toLowerCase(),
          style: new TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            letterSpacing: 4.0,
          ),
        ),
        decoration: new BoxDecoration(
          color: Colors.red[400],
        ),
        padding: new EdgeInsets.all(16.0),
      ),
    ),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[300],
  );

  /**
   * 内联样式
   */
  var richText = new Container(
    // grey box
    child: new Center(
      child: new Container(
        // red box
        child: new RichText(
          text: new TextSpan(
            style: new TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.0),
            children: <TextSpan>[
              new TextSpan(text: "Lorem "),
              new TextSpan(
                text: "ipsum",
                style: new TextStyle(
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontSize: 48.0,
                ),
              ),
            ],
          ),
        ),
        decoration: new BoxDecoration(
          color: Colors.red[400],
        ),
        padding: new EdgeInsets.all(16.0),
      ),
    ),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[300],
  );

  /**
   * 创建文本摘要(文本溢出处理)
   */
  var overflow_text = new Container(
    child: new Center(
      child: new Container(
        child: new Text(
          '这是文本溢出处理内容,多余的内容怎么去处理呢?嘎嘎嘎嘎嘎.',
          style: new TextStyle(
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            fontSize: 20.0,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        decoration: BoxDecoration(
          color: Colors.red[400]
        ),
        padding: EdgeInsets.all(16.0),
      )
    ),
    width: 320.0,
    height: 240.0,
    color: Colors.grey[300]
  );
}

/**
 * ParentWidget 为 TapboxB 管理状态.
 */
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      //@TapboxB: ParentWidget为TapboxB 管理状态
      //@TapboxC: 混合管理状态
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: active ? Colors.blue[700] : Colors.blue[100]),
      ),
    );
  }

  void _handleTap() {
    onChanged(!active);
  }
}

/**
 * 混合管理
 */
class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
            child: new Text(widget.active ? 'Active' : 'Inactive',
                style: new TextStyle(fontSize: 32.0, color: Colors.white))),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.yellow[700] : Colors.grey[500],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 5.0,
                )
              : null,
        ),
      ),
    );
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }
}
