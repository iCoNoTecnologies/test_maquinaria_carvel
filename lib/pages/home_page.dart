import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ThemeModel.dart';
import '../providers/character_provider.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeNotifier, child) {
        final theme = Theme.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'HP Characters',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).textTheme.headlineSmall!.color,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            iconTheme: IconThemeData(color: Theme.of(context).textTheme.headlineSmall!.color),
            actions: [
              IconButton(
                icon: Icon(
                  themeNotifier.isDark
                      ? Icons.nightlight_round
                      : Icons.wb_sunny,
                ),
                onPressed: () {
                  themeNotifier.isDark = !themeNotifier.isDark;
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Consumer<CharacterProvider>(
              builder: (context, provider, _) {
                switch (provider.state) {
                  case LoadingState.loading:
                    return const Center(child: CircularProgressIndicator());

                  case LoadingState.error:
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Error: ${provider.errorMessage ?? "unknown"}',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: provider.loadCharacters,
                            child: const Text('Reintentar'),
                          ),
                        ],
                      ),
                    );

                  case LoadingState.success:
                    final items = provider.items;
                    if (items.isEmpty) {
                      return Center(
                        child: Text(
                          'No hay personajes.',
                          style: theme.textTheme.bodyMedium,
                        ),
                      );
                    }

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 600;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isWide
                              ? GridView.builder(
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: items.length,
                            itemBuilder: (context, index) =>
                                _CharacterTile(items[index]),
                          )
                              : ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) =>
                                _CharacterTile(items[index]),
                          ),
                        );
                      },
                    );

                  default:
                    return Center(
                      child: ElevatedButton(
                        onPressed: () => Provider.of<CharacterProvider>(
                          context,
                          listen: false,
                        ).loadCharacters(),
                        child: const Text('Cargar personajes'),
                      ),
                    );
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class _CharacterTile extends StatelessWidget {
  final dynamic item;

  const _CharacterTile(this.item);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = item.image;

    return  Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: theme.cardTheme.elevation ?? 3,
      child:Container(
    color:
    Theme.of(context).cardTheme.color,
    child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => DetailPage(character: item),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: imageUrl != null && imageUrl.isNotEmpty
                    ? Image.network(
                  imageUrl,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _fallbackAvatar(theme),
                )
                    : _fallbackAvatar(theme),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? 'No Name',
                      style: theme.textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.house ?? 'Unknown house',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.iconTheme.color?.withOpacity(0.7),
              ),
            ],
          ),
        ),
      ),)
    );
  }

  Widget _fallbackAvatar(ThemeData theme) {
    return Container(
      width: 72,
      height: 72,
      color: theme.colorScheme.onSecondary.withOpacity(0.2),
      child: Icon(
        Icons.person,
        size: 36,
        color: theme.iconTheme.color,
      ),
    );
  }
}
