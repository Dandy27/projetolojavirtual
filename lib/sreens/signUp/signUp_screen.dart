import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetolojavirtual/helpers/validators.dart';
import 'package:projetolojavirtual/models/user.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final User user = User();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true, // ocupar o menor espaço possivel
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  validator: (name){
                    if(name.isEmpty)
                      return 'Campo obrigatório';
                    else if(name.trim().split(' ').length <= 1)
                    return 'Preencha o Nome Completo';
                        return null;
                  },
                  onSaved: (name) => user.name = name,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                 validator: (email){
                    if(email.isEmpty)
                      return 'Campo obrigatório';
                    else if(!emailValid(email))
                      return 'E-mail inválido';
                    return null;
                 },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  validator: (pass){
                    if(pass.isEmpty)
                      return 'Campo obrigatório';
                    else if(pass.length < 6)
                      return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (pass) => user.password = pass,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a Senha'),
                  validator: (pass){
                    if(pass.isEmpty)
                      return 'Campo obrigatório';
                    else if(pass.length < 6)
                      return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (pass) => user.confirmPassword = pass,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(height: 44,child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                  onPressed: (){
                    if(formKey.currentState.validate()){
                      formKey.currentState.save();// o metodo save vai chamar o onSave de cada um dos forms

                      if(user.password != user.confirmPassword){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: const Text('Senhas não coincidem'),
                          backgroundColor: Colors.red,)
                        );
                        return;
                      }
                      // usermanager
                    }
                  },
                  child: Text('Criar Conta',style: TextStyle(
                    fontSize: 18
                  ),),
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
