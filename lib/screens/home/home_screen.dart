import 'package:admin/controllers/MenuController.dart';
import 'package:admin/controllers/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../pages/pages.dart';
import 'components/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            BlocConsumer<NavigationBloc, NavigationState>(
              listener: (context, state) {
                context.read<MenuController>().closeMenu();
              },
              builder: (context, state) {
                // Home Page is selected
                if (state is HomePageInitialized) {
                  return HomePageFragment();
                }

                // Employees page seleceted
                if (state is EmployeesPageInitialized) {
                  return EmployeesPageFragment();
                }

                // Persons with special needs seleceted
                if (state is PersonsWithSpecialNeedsPageInitialized) {
                  return PersonsPageFragment();
                }

                // Donations page seleceted
                if (state is DonationsPageInitialized) {
                  return DonationPageFragment();
                }
                // Volunteers page seleceted
                if (state is VolunteerPageInitialized) {
                  return VolunteerPageFragment();
                }

                // Sponsorships page seleceted
                if (state is SponsorshipsPageInitialized) {
                  return SponsorshipsPageFragment();
                }

                // Notifications page seleceted
                if (state is NotificationsPageInitialized) {
                  return NotificationsPageFragment();
                }

                // Persons with special needs seleceted
                if (state is SettingsPageInitialized) {
                  return SettingsPageFragment();
                }
                return HomePageFragment();
              },
            ),
          ],
        ),
      ),
    );
  }
}