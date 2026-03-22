import 'package:budget_tracker/view_models/api_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file_manager/open_file_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class AiAnalysisScreen extends ConsumerStatefulWidget {
  const AiAnalysisScreen({super.key});

  @override
  ConsumerState<AiAnalysisScreen> createState() => _AiAnalysisScreenState();
}

class _AiAnalysisScreenState extends ConsumerState<AiAnalysisScreen> {
  FilePickerResult? file;
  String l = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      ref.read(apiServiceProvider).getInsights();
    });
  }

  Future<void> getInsights(FilePickerResult file) async {
    await Future.delayed(Duration(seconds: 2),(){
      // never call set state here or risk ending up an infinite loop
      log('sratr');
        l = 'hello';
    });
    log('done');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Analysis',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: file == null
          ? Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  IconButton(
                    onPressed: () async {
                      if (await Permission
                              .manageExternalStorage
                              .isPermanentlyDenied ||
                          await Permission.storage.isPermanentlyDenied) {
                        if (!mounted) return;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                'Permission Request',
                                style: GoogleFonts.poppins(),
                              ),
                              content: Text(
                                'Storage permission is required to perform Ai analysis',
                                style: GoogleFonts.poppins(),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    openAppSettings();
                                  },
                                  child: Text(
                                    'Open settings',
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (await Permission.manageExternalStorage
                              .request()
                              .isGranted ||
                          await Permission.storage.request().isGranted) {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles();
                        setState(() {
                          file = result!;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.file_upload_outlined,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tap icon to uplaod bank statement',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          : FutureBuilder(
              future: getInsights(file!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text('l'),
                  );
                }
              },
            ),
    );
  }
}
