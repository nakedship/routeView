import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get vehicleDetails => getField<String>('vehicle_details');
  set vehicleDetails(String? value) =>
      setField<String>('vehicle_details', value);

  String? get locationLatlon => getField<String>('location_latlon');
  set locationLatlon(String? value) =>
      setField<String>('location_latlon', value);

  int? get currentOrderId => getField<int>('current_order_id');
  set currentOrderId(int? value) => setField<int>('current_order_id', value);

  List<int> get orderHistory => getListField<int>('order_history');
  set orderHistory(List<int>? value) =>
      setListField<int>('order_history', value);

  String? get driverStatus => getField<String>('driver_status');
  set driverStatus(String? value) => setField<String>('driver_status', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  String get phoneNumber => getField<String>('phone_number')!;
  set phoneNumber(String value) => setField<String>('phone_number', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  bool? get isBeingPromptedForOrder =>
      getField<bool>('is_being_prompted_for_order');
  set isBeingPromptedForOrder(bool? value) =>
      setField<bool>('is_being_prompted_for_order', value);

  double? get customerPaymentAmount =>
      getField<double>('customer_payment_amount');
  set customerPaymentAmount(double? value) =>
      setField<double>('customer_payment_amount', value);

  bool? get isEligibleForPickups => getField<bool>('is_eligible_for_pickups');
  set isEligibleForPickups(bool? value) =>
      setField<bool>('is_eligible_for_pickups', value);

  String? get locationGeography => getField<String>('location_geography');
  set locationGeography(String? value) =>
      setField<String>('location_geography', value);

  DateTime? get subscriptionStartDate =>
      getField<DateTime>('subscription_start_date');
  set subscriptionStartDate(DateTime? value) =>
      setField<DateTime>('subscription_start_date', value);

  int? get subscriptionLengthMonths =>
      getField<int>('subscription_length_months');
  set subscriptionLengthMonths(int? value) =>
      setField<int>('subscription_length_months', value);

  bool? get isSubscribed => getField<bool>('is_subscribed');
  set isSubscribed(bool? value) => setField<bool>('is_subscribed', value);
}
