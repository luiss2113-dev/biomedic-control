import 'package:biomedic_control/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatelessWidget {
  static const route = '/auth';
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              bottom: 0,
              top: 0,
              child: SvgPicture.asset(
                'assets/svg/wave-haikei-green.svg',
                width: size.width,
                height: size.height,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
                height: size.height * 0.48,
                top: size.height * 0.01,
                right: size.width * 0.02,
                left: size.width * 0.02,
                child: const Image(
                  image: AssetImage('assets/images/image-logo.png'),
                  fit: BoxFit.fill,
                )),
            Positioned(
              top: size.height * 0.6,
              bottom: 0,
              child: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Inicia tu control aquí:',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    ElevatedButton.icon(
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/svg/google.svg',
                            height: 30,
                            width: 30,
                            semanticsLabel: 'Inicio de sesión con google',
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          minimumSize: Size(size.width * 0.7, 60),
                        ),
                        label: Text(
                          "Inicia con Google",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic),
                        ),
                        onPressed: () => context
                            .read<AuthBloc>()
                            .add(const AuthLoginPressed()))
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                child: Text(
                  'V.1 FancyCoder',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
