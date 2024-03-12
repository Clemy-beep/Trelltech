import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trelltech/components/custom_appbar.dart';
import 'package:trelltech/components/custom_bottom_navigation_bar.dart';

class Organization extends StatelessWidget {
  const Organization({super.key, required this.orgId});
  final String? orgId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Organization $orgId'),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}