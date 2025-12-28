import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputData {
  String passport = '';
  String numOfPeople = '';
  String travelTicket = '';
  String fromAirport = '';
  String toAirport = '';
  String numOfBags = '';
  String oldResidenceCard = '';
  String leaseContract = '';
  String bill = '';
  String location = '';
  String address = '';
  String fromLanguage = '';
  String toLanguage = '';
  String docToStamp = '';
  String birthCertificate = '';
  String oldPassport = '';
  String idCard = '';
  String medicalReport = '';
  String drivingLicense = '';
  String personalPhoto = '';
  String carLicenses = '';
  String drivingLicenses = '';
  String phoneNumber = '';
  String chargeAmount = '';
  String fromCountry = '';
  String toCountry = '';
  String reservationType = '';
  String hotelName = '';
  String placeName = '';
  String numOfChildren = '';
  String passportPhoto = '';
  String courseType = '';
  String accomodation = '';
  String subject = '';
  String studyStage = '';
  String courseOfStudy = '';
  String approvalType = '';
  String flightType = '';
  String arrivalDate = '';
  String arrivalTime = '';
  String numOfPages = '';
  String startDate = '';
  String endDate = '';
  String rechargingType = '';
  String simType = '';
  String withDriver = '';

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<File> passportImages = [];
  List<File> travelTicketImages = [];
  List<File> medicalReportImages = [];
  List<File> drivingLicensesImages = [];
  List<File> personalPhotoImages = [];
  List<File> carLicenseImages = [];

  List<String> passportUrls = [];
  List<String> travelTicketUrls = [];
  List<String> medicalReportUrls = [];
  List<String> drivingLicensesUrls = [];
  List<String> personalPhotoUrls = [];
  List<String> carLicenseUrls = [];

  Map<String, dynamic> populatedData() {
    final Map<String, dynamic> data = {};
    if (passport.isNotEmpty) {
      data['passport'] = passport;
    }

    if (numOfPeople.isNotEmpty) {
      data['num_of_people'] = numOfPeople;
    }

    if (travelTicket.isNotEmpty) {
      data['travel_ticket'] = travelTicket;
    }

    if (fromAirport.isNotEmpty) {
      data['from_airport'] = fromAirport;
    }

    if (toAirport.isNotEmpty) {
      data['to_airport'] = toAirport;
    }

    if (numOfBags.isNotEmpty) {
      data['num_of_bags'] = numOfBags;
    }

    if (oldResidenceCard.isNotEmpty) {
      data['old_residence_card'] = oldResidenceCard;
    }

    if (leaseContract.isNotEmpty) {
      data['lease_contract'] = leaseContract;
    }

    if (bill.isNotEmpty) {
      data['bill'] = bill;
    }

    if (location.isNotEmpty) {
      data['location'] = location;
    }

    if (address.isNotEmpty) {
      data['address'] = address;
    }

    if (fromLanguage.isNotEmpty) {
      data['from_language'] = fromLanguage;
    }

    if (toLanguage.isNotEmpty) {
      data['to_language'] = toLanguage;
    }

    if (docToStamp.isNotEmpty) {
      data['doc_to_stamp'] = docToStamp;
    }

    if (birthCertificate.isNotEmpty) {
      data['birth_certificate'] = birthCertificate;
    }

    if (oldPassport.isNotEmpty) {
      data['old_passport'] = oldPassport;
    }

    if (idCard.isNotEmpty) {
      data['id_card'] = idCard;
    }

    if (medicalReport.isNotEmpty) {
      data['medical_report'] = medicalReport;
    }

    if (drivingLicense.isNotEmpty) {
      data['driving_license'] = drivingLicense;
    }

    if (personalPhoto.isNotEmpty) {
      data['personal_photo'] = personalPhoto;
    }

    if (carLicenses.isNotEmpty) {
      data['car_licenses'] = carLicenses;
    }

    if (drivingLicenses.isNotEmpty) {
      data['driving_licenses'] = drivingLicenses;
    }

    if (phoneNumber.isNotEmpty) {
      data['phone_number'] = phoneNumber;
    }

    if (chargeAmount.isNotEmpty) {
      data['charge_amount'] = chargeAmount;
    }

    if (fromCountry.isNotEmpty) {
      data['from_country'] = fromCountry;
    }

    if (toCountry.isNotEmpty) {
      data['to_country'] = toCountry;
    }

    if (reservationType.isNotEmpty) {
      data['reservation_type'] = reservationType;
    }

    if (hotelName.isNotEmpty) {
      data['hotel_name'] = hotelName;
    }

    if (placeName.isNotEmpty) {
      data['place_name'] = placeName;
    }

    if (numOfChildren.isNotEmpty) {
      data['num_of_children'] = numOfChildren;
    }

    if (passportPhoto.isNotEmpty) {
      data['passport_photo'] = passportPhoto;
    }

    if (courseType.isNotEmpty) {
      data['course_type'] = courseType;
    }

    if (accomodation.isNotEmpty) {
      data['accomodation'] = accomodation;
    }

    if (subject.isNotEmpty) {
      data['subject'] = subject;
    }

    if (studyStage.isNotEmpty) {
      data['study_stage'] = studyStage;
    }

    if (courseOfStudy.isNotEmpty) {
      data['course_of_study'] = courseOfStudy;
    }

    if (approvalType.isNotEmpty) {
      data['approval_type'] = approvalType;
    }

    if (flightType.isNotEmpty) {
      data['flight_type'] = flightType;
    }

    if (arrivalDate.isNotEmpty) {
      data['arrival_date'] = arrivalDate;
    }

    if (arrivalTime.isNotEmpty) {
      data['arrival_time'] = arrivalTime;
    }

    if (numOfPages.isNotEmpty) {
      data['num_of_pages'] = numOfPages;
    }

    if (startDate.isNotEmpty) {
      data['start_date'] = startDate;
    }

    if (endDate.isNotEmpty) {
      data['end_date'] = endDate;
    }

    if (withDriver.isNotEmpty) {
      data['with_driver'] = withDriver;
    }

    if (simType.isNotEmpty) {
      data['sim_type'] = simType;
    }

    if (rechargingType.isNotEmpty) {
      data['recharging_type'] = rechargingType;
    }

    if (passportUrls.isNotEmpty) {
      data['passport_image_urls'] = passportUrls;
    }

    if (travelTicketUrls.isNotEmpty) {
      data['travel_ticket_image_urls'] = travelTicketUrls;
    }

    if (medicalReportUrls.isNotEmpty) {
      data['medical_report_image_urls'] = medicalReportUrls;
    }

    if (drivingLicensesUrls.isNotEmpty) {
      data['driving_licenses_image_urls'] = drivingLicensesUrls;
    }

    if (personalPhotoUrls.isNotEmpty) {
      data['personal_photo_image_urls'] = personalPhotoUrls;
    }

    if (carLicenseUrls.isNotEmpty) {
      data['car_license_image_urls'] = carLicenseUrls;
    }

    if (selectedDate != null) {
      data['date'] = DateFormat("dd MMMM, yyyy").format(selectedDate!);
    }

    if (selectedTime != null) {
      data['time'] =
          "${selectedTime!.hourOfPeriod}:${selectedTime!.minute} ${selectedTime!.period.name.toUpperCase()}";
    }

    return data;
  }

  static const keyToLabel = {
    'passport': 'Passport',
    'passport_image_urls': 'Passport Images',
    'num_of_people': 'Number of People',
    'travel_ticket': 'Travel Ticket',
    'travel_ticket_image_urls': 'Travel Ticket Images',
    'from_airport': 'From Airport',
    'to_airport': 'To Airport',
    'num_of_bags': 'Number of Bags',
    'old_residence_card': 'Old Residence Card',
    'lease_contract': 'Lease Contract',
    'bill': 'Bill',
    'location': 'Location',
    'address': 'Address',
    'from_language': 'From Language',
    'to_language': 'To Language',
    'doc_to_stamp': 'Document to Stamp',
    'birth_certificate': 'Birth Certificate',
    'old_passport': 'Old Passport',
    'id_card': 'ID Card',
    'medical_report': 'Medical Report',
    'medical_report_image_urls': 'Medical Report Images',
    'driving_license': 'Driving License',
    'personal_photo': 'Personal Photo',
    'personal_photo_image_urls': 'Personal Photo Images',
    'car_licenses': 'Car Licenses',
    'car_license_image_urls': 'Car License Images',
    'driving_licenses': 'Driving Licenses',
    'driving_licenses_image_urls': 'Driving Licenses Images',
    'phone_number': 'Phone Number',
    'charge_amount': 'Charge Amount',
    'from_country': 'From Country',
    'to_country': 'To Country',
    'reservation_type': 'Reservation Type',
    'hotel_name': 'Hotel Name',
    'place_name': 'Place Name',
    'num_of_children': 'Number of Children',
    'passport_photo': 'Passport Photo',
    'course_type': 'Course Type',
    'accomodation': 'Accomodation',
    'subject': 'Subject',
    'study_stage': 'Study Stage',
    'course_of_study': 'Course of Study',
    'approval_type': 'Approval Type',
    'flight_type': 'Flight Type',
    'arrival_date': 'Arrival Date',
    'arrival_time': 'Arrival Time',
    'num_of_pages': 'Number of Pages',
    'start_date': 'Start Date',
    'end_date': 'End Date',
    'with_driver': 'With Driver',
    'sim_type': 'SIM Type',
    'recharging_type': 'Recharging Type',
    'date': 'Date',
    'time': 'Time',
  };
}
