import 'package:flutter/material.dart';

enum LoginType { funcionario, empresa }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginType _selectedLoginType = LoginType.funcionario;
  final _formKey = GlobalKey<FormState>(); // Single form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450.0),
            child: Card.filled(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 25,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        spacing: 15,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Ícone de capacete de obra
                          const Icon(Icons.construction, size: 28.0),
                          const Text(
                            'Epigest',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      _buildSegmentedButton(),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: _selectedLoginType == LoginType.funcionario ? 'CPF' : 'CNPJ',
                          prefixIcon: Icon(_selectedLoginType == LoginType.funcionario ? Icons.badge_outlined : Icons.business_center_outlined),
                        ),
                        keyboardType: _selectedLoginType == LoginType.funcionario ? TextInputType.number : TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o ${_selectedLoginType == LoginType.funcionario ? 'CPF' : 'CNPJ'}';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a senha';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Logando como ${_selectedLoginType.name}...')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          textStyle: const TextStyle(fontSize: 16.0),
                        ),
                        child: const Text('Entrar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSegmentedButton() {
    return SegmentedButton<LoginType>(
      segments: const <ButtonSegment<LoginType>>[
        ButtonSegment<LoginType>(
            value: LoginType.funcionario,
            label: Text('Funcionário'),
            icon: Icon(Icons.person)),
        ButtonSegment<LoginType>(
            value: LoginType.empresa,
            label: Text('Empresa'),
            icon: Icon(Icons.business)),
      ],
      selected: <LoginType>{_selectedLoginType},
      onSelectionChanged: (Set<LoginType> newSelection) {
        setState(() {
          _selectedLoginType = newSelection.first;
          _formKey.currentState?.reset(); // Reset the single form
        });
      },
      style: SegmentedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
      ),
    );
  }
}
