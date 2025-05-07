import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  final void Function(bool isDark)? onThemeChanged;

  const ProfilPage({super.key, this.onThemeChanged});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool _isDarkMode = false;

  String _nama = 'Siti Intan Nia';
  String _npm = '4522210054';
  String _email = '4522210054@univpancasila.ac.id';
  String _jurusan = 'Teknik Informatika';

  void _editData(String label, String initialValue, Function(String) onSave) {
    String tempValue = initialValue;
    final controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit $label'),
        content: TextField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) => tempValue = value,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              onSave(tempValue);
              Navigator.pop(context);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(String label, String value, VoidCallback onEdit) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        '$label:',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: onEdit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Kembali ke Home',
          onPressed: () {
            Navigator.pushNamed(context, '/home'); // Pastikan rute '/home' tersedia
          },
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  ),
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/Pribadi1.jpg'),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        _nama,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _email,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      _buildProfileItem('Nama', _nama, () {
                        _editData('Nama', _nama, (val) => setState(() => _nama = val));
                      }),
                      _buildProfileItem('NPM', _npm, () {
                        _editData('NPM', _npm, (val) => setState(() => _npm = val));
                      }),
                      _buildProfileItem('Email', _email, () {
                        _editData('Email', _email, (val) => setState(() => _email = val));
                      }),
                      _buildProfileItem('Jurusan', _jurusan, () {
                        _editData('Jurusan', _jurusan, (val) => setState(() => _jurusan = val));
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Mode Gelap:', style: TextStyle(fontSize: 16)),
                    Switch(
                      value: _isDarkMode,
                      onChanged: (value) {
                        setState(() => _isDarkMode = value);
                        widget.onThemeChanged?.call(value);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Logout ditekan')),
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
