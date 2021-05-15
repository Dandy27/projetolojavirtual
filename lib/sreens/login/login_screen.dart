import 'package:flutter/material.dart';
import 'package:projetolojavirtual/helpers/validators.dart';
import 'package:projetolojavirtual/models/user.dart';
import 'package:projetolojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email) {
                    if (!emailValid(email)) return 'E-mail inválido';
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty || pass.length < 6)
                      return 'Senha inválida';
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: ESQUECI MINHA SENHA
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          context.read<UserManager>().signIn(
                              user: User(
                                  email: emailController.text,
                                  password: passController.text),
                              onFail: (e) {
                                // ignore: deprecated_member_use
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Falha ao entrar: $e'),
                                    backgroundColor: Colors.red,));
                              },
                              onSuccess: () {
                                // TODO: FECHAR TELA DE LOGIN
                              });
                        }
                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
