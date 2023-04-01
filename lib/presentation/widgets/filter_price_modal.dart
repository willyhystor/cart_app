import 'package:cart_app/presentation/widgets/modal_tip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPriceModal extends StatefulWidget {
  final int minPrice;

  const FilterPriceModal({
    super.key,
    required this.minPrice,
  });

  @override
  State<FilterPriceModal> createState() => _FilterPriceModalState();
}

class _FilterPriceModalState extends State<FilterPriceModal> {
  final _minPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _minPriceController.text = widget.minPrice.toString();
  }

  @override
  void dispose() {
    _minPriceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ModalTip(),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Get.back(result: 0),
              child: Text(
                'filter_reset'.tr,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            // mainAxisAlignment: MainAxisAlignment.left,
            children: [
              Text('${'filter_min_price'.tr}: '),
              const SizedBox(width: 8),
              const Text('\$'),
              const SizedBox(width: 4),
              Container(
                height: 40,
                width: 80,
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.withOpacity(0.25),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _minPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '50',
                  ),
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.left,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _minPriceController
                        ..text = '0'
                        ..selection = TextSelection.fromPosition(TextPosition(
                            offset: _minPriceController.text.length));
                    } else {
                      _minPriceController
                        ..text = int.parse(value).toString()
                        ..selection = TextSelection.fromPosition(TextPosition(
                            offset: _minPriceController.text.length));
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () =>
                    Get.back(result: int.parse(_minPriceController.text)),
                child: Text('apply'.tr),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
