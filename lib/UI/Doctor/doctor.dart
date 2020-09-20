import 'package:digihealth/Bloc/doctorBloc.dart';
import 'package:digihealth/Bloc/doctorEvent.dart';
import 'package:digihealth/UI/Doctor/patientReport.dart';
import 'package:flutter/material.dart';
import 'package:digihealth/UI/Doctor/prescription.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:digihealth/Widgets/bottom_nav_bar.dart';
import 'package:digihealth/Widgets/search_bar.dart';
import 'package:digihealth/Widgets/category_card.dart';
import 'package:digihealth/Widgets/constants.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  DoctorBloc _doctorBloc;
  _scan() async {
    if (await Permission.camera.request().isGranted &&
        await Permission.storage.request().isGranted) {
      String _result = await scanner.scan();
      _doctorBloc.eventSink.add(GetPatientReport(uid: _result));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PatientReport(
                    doctorBloc: _doctorBloc,
                  )));
    } else {
      print("NO");
    }
  }

  @override
  Widget build(BuildContext context) {
    _doctorBloc = BlocProvider.of<DoctorBloc>(context);
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/menu.svg",
                      ),
                    ),
                  ),
                  Text(
                    "Hi! \nDr Kevin",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Medicines",
                          svgSrc: "assets/icons/pill.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Prescriptions",
                          svgSrc: "assets/icons/record.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Clinic",
                          svgSrc: "assets/icons/hospital.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return CreatePres();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "QR Code",
                          svgSrc: "assets/icons/qr-code.svg",
                          press: () {
                            _scan();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
