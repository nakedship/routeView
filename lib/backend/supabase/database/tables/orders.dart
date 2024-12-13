import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get customerId => getField<String>('customer_id');
  set customerId(String? value) => setField<String>('customer_id', value);

  String? get driverId => getField<String>('driver_id');
  set driverId(String? value) => setField<String>('driver_id', value);

  String? get orderType => getField<String>('order_type');
  set orderType(String? value) => setField<String>('order_type', value);

  double? get totalPrice => getField<double>('total_price');
  set totalPrice(double? value) => setField<double>('total_price', value);

  String? get orderStatus => getField<String>('order_status');
  set orderStatus(String? value) => setField<String>('order_status', value);

  DateTime? get timestamp => getField<DateTime>('timestamp');
  set timestamp(DateTime? value) => setField<DateTime>('timestamp', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  double? get deliveryFee => getField<double>('delivery_fee');
  set deliveryFee(double? value) => setField<double>('delivery_fee', value);

  String? get postalCarrier => getField<String>('postal_carrier');
  set postalCarrier(String? value) => setField<String>('postal_carrier', value);

  String? get qrCodeImgPath => getField<String>('qr_code_img_path');
  set qrCodeImgPath(String? value) =>
      setField<String>('qr_code_img_path', value);

  String? get pickupLocationLatlon =>
      getField<String>('pickup_location_latlon');
  set pickupLocationLatlon(String? value) =>
      setField<String>('pickup_location_latlon', value);

  bool get isDriverAssigned => getField<bool>('is_driver_assigned')!;
  set isDriverAssigned(bool value) =>
      setField<bool>('is_driver_assigned', value);

  List<String> get driverRejectedList =>
      getListField<String>('driver_rejected_list');
  set driverRejectedList(List<String>? value) =>
      setListField<String>('driver_rejected_list', value);

  double? get pickupDistance => getField<double>('pickup_distance');
  set pickupDistance(double? value) =>
      setField<double>('pickup_distance', value);

  String? get pickupAddress1 => getField<String>('pickup_address1');
  set pickupAddress1(String? value) =>
      setField<String>('pickup_address1', value);

  String? get pickupAddress2 => getField<String>('pickup_address2');
  set pickupAddress2(String? value) =>
      setField<String>('pickup_address2', value);

  int? get pickupZip => getField<int>('pickup_zip');
  set pickupZip(int? value) => setField<int>('pickup_zip', value);

  String? get trackingNumber => getField<String>('tracking_number');
  set trackingNumber(String? value) =>
      setField<String>('tracking_number', value);

  DateTime? get driverRequestedTimestamp =>
      getField<DateTime>('driver_requested_timestamp');
  set driverRequestedTimestamp(DateTime? value) =>
      setField<DateTime>('driver_requested_timestamp', value);

  String? get driverLocationLatlon =>
      getField<String>('driver_location_latlon');
  set driverLocationLatlon(String? value) =>
      setField<String>('driver_location_latlon', value);

  int? get dropoffLocationId => getField<int>('dropoff_location_id');
  set dropoffLocationId(int? value) =>
      setField<int>('dropoff_location_id', value);

  String? get dropoffLocationLatlon =>
      getField<String>('dropoff_location_latlon');
  set dropoffLocationLatlon(String? value) =>
      setField<String>('dropoff_location_latlon', value);

  bool? get custHasBeenDistanceNotified =>
      getField<bool>('cust_has_been_distance_notified');
  set custHasBeenDistanceNotified(bool? value) =>
      setField<bool>('cust_has_been_distance_notified', value);

  double? get driverDistanceFromPickup =>
      getField<double>('driver_distance_from_pickup');
  set driverDistanceFromPickup(double? value) =>
      setField<double>('driver_distance_from_pickup', value);

  double? get driverDistanceFromDropoff =>
      getField<double>('driver_distance_from_dropoff');
  set driverDistanceFromDropoff(double? value) =>
      setField<double>('driver_distance_from_dropoff', value);

  bool? get isRefunded => getField<bool>('is_refunded');
  set isRefunded(bool? value) => setField<bool>('is_refunded', value);

  String? get driverLocationGeography =>
      getField<String>('driver_location_geography');
  set driverLocationGeography(String? value) =>
      setField<String>('driver_location_geography', value);

  String? get pickupLocationGeography =>
      getField<String>('pickup_location_geography');
  set pickupLocationGeography(String? value) =>
      setField<String>('pickup_location_geography', value);

  bool? get isContactless => getField<bool>('is_contactless');
  set isContactless(bool? value) => setField<bool>('is_contactless', value);

  int? get amtOfBags => getField<int>('amt_of_bags');
  set amtOfBags(int? value) => setField<int>('amt_of_bags', value);

  String? get itemImgPath => getField<String>('item_img_path');
  set itemImgPath(String? value) => setField<String>('item_img_path', value);

  dynamic? get pickupLocationLatlonJson =>
      getField<dynamic>('pickup_location_latlon_json');
  set pickupLocationLatlonJson(dynamic? value) =>
      setField<dynamic>('pickup_location_latlon_json', value);

  dynamic? get dropoffLocationLatlonJson =>
      getField<dynamic>('dropoff_location_latlon_json');
  set dropoffLocationLatlonJson(dynamic? value) =>
      setField<dynamic>('dropoff_location_latlon_json', value);
}
