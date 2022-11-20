// ignore_for_file: prefer_const_constructors, unused_element, avoid_print, use_build_context_synchronously, await_only_futures, unused_local_variable, unnecessary_null_comparison, prefer_if_null_operators, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/utils/custom_string.dart';
import '../providers/authentication_provider.dart';
import '../providers/vpn_provider.dart';
import '../utils/custom_text_style.dart';
import '../utils/dimensions.dart';
import '../widgets/country_item.dart';

class LocationSelectPage extends StatefulWidget {
  const LocationSelectPage({Key? key}) : super(key: key);

  @override
  State<LocationSelectPage> createState() => _LocationSelectPageState();
}

class _LocationSelectPageState extends State<LocationSelectPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    VpnProvider vpnProvider = Provider.of<VpnProvider>(context, listen: false);
    AuthenticationProvider authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    final _appbar = AppBar(
      backgroundColor: CustomColor.bgColor,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        onTap: () => scaffoldKey.currentState!.openDrawer(),
        child: Image.asset(CustomString.drawer),
      ),
      actions: [
        Image.asset(CustomString.what),
        // Consumer<AuthenticationProvider>(
        //   builder: (context, authProvider, child) => authProvider.user == null
        //       ? Image.asset(CustomString.what)
        //       : Container(
        //           alignment: Alignment.center,
        //           height: 32.h,
        //           width: 32.w,
        //           decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               color: CustomColor.greenMainColor),
        //           child: authProvider.user!.photoURL! != null
        //               ? ClipRRect(
        //                   borderRadius: BorderRadius.circular(100),
        //                   child: Image.network(
        //                     authProvider.user!.photoURL!,
        //                   ),
        //                 )
        //               : Text(authProvider.user!.displayName!.substring(0, 2)),
        //         ),
        // ),
        SizedBox(width: 10),
      ],
    );

    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appbar,
      backgroundColor: CustomColor.bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "_",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 18,
                right: width / 18,
              ),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      bottom: 10.0, left: 10.0, right: 10.0),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: width / 15,
                        right: width / 20,
                        top: width / 44,
                        bottom: width / 44),
                    child: Icon(
                      Icons.search,
                      size: height / 23,
                      color: Colors.black,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Search Location.",
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 15.sp,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomColor.greenMainColor, width: width / 170),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width / 35),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: CustomColor.greenMainColor, width: width / 170),
                    borderRadius: BorderRadius.all(
                      Radius.circular(width / 35),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 17,
              ),
              child: Text(
                "Recommended",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),

            // Recommended Contents
            Padding(
              padding: EdgeInsets.only(
                left: width / 18,
                right: width / 18,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CustomColor.greenMainColor,
                    width: width / 170,
                  ),
                  borderRadius: BorderRadius.circular(width / 35),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width / 20,
                      top: height / 80,
                      bottom: height / 80,
                      right: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(CustomString.usaFlag),
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "USA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          ),
                          Text("Free & Unlimited Speed",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w300,
                                color: CustomColor.blackNormal,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: width / 10,
                      ),
                      Text("50 ms",
                          style: TextStyle(
                              color: CustomColor.blackNormal,
                              fontWeight: FontWeight.w300)),
                      SizedBox(
                        width: width / 20,
                      ),
                      SvgPicture.asset(
                        CustomString.wifiLow,
                        height: height / 40,
                        width: width / 30,
                        color: CustomColor.wifiColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 50,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 18,
                right: width / 18,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColor.greenMainColor,
                  border: Border.all(
                    color: CustomColor.greenMainColor,
                    width: width / 170,
                  ),
                  borderRadius: BorderRadius.circular(width / 35),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width / 20,
                      top: height / 80,
                      bottom: height / 80,
                      right: width / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(CustomString.usaFlag),
                      ),
                      SizedBox(
                        width: width / 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "USA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                          Text("Free & Unlimited Speed",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white))
                        ],
                      ),
                      SizedBox(
                        width: width / 10,
                      ),
                      Text("50 ms",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          )),
                      SizedBox(
                        width: width / 20,
                      ),
                      SvgPicture.asset(
                        CustomString.wifiMedium,
                        height: height / 50,
                        width: width / 50,
                        color: CustomColor.wifiColor,
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Asia
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 17,
              ),
              child: Text(
                "Asia",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            FutureBuilder(
              future: vpnProvider
                  .getCountryList(authenticationProvider.userTokenAfterLoginIn),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  Fluttertoast.showToast(
                      msg: "Failed to face data",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
                return ListView.builder(
                  padding: EdgeInsets.only(
                    left: width / 18,
                    right: width / 18,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: vpnProvider.countryList.data?.length == null
                      ? 0
                      : vpnProvider.countryList.data!.length,
                  itemBuilder: (context, index) {
                    final dataM = vpnProvider.countryList.data![index];
                    return CountryItem(
                      dataM: dataM,
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: height / 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 17,
              ),
              child: Text(
                "Europe",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }
}
