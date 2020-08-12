import 'package:flutter/material.dart';
import 'package:mockup/size_config.dart';

import 'components/body.dart';

class Verify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Body(),
    );
  }
}
