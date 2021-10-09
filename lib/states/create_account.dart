import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wittravel/utility/my_constant.dart';
import 'package:wittravel/utility/my_dialog.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Container buildname(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 48),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        controller: namecontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Name in Blank';
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: 'Name :',
          prefixIcon: Icon(Icons.fingerprint),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container builduser(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        controller: usercontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill User in Blank';
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: 'User :',
          prefixIcon: Icon(Icons.perm_identity),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildpassword(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
        controller: passwordcontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Password in Blank';
          } else {
            return null;
          }
        },
        decoration: const InputDecoration(
          hintText: 'Password :',
          prefixIcon: Icon(Icons.lock_outline),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildcreateaccount(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: constraints.maxWidth * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyConstant.dart),
        onPressed: () {
          if (formkey.currentState!.validate()) {
            processcreateaccount();
          }
        },
        child: const Text('Create Account'),
      ),
    );
  }

  Future<void> processcreateaccount() async {
    String name = namecontroller.text;
    String user = usercontroller.text;
    String password = passwordcontroller.text;
    print('# name=$name,user = $user,password = $password');

    String apicheckuser =
        '${MyConstant.domain}/wittravel/getuserwhereuser.php?isAdd=true&user=$user';
    await Dio().get(apicheckuser).then(
      (value) {
        print('# value = $value');

        if (value.toString() != 'null') {
          MyDialog().normalDialog(
              context, 'User Fail', 'Please Chang User ? User Dulucape');
        } else {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Account'),
        backgroundColor: MyConstant.dart,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildname(constraints),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    builduser(constraints),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildpassword(constraints),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildcreateaccount(constraints),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
