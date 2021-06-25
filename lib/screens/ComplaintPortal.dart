import 'package:flutter/material.dart';

class ComplaintLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Portal'),
      ),
      //Body containing the image, three texts and a button
      body: Stack(
        children: <Widget>[
          //The image
          Align(
            alignment: Alignment(0, -0.8),
            child: Image(
              image: AssetImage('assets/images/question_mark.png'),
              height: 150,
              width: 150,
            ),
          ),
          //Text line one
          Align(
            alignment: Alignment(0, -0.2),
            child: Text("You don't have any previous",
                style: TextStyle(color: Colors.grey)),
          ),
          //Text line two
          Align(
            alignment: Alignment(0, -0.1),
            child: Text("complaint registered",
                style: TextStyle(color: Colors.grey)),
          ),
          //Text line three
          Align(
            alignment: Alignment(0, 0),
            child: Text("Have an issue?", style: TextStyle(color: Colors.grey)),
          ),
          //Button
          Align(
              alignment: Alignment(0, 0.1),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ComplaintForm()));
                },
                child: Text("Raise a complaint"),
                color: Color.fromRGBO(242, 161, 84, 1),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0)),
              ))
        ],
      ),
    );
  }
}

class ComplaintForm extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      print("Ok");
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit A Complaint"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Subject",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0))),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        labelText: "Complaint",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0))),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                      onPressed: validate,
                      child: Text("SUBMIT"),
                      color: Color.fromRGBO(242, 161, 84, 1),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
