import 'package:changin/utils/helper/logger.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/widgets/textformfield.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class AddServicePage extends HookWidget {
  const AddServicePage({super.key});

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
              'Place Order',
              style: Style.textStyles.poppins(),
            )),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Style.colors.black),
        backgroundColor: Style.colors.white,
        elevation: 0,
        title: Text(
          'Book Your Service',
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
            SizedBox(
              height: 11.h,
              child: EasyDateTimeLine(
                itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
                    isSelected) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0.sp),
                    child: Container(
                      height: 15.h,
                      width: 16.w,
                      decoration: Style.customDecoration.buildCustomNotch1(
                          color: isSelected
                              ? Style.colors.primaryfade
                              : Style.colors.grey.withOpacity(.10),
                          radius: 10.sp,
                          borderColor: isSelected
                              ? Style.colors.primary.withOpacity(0.3)
                              : Style.colors.white,
                          fill: true),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              monthName,
                              style: Style.textStyles.poppins(
                                  color: isSelected
                                      ? Style.colors.black
                                      : Style.colors.black,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              dayNumber,
                              style: Style.textStyles.poppins(
                                  color: isSelected
                                      ? Style.colors.black
                                      : Style.colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                          ]),
                    ),
                  );
                },
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  logger.w(selectedDate);
                },
                headerProps: EasyHeaderProps(
                  showHeader: false,
                  monthStyle: Style.textStyles.poppins(
                      color: Style.colors.primary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600),
                  selectedDateStyle: Style.textStyles.poppins(
                      color: Style.colors.primary,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600),
                  monthPickerType: MonthPickerType.switcher,
                  selectedDateFormat: SelectedDateFormat.fullDateDMY,
                ),
                dayProps: EasyDayProps(
                  activeDayNumStyle: Style.textStyles.poppins(
                      color: Style.colors.primary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                  activeDayStrStyle: Style.textStyles.poppins(
                      color: Style.colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w900),
                  inactiveDayNumStyle: Style.textStyles.poppins(
                      color: Style.colors.primary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                  height: 10.h,
                  todayHighlightColor: Style.colors.primary,
                  borderColor: Style.colors.primary,
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                      decoration: Style.customDecoration.buildBoxDecoration(
                          color: Style.colors.white, radius: 10.sp)),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Select Time',
              style: Style.textStyles.poppins(
                fontSize: 12.sp,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    inputType: TextInputType.datetime,
                    controller: TextEditingController(
                        text: _startTime.value.format(context)),
                    hintText: 'Start Time',
                    hasError: ValueNotifier(false),
                    isValid: true,
                    suffix: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        _selectTime(context, true);
                      },
                      child: Icon(
                        Icons.calendar_month,
                        color: Style.colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                  child: CustomTextField(
                    inputType: TextInputType.datetime,
                    controller: TextEditingController(
                        text: _endTime.value.format(context)),
                    hintText: 'End Time',
                    hasError: ValueNotifier(false),
                    isValid: true,
                    suffix: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        _selectTime(context, false);
                      },
                      child: Icon(
                        Icons.calendar_month,
                        color: Style.colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Select your services',
              style: Style.textStyles.poppins(
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 1.2.h,
            ),
            DropdownButtonFormField<String>(
              value: selectedService.value,
              decoration: Style.customDecoration
                  .buildTextfieldDcoration(hintext: 'Select Service'),
              items: services.value.map((String service) {
                return DropdownMenuItem<String>(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              onChanged: (newValue) {
                selectedService.value = newValue!;
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select a service';
                }
                return null;
              },
            ),
            SizedBox(height: 2.h),
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
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
