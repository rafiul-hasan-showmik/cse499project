import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_demo/InternetBill.dart';
import 'package:razorpay_demo/dataRecord.dart';
import 'package:razorpay_demo/gas_bill.dart';
import 'package:razorpay_demo/phone_recharge.dart';
import 'package:razorpay_demo/service_bill.dart';
import 'package:razorpay_demo/water_bill.dart';
import 'electricity_bill.dart';

var months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

var years = [
  '2018',
  '2019',
  '2020',
  '2021',
  '2022',
  '2023',
];
History h = History("Dot Internet", "123", "01765324000", '300', "Jan", "2023", Icons.abc, Colors.black);
var hlog = [h];



List<String> titlelist = [
  "Electricity Bill",
  "Water Bill",
  "Gas Bill",
  "Internet Bill",
  "Phone Recharge",
  "Service Charge",
];
List<Color> colorlist = [
  Colors.yellow,
  Colors.blue,
  Colors.red,
  Colors.grey,
  Colors.green,
  Colors.purple,
];
List<IconData> iconList = [
  Icons.electric_bolt,
  Icons.water_drop,
  Icons.gas_meter,
  Icons.wifi_tethering_error,
  Icons.phone_in_talk,
  Icons.hub,
];
List<String> routerList = [
  ElectricityBill.routeName,
  WaterBill.routeName,
  GasBill.routeName,
  InternetBill.routeName,
  PhoneRecharge.routeName,
  ServiceBill.routeName,
];

List<String> electricitylist = [
  "DESCO",
  "NESCO",
  "DPDC",
  "Palli Bidyut",
  "BPDB",
];
List<String> electricityImage = [
  "https://bangladeshpost.net/webroot/uploads/featureimage/2019-08/5d581224b86cd.jpg",
  "https://seeklogo.com/images/N/nesco-logo-2915C84B33-seeklogo.com.png",
  "https://seeklogo.com/images/D/dpdc-logo-07F8FACEA4-seeklogo.com.png",
  "https://seeklogo.com/images/P/palli-bidyut-board-logo-5CC08BEF78-seeklogo.com.png",
  "https://seeklogo.com/images/P/palli-bidyut-board-logo-5CC08BEF78-seeklogo.com.png",
];

List<String> waterlist = [
  "Dhaka Wasa",
  "Chattogram Wasa",
  "Rajshahi Wasa",
  "Khulna Wasa",
];

List<String> waterimage = [
  "https://upload.wikimedia.org/wikipedia/en/e/e1/Dhaka_WASA_logo.jpeg",
  "https://3.bp.blogspot.com/-_UG2D_82zlo/WpMI0OIevAI/AAAAAAAAKLo/ngzBr0IANPEXvpBbYJihYzdyAId0cmzGQCLcBGAs/s1600/dhaka-wasa.jpg",
  "https://wopbangladesh.com/wp-content/uploads/2022/06/dwasa-logo-300x128.png",
  "https://bangladeshpost.net/webroot/uploads/featureimage/2020-01/5e2c575a179ad.jpg",
];
List<String> internetlist = [
  "Link3",
  "AmberIT",
  "Carnival",
  "Triangle",
];
List<String> internetimage = [
  "https://upload.wikimedia.org/wikipedia/en/thumb/5/57/Link3_Technologies_Ltd_Logo.svg/1200px-Link3_Technologies_Ltd_Logo.svg.png",
  "https://www.mawbiz.com.bd/application/views/module/product_image/amber-it-ltd_1.jpg",
  "https://www.clipartmax.com/png/small/327-3278309_cruise-ship-clipart-login-to-goccl-goccl-carnival-cruise-lines-logo.png",
  "https://www.bangladeshyp.com/img/bd/g/1419677139-triangle-services-ltd.png",
];
List<String> gaslist = [
  "Titash Gas",
  "Karnaphuli Gas",
  "Jalalabad Gas",
  "Sundarban Gas",
];
List<String> gasimage = [
  "https://2.bp.blogspot.com/-PvjBTvtpeX4/WR0cMXl6YEI/AAAAAAAAHGE/6fMc9oTyWQIuxDPZqW6IyIReimypw9AEQCLcB/w1200-h630-p-k-no-nu/titas-gas.jpg",
  "https://seeklogo.com/images/K/karnaphuli-gas-distribution-company-ltd-logo-50C4639246-seeklogo.com.png",
  "https://bangladeshpost.net/webroot/uploads/featureimage/2022-10/635691499822a.jpg",
  "https://aneeshagroup.com/wp-content/uploads/2019/04/SGS-320x202.jpg",
];
List<String> telephonelist = [
  "Airtel",
  "Banglalink",
  "Grameen Phone",
  "Robi",
];
List<String> telephoneimage = [
  "https://e7.pngegg.com/pngimages/240/684/png-clipart-4g-bharti-airtel-lte-3g-2g-recharge-text-trademark-thumbnail.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/6/69/Logo_of_Banglalink.svg/1200px-Logo_of_Banglalink.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Grameenphone_Logo_GP_Logo.svg/2150px-Grameenphone_Logo_GP_Logo.svg.png",
  "https://e7.pngegg.com/pngimages/987/411/png-clipart-airtel-bangladesh-robi-axiata-limited-mobile-phones-bharti-airtel-banglalink-text-heart.png",
];
List<String> servicechargelist = [
  "Tropical Heights",
  "Dominno",
  "Sheltech",
  "Concord",
];
List<String> servicechargeimage = [
  "https://www.nagorikseba.com/uploads/logo/1661684994.jpg",
  "https://i.pinimg.com/280x280_RS/98/e9/80/98e980937ff5aef7ad56193f9c9fcdca.jpg",
  "https://marketbangladesh.com/media/com_jbusinessdirectory/pictures/companies/268/shelteclogo-1466332100.jpg",
  "https://media.glassdoor.com/sqll/1319506/concorde-group-squarelogo-1540210851155.png",
];
