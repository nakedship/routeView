import '../database.dart';

class OrderItemsTable extends SupabaseTable<OrderItemsRow> {
  @override
  String get tableName => 'order_items';

  @override
  OrderItemsRow createRow(Map<String, dynamic> data) => OrderItemsRow(data);
}

class OrderItemsRow extends SupabaseDataRow {
  OrderItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get orderId => getField<int>('order_id')!;
  set orderId(int value) => setField<int>('order_id', value);

  String get productName => getField<String>('product_name')!;
  set productName(String value) => setField<String>('product_name', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int? get bagId => getField<int>('bag_id');
  set bagId(int? value) => setField<int>('bag_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get bagQrCodeId => getField<int>('bag_qr_code_id');
  set bagQrCodeId(int? value) => setField<int>('bag_qr_code_id', value);
}
