import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BlueBox(),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: const Icon(Icons.person_pin,
            color: Color.fromARGB(255, 255, 255, 255), size: 100),
        //height: 200,
        //color: Colors.red,
      ),
    );
  }
}

class _BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _blueBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 90),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -10, right: 50),
          Positioned(child: _Bubble(), bottom: -10, left: 10),
          Positioned(child: _Bubble(), bottom: 50, right: 20),
        ],
      ),
    );
  }

  BoxDecoration _blueBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(255, 222, 89, 8),
        Color.fromRGBO(255, 222, 120, 1),
      ]));
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromRGBO(255, 255, 255, 0.1)));
  }
}
