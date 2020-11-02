import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:get/get.dart';
import 'package:template/modules/login/controllers/login.controllers.dart';
import 'package:template/modules/login/models/login.models.dart';
import 'package:template/modules/login/views/toplogin.views.dart';
import 'package:template/modules/verifikasibongkar/views/listpengajuan.verifikasi.views.dart';


class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller;

  @override
  void initState() {
    controller = new LoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: LoginModel.form,
        child: FooterView(
            children: <Widget>[
              GetBuilder<LoginController>(
                init: controller,
                builder: (params){
                  if(!params.reload){
                    return Container(
                        child: Column(
                          children: <Widget>[
                            TopLoginView(),
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 32, right: 32, top: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email),
                                      hintText: "Username",
                                      labelText: "Username"
                                  ),
                                  keyboardType: TextInputType.text,
                                  validator: (text){
                                    if(text.isEmpty){
                                      return "Username Wajib Diisi";
                                    }

                                    return null;
                                  },
                                  onChanged: (val){
                                    LoginModel.username_input = val;
                                  },
                                )
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 32, right: 32, top: 16),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "Password",
                                    labelText: "Password",
                                  ),
                                  validator: (text){
                                    if(text.isEmpty){
                                      return "Password Wajib Diisi";
                                    }

                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  onFieldSubmitted: (val){

                                  },
                                  obscureText: true,
                                  onChanged: (val){
                                    LoginModel.password_input = val;
                                  },
                                )
                            ),
                            Container(
                                width: double.infinity,
                                height: 60,
                                padding: EdgeInsets.only(left: 32, right: 32, top: 16),
                                child: RaisedButton(
                                  color: Colors.blue,
                                  child: Text("Masuk", style: TextStyle(color: Colors.white),),
                                  onPressed: (){
                                    if(LoginModel.form.currentState.validate()){
                                      controller.login();
//                                        controller.verifikasiFinger();
//                                          controller.authentificationFinger();
                                    }
                                  },
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3.0),
                                  ),
                                )
                            ),
                          ],
                        )
                    );
                  }

                  return CircularProgressIndicator();
                },
              )
            ],
            footer: Footer(
              backgroundColor: Colors.white,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:<Widget>[
                    Text('Copyright ©2020, All Rights Reserved.',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0, color: Color(0xFF162A49)),),
                    Text('Wonokoyo',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0,color: Color(0xFF162A49)),),
                  ]
              ),
            )
        ),
      ),

    );
  }
}
