import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(text: '');
  bool _obsecureText = true;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)..addListener(() {
      setState(() {

      });
    })..addStatusListener((animationStatus) {

      if(animationStatus == AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();
      }


    });
    _animationController.forward();
    super.initState();
  }
  void _submitFormLogin(){
    final isValid = _loginFormKey.currentState!.validate();
    print (';Invalid isValid');
  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://wallpaperaccess.com/full/51370.jpg",
            placeholder: (context, url) => Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.fill,

            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            alignment: FractionalOffset(_animation.value,0),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Text('Forgot Password',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),
                SizedBox(height: 10),
                Text('Email Address',style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.white,fontSize: 20),),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                Form(
                  key: _loginFormKey,
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.blue.shade700,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Reset Password',style: TextStyle(color: Colors.white,

                              fontWeight: FontWeight.bold,fontSize: 20
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
