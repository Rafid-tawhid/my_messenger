import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  var _isLogin=true;
  var _email='';
  var _pass='';
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                width: 200,
                child: Image.asset('images/bear.png'),
              ),
              Card(
                margin: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (val){
                              if(val==null||val.trim().isEmpty||!val.contains('@')){
                                return 'Please enter a valid email address.';
                              }
                              else return null;
                            },
                            onSaved: (value){
                              _email=value!;
                            },
                          ),
                          SizedBox(height: 6,),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (val){
                              if(val==null||val.trim().length<6){
                                return 'Password must be atleast 6 charecter long.';
                              }
                              else return null;
                            },
                            onSaved: (value){
                              _pass=value!;
                            },
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary
                              ),
                              child: Text(_isLogin?'Login':'Signup')),
                          TextButton(onPressed: (){
                            setState(() {
                              _isLogin=!_isLogin;
                            });
                          }, child: Text(_isLogin?'Create an account':'Already have an account.'))
                        ],
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

  void _submit() {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print(_email);
      print(_pass);
    }
  }
}
