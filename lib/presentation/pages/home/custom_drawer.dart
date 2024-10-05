import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,  // Set the drawer background color to white
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,  // Ensure no color or rounded corners here
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.handshake,  // You can replace this with your logo
                    size: 50,
                    color: Colors.blue,  // Blue color for the logo/icon
                  ),
                ],
              ),
            ),
            // "Mi app" section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Mi app',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,  // Correct color for the title
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Idioma'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificaciones'),
            ),
            const ListTile(
              leading: Icon(Icons.receipt),
              title: Text('Datos de facturación'),
            ),
            const Divider(),
            // "Codigos promocionales" section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Codigos promocionales',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,  // Correct color for the title
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text('Refiere y gana'),
            ),
            const ListTile(
              leading: Icon(Icons.redeem),
              title: Text('Redimir código'),
            ),
            const Divider(),
            // "Información" section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Información',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,  // Correct color for the title
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Preguntas frecuentes'),
            ),
            const ListTile(
              leading: Icon(Icons.report_problem),
              title: Text('Reportar un problema'),
            ),
            const ListTile(
              leading: Icon(Icons.description),
              title: Text('Términos y condiciones'),
            ),
            const ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Política de privacidad'),
            ),
            const Divider(),
            // "Cerrar sesión" at the bottom
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.blue),
              title: const Text('Cerrar sesión', style: TextStyle(color: Colors.blue)),
              onTap: () {
                // Handle "Cerrar sesión" action here
              },
            ),
          ],
        ),
      ),
    );
  }
}
