import 'package:flutter/material.dart';
import 'activity_model.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Mock data for 7 activities
  static List<ActivityStat> get activities => [
        ActivityStat(
          name: 'Orders',
          pending: 12,
          today: 45,
          yesterday: 38,
          icon: Icons.shopping_cart,
          color: Colors.blue,
        ),
        ActivityStat(
          name: 'Shipments',
          pending: 5,
          today: 28,
          yesterday: 30,
          icon: Icons.local_shipping,
          color: Colors.orange,
        ),
        ActivityStat(
          name: 'Returns',
          pending: 3,
          today: 2,
          yesterday: 5,
          icon: Icons.assignment_return,
          color: Colors.red,
        ),
        ActivityStat(
          name: 'Inquiries',
          pending: 8,
          today: 15,
          yesterday: 12,
          icon: Icons.help_outline,
          color: Colors.purple,
        ),
        ActivityStat(
          name: 'Payments',
          pending: 4,
          today: 42,
          yesterday: 40,
          icon: Icons.payments,
          color: Colors.green,
        ),
        ActivityStat(
          name: 'Reviews',
          pending: 15,
          today: 8,
          yesterday: 10,
          icon: Icons.star_rate,
          color: Colors.amber,
        ),
        ActivityStat(
          name: 'New Users',
          pending: 2,
          today: 12,
          yesterday: 9,
          icon: Icons.person_add,
          color: Colors.teal,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout:
          // < 600px width: 1 column (List)
          // 600-900px: 2 columns
          // > 900px: 3 or 4 columns
          int crossAxisCount = 1;
          if (constraints.maxWidth > 1200) {
            crossAxisCount = 4;
          } else if (constraints.maxWidth > 900) {
            crossAxisCount = 3;
          } else if (constraints.maxWidth > 600) {
            crossAxisCount = 2;
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: activities.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5, // Adjust height of cards
              ),
              itemBuilder: (context, index) {
                final activity = activities[index];
                return _buildActivityCard(context, activity);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildActivityCard(BuildContext context, ActivityStat activity) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: activity.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(activity.icon, color: activity.color, size: 28),
                ),
                const SizedBox(width: 12),
                Text(
                  activity.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(context, 'Pending', activity.pending, Colors.orange),
                _buildStatItem(context, 'Today', activity.today, Colors.blue),
                _buildStatItem(context, 'Yesterday', activity.yesterday, Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, int count, Color color) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
