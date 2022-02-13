import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_app/appliction/auth/auth/auth_bloc.dart';
import 'package:notes_app/appliction/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:notes_app/presentation/routes/router.gr.dart';

class SignInForm extends HookWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPasswordObscure = useState(true);
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureorSuccess.fold(
          () {},
          (either) => either.fold(
            (l) {
              // ignore: avoid_single_cascade_in_expression_statements
              Flushbar<dynamic>(
                title: '⚠',
                message: l.map(
                  serverError: (_) => 'Server Error!',
                  emailAlreadyInUse: (_) => 'Email already in use!',
                  invalidEmailPassword: (_) =>
                      'Invalid email and password combination',
                  cancelByUser: (_) => 'Cancelled!',
                ),
                duration: const Duration(seconds: 3),
              )..show(context);
            },
            (r) {
              AutoRouter.of(context).replace(const NotesOverviewPageRoute());
              BlocProvider.of<AuthBloc>(context).add(
                const AuthEvent.authCheckRequest(),
              );
            },
          ),
        );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            autovalidateMode: state.showErrorMessage,
            child: ListView(
              children: [
                const Text(
                  '📝',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 130),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                      .add(SignInFormEvent.emailChanged(value)),
                  validator: (value) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (l) => l.maybeMap(
                          invalidEmail: (value) => 'invalid email',
                          orElse: () => 'fsfsa',
                        ),
                        (r) => null,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        isPasswordObscure.value = !isPasswordObscure.value;
                      },
                      icon: Icon(
                        isPasswordObscure.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  autocorrect: false,
                  obscureText: isPasswordObscure.value,
                  onChanged: (value) => BlocProvider.of<SignInFormBloc>(context)
                      .add(SignInFormEvent.passwordChanged(value)),
                  validator: (value) =>
                      context.read<SignInFormBloc>().state.password.value.fold(
                            (l) => l.maybeMap(
                              invalidPassword: (value) => 'invalid password',
                              orElse: () => null,
                            ),
                            (r) => null,
                          ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          BlocProvider.of<SignInFormBloc>(context).add(
                            const SignInFormEvent.signInWithEmailandPassword(),
                          );
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          BlocProvider.of<SignInFormBloc>(context).add(
                            const SignInFormEvent
                                .registerWithEmailandPassword(),
                          );
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGoogle(),
                        );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: const Text(
                    'SIGN IN WITH GOOGLE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (state.isSubmitting) ...[
                  const SizedBox(height: 8),
                  const LinearProgressIndicator(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
