import 'package:flutter/material.dart';
import '../data/topics_data.dart';
import '../models/topic.dart';
import 'topic_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'info_outline': return Icons.info_outline;
      case 'memory': return Icons.memory;
      case 'warning_amber': return Icons.warning_amber;
      case 'ads_click': return Icons.ads_click;
      case 'settings_input_component': return Icons.settings_input_component;
      case 'flash_on': return Icons.flash_on;
      default: return Icons.article;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Embedded C Guide'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 1;
          if (constraints.maxWidth > 900) {
            crossAxisCount = 3;
          } else if (constraints.maxWidth > 600) {
            crossAxisCount = 2;
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: embeddedTopics.length,
            itemBuilder: (context, index) {
              final topic = embeddedTopics[index];
              return TopicCard(
                topic: topic,
                iconData: _getIconData(topic.iconName),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopicDetailScreen(topic: topic),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  final Topic topic;
  final IconData iconData;
  final VoidCallback onTap;

  const TopicCard({
    super.key,
    required this.topic,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 12),
              Text(
                topic.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  topic.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
