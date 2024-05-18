import 'package:changin/utils/style/style.dart';
import 'package:changin/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';
import 'package:dotted_border/dotted_border.dart';

class AddPropertiesPage extends HookWidget {
  int isClass;
  AddPropertiesPage({required this.isClass, super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = useTextEditingController();
    final orderNotesController = useTextEditingController();
    final mobileNumberController = useTextEditingController();
    final ValueNotifier<List<String>> services = useState([
      'Plumbing',
      'Grass Cleaning',
      'Electrical Work',
      'House Painting',
      'Car Repair',
    ]);
    ValueNotifier<String>? selectedService =
        useState(services.value.map((e) => e).first);
    ValueNotifier<TimeOfDay> _startTime =
        useState(const TimeOfDay(hour: 12, minute: 0));
    ValueNotifier<TimeOfDay> _endTime =
        useState(const TimeOfDay(hour: 12, minute: 0));

    Future<void> _selectTime(BuildContext context, bool isStartTime) async {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: isStartTime
            ? (_startTime.value ?? TimeOfDay.now())
            : (_endTime.value ?? TimeOfDay.now()),
      );
      if (picked != null) {
        if (isStartTime) {
          _startTime.value = picked;
        } else {
          _endTime.value = picked;
        }
      }
    }

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 9.w),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.green),
                fixedSize: MaterialStatePropertyAll(Size(100.w, 6.h))),
            onPressed: () {},
            child: Text(
              'Submit',
              style: Style.textStyles.poppins(),
            )),
      ),
      appBar: AppBar(
        backgroundColor: Style.colors.white,
        elevation: 0,
        leading: const Icon(null),
        leadingWidth: 0.w,
        title: Text(
          '${isClass == 1 ? 'Add' : 'Edit'} Your Properties',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: ListView(
          children: [
            SizedBox(
              height: 1.h,
            ),
            DottedBorder(
              dashPattern: const [8, 4],
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              padding: EdgeInsets.all(6.sp),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: 17.h,
                  width: 100.w,
                  color: Colors.grey.withOpacity(0.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Style.colors.white,
                        size: 25.sp,
                      ),
                      Text(
                        'Upload Images',
                        style: Style.textStyles.poppins(
                            color: Style.colors.white, fontSize: 13.sp),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Please fill your work location and other details*',
              style: Style.textStyles.poppins(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 0.5.h),
            CustomTextField(
                controller: addressController,
                hintText: 'Address',
                hasError: ValueNotifier(false),
                isValid: true),
            SizedBox(
              height: 1.h,
            ),
            CustomTextField(
                controller: mobileNumberController,
                hintText: 'Mobile Number',
                hasError: ValueNotifier(false),
                isValid: true),
            SizedBox(
              height: 1.h,
            ),
            CustomTextField(
                controller: orderNotesController,
                hintText: 'Order Notes',
                hasError: ValueNotifier(false),
                maxLines: 4,
                isValid: true),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
