import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin bengkel 88"),elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.green,
      ),
      body: Tawk(
    directChatLink: 'https://tawk.to/chat/644d164f31ebfa0fe7fb157b/1gv6hua1t',
    visitor: TawkVisitor(
        name: '${FirebaseAuth.instance.currentUser!.email}',
        email: '${FirebaseAuth.instance.currentUser!.email}',
    ),
),
    );
  }
}