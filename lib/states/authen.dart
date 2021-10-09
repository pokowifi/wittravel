import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wittravel/utility/my_constant.dart';
import 'package:wittravel/widgets/show_image.dart';
import 'package:wittravel/widgets/show_text.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                buildimage(constraints),
                buildappname(),
                builduser(constraints),
                buildpassword(constraints),
                buildlogin(constraints),
                const Spacer(),
                buildcreateaccount(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Row buildcreateaccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const showText(title: 'None Account ?'),
        TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, MyConstant.routeCreateAccount),
            child: showText(
              title: 'Create Account',
              textStyle: MyConstant().h2style(),
            ))
      ],
    );
  }

  Container buildlogin(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: constraints.maxWidth * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: MyConstant.dart),
        onPressed: () {},
        child: const Text('Login'),
      ),
    );
  }

  Container builduser(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: constraints.maxWidth * 0.6,
      child: TextFormField(
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
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password :',
          prefixIcon: Icon(Icons.lock_outline),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  showText buildappname() {
    return showText(
      title: MyConstant.appname,
      textStyle: MyConstant().h1style(),
    );
  }

  Container buildimage(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.6,
      child: const ShowImage(),
    );
  }
}
