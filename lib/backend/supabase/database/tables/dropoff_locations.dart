import '../database.dart';

class DropoffLocationsTable extends SupabaseTable<DropoffLocationsRow> {
  @override
  String get tableName => 'dropoff_locations';

  @override
  DropoffLocationsRow createRow(Map<String, dynamic> data) =>
      DropoffLocationsRow(data);
}

class DropoffLocationsRow extends SupabaseDataRow {
  DropoffLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DropoffLocationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get dropoffAddress1 => getField<String>('dropoff_address_1');
  set dropoffAddress1(String? value) =>
      setField<String>('dropoff_address_1', value);

  String? get dropoffAddress2 => getField<String>('dropoff_address_2');
  set dropoffAddress2(String? value) =>
      setField<String>('dropoff_address_2', value);

  String? get entryCode => getField<String>('entry_code');
  set entryCode(String? value) => setField<String>('entry_code', value);

  String? get dropoffLocationLatlon =>
      getField<String>('dropoff_location_latlon');
  set dropoffLocationLatlon(String? value) =>
      setField<String>('dropoff_location_latlon', value);

  int? get dropoffZipCode => getField<int>('dropoff_zip_code');
  set dropoffZipCode(int? value) => setField<int>('dropoff_zip_code', value);

  String? get dropoffState => getField<String>('dropoff_state');
  set dropoffState(String? value) => setField<String>('dropoff_state', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get operatingHours => getField<String>('operating_hours');
  set operatingHours(String? value) =>
      setField<String>('operating_hours', value);

  String? get dropoffCity => getField<String>('dropoff_city');
  set dropoffCity(String? value) => setField<String>('dropoff_city', value);

  String? get dropoffLocationGeo => getField<String>('dropoff_location_geo');
  set dropoffLocationGeo(String? value) =>
      setField<String>('dropoff_location_geo', value);
}
