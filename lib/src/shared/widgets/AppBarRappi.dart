import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarRappi extends StatelessWidget {
  final Widget body;
  final String? title;
  final bool showSearch;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;

  const AppBarRappi({
    super.key,
    required this.body,
    this.title,
    this.showSearch = true,
    this.actions,
    this.floatingActionButton,
  });

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const _AppDrawer(),
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
              context.push('/home');         // ruta corregida
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Reuniones'),
            onTap: () {
              Navigator.pop(context);
              context.push('/reuniones');
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Actas'),
            onTap: () {
              Navigator.pop(context);
              context.push('/actas');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
              Navigator.pop(context);
              context.push('/settings');
            },
          ),
        ],
      ),
    );
  }
}

class _CurvedHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuTap;
  final List<Widget>? actions;
  final bool showSearch;
  final bool centerTitle; // <- NUEVO

  const _CurvedHeader({
    required this.title,
    required this.onMenuTap,
    this.actions,
    this.showSearch = true,
    this.centerTitle = true, // <- NUEVO
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
          // --- BARRA SUPERIOR ---
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                // Menú a la izquierda
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: onMenuTap,
                  ),
                ),

                // Título centrado en toda la pantalla
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Actions a la derecha
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions ?? const [],
                  ),
                ),
              ],
            ),
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
