import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/spinner/spinner.dart';
import '../../shop/home/home.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../domain/entity/notification_entity.dart';
import 'cubit/notification_cubit.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<NotificationCubit>();
    if (bloc.state is! NotificationLoaded) {
      bloc.fetchNotifications();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DAppBar(
        title: Text("Notifications"),
        showBackArrow: true,
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        backgroundColor: AppColors.white,
        onRefresh: () => context.read<NotificationCubit>().fetchNotifications(),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is NotificationInitial ||
                  state is NotificationLoading) {
                return Spinner();
              }
              if (state is NotificationLoaded) {
                if (state.notificationEntity.isEmpty) {
                  return Center(child: Text("No New Notifications"));
                }
                final now = DateTime.now();
                final today = <NotificationEntity>[];
                final yesterday = <NotificationEntity>[];
                final older = <NotificationEntity>[];
                for (var notification in state.notificationEntity) {
                  final sentAt = notification.sentAt.toLocal();
                  final todayDate = DateTime(now.year, now.month, now.day);
                  final sentDate =
                      DateTime(sentAt.year, sentAt.month, sentAt.day);
                  final differenceDays = todayDate.difference(sentDate).inDays;
                  if (differenceDays == 0) {
                    today.add(notification);
                  } else if (differenceDays == 1) {
                    yesterday.add(notification);
                  } else {
                    older.add(notification);
                  }
                }
                final sections = [
                  {'title': 'Today', 'notifications': today},
                  {'title': 'Yesterday', 'notifications': yesterday},
                  {'title': 'Earlier', 'notifications': older},
                ];
                return CustomScrollView(
                  slivers: [
                    for (var section in sections)
                      if ((section['notifications'] as List).isNotEmpty) ...[
                        SliverPadding(
                          padding: const EdgeInsets.only(bottom: AppSizes.xs),
                          sliver: SliverToBoxAdapter(
                            child: Text(
                              section['title'] as String,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final n = (section['notifications']
                                  as List<NotificationEntity>)[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSizes.spaceBtwItems),
                                child: buildNotificationItem(n),
                              );
                            },
                            childCount:
                                (section['notifications'] as List).length,
                          ),
                        ),
                      ]
                  ],
                );
              }
              return Center(child: Text("Oops"));
            },
          ),
        ),
      ),
    );
  }
}
Widget buildNotificationItem(NotificationEntity n) {
  Widget iconWidget;
  switch (n.type) {
    case "message":
      iconWidget = Icon(
        Iconsax.message,
        color: AppColors.primary,
      );
    case "reminder":
      iconWidget = Icon(
        Iconsax.clock,
        color: AppColors.primary,
      );
    case "order":
      iconWidget = Icon(
        Iconsax.truck_fast,
        color: AppColors.primary,
      );
    default:
      iconWidget = Icon(
        Iconsax.notification,
        color: AppColors.primary,
      );
  }
  return RoundedContainer(
    showBoxShadow: true,
    backgroundColor: n.read
        ? AppColors.darkGrey
        : AppColors.primary.withValues(alpha: .2, blue: .8),
    padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
    height: 80,
    child: Row(
      children: [
        RoundedContainer(
          height: 50,
          width: 50,
          radius: 100,
          backgroundColor: AppColors.lightGrey,
          child: Padding(
              padding: const EdgeInsets.all(AppSizes.sm), child: iconWidget),
        ),
        SizedBox(width: AppSizes.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(n.title),
              SizedBox(height: AppSizes.xs),
              Text(
                n.body,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}