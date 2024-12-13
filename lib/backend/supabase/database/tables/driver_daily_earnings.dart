import '../database.dart';

class DriverDailyEarningsTable extends SupabaseTable<DriverDailyEarningsRow> {
  @override
  String get tableName => 'driver_daily_earnings';

  @override
  DriverDailyEarningsRow createRow(Map<String, dynamic> data) =>
      DriverDailyEarningsRow(data);
}

class DriverDailyEarningsRow extends SupabaseDataRow {
  DriverDailyEarningsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriverDailyEarningsTable();

  String get driverId => getField<String>('driver_id')!;
  set driverId(String value) => setField<String>('driver_id', value);

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);

  double? get totalDeliveryFee => getField<double>('total_delivery_fee');
  set totalDeliveryFee(double? value) =>
      setField<double>('total_delivery_fee', value);
}
