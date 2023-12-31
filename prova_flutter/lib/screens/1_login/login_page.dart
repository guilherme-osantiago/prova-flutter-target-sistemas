import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prova_flutter/pages/layout_page.dart';
import 'package:prova_flutter/screens/1_login/components/btn_entrar.dart';
import 'package:prova_flutter/screens/1_login/components/input_info.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController usuarioControl = TextEditingController();
    TextEditingController senhaControl = TextEditingController();

    // Utilize as linhas abaixo para acesso rápido
    // usuarioControl.text = "admin";
    // senhaControl.text = "admin";
    // Outras credenciais disponíveis no link do arquivo constants.dart

    return LayoutPage(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputInfo(
                titulo: "Usuário",
                controller: usuarioControl,
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha este campo';
                  } else if (value.length > 20) {
                    return 'Máximo 20 caracteres';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24),
              InputInfo(
                titulo: "Senha",
                controller: senhaControl,
                icon: Icons.lock,
                inputFormatters: <TextInputFormatter>[
                  // Apenas de '0'-'9' e 'a'-'Z'
                  FilteringTextInputFormatter.allow(RegExp(r'^[A-Za-z0-9]+')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha este campo';
                  } else if (value.length < 2) {
                    return 'Senha muito curta';
                  } else if (value.length > 20) {
                    return 'Máximo 20 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              BtnEntrar(
                usuarioControl: usuarioControl,
                senhaControl: senhaControl,
                formKey: formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
