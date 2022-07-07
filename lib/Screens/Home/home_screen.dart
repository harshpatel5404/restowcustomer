import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:restowcustomer/Constants/colors.dart';
import 'package:restowcustomer/Screens/Calendar/calendar_screen.dart';
import 'package:restowcustomer/Screens/VehicleTow/vehicle_tow.dart';
import 'package:restowcustomer/Widgets/buttons.dart';
import 'package:restowcustomer/Widgets/icon.dart';
import '../../Widgets/drawer_menu.dart';
import '../Notifications/notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final List<Marker> _markers = <Marker>[];

  var location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _locationData;
  Set<Circle>? mCircle;

  void getlocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(_locationData!.latitude!.toDouble(),
            _locationData!.longitude!.toDouble()),
        infoWindow: InfoWindow(title: 'The title of the marker')));

    mCircle = Set.from([
      Circle(
        circleId: CircleId("id1"),
        center: LatLng(_locationData!.latitude!.toDouble(),
            _locationData!.longitude!.toDouble()),
        radius: 500,
      ),
    ]);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // getlocation();
    // location.onLocationChanged.listen((LocationData currentLocation) {
      
    // });
  }

  
  GoogleMapController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _locationData != null
                  ? LatLng(_locationData!.latitude!.toDouble(),
                      _locationData!.longitude!.toDouble())
                  : const LatLng(62.750411, 26.140096),
              zoom: 4,
            ),
            // markers: Set<Marker>.of(_markers),
            // circles: Set.from([
            //   Circle(
            //     circleId: const CircleId("id1"),
            //     fillColor: Colors.grey,
            //     center: LatLng(_locationData!.latitude!.toDouble(),
            //         _locationData!.longitude!.toDouble()),
            //     radius: Get.height * 0.2,
            //   ),
            // ]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: Get.height * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        scaffoldkey.currentState!.openDrawer();
                      },
                      child: AppIcon(
                        icon: Icons.menu,
                      ),
                    ),
                    Container(
                      width: Get.width * 0.6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                "assets/images/addressbg.png",
                              ))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Your Location",
                              style: const TextStyle(
                                color: textcolor,
                                fontSize: 11,
                              ),
                            ),
                            const Text(
                              "83250 Hermosillo, Mexico",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ]),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Notifications());
                      },
                      child: Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(width: 0, color: Colors.white)),
                        elevation: 8,
                        child: Padding(
                            padding: EdgeInsets.all(Get.width * 0.03),
                            child: SvgPicture.asset(
                              "assets/icons/notification.svg",
                              height: 20,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.08, vertical: Get.width * 0.05),
                width: Get.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Form(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF7F6FB),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 17, color: Color(0xffC3C3C3)),
                            hintText: 'Where to go?',
                            suffixIcon: InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                )),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(Get.width * 0.05),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                            onpress: () {
                              Get.to(VehicleTowPage());
                            },
                            widths: Get.width * 0.4,
                            btnfontsize: 17.0,
                            btntext: "Tow Now"),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.3),
                                blurRadius: 5.0,
                                offset: Offset(0.0, 8.0),
                              ),
                            ],
                          ),
                          width: Get.width * 0.4,
                          height: Get.height * 0.08,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(CalendarScreen());
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  kPrimaryColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(
                                        color: kPrimaryColor, width: 1)),
                              ),
                            ),
                            child: Text(
                              "Ask For Offer",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
