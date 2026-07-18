import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          final user = authProvider.user;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: user?.photoURL != null
                      ? Image.network(user!.photoURL!)
                      : const Icon(
                          Icons.account_circle,
                          size: 80,
                        ),
                ),
                const SizedBox(height: 16),
                Text(
                  user?.displayName ?? 'User',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  user?.email ?? 'No email',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                _buildProfileItem(
                  context,
                  icon: Icons.calendar_today,
                  label: 'My Bookings',
                  onTap: () {},
                ),
                _buildProfileItem(
                  context,
                  icon: Icons.shopping_bag,
                  label: 'My Orders',
                  onTap: () {},
                ),
                _buildProfileItem(
                  context,
                  icon: Icons.favorite,
                  label: 'Wishlist',
                  onTap: () {},
                ),
                _buildProfileItem(
                  context,
                  icon: Icons.location_on,
                  label: 'Addresses',
                  onTap: () {},
                ),
                _buildProfileItem(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () {},
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    authProvider.signOut();
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign Out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
