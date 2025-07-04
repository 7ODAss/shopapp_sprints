import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_sprints/l10n/generated/app_localizations.dart';
import '../../../../../core/shared/controller/cubit.dart';
import '../../../signin/presentation/screens/login_screen.dart';
import '../../../signup/presentation/screens/register_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => context.read<LocalCubit>().toggleLocale(),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.appTitle,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Suwannaphum",
            ),
          ),
          Text(
            AppLocalizations.of(context)!.appDescription,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Suwannaphum",
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/intro.jpg',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.pexels.com/photos/1488463/pexels-photo-1488463.jpeg',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.signUp,
                  style: TextStyle(
                    fontFamily: "Suwannaphum",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              SizedBox(width: 20),
             ElevatedButton(onPressed: (){ Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => LoginScreen()),
             );}, child:  Text(
               AppLocalizations.of(context)!.signIn,
               style: TextStyle(
                 fontFamily: "Suwannaphum",
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                 color: Colors.deepPurpleAccent,
               ),
             ),)
            ],
          ),
        ],
      ),
    );
  }
}
