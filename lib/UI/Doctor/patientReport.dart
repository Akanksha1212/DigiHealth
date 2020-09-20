import 'package:digihealth/Bloc/doctorBloc.dart';
import 'package:digihealth/Model/Report/reportModel.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class PatientReport extends StatefulWidget {
  final DoctorBloc doctorBloc;
  PatientReport({@required this.doctorBloc});
  @override
  _PatientReportState createState() => _PatientReportState();
}

class _PatientReportState extends State<PatientReport> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Report>>(
      stream: widget.doctorBloc.reportStream,
      initialData: widget.doctorBloc.getReport,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.hasError) {
            return Text("Error");
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text("Reports"),
              ),
              body: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return GFAccordion(
                    title: snapshot.data[i].doctorName,
                    contentChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          initialValue: snapshot.data[i].description,
                          decoration: InputDecoration(labelText: "Description"),
                          readOnly: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Prescription: ",
                            textAlign: TextAlign.left,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data[i].prescription.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot
                                  .data[i].prescription[index].medicineName),
                              subtitle: Text(snapshot
                                  .data[i].prescription[index].medicineDesc),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
        } else {
          return Text("No Data");
        }
      },
    );
  }
}
