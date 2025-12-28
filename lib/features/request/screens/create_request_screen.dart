import 'package:flutter/material.dart';
import 'package:fso/core/constants/spacings.dart';
import 'package:fso/core/widgets/button.dart';
import 'package:fso/features/request/screens/submit_request_screen.dart';

import '../../../core/constants/categories.dart';
import '../../../core/constants/colors.dart';

class CreateRequestScreen extends StatefulWidget {
  final String? category;
  const CreateRequestScreen({super.key, this.category});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  String? category;
  String? subCategory;
  TextEditingController notes = TextEditingController();

  @override
  void initState() {
    category = widget.category;
    notes.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.kScaffoldColor,
        appBar: AppBar(
          backgroundColor: AppColors.kAppBarColor,
          title: const Text(
            'Step 1 of 2',
            style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleSpacing: 24.0,
          centerTitle: true,
          shape: const Border(
            bottom: BorderSide(
              width: 2.0,
              color: AppColors.kLightGreyColor,
            ),
          ),
        ),
        body: Padding(
          padding: AppSpacings.horizontal,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 20.0),
                    const Text(
                      'Create a Request',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFCCCACA),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButton<String>(
                        items: ServiceCategory.categories.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {
                          setState(() {
                            subCategory = null;
                            category = _;
                          });
                        },
                        borderRadius: BorderRadius.circular(8.0),
                        elevation: 0,
                        underline: const SizedBox(),
                        value: category,
                        hint: const Text(
                          'Select Service Category',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: AppColors.kGreyColor,
                          ),
                        ),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.expand_more,
                          color: Color(0xFFCCCACA),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFCCCACA),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButton<String>(
                        items: ServiceCategory.subCategories[category]?.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {
                          setState(() {
                            subCategory = _;
                          });
                        },
                        borderRadius: BorderRadius.circular(8.0),
                        elevation: 0,
                        underline: const SizedBox(),
                        value: subCategory,
                        hint: const Text(
                          'Select Service Sub-Category',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0,
                            color: AppColors.kGreyColor,
                          ),
                        ),
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.expand_more,
                          color: Color(0xFFCCCACA),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                      controller: notes,
                      decoration: InputDecoration(
                        hintText: 'Notes',
                        hintStyle: const TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.0,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                        isDense: true,
                      ),
                    ),
                  ],
                ),
              ),
              FSOButton(
                buttonText: 'Next',
                disabled: category == null || subCategory == null,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubmitRequestScreen(
                        category: category!,
                        subCategory: subCategory!,
                        notes: notes.text.trim(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
