import 'package:flutter/material.dart';

class RappiStyleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showSearch;
  final List<Widget>? actions;

  const RappiStyleAppBar({
    super.key,
    this.title,
    this.showSearch = true,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0033A0),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // fila superior con título + acciones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                const CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/avatar.png')),

              Row(
                children: actions ?? [],
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (showSearch)
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar...",
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
      ),
    );
  }
}
