import 'package:flutter/material.dart';

class EditorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
//  /// Allows to control the editor and the document.
//  ZefyrController _controller;
//
//  /// Zefyr editor like any other input field requires a focus node.
//  FocusNode _focusNode;
//
//  @override
//  void initState() {
//    super.initState();
//    // Here we must load the document and pass it to Zefyr controller.
//    final document = _loadDocument();
//    _focusNode = FocusNode();
//    _loadDocument().then((document) {
//      setState(() {
//        _controller = ZefyrController(document);
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // If _controller is null we show Material Design loader, otherwise
//    // display Zefyr editor.
//    final Widget body = (_controller == null)
//        ? Center(child: CircularProgressIndicator())
//        : ZefyrScaffold(
//            child: ZefyrEditor(
//              padding: EdgeInsets.all(16),
//              controller: _controller,
//              focusNode: _focusNode,
//            ),
//          );
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Editor page"),
//        leading: Builder(
//          builder: (BuildContext context) {
//            return IconButton(
//              icon: const Icon(Icons.arrow_back),
//              onPressed: () =>
//                  BlocProvider.of<RouteBloc>(context).add(NavigatePop()),
//            );
//          },
//        ),
//        actions: <Widget>[
//          Builder(
//            builder: (context) => IconButton(
//              icon: Icon(Icons.save),
//              onPressed: () => _saveDocument(context),
//            ),
//          )
//        ],
//      ),
//      body: body,
//    );
//  }
//
//  /// Loads the document asynchronously from a file if it exists, otherwise
//  /// returns default document.
//  Future<NotusDocument> _loadDocument() async {
//    final file = File(Directory.systemTemp.path + "/quick_start.json");
//    if (await file.exists()) {
//      final contents = await file.readAsString();
//      return NotusDocument.fromJson(jsonDecode(contents));
//    }
//    final Delta delta = Delta()..insert("Zefyr Quick Start\n");
//    return NotusDocument.fromDelta(delta);
//  }
//
//  void _saveDocument(BuildContext context) {
//    // Notus documents can be easily serialized to JSON by passing to
//    // `jsonEncode` directly
//    final contents = jsonEncode(_controller.document);
//
//    var now = new DateTime.now();
//    Firestore.instance
//        .collection("notice")
//        .document("$now")
//        .setData({"contents": contents});
//
//    // For this example we save our document to a temporary file.
//    final file = File(Directory.systemTemp.path + "/quick_start.json");
//    // And show a snack bar on success.
//    file.writeAsString(contents).then((_) {
//      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved.")));
//    });
//  }
}
