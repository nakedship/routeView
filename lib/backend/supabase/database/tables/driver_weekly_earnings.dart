import '../database.dart';

class DriverWeeklyEarningsTable extends SupabaseTable<DriverWeeklyEarningsRow> {
  @override
  String get tableName => 'driver_weekly_earnings';

  @override
  DriverWeeklyEarningsRow createRow(Map<String, dynamic> data) =>
      DriverWeeklyEarningsRow(data);
}

class DriverWeeklyEarningsRow extends SupabaseDataRow {
  DriverWeeklyEarningsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DriverWeeklyEarningsTable();

  String get driverId => getField<String>('driver_id')!;
  set driverId(String value) => setField<String>('driver_id', value);

  DateTime get weekStartDate => getField<DateTime>('week_start_date')!;
  set weekStartDate(DateTime value) =>
      setField<DateTime>('week_start_date', value);

  double? get totalDeliveryFee => getField<double>('total_delivery_fee');
  set totalDeliveryFee(double? value) =>
      setField<double>('total_delivery_fee', value);
}
