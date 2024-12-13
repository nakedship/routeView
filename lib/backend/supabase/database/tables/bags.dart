import '../database.dart';

class BagsTable extends SupabaseTable<BagsRow> {
  @override
  String get tableName => 'bags';

  @override
  BagsRow createRow(Map<String, dynamic> data) => BagsRow(data);
}

class BagsRow extends SupabaseDataRow {
  BagsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BagsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get bagQrCodeId => getField<int>('bag_qr_code_id');
  set bagQrCodeId(int? value) => setField<int>('bag_qr_code_id', value);

  int? get orderId => getField<int>('order_id');
  set orderId(int? value) => setField<int>('order_id', value);

  String? get processedShippingLabelImgPath =>
      getField<String>('processed_shipping_label_img_path');
  set processedShippingLabelImgPath(String? value) =>
      setField<String>('processed_shipping_label_img_path', value);

  String? get preProcessedShippingLabelImgPath =>
      getField<String>('pre_processed_shipping_label_img_path');
  set preProcessedShippingLabelImgPath(String? value) =>
      setField<String>('pre_processed_shipping_label_img_path', value);

  String? get stickerNumberVisibleId =>
      getField<String>('sticker_number_visible_id');
  set stickerNumberVisibleId(String? value) =>
      setField<String>('sticker_number_visible_id', value);
}
