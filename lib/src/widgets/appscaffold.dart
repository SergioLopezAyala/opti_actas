import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final bool showSearch;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.showSearch = true,
    this.actions,
    this.floatingActionButton,
  });

  // Mejor tener la key fuera de build para no recrearla cada frame
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // Drawer lateral
      drawer: const _AppDrawer(),

      // AppBar curvo estilo Rappi (SIN ternario ni código muerto)
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: _CurvedHeader(
          title: title ?? 'Inicio',
          onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
          actions: actions,
          showSearch: showSearch,
        ),
      ),

      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

class _AppDrawer extends StatelessWidget {
  const _AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF0033A0)),
            child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pop(context);      // cierra el drawer
              context.go('/home');         // ruta corregida
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Reuniones'),
            onTap: () {
              Navigator.pop(context);
              context.go('/reuniones');
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Actas'),
            onTap: () {
              Navigator.pop(context);
              context.go('/actas');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
              context.go('/settings');
            },
          ),
        ],
      ),
    );
  }
}

/// Header curvo estilo “Rappi”
class _CurvedHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuTap;
  final List<Widget>? actions;
  final bool showSearch;

  const _CurvedHeader({
    required this.title,
    required this.onMenuTap,
    this.actions,
    this.showSearch = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0033A0),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: onMenuTap, // abre el drawer
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Row(children: actions ?? const []),
            ],
          ),
          if (showSearch) ...[
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar…",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
