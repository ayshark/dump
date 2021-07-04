import 'package:flutter/material.dart';

class RequestLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Portal'),
      ),
      //Body containing the image, two texts and a button
      body: Stack(
        children: <Widget>[
          //The image
          Align(
            alignment: Alignment(0, -0.2),
            child: Image(
              image: AssetImage('assets/images/dustbin.png'),
              height: 150,
              width: 150,
            ),
          ),
          //Text line one
          Align(
            alignment: Alignment(0, -0.2),
            child: Text("Do you have a large amount of",
                style: TextStyle(color: Colors.grey)),
          ),
          //Text line two
          Align(
            alignment: Alignment(0, -.1),
            child: Text("waste waiting to be disposed?",
                style: TextStyle(color: Colors.grey)),
          ),
          //Button
          Align(
              alignment: Alignment(0, 0.4),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestForm()));
                },
                child: Text("Request a pickup"),
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

class RequestForm extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void validate() {
    if (formkey.currentState!.validate()) {
      //validation
      print("Ok");
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request A Pickup"),
        actions: <Widget>[
          IconButton(
            //Icon code
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              //do something
            },
          )
        ],
      ),
      body: Padding(
        //body which includes three TextFormField
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Date",
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
                        labelText: "Time",
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
                    maxLines: 10,
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
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0), //button code
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
