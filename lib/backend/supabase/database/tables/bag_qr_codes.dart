import '../database.dart';

class BagQrCodesTable extends SupabaseTable<BagQrCodesRow> {
  @override
  String get tableName => 'bag_qr_codes';

  @override
  BagQrCodesRow createRow(Map<String, dynamic> data) => BagQrCodesRow(data);
}

class BagQrCodesRow extends SupabaseDataRow {
  BagQrCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BagQrCodesTable();

  int get bagQrCodeId => getField<int>('bag_qr_code_id')!;
  set bagQrCodeId(int value) => setField<int>('bag_qr_code_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get driverId => getField<int>('driver_id');
  set driverId(int? value) => setField<int>('driver_id', value);

  bool? get isUsed => getField<bool>('is_used');
  set isUsed(bool? value) => setField<bool>('is_used', value);

  String? get qrCodeImgPath => getField<String>('qr_code_img_path');
  set qrCodeImgPath(String? value) =>
      setField<String>('qr_code_img_path', value);
}
