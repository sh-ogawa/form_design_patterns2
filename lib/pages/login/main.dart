import 'package:flutter/material.dart';
import 'package:form_design_patterns2/main.dart';
import 'package:form_design_patterns2/utils/log/logger.dart';

import 'bloc.dart';

class LoginMainPage extends StatelessWidget {
  final bloc = Bloc();

  LoginMainPage({Key? key}) : super(key: key);

  // ユーザーIDの登録セクション
  Widget _buildUserIdSection() {
    return Semantics(
      label: 'input user id',
      child: Column(
        children: <Widget>[
          const Align(child: Text('ユーザーIDまたはメールアドレス'), alignment: Alignment.centerLeft,),
          StreamBuilder(
            stream: bloc.userId,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return TextField(
                enabled: true,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                maxLength: 20,
                onChanged: bloc.userIdChanged,
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }

  // ユーザーIDの登録セクション
  Widget _buildPasswordSection() {
    return Semantics(
      label: 'input password',
      child: Column(
        children: <Widget>[
          const Align(child: Text('パスワード'), alignment: Alignment.centerLeft,),
          StreamBuilder(
            stream: bloc.password,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return TextField(
                enabled: true,
                maxLines: 1,
                maxLength: 20,
                obscureText: true,
                onChanged: bloc.passwordChanged,
                textAlign: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return StreamBuilder<bool>(
      stream: bloc.submitCheck,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          func() async {
            var userId = await bloc.userId.first;
            var password = await bloc.password.first;
            showDialog(
              barrierColor: Colors.white,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  child: FractionallySizedBox(
                    widthFactor: 0.80,
                    heightFactor: 0.50,
                    child: Column(
                      children: <Widget>[
                        Text('ユーザーID： $userId'),
                        Text('パスワード： $password'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return ElevatedButton(
            onPressed: func,
            child: const Text('ログイン'),
          );
        }
        return const ElevatedButton(
          onPressed: null,
          child: Text('ログイン'),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    locator<Logger>().log('I0200001');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ログイン'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FractionallySizedBox(
          widthFactor: 0.60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(flex: 4,),
              _buildUserIdSection(),
              const Spacer(flex: 1,),
              _buildPasswordSection(),
              const Spacer(flex: 1,),
              _buildSubmitButton(),
              const Spacer(flex: 4,),
            ],
          ),
        ),
      ),
    );
  }
}
