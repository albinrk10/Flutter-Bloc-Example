part of 'guests_bloc.dart';

enum GuestFilter {
  all,
  invited,
  noInvited,
}

class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  int get howManyGuests => guests.length;
  List<Todo> get filteredGuests {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((guests) => guests.done).toList();

      case GuestFilter.noInvited:
        return guests.where((guests) => !guests.done).toList();

      case GuestFilter.all:
        return guests;
      default:
        throw Exception('Filtro no soportado');
    }
  }

  int get howManyfilteredGuests => filteredGuests.length;

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) =>
      GuestsState(
        filter: filter ?? this.filter,
        guests: guests ?? this.guests,
      );
  @override
  List<Object> get props => [filter, guests];
}
