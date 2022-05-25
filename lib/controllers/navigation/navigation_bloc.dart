import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomePageInitialized(pageTitle: tr('home'))) {
    on(_onNavigateToPage);
  }
}

final List<String> pageTitles = [
  tr('home'),
  tr('employees'),
  tr('person_with_special_needs'),
  tr('donation'),
  tr('volunteer'),
  tr('sponsorships'),
  tr('notifications'),
  tr('settings'),
];
void _onNavigateToPage(
  NavigateToPage event,
  Emitter<NavigationState> emit,
) async {
  switch (event.pageIndex) {
    case 0:
      emit(HomePageInitialized(pageTitle: pageTitles[event.pageIndex]));
      break;
    case 1:
      emit(EmployeesPageInitialized(pageTitle: pageTitles[event.pageIndex]));
      break;
    case 2:
      emit(PersonsWithSpecialNeedsPageInitialized(
        pageTitle: pageTitles[event.pageIndex],
      ));
      break;
    case 3:
      emit(DonationsPageInitialized(pageTitle: pageTitles[event.pageIndex]));
      break;

    case 4:
      emit(VolunteerPageInitialized(pageTitle: pageTitles[event.pageIndex]));
      break;

    case 5:
      emit(
        SponsorshipsPageInitialized(pageTitle: pageTitles[event.pageIndex]),
      );
      break;

    case 6:
      emit(
        NotificationsPageInitialized(pageTitle: pageTitles[event.pageIndex]),
      );
      break;

    case 7:
      emit(SettingsPageInitialized(pageTitle: pageTitles[event.pageIndex]));
      break;
    default:
      emit(HomePageInitialized(pageTitle: pageTitles[0]));
  }
}