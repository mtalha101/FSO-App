import 'package:flutter/material.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/features/home/widgets/date_time_widget.dart';
import 'package:fso/features/home/widgets/droopdown_widget.dart';
import 'package:fso/features/home/widgets/image_picker_widget.dart';

import '../../../core/widgets/textfield.dart';
import '../utils/input_data.dart';

class InputBuilderWidget extends StatelessWidget {
  final InputData data;
  final String subCategory;
  const InputBuilderWidget({
    super.key,
    required this.subCategory,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if (subCategory == 'Booking Courses and Institutes') {
      return BookingCoursesAndInstitutes(data: data);
    }
    if (subCategory == 'Private teachers in all Majors') {
      return PrivateTeachersInAllMajors(data: data);
    }
    if (subCategory == 'Hotels reservation') {
      return HotelReservation(data: data);
    }
    if (subCategory == 'Booking Airline Tickets') {
      return BookingAirlineTickets(data: data);
    }
    if (subCategory == 'Umrah Visa (Electronic Visa)') {
      return UmrahVisa(data: data);
    }
    if (subCategory == 'Balance Recharging') {
      return BalanceRecharging(data: data);
    }
    if (subCategory == 'Issuance SIM-Card') {
      return IssuanceSIMCard(data: data);
    }
    if (subCategory == 'Balance Transfer') {
      return BalanceTransfer(data: data);
    }
    if (subCategory == 'Cars Rent') {
      return CarsRent(data: data);
    }
    if (subCategory == 'Issuance of Driving Licenses') {
      return IssuanceOfDrivingLicenses(data: data);
    }
    if (subCategory == 'Traffic violations Payment') {
      return TrafficViolationsPayment(data: data);
    }
    if (subCategory == 'Cars repairing') {
      return CarsRepairing(data: data);
    }
    if (subCategory == 'Pulling cars (Crane)') {
      return PullingCars(data: data);
    }
    if (subCategory == 'Hire a driver with a monthly or daily fee') {
      return HireDriverWithMonthlyOrDailyFee(data: data);
    }
    if (subCategory == 'Doctors Recommendation') {
      return DoctorsRecommendation(data: data);
    }
    if (subCategory == 'PCR Examination') {
      return PCRExamination(data: data);
    }
    if (subCategory == 'Corona Vaccine Certificate (Vaccination)') {
      return CoronaVaccineCertificate(data: data);
    }
    if (subCategory == 'Transferring Data from Old to New Passport') {
      return TransferringDataFromOldToNewPassport(data: data);
    }
    if (subCategory == 'Issuing New Passport') {
      return IssuingNewPassport(data: data);
    }
    if (subCategory == 'Embassies Stamps') {
      return EmbassiesStamps(data: data);
    }
    if (subCategory == 'Issuing a Replacement Passport') {
      return IssuingReplacementPassport(data: data);
    }
    if (subCategory == 'Embassy Authorization') {
      return EmbassyAuthorization(data: data);
    }
    if (subCategory == 'Address Verification') {
      return AddressVerification(data: data);
    }
    if (subCategory == 'Arrival Stamp') {
      return ArrivalStamp(data: data);
    }
    if (subCategory ==
        'Translating Legal Contracts (marriage - birth certificates - agencies)') {
      return TranslatingLegalContracts(data: data);
    }
    if (subCategory == 'Residence Card (6 months)') {
      return ResidenceRenewal(data: data);
    }
    if (subCategory == 'Annual Residence (student)') {
      return ResidenceRenewal(data: data);
    }
    if (subCategory == 'Work Residence') {
      return ResidenceRenewal(data: data);
    }
    if (subCategory == 'Airport Facilities (Arrival and Departure)') {
      return AirportFacilitiesArrivalAndDeparture(data: data);
    }
    if (subCategory == 'VIP Services (Arrival and Departure)') {
      return AirportFacilitiesArrivalAndDeparture(data: data);
    }
    if (subCategory == 'Security Approval') {
      return SecurityApproval(data: data);
    }
    if (subCategory == 'Transfer from\\to the Airport') {
      return TransferFromToAirport(data: data);
    }
    if (subCategory ==
        'Hire Maids (cooking - cleaning) with monthly or daily fee') {
      return HireMaids(data: data);
    }
    return const SizedBox();
  }
}

class AirportFacilitiesArrivalAndDeparture extends StatelessWidget {
  final InputData data;
  const AirportFacilitiesArrivalAndDeparture({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Passport',
          onChanged: (_) {
            data.passport = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Travel ticket',
          onChanged: (_) {
            data.travelTicket = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Number of people',
          onChanged: (_) {
            data.numOfPeople = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        const Text(
          'Note: The customer is notified to Take responsibility of the cost',
          style: TextStyle(
            color: AppColors.kGreyColor,
          ),
        ),
      ],
    );
  }
}

class SecurityApproval extends StatelessWidget {
  final InputData data;
  const SecurityApproval({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        ImagePickerWidget(
          hintText: 'Travel Ticket',
          onImagesSelected: (_) {
            data.travelTicketImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSODropdownWidget(
          hintText: 'Type of Approval',
          options: const ['1 day', '3-4 days', '7-8 days', '14-18 days'],
          onChanged: (_) {
            data.approvalType = _!;
          },
        ),
      ],
    );
  }
}

class TransferFromToAirport extends StatelessWidget {
  final InputData data;
  const TransferFromToAirport({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: FSOTextField(
                hintText: 'From',
                onChanged: (_) {
                  data.fromAirport = _.trim();
                },
              ),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: FSOTextField(
                hintText: 'To',
                onChanged: (_) {
                  data.toAirport = _.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        FSODateWidget(
          onDateChanged: (_, val) {
            data.arrivalDate = val;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTimeWidget(
          onTimeChanged: (_, val) {
            data.arrivalTime = val;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Number of people',
          onChanged: (_) {
            data.numOfPeople = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Number of bag',
          onChanged: (_) {
            data.numOfBags = _.trim();
          },
        ),
      ],
    );
  }
}

class ArrivalStamp extends StatelessWidget {
  final InputData data;
  const ArrivalStamp({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Location',
          onChanged: (_) {
            data.location = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Address',
          onChanged: (_) {
            data.address = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSODateWidget(
          onDateChanged: (_, val) {
            data.selectedDate = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTimeWidget(
          onTimeChanged: (_, val) {
            data.selectedTime = _;
          },
        ),
      ],
    );
  }
}

class TranslatingLegalContracts extends StatelessWidget {
  final InputData data;
  const TranslatingLegalContracts({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Location',
          onChanged: (_) {
            data.location = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Address',
          onChanged: (_) {
            data.address = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSODateWidget(
          onDateChanged: (_, val) {
            data.selectedDate = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTimeWidget(
          onTimeChanged: (_, val) {
            data.selectedTime = _;
          },
        ),
        const SizedBox(height: 24.0),
        const Text('Language'),
        const SizedBox(height: 12.0),
        Row(
          children: [
            Expanded(
              child: FSOTextField(
                hintText: 'From',
                onChanged: (_) {
                  data.fromLanguage = _.trim();
                },
              ),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: FSOTextField(
                hintText: 'To',
                onChanged: (_) {
                  data.toLanguage = _.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Number of pages',
          onChanged: (_) {
            data.numOfPages = _.trim();
          },
        ),
      ],
    );
  }
}

class TransferringDataFromOldToNewPassport extends StatelessWidget {
  final InputData data;
  const TransferringDataFromOldToNewPassport({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Location',
          onChanged: (_) {
            data.location = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Address',
          onChanged: (_) {
            data.address = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSODateWidget(
          onDateChanged: (_, val) {
            data.selectedDate = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTimeWidget(
          onTimeChanged: (_, val) {
            data.selectedTime = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Number of people',
          onChanged: (_) {
            data.numOfPeople = _.trim();
          },
        ),
      ],
    );
  }
}

class IssuingNewPassport extends StatelessWidget {
  final InputData data;
  const IssuingNewPassport({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Old Passport',
          onChanged: (_) {
            data.oldPassport = _.trim();
          },
        ),
      ],
    );
  }
}

class EmbassiesStamps extends StatelessWidget {
  final InputData data;
  const EmbassiesStamps({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Documents to be stamped',
          onChanged: (_) {
            data.docToStamp = _.trim();
          },
        ),
      ],
    );
  }
}

class IssuingReplacementPassport extends StatelessWidget {
  final InputData data;
  const IssuingReplacementPassport({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Birth Certificate',
          onChanged: (_) {
            data.docToStamp = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Old Passport',
          onChanged: (_) {
            data.docToStamp = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Birth Certificate',
          onChanged: (_) {
            data.docToStamp = _.trim();
          },
        ),
      ],
    );
  }
}

class EmbassyAuthorization extends StatelessWidget {
  final InputData data;
  const EmbassyAuthorization({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Passport',
          onChanged: (_) {
            data.passport = _.trim();
          },
        ),
      ],
    );
  }
}

class AddressVerification extends StatelessWidget {
  final InputData data;
  const AddressVerification({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Lease Contract',
          onChanged: (_) {
            data.leaseContract = _.trim();
          },
        ),
      ],
    );
  }
}

class DoctorsRecommendation extends StatelessWidget {
  final InputData data;
  const DoctorsRecommendation({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        ImagePickerWidget(
          hintText: 'Medical Report',
          onImagesSelected: (_) {
            data.medicalReportImages = _;
          },
        ),
      ],
    );
  }
}

class PCRExamination extends StatelessWidget {
  final InputData data;
  const PCRExamination({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
      ],
    );
  }
}

class CoronaVaccineCertificate extends StatelessWidget {
  final InputData data;
  const CoronaVaccineCertificate({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
      ],
    );
  }
}

class CarsRent extends StatefulWidget {
  final InputData data;
  const CarsRent({
    super.key,
    required this.data,
  });

  @override
  State<CarsRent> createState() => _CarsRentState();
}

class _CarsRentState extends State<CarsRent> {
  int radioSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSODateWidget(
          hintText: 'Start Date',
          onDateChanged: (_, val) {
            widget.data.startDate = val;
          },
        ),
        const SizedBox(height: 24.0),
        FSODateWidget(
          hintText: 'End Date',
          onDateChanged: (_, val) {
            widget.data.endDate = val;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Location',
          onChanged: (_) {
            widget.data.location = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Address',
          onChanged: (_) {
            widget.data.address = _.trim();
          },
        ),
        if (radioSelected == 2) ...[
          const SizedBox(height: 24.0),
          FSOTextField(
            hintText: 'License',
            onChanged: (_) {
              widget.data.numOfPeople = _.trim();
            },
          ),
        ],
        const SizedBox(height: 24.0),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: radioSelected,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        radioSelected = value!;
                        widget.data.withDriver = 'Yes';
                      });
                    },
                  ),
                  const SizedBox(width: 8.0),
                  const Text('With Driver'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: radioSelected,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        radioSelected = value!;
                        widget.data.withDriver = 'No';
                      });
                    },
                  ),
                  const SizedBox(width: 8.0),
                  const Text('Without Driver'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class IssuanceOfDrivingLicenses extends StatelessWidget {
  final InputData data;
  const IssuanceOfDrivingLicenses({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        ImagePickerWidget(
          hintText: 'Old Driving Licenses (Optional)',
          onImagesSelected: (_) {
            data.drivingLicensesImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        ImagePickerWidget(
          hintText: 'Personal Photo',
          onImagesSelected: (_) {
            data.personalPhotoImages = _;
          },
        ),
      ],
    );
  }
}

class TrafficViolationsPayment extends StatelessWidget {
  final InputData data;
  const TrafficViolationsPayment({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        ImagePickerWidget(
          hintText: 'Car Licenses',
          onImagesSelected: (_) {
            data.carLicenseImages = _;
          },
        ),
      ],
    );
  }
}

class HireDriverWithMonthlyOrDailyFee extends StatelessWidget {
  final InputData data;
  const HireDriverWithMonthlyOrDailyFee({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSODateWidget(
          hintText: 'From',
          onDateChanged: (_, val) {
            data.startDate = val;
          },
        ),
        const SizedBox(height: 24.0),
        FSODateWidget(
          hintText: 'To',
          onDateChanged: (_, val) {
            data.endDate = val;
          },
        ),
      ],
    );
  }
}

class CarsRepairing extends StatelessWidget {
  final InputData data;
  const CarsRepairing({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Car Licenses',
          onChanged: (_) {
            data.carLicenses = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Driver Licenses',
          onChanged: (_) {
            data.drivingLicenses = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        const Text(
          'Contact us at: +201500000438',
        ),
      ],
    );
  }
}

class PullingCars extends StatelessWidget {
  final InputData data;
  const PullingCars({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Car Address',
          onChanged: (_) {
            data.address = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Location',
          onChanged: (_) {
            data.location = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        const Text(
          'Contact us at: +201500000438',
        ),
      ],
    );
  }
}

class BalanceRecharging extends StatelessWidget {
  final InputData data;
  const BalanceRecharging({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSODropdownWidget(
          hintText: 'Type of Recharge',
          options: const [
            'Charge the number',
            'Pay the bill',
            'Landline',
            'Internet'
          ],
          onChanged: (_) {
            data.rechargingType = _!;
          },
        ),
        const SizedBox(height: 24.0),
        FSODropdownWidget(
          hintText: 'Type of SIM Card',
          options: const [
            'Vodafone',
            'Etisalat',
            'Orange',
            'WE',
          ],
          onChanged: (_) {
            data.simType = _!;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Phone Number',
          onChanged: (_) {
            data.phoneNumber = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Amount',
          onChanged: (_) {
            data.chargeAmount = _.trim();
          },
        ),
      ],
    );
  }
}

class IssuanceSIMCard extends StatelessWidget {
  final InputData data;
  const IssuanceSIMCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSODropdownWidget(
          hintText: 'Type of SIM Card',
          options: const [
            'Vodafone',
            'Etisalat',
            'Orange',
            'WE',
          ],
          onChanged: (_) {
            data.simType = _!;
          },
        ),
      ],
    );
  }
}

class BalanceTransfer extends StatelessWidget {
  final InputData data;
  const BalanceTransfer({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FSOTextField(
          hintText: 'Phone Number',
          onChanged: (_) {
            data.phoneNumber = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Amount',
          onChanged: (_) {
            data.chargeAmount = _.trim();
          },
        ),
      ],
    );
  }
}

class BookingAirlineTickets extends StatelessWidget {
  final InputData data;
  const BookingAirlineTickets({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        const Text('Country'),
        const SizedBox(height: 12.0),
        Row(
          children: [
            Expanded(
              child: FSOTextField(
                hintText: 'From',
                onChanged: (_) {
                  data.fromLanguage = _.trim();
                },
              ),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: FSOTextField(
                hintText: 'To',
                onChanged: (_) {
                  data.toLanguage = _.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        FSODateWidget(
          onDateChanged: (_, val) {
            data.selectedDate = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSODropdownWidget(
          hintText: 'Type',
          options: const ['Business', 'Economy'],
          onChanged: (_) {
            data.flightType = _!;
          },
        ),
      ],
    );
  }
}

class HotelReservation extends StatelessWidget {
  final InputData data;
  const HotelReservation({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ImagePickerWidget(
          hintText: 'Passport',
          onImagesSelected: (_) {
            data.passportImages = _;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Hotel',
          onChanged: (_) {
            data.hotelName = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Place',
          onChanged: (_) {
            data.placeName = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        const Text('Date'),
        const SizedBox(height: 12.0),
        Row(
          children: [
            Expanded(
              child: FSODateWidget(
                hintText: 'From',
                onDateChanged: (_, val) {
                  data.startDate = val.trim();
                },
              ),
            ),
            const SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: FSODateWidget(
                hintText: 'To',
                onDateChanged: (_, val) {
                  data.endDate = val.trim();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        FSODropdownWidget(
          hintText: 'Type',
          options: const ['Suite', 'Room'],
          onChanged: (_) {
            data.reservationType = _!;
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Number of people',
          onChanged: (_) {
            data.numOfPeople = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Number of children',
          onChanged: (_) {
            data.numOfChildren = _.trim();
          },
        ),
      ],
    );
  }
}

class UmrahVisa extends StatelessWidget {
  final InputData data;
  const UmrahVisa({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Passport',
          onChanged: (_) {
            data.passport = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Photo',
          onChanged: (_) {
            data.personalPhoto = _.trim();
          },
        ),
      ],
    );
  }
}

class BookingCoursesAndInstitutes extends StatelessWidget {
  final InputData data;
  const BookingCoursesAndInstitutes({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Course Type',
          onChanged: (_) {
            data.courseType = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Passport',
          onChanged: (_) {
            data.passport = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Accomodation',
          onChanged: (_) {
            data.accomodation = _.trim();
          },
        ),
      ],
    );
  }
}

class PrivateTeachersInAllMajors extends StatelessWidget {
  final InputData data;
  const PrivateTeachersInAllMajors({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Subject',
          onChanged: (_) {
            data.subject = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Study Stage',
          onChanged: (_) {
            data.studyStage = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Course of Study',
          onChanged: (_) {
            data.courseOfStudy = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Address',
          onChanged: (_) {
            data.address = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Location',
          onChanged: (_) {
            data.location = _.trim();
          },
        ),
      ],
    );
  }
}

class HireMaids extends StatelessWidget {
  final InputData data;
  const HireMaids({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class ResidenceRenewal extends StatelessWidget {
  final InputData data;
  const ResidenceRenewal({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FSOTextField(
          hintText: 'Passport',
          onChanged: (_) {
            data.passport = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Old Residence Card',
          onChanged: (_) {
            data.oldResidenceCard = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Lease Contract',
          onChanged: (_) {
            data.leaseContract = _.trim();
          },
        ),
        const SizedBox(height: 24.0),
        FSOTextField(
          hintText: 'Bill',
          onChanged: (_) {
            data.bill = _.trim();
          },
        ),
      ],
    );
  }
}
