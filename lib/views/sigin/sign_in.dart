import 'package:blc_validation/views/sigin/sigin_blc.dart';
import 'package:blc_validation/views/sigin/sigin_event.dart';
import 'package:blc_validation/views/sigin/sigin_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text("SignIn"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          BlocBuilder<SignInBloc, SigInState>(builder: (context, state) {
            if (state is SignInErrorState) {
              return Text(
                state.errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              );
            } else {
              return Container();
            }
          }),
          TextFormField(
            onTap: () {
              BlocProvider.of<SignInBloc>(context).add(
                SignInTextChangedEvent(_email.text, _password.text),
              );
            },
            controller: _email,
            decoration: const InputDecoration(
              hintText: "Enter your email address",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            onTap: () {
              BlocProvider.of<SignInBloc>(context).add(
                SignInTextChangedEvent(_email.text, _password.text),
              );
            },
            controller: _password,
            decoration: const InputDecoration(
              hintText: "enter your password",
            ),
          ),
          const SizedBox(height: 50),
          BlocBuilder<SignInBloc, SigInState>(
            builder: (context, state) {
              return CupertinoButton(
                color: (state is SignInValidState)
                    ? Colors.deepPurpleAccent
                    : Colors.grey,
                onPressed: () {
                  if (state is SignInValidState) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SigInSubmittedEvent(
                        _email.text,
                        _password.text,
                      ),
                    );
                  }
                },
                child: const Text("Sign In"),
              );
            },
          ),
        ],
      ),
    );
  }
}
