import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/src/shared/widgets/AppBarRappi.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarRappi(
      title: 'Inicio',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 👋 Saludo
              Text.rich(
                TextSpan(
                  text: 'Hola, ',
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    TextSpan(
                      text: 'Rocío!',
                      //TODO: TRAER NOMBRE DE OBJETO PERSONA, NO QUEMAR EN CODIGO
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Agosto 2025'),
                            SizedBox(height: 8),
                            Placeholder(fallbackHeight: 180),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tareas del día',
                                style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 12),
                            _taskItem('Revisar presupuesto 2026'),
                            _taskItem('Revisar flujo de caja diario'),
                            _taskItem('Analizar reportes financieros'),
                            // TODO: generar dinámicamente desde una lista de tareas creadas por el usuario
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                'Tu reunión más reciente',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Card(
                child: ListTile(
                  title: const Text('Tesorería – Riesgo Cambiario'),
                  subtitle: const Text('Duración: 30 min • Agosto 5, 2025'),
                  // TODO: tomar datos de la primera reunión (la más reciente)
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () => context.push('/acta'),
                  ),
                  onTap: () => context.push('/acta'),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'Archivos Relacionados',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _quickAction(
                    context,
                    icon: Icons.description,
                    label: 'Acta',
                    onTap: () => context.push('/acts'),
                  ),
                  _quickAction(
                    context,
                    icon: Icons.description,
                    label: 'ARCHIVO RELACIONADO',
                    onTap: () => context.push('/archivo'),
                    //TODO: LA RUTA RECIBIDA PARA LA NAVEGACION DEBE DEPENDER DEL ARCHIVO QUE SE VAYA A BUSCAR, SE DEBE PASAR ALGO COMO "{$XXX}".
                  ),
                  _quickAction(
                    context,
                    icon: Icons.person,
                    label: 'Ver asistentes',
                    onTap: () => context.push('/asistentes'),
                  ),
                  // TODO: cargar archivos relacionados dinámicamente
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/meeting'),
        icon: const Icon(Icons.add),
        label: const Text('Nueva reunión'),
      ),
    );
  }

  // Helper para tareas del día
  static Widget _taskItem(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: [
        const Icon(Icons.circle, size: 8, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    ),
  );

  // Helper para acciones rápidas
  Widget _quickAction(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: -3,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}