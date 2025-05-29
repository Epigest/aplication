import 'package:epigest_project/ui/epi/epi_list_page.dart';
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Card.filled(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 6,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 25,
                      children: [
                        Row(
                          spacing: 15,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.construction),
                            Text(
                              'Epigest',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        _buildSegmentedButton(),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText:
                                _selectedLoginType == LoginType.funcionario
                                    ? 'CPF'
                                    : 'CNPJ',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(
                              _selectedLoginType == LoginType.funcionario
                                  ? Icons.badge_outlined
                                  : Icons.business_center_outlined,
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_outline),
                          ),
                          obscureText: true,
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.login),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EpiListPage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(150, 35),
                          ),
                          label: const Text('Entrar'),
                        ),
                      ],
                    ),
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
      segments: <ButtonSegment<LoginType>>[
        ButtonSegment<LoginType>(
          value: LoginType.funcionario,
          label: Text('Funcionário'),
          icon: Icon(Icons.person),
        ),
        ButtonSegment<LoginType>(
          value: LoginType.empresa,
          label: Text('Empresa'),
          icon: Icon(Icons.business),
        ),
      ],
      showSelectedIcon: false,
      selected: <LoginType>{_selectedLoginType},
      onSelectionChanged: (Set<LoginType> newSelection) {
        setState(() {
          _selectedLoginType = newSelection.first;
          _formKey.currentState?.reset();
        });
      },
    );
  }
}
