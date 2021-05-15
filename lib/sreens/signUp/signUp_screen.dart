import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
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
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true, // ocupar o menor espaço possivel
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome Completo'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Repita a Senha'),
                obscureText: true,
              ),
              SizedBox(height: 44,child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                onPressed: (){},
                child: Text('Criar Conta',style: TextStyle(
                  fontSize: 18
                ),),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
