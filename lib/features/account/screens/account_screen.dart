import 'package:flutter/material.dart';
import 'package:financeLine/constants/global_variables.dart';
import 'package:financeLine/features/account/widgets/below_appbar.dart';
import 'package:financeLine/features/account/widgets/orders.dart';
import 'package:financeLine/features/account/widgets/top_buttons.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
          SizedBox(
            height: 10,
          ),
          Orders()
        ],
      ),
    );
  }
}
