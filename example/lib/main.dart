import 'package:flutter/material.dart';
import 'package:flutter_read_device/flutter_read_device.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Read Device Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device & App Info'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<FlutterReadDeviceInfo>(
        future: FlutterReadDevice.collect(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No information collected.'));
          }

          final info = snapshot.data!;

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildSectionTitle(context, 'Application Information', Icons.apps),
              _buildInfoCard([
                _buildInfoRow('App Name', info.app.appName),
                _buildInfoRow('Package Name', info.app.packageName),
                _buildInfoRow('Version', info.app.version),
                _buildInfoRow('Build Number', info.app.buildNumber),
                _buildInfoRow('Installer Store', info.app.installerStore ?? 'N/A'),
              ]),
              const SizedBox(height: 24),
              _buildSectionTitle(context, 'Device Information', Icons.phone_android),
              _buildInfoCard([
                _buildInfoRow('Brand', info.device.brand),
                _buildInfoRow('Model', info.device.model),
                _buildInfoRow('Manufacturer', info.device.manufacturer),
                _buildInfoRow('OS Version', info.device.osVersion),
                _buildInfoRow('Physical Device', info.device.isPhysicalDevice ? 'Yes' : 'No'),
                _buildInfoRow('Is Emulator', info.isEmulator ? 'Yes' : 'No'),
                if (info.isAndroid) ...[
                  _buildInfoRow('SDK Int', info.device.sdkInt.toString()),
                  _buildInfoRow('Android 13+', info.isAndroid13Above ? 'Yes' : 'No'),
                ],
              ]),
              const SizedBox(height: 32),
              Center(
                child: FilledButton.icon(
                  onPressed: () => _showRawJson(context, info),
                  icon: const Icon(Icons.code),
                  label: const Text('View Raw JSON'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showRawJson(BuildContext context, FlutterReadDeviceInfo info) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Raw JSON Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SelectableText(
                      info.toJson(),
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Card(
      elevation: 0,
      color: Colors.deepPurple.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: children),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
