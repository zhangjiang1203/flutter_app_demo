/*
* FileBasicOperationModel created by zj 
* on 2020/4/15 10:18 AM
* copyright on zhangjiang
*/

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileBasicOperationModel extends StatefulWidget {
  FileBasicOperationModel({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FileBasicOperationModel createState() => _FileBasicOperationModel();
}

class _FileBasicOperationModel extends State<FileBasicOperationModel> {
  late Future<Directory> _tempDirectory;
  late Future<Directory> _appSupportDirectory;
  late Future<Directory> _appLibraryDirectory;
  late Future<Directory> _appDocumentsDirectory;
  late Future<Directory> _externalDocumentsDirectory;
  late Future<List<Directory>> _externalStorageDirectories;
  late Future<List<Directory>> _externalCacheDirectories;

  void _requestTempDirectory() {
    setState(() {
      _tempDirectory = getTemporaryDirectory();
    });
  }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data?.path}');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  Widget _buildDirectories(
      BuildContext context, AsyncSnapshot<List<Directory>> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final String combined =
        snapshot.data!.map((Directory d) => d.path).join(', ');
        text = Text('paths: $combined');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  void _requestAppDocumentsDirectory() {
    setState(() {
      _appDocumentsDirectory = getApplicationDocumentsDirectory();
    });
  }

//  void _requestAppSupportDirectory() {
//    setState(() {
//      _appSupportDirectory = getApplicationSupportDirectory();
//    });
//  }
//
//  void _requestAppLibraryDirectory() {
//    setState(() {
//      _appLibraryDirectory = getLibraryDirectory();
//    });
//  }

  void _requestExternalStorageDirectory() {
    setState(() {
      _externalDocumentsDirectory = getExternalStorageDirectory() as Future<Directory> ;
    });
  }

//  void _requestExternalStorageDirectories(StorageDirectory type) {
//    setState(() {
//      _externalStorageDirectories = getExternalStorageDirectories(type: type);
//    });
//  }
//
//  void _requestExternalCacheDirectories() {
//    setState(() {
//      _externalCacheDirectories = getExternalCacheDirectories();
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FileBasicOperationModel"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                child: const Text('Get Temporary Directory'),
                onPressed: _requestTempDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _tempDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                child: const Text('Get Application Documents Directory'),
                onPressed: _requestAppDocumentsDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _appDocumentsDirectory, builder: _buildDirectory),
//            Padding(
//              padding: const EdgeInsets.all(16.0),
//              child: RaisedButton(
//                child: const Text('Get Application Support Directory'),
//                onPressed: _requestAppSupportDirectory,
//              ),
//            ),
            FutureBuilder<Directory>(
                future: _appSupportDirectory, builder: _buildDirectory),
//            Padding(
//              padding: const EdgeInsets.all(16.0),
//              child: RaisedButton(
//                child: const Text('Get Application Library Directory'),
//                onPressed: _requestAppLibraryDirectory,
//              ),
//            ),
            FutureBuilder<Directory>(
                future: _appLibraryDirectory, builder: _buildDirectory),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                child: Text(
                    '${Platform.isIOS ? "External directories are unavailable " "on iOS" : "Get External Storage Directory"}'),
                onPressed:
                Platform.isIOS ? null : _requestExternalStorageDirectory,
              ),
            ),
            FutureBuilder<Directory>(
                future: _externalDocumentsDirectory, builder: _buildDirectory),
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  child: Text(
                      '${Platform.isIOS ? "External directories are unavailable " "on iOS" : "Get External Storage Directories"}'),
                  onPressed: Platform.isIOS
                      ? null
                      : () {
//                    _requestExternalStorageDirectories(
//                      StorageDirectory.music,
//                    );
                  },
                ),
              ),
            ]),
            FutureBuilder<List<Directory>>(
                future: _externalStorageDirectories,
                builder: _buildDirectories),
            Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {  },
                  child: Text(
                      '${Platform.isIOS ? "External directories are unavailable " "on iOS" : "Get External Cache Directories"}'),
//                  onPressed:
//                  Platform.isIOS ? null : _requestExternalCacheDirectories,
                ),
              ),
            ]),
            FutureBuilder<List<Directory>>(
                future: _externalCacheDirectories, builder: _buildDirectories),
          ],
        ),
      ),
    );
  }
}