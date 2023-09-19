import 'package:abd_garments/utilities/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool ChangeButton = false;

  final formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if(formKey.currentState!.validate()){
    setState(() {
     ChangeButton = true;
    });
     await Future.delayed(Duration(seconds: 2));
     await Navigator.pushNamed(context, MyRoutes.HomeRoute);  
     setState(() {
       ChangeButton = false;
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                        height: 70,
                        width: 70,
                        image: AssetImage('images/logo.png')),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          'Abdullah',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Garments',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 116, 91, 185)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Abdullah Garments' '\n $name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Username.";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {
                              
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          ),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Password.";
                            }
                            else if(value.length<6){
                              return "Atleast 6 character.";
                            }
                            return null;
                          }
                        ),
                      ],
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed:(){
                  //    Navigator.pushNamed(context, MyRoutes.HomeRoute);
                  //   },
                  //    child:Text('Log in'))
                ],
              ),
              Material(
                color: Color.fromARGB(255, 116, 91, 185),
                borderRadius: BorderRadius.circular(ChangeButton?20 : 8),
                child: InkWell (
                  onTap:  () =>moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40,
                    width: ChangeButton? 50: 150,
                    child: Center(
                      child: ChangeButton? Icon(Icons.check):
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
