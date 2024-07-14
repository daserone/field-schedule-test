import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/domain/location_service.dart';
import 'package:test_agenda/domain/provider/field_provider.dart';
import 'package:test_agenda/domain/provider/schedule_provider.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/core/theme/text_styles.dart';
import 'package:test_agenda/presentation/views/home/widgets/fields.dart';
import 'package:test_agenda/presentation/views/home/widgets/schedule_list.dart';
import 'package:test_agenda/presentation/widgets/custom_text.dart';
import 'package:test_agenda/presentation/widgets/icon_button.dart';
import 'package:test_agenda/presentation/widgets/main_app_bar.dart';
import 'package:test_agenda/presentation/widgets/profile_pic.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final location = LocationService();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final schedule = context.read<ScheduleProvider>();
      final fields = context.read<FieldProvider>();
      fields.getFieldsFromJson();
      location.determinePosition(context);
      schedule.getItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        actions: [
          const ProfilePic(isAsset: true, imageUrl: 'assets/images/user.png'),
          CustomIconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: AppColors.white,
            ),
          ),
          CustomIconButton(
            icon: Icon(
              Icons.menu,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.gray.withOpacity(0.2),
                ),
              ),
            ),
            child: CustomText(
              "Hola, Andrea!",
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const FieldList(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              'Reservas programadas',
              style: CustomTextStyles.customTextStylePoppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const ScheduleList(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
