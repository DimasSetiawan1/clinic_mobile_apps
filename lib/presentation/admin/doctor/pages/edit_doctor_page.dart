import 'dart:developer';

import 'package:clinic_mobile_apps/core/components/custom_pick_image.dart';
import 'package:clinic_mobile_apps/core/components/custom_radio.dart';
import 'package:clinic_mobile_apps/core/components/custom_select_date.dart';
import 'package:clinic_mobile_apps/core/constants/global_variable.dart';
import 'package:clinic_mobile_apps/core/extensions/string_ext.dart';
import 'package:clinic_mobile_apps/core/extensions/time_ext.dart';
import 'package:clinic_mobile_apps/data/models/request/doctor_request_model.dart';
import 'package:clinic_mobile_apps/data/models/response/doctor_response_model.dart';
import 'package:clinic_mobile_apps/data/models/specialist_model.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/blocs/edit_doctor/edit_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/blocs/get_specialist_doctor/specalist_doctor_bloc.dart';
import 'package:clinic_mobile_apps/presentation/admin/doctor/pages/admin_doctor_page.dart';
import 'package:clinic_mobile_apps/presentation/admin/home/pages/admin_main_page.dart';
import 'package:clinic_mobile_apps/presentation/doctor/home/pages/doctor_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinic_mobile_apps/core/components/buttons.dart';
import 'package:clinic_mobile_apps/core/components/custom_text_field.dart';
import 'package:clinic_mobile_apps/core/components/custom_text_field_height.dart';
import 'package:clinic_mobile_apps/core/components/spaces.dart';
import 'package:clinic_mobile_apps/core/constants/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditDoctorPage extends StatefulWidget {
  final User doctor;
  const EditDoctorPage({super.key, required this.doctor});

  @override
  State<EditDoctorPage> createState() => _EditDoctorPageState();
}

class _EditDoctorPageState extends State<EditDoctorPage> {
  final GlobalKey<FormState> _doctorFormKey = GlobalKey<FormState>();
  String? _selectedGender;

  TextEditingController? _nameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _sertifikasiController;
  TextEditingController? _telemedisFeeController;
  TextEditingController? _chatPremiumController;
  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  //ignore: unused_field
  XFile? imageFile;
  SpecialistModel? _selectedSpecialation;
  bool _visible = false;
  @override
  void dispose() {
    _nameController?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    _sertifikasiController?.dispose();
    _telemedisFeeController?.dispose();
    _chatPremiumController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.doctor.name);
    _emailController = TextEditingController(text: widget.doctor.email);
    _passwordController = TextEditingController();
    _sertifikasiController = TextEditingController(
      text: widget.doctor.certification,
    );
    _telemedisFeeController = TextEditingController(
      text: "${widget.doctor.telemedicineFee ?? 0}",
    );
    _chatPremiumController = TextEditingController(
      text: "${widget.doctor.chatFee ?? 0}",
    );
    context.read<SpecalistDoctorBloc>().add(
      SpecalistDoctorEvent.getSpecalist(),
    );
    super.initState();
  }

  void _selectTime(BuildContext context, bool isStart) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          isStart ? _startTime ?? TimeOfDay.now() : _endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  String? _selectedStatus;

  void _updateGender(String? gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void _updateStatus(String? status) {
    setState(() {
      _selectedStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff1469F0),
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      bottomNavigationBar: Container(
        height: 52,
        margin: const EdgeInsets.all(20),
        width: context.deviceWidth,
        child: BlocConsumer<EditDoctorBloc, EditDoctorState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              success: (doctor) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text(doctor),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                });
              },
              loading: () => CircularProgressIndicator(),
              error: (message) {
                log(message);
                return context.showSnackBar(message, Colors.red);
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Button.filled(
                  height: 48,
                  onPressed: () {
                    if (_telemedisFeeController?.text == "0" &&
                        _chatPremiumController?.text == "0") {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Fee tidak boleh 0.')),
                        );
                      }
                    }
                    if (_doctorFormKey.currentState != null &&
                        _doctorFormKey.currentState!.validate()) {
                      final DoctorRequestModel data = DoctorRequestModel(
                        id: widget.doctor.id,
                        clinicId: widget.doctor.clinicId,
                        name: _nameController!.text,
                        email: _emailController!.text,
                        password: _passwordController!.text,
                        certification: _sertifikasiController!.text,
                        gender: _selectedGender!,
                        status: _selectedStatus!,
                        telemedicineFee:
                            _telemedisFeeController!.text.toIntegerFromText,
                        chatFee: _chatPremiumController!.text.toIntegerFromText,
                        startTime: _startTime!.timeOfDayToString,
                        endTime: _endTime!.timeOfDayToString,
                        specialistId: _selectedSpecialation!.id!,
                        image: imageFile,
                      );
                      context.read<EditDoctorBloc>().add(
                        EditDoctorEvent.editDataDoctor(data),
                      );
                    } else {
                      context.showSnackBar(
                        'Formulir tidak valid. Silahkan cek kembali isian formulir.',
                        Colors.orangeAccent,
                      );
                    }
                  },
                  label: 'Simpan',
                  fontSize: 16.0,
                );
              },
              loading: () {
                return Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.secondary, Color(0xff1469F0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    ),
                  ),
                  SpaceWidth(context.deviceWidth * 0.2),
                  const Text(
                    "Edit Dokter",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(24),
            Form(
              key: _doctorFormKey,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                width: context.deviceWidth,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nama Dokter",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    CustomTextField(
                      controller: _nameController!,
                      label: 'Masukkan nama Dokter',
                      textInputAction: TextInputAction.next,
                    ),
                    const SpaceHeight(16),
                    const Text(
                      "Email Dokter",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    CustomTextField(
                      controller: _emailController!,
                      label: 'Masukkan email Dokter',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SpaceHeight(16),
                    const Text(
                      "Password Dokter",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    CustomTextField(
                      controller: _passwordController!,
                      label: 'Masukkan Password Dokter',
                      textInputAction: TextInputAction.next,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                        icon:
                            _visible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                      ),
                      // keyboardType: ,
                      obscureText: !_visible,
                    ),
                    const SpaceHeight(16),
                    const Text(
                      "Sertifikasi",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    CustomTextFieldHeight(
                      controller: _sertifikasiController!,
                      label: 'Masukkan Sertifikasi',
                    ),
                    const SpaceHeight(16),
                    buildRadioOptions(
                      'Jenis Kelamin',
                      ['Pria', 'Wanita'],
                      _selectedGender,
                      _updateGender,
                    ),
                    const SpaceHeight(16),
                    buildRadioOptions(
                      'Status Dokter',
                      ['Aktif', 'Inactive'],
                      _selectedStatus,
                      _updateStatus,
                    ),
                    const SpaceHeight(16),
                    const Text(
                      "Spesialisasi",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    BlocBuilder<SpecalistDoctorBloc, SpecalistDoctorState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return SizedBox.shrink();
                          },
                          loading: () {
                            return Center(child: CircularProgressIndicator());
                          },
                          success: (doctor) {
                            _selectedSpecialation = doctor.firstWhere(
                              (specialist) =>
                                  specialist.id == _selectedSpecialation?.id,
                              orElse: () => doctor.first,
                            );
                            return DropdownButtonFormField<SpecialistModel>(
                              validator:
                                  (value) =>
                                      value == null
                                          ? 'Field is required'
                                          : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(width: 2),
                                ),
                              ),
                              hint: const Text(
                                "Pilih Spesialisasi",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff677294),
                                ),
                              ),
                              isExpanded: true,
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  _selectedSpecialation = newValue;
                                  setState(() {});
                                }
                              },
                              items:
                                  doctor.map<DropdownMenuItem<SpecialistModel>>(
                                    (SpecialistModel specialation) {
                                      return DropdownMenuItem<SpecialistModel>(
                                        value: specialation,
                                        child: Text(
                                          specialation.name!,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff677294),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                            );
                          },
                        );
                      },
                    ),
                    const SpaceHeight(16),
                    const Text(
                      "Tarif Telemedis",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    CustomTextField(
                      controller: _telemedisFeeController!,
                      label: 'Masukkan tarif telemedis ',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        final int priceValue = value.toIntegerFromText;
                        _telemedisFeeController!.text =
                            priceValue.toString().currencyFormatRpV2;
                        // _telemedisFeeController!.text = priceValue.toString();
                        _telemedisFeeController!
                            .selection = TextSelection.fromPosition(
                          TextPosition(
                            offset: _telemedisFeeController!.text.length,
                          ),
                        );
                      },
                    ),
                    const SpaceHeight(16),
                    const Text(
                      "Tarif Chat Premium",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    CustomTextField(
                      controller: _chatPremiumController!,
                      label: 'Masukkan tarif chat premium',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        final int priceValue = value.toIntegerFromText;
                        _chatPremiumController!.text =
                            priceValue.toString().currencyFormatRpV2;
                        _chatPremiumController!
                            .selection = TextSelection.fromPosition(
                          TextPosition(
                            offset: _chatPremiumController!.text.length,
                          ),
                        );
                      },
                    ),
                    const SpaceHeight(16),
                    const Text(
                      "Jadwal Praktik",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SpaceHeight(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTimeField(
                            // doctorFormKey: _doctorFormKey,
                            isStart: true,
                            startTime: _startTime,
                            endTime: _endTime,
                            selectTime: _selectTime,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTimeField(
                            isStart: false,
                            startTime: _startTime,
                            endTime: _endTime,
                            selectTime: _selectTime,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(16),
                    widget.doctor.image != null
                        ? widget.doctor.image.toString().contains('http')
                            ? Padding(
                              padding: EdgeInsets.all(16),
                              child: Image.network(
                                widget.doctor.image!,
                                fit: BoxFit.cover,
                              ),
                            )
                            : Padding(
                              padding: EdgeInsets.all(16),
                              child: Image.network(
                                dotenv.env['BASE_URL']! + widget.doctor.image!,
                                fit: BoxFit.cover,
                              ),
                            )
                        : CustomPickImage(
                          onChanged: (file) {
                            if (file == null) {
                              return;
                            }
                            imageFile = file;
                          },
                        ),
                    const SpaceHeight(24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
