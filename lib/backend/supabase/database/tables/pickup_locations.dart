import '../database.dart';

class PickupLocationsTable extends SupabaseTable<PickupLocationsRow> {
  @override
  String get tableName => 'pickup_locations';

  @override
  PickupLocationsRow createRow(Map<String, dynamic> data) =>
      PickupLocationsRow(data);
}

class PickupLocationsRow extends SupabaseDataRow {
  PickupLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PickupLocationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get customerId => getField<String>('customer_id');
  set customerId(String? value) => setField<String>('customer_id', value);

  bool? get isDefaultLocation => getField<bool>('is_default_location');
  set isDefaultLocation(bool? value) =>
      setField<bool>('is_default_location', value);

  String? get pickupLocationLatlon =>
      getField<String>('pickup_location_latlon');
  set pickupLocationLatlon(String? value) =>
      setField<String>('pickup_location_latlon', value);

  String? get pickupLocationGeo => getField<String>('pickup_location_geo');
  set pickupLocationGeo(String? value) =>
      setField<String>('pickup_location_geo', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get pickupAddress1 => getField<String>('pickup_address_1');
  set pickupAddress1(String? value) =>
      setField<String>('pickup_address_1', value);

  String? get pickupAddress2 => getField<String>('pickup_address_2');
  set pickupAddress2(String? value) =>
      setField<String>('pickup_address_2', value);

  String? get pickupCity => getField<String>('pickup_city');
  set pickupCity(String? value) => setField<String>('pickup_city', value);

  int? get pickupZipCode => getField<int>('pickup_zip_code');
  set pickupZipCode(int? value) => setField<int>('pickup_zip_code', value);

  String? get pickupState => getField<String>('pickup_state');
  set pickupState(String? value) => setField<String>('pickup_state', value);
}
