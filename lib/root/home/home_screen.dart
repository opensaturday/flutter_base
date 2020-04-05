import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/root/auth/bloc/authentication_bloc.dart';
import 'package:flutter_base/root/auth/bloc/authentication_event.dart';
import 'package:flutter_base/route/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () =>
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.textsms),
              onPressed: () => BlocProvider.of<RouteBloc>(context)
                  .add(NavigatePush("/editor")),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("notice").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return ListView(
              padding: const EdgeInsets.only(top: 20.0),
              children: snapshot.data.documents
                  .map((data) => Text("${data.documentID}"))
                  .toList());
        },
      ),
    );
//        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            FlatButton(
//              color: Colors.blue,
//              child: Text(
//                "create button",
//                style: TextStyle(color: Colors.white),
//              ),
//              onPressed: () {
//                String book = "천년의_질문";
//                _firestore.collection("books").document(book).setData(
//                    {'page': 433, 'purchage?': false, 'title': '천년의 질문'});
//              },
//            ),
//            FlatButton(
//              color: Colors.blue,
//              child: Text(
//                "read button",
//                style: TextStyle(color: Colors.white),
//              ),
//              onPressed: () {
//                String title = "";
//                _firestore
//                    .collection("books")
//                    .document("on_intelligence")
//                    .get()
//                    .then((DocumentSnapshot documentSnapshot) {
//                  title = documentSnapshot.data["title"];
//                  print(title);
//                });
//              },
//            ),
//            FlatButton(
//              color: Colors.blue,
//              child: Text(
//                "update button",
//                style: TextStyle(color: Colors.white),
//              ),
//              onPressed: () {
//                _firestore
//                    .collection("books")
//                    .document("chemistry_between_us")
//                    .updateData({"page": 543});
//              },
//            ),
//            FlatButton(
//              color: Colors.blue,
//              child: Text(
//                "delete button",
//                style: TextStyle(color: Colors.white),
//              ),
//              onPressed: () {
//                //특정 document 삭제
//                _firestore.collection("books").document("천년의_질문").delete();
//                //특정 document 의 field 하나를 삭제
//                _firestore
//                    .collection('books')
//                    .document('chemistry_between_us')
//                    .updateData({'page': FieldValue.delete()});
//              },
//            ),
//          ],
//    ));
  }
}
