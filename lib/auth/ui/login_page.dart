import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';
import 'components/button.dart';

// Styles & Constantes réutilisables
class AuthStyles {
  // Palette
  static const Color primary = Color(0xFF015845);
  static const Color bg = Color(0xFFFFFFFF);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey400 = Color(0xFFBDBDBD);

  // Les spacings
  static const double spacing = 16;
  static const EdgeInsets pagePadding = EdgeInsets.fromLTRB(24, 60, 24, 0);

  // Les typos
  static const double fieldFontSize = 12;
  static const TextStyle title = TextStyle(fontWeight: FontWeight.w500);
  static const TextStyle subtitle =
      TextStyle(fontSize: 11, color: grey500, height: 1.4);

  static const TextStyle fieldText =
      TextStyle(fontSize: fieldFontSize, color: grey600, fontWeight: FontWeight.w400);

  static const TextStyle label =
      TextStyle(fontSize: fieldFontSize, color: grey600, fontWeight: FontWeight.w400);

  static const TextStyle linkMuted =
      TextStyle(fontSize: 12, color: grey500, fontWeight: FontWeight.w400);

  // Underlines
  static const UnderlineInputBorder enabledUnderline =
      UnderlineInputBorder(borderSide: BorderSide(color: grey400));
  static const UnderlineInputBorder focusedUnderline =
      UnderlineInputBorder(borderSide: BorderSide(color: grey600));
  static const EdgeInsets fieldPadding = EdgeInsets.symmetric(vertical: 6);
}

// TextField réutilisable
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: AuthStyles.fieldText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AuthStyles.label,
        enabledBorder: AuthStyles.enabledUnderline,
        focusedBorder: AuthStyles.focusedUnderline,
        contentPadding: AuthStyles.fieldPadding,
      ),
    );
  }
}

// Séparateur “Ou” 
class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(color: AuthStyles.grey500)),
        SizedBox(width: 8),
        Text('Ou', style: TextStyle(color: AuthStyles.grey500)),
        SizedBox(width: 8),
        Expanded(child: Divider(color: AuthStyles.grey500)),
      ],
    );
  }
}

// La page 
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AuthStyles.bg,
      body: SafeArea(
        child: Padding(
          padding: AuthStyles.pagePadding,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 28),
              Text('Connexion',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.merge(AuthStyles.title)),
              const SizedBox(height: 8),
              const Text(
                'Entrez votre email et votre mot de passe pour vous connecter.',
                style: AuthStyles.subtitle,
              ),
              const SizedBox(height: 32),

              // Email
              AuthTextField(
                label: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                onChanged: context.read<LoginCubit>().emailChanged,
              ),

              const SizedBox(height: AuthStyles.spacing),

              // Mot de passe
              AuthTextField(
                label: 'Mot de passe',
                obscureText: true,
                onChanged: context.read<LoginCubit>().passwordChanged,
              ),

              const SizedBox(height: 10),

              // Mot de passe oublié
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // TODO: Pour la page de réinitialisation du mot de passe
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Mot de passe oublié ?',
                      style: AuthStyles.linkMuted),
                ),
              ),

              const SizedBox(height: AuthStyles.spacing),

              // Boutton Se connecter
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (p, c) => p.status != c.status,
                builder: (context, state) {
                  return Button(
                    text: 'Se connecter',
                    loading: state.status == FormzSubmissionStatus.inProgress,
                    onPressed: () => context.read<LoginCubit>().submitted(),
                  );
                },
              ),

              const SizedBox(height: 12),

              // Séparateur Ou
              const OrSeparator(),

              const SizedBox(height: 12),

              // Boutons Google / Apple
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {/* TODO Connexion Google */},
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: AuthStyles.grey400,
                          width: 1.2,
                        ),
                      ),
                      child: Image.asset(
                        'assets/icons/icons8-logo-google-48.png',
                        height: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {/* TODO Connexion Apple */},
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: AuthStyles.grey400,
                          width: 1.2,
                        ),
                      ),
                      child: Image.asset(
                        'assets/icons/icons8-mac-os-48.png',
                        height: 24,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 80),

              // Message de l'état du retour de la requête Post de login
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state.status == FormzSubmissionStatus.failure &&
                      state.error != null) {
                    return Text(
                      state.error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                  if (state.status == FormzSubmissionStatus.success) {
                    return const Text(
                      'Connexion réussie',
                      textAlign: TextAlign.center,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),

      // Bas de page
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Je n'ai pas de compte ?",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 12, color: AuthStyles.grey600)),
            const SizedBox(width: 2),
            TextButton(
              onPressed: () {
                // TODO: Pour la page d'inscription
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                foregroundColor: AuthStyles.primary,
              ),
              child: const Text(
                "S'inscrire",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
