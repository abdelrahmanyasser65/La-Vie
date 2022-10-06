import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lavie/bussiness_logic/scan/cubit.dart';
import 'package:lavie/bussiness_logic/scan/state.dart';
import 'package:lavie/presentation/constants/images.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<QRScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    controller.resumeCamera();
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        controller.pauseCamera();
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanCubit,ScanState>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=BlocProvider.of<ScanCubit>(context);
        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  QRView(
                    key: qrKey,

                    onQRViewCreated: _onQRViewCreated,
                    onPermissionSet: (ctrl, p) =>
                        _onPermissionSet(context, ctrl, p),
                  ),
                  Image.asset(
                    scanQr,
                    height: 35.h,
                  ),
                ],
              ),
              if (result == null)
                Container()
              else
                InkWell(
                    onTap: () async{
                      await cubit.getAllBlogs(context);
                      cubit.getOneBlog(result!.code.toString());
                      controller!.pauseCamera();
                    },
                    child: buildBottom()),
            ],
          ),
        );
      },
    );
  }

  Widget buildBottom() {
    return Container(
      height: 10.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50.w,
            child: const Text("Scan Successfully Go To Details",
                style: TextStyle(letterSpacing: 1.2)),
          ),
          const Spacer(),
          Container(
            height: 10.h,
            width: 12.w,
            decoration: BoxDecoration(
              color: HexColor('#1ABC00'),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
