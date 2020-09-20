import 'package:digihealth/Bloc/chemistBloc.dart';
import 'package:digihealth/Bloc/doctorBloc.dart';
import 'package:digihealth/Bloc/patientBloc.dart';
import 'package:digihealth/Service/signInHandler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    bloc: PatientBloc(),
    child: BlocProvider(
      bloc: DoctorBloc(),
      child: BlocProvider(
        bloc: ChemistBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyApp(),
        ),
      ),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignInHandler(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/0b/aa/d3/0baad396804053238b9351882064f003.jpg"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Image.network(
                "https://image.freepik.com/free-vector/online-doctor-concept_23-2148522555.jpg"),
          )),
    );
  }
}
