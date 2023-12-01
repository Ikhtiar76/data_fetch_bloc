import 'package:data_fetch_bloc/presentation/home.dart';
import 'package:data_fetch_bloc/presentation/widgets/auth_button.dart';
import 'package:data_fetch_bloc/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/reg_bloc/registration_bloc.dart';
import '../../model/registration model/reg_model.dart';

class RegistrationForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Registration Successful'),
            backgroundColor: Colors.red,
          ));
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } else if (state is RegistrationErrorState) {
          // Show an error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registration',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            const SizedBox(height: 36.0),
            AuthTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'example@gmail.com',
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.black,
                )),
            const SizedBox(height: 16.0),
            AuthTextField(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.black,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 36.0),
            BlocBuilder<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                if (state is RegistrationLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
                return AuthButton(
                  text: 'Register',
                  onPressed: () {
                    // Dispatch the registration event when the button is pressed
                    BlocProvider.of<RegistrationBloc>(context).add(
                      RegisterUserEvent(
                        Registration(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'If you already have an account,',
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Login here...',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue[900],
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
