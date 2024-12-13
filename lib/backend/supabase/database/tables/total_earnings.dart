import '../database.dart';

class TotalEarningsTable extends SupabaseTable<TotalEarningsRow> {
  @override
  String get tableName => 'total_earnings';

  @override
  TotalEarningsRow createRow(Map<String, dynamic> data) =>
      TotalEarningsRow(data);
}

class TotalEarningsRow extends SupabaseDataRow {
  TotalEarningsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TotalEarningsTable();

  String get driverId => getField<String>('driver_id')!;
  set driverId(String value) => setField<String>('driver_id', value);

  double? get totalDeliveryFee => getField<double>('total_delivery_fee');
  set totalDeliveryFee(double? value) =>
      setField<double>('total_delivery_fee', value);
}
