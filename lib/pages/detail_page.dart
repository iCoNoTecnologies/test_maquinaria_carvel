import 'package:flutter/material.dart';
import '../models/character_model.dart';

class DetailPage extends StatelessWidget {
  final CharacterModel character;

  const DetailPage({Key? key, required this.character}) : super(key: key);

  Widget _infoRow(BuildContext context, String label, String? value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '$label:',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? '—',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final image = character.image;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          character.name ?? 'Detalle',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).textTheme.headlineSmall!.color,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        iconTheme: IconThemeData(color: Theme.of(context).textTheme.headlineSmall!.color),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (image != null && image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  errorBuilder: (_, __, ___) => Container(
                    height: 350,
                    color: theme.colorScheme.surfaceVariant.withOpacity(0.2),
                    child: Icon(
                      Icons.broken_image,
                      color: theme.iconTheme.color?.withOpacity(0.7),
                      size: 50,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Card(
              color: theme.cardTheme.color,
              elevation: theme.cardTheme.elevation ?? 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child:Container(
               color:
               Theme.of(context).cardTheme.color,
                child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _infoRow(context, 'Name', character.name),
                    _infoRow(context, 'House', character.house),
                    _infoRow(context, 'Actor', character.actor),
                    _infoRow(context, 'Species', character.species),
                    _infoRow(context, 'Gender', character.gender),
                    _infoRow(
                      context,
                      'Birth',
                      character.dateOfBirth ?? character.yearOfBirth?.toString(),
                    ),
                    _infoRow(context, 'Eye colour', character.eyeColour),
                    _infoRow(context, 'Hair', character.hairColour),
                    _infoRow(context, 'Patronus', character.patronus),
                    _infoRow(context, 'Ancestry', character.ancestry),
                    _infoRow(context, 'Wizard', character.wizard == true ? 'Yes' : 'No'),
                    _infoRow(context, 'Alive', character.alive == true ? 'Yes' : 'No'),
                    const SizedBox(height: 12),
                    if (character.wand != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wand',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              color: theme.colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          _infoRow(context, 'Wood', character.wand?.wood),
                          _infoRow(context, 'Core', character.wand?.core),
                          _infoRow(
                              context,
                              'Length',
                              character.wand?.length != null
                                  ? '${character.wand?.length} inches'
                                  : '—'),
                        ],
                      ),
                  ],
                ),
              ),)
            ),
          ],
        ),
      ),
    );
  }
}
