import '../database.dart';

class DriverSessionsTable extends SupabaseTable<DriverSessionsRow> {
  @override
  String get tableName => 'driver_sessions';

  @override
  DriverSessionsRow createRow(Map<String, dynamic> data) =>
      DriverSessionsRow(data);
}

class DriverSessionsRow extends SupabaseDataRow {
  DriverSessionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriverSessionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get startTime => getField<DateTime>('start_time')!;
  set startTime(DateTime value) => setField<DateTime>('start_time', value);

  DateTime? get endTime => getField<DateTime>('end_time');
  set endTime(DateTime? value) => setField<DateTime>('end_time', value);

  String? get driverId => getField<String>('driver_id');
  set driverId(String? value) => setField<String>('driver_id', value);

  bool? get isLatestSession => getField<bool>('is_latest_session');
  set isLatestSession(bool? value) =>
      setField<bool>('is_latest_session', value);
}
