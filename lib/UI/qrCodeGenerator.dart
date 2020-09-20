import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class QRGenerator extends StatelessWidget {
  final String uid;
  QRGenerator({@required this.uid});
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();
  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();
      final image = await wrapWidget(
        doc.document,
        key: _printKey,
        pixelRatio: 2.0,
      );
      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));
      return doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _printScreen();
        },
        child: Icon(Icons.save),
      ),
      body: SafeArea(
        child: RepaintBoundary(
          key: _printKey,
          child: Container(
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Scan QR code to check Patients Report",
                        textAlign: TextAlign.center,
                      ),
                      QrImage(
                        data: uid,
                        version: QrVersions.auto,
                        size: 240,
                        gapless: false,
                        padding: EdgeInsets.all(20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
