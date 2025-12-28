class ServiceCategory {
  const ServiceCategory._();

  static const categories = [
    'Cairo Airport Services',
    'Car Services',
    'Educational Services',
    'Immigration and Passport Services',
    'Medical Services',
    'Mobile Services',
    'Other Services',
    'Tourism Services',
    'Yemeni Embassy/Consulate Services',
  ];

  static const subCategories = {
    "Cairo Airport Services": [
      "Airport Facilities (Arrival and Departure)",
      "Security Approval",
      "Transfer from\\to the Airport",
      "VIP Services (Arrival and Departure)",
    ],
    "Car Services": [
      "Cars Rent",
      "Cars repairing",
      "Hire a driver with a monthly or daily fee",
      "Issuance of Driving Licenses",
      "Pulling cars (Crane)",
      "Traffic violations Payment",
    ],
    "Educational Services": [
      "Booking Courses and Institutes",
      "Private teachers in all Majors",
    ],
    "Immigration and Passport Services": [
      "Annual Residence (student)",
      "Arrival Stamp",
      "Work Residence",
      "Residence Card (6 months)",
      "Translating Legal Contracts (marriage - birth certificates - agencies)",
    ],
    "Medical Services": [
      "Corona Vaccine Certificate (Vaccination)",
      "Doctors Recommendation",
      "PCR Examination",
    ],
    "Mobile Services": [
      "Balance Recharging",
      "Balance Transfer",
      "Issuance SIM-Card",
    ],
    "Other Services": [
      "Hire Maids (cooking - cleaning) with monthly or daily fee",
    ],
    "Tourism Services": [
      "Booking Airline Tickets",
      "Hotels reservation",
      "Umrah Visa (Electronic Visa)",
    ],
    "Yemeni Embassy/Consulate Services": [
      "Address Verification",
      "Embassies Stamps",
      "Embassy Authorization",
      "Issuing New Passport",
      "Issuing a Replacement Passport",
      "Transferring Data from Old to New Passport",
    ],
  };
}
