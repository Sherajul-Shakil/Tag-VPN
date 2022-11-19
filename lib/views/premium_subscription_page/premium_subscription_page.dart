import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tap_vpn_details/providers/authentication_provider.dart';
import 'package:tap_vpn_details/providers/premium_subscription_provider.dart';
import 'package:tap_vpn_details/utils/custom_color.dart';
import 'package:tap_vpn_details/widgets/login_signup_button.dart';

import '../../widgets/toast/custom_toast.dart';


class PremiumSubscriptionPage extends StatefulWidget {
  const PremiumSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<PremiumSubscriptionPage> createState() => _PremiumSubscriptionPageState();
}

class _PremiumSubscriptionPageState extends State<PremiumSubscriptionPage> {


  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    PremiumSubscriptionProvider premiumSubscriptionProvider = await Provider.of<PremiumSubscriptionProvider>(context, listen: false);
    AuthenticationProvider authenticationProvider = await Provider.of<AuthenticationProvider>(context, listen: false);
    await premiumSubscriptionProvider.premiumSubscriptionListFetch(authenticationProvider.userTokenAfterLoginIn);
  }


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Consumer<PremiumSubscriptionProvider>(
      builder: (_,premiumProvider,___) {
        return premiumProvider.premiumSubscriptionList.success == true ?
        Consumer<AuthenticationProvider>(
          builder: (_,authProvider,___) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Icon(Icons.arrow_back),
                actions: [
                  Padding(
                    padding:  EdgeInsets.only(
                      right:width/20,
                    ),
                    child: Icon(Icons.highlight_remove_outlined,
                    color: CustomColor.greenMainColor,
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height/20,
                      ),
                      Text(
                        "Try Tag VPN Premium for Free",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                          height: height/30
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              SizedBox(
                                height: height/50,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.check,
                                    color: CustomColor.greenMainColor,
                                  ),
                                  SizedBox(
                                    width: width/20,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                          height: height/30
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: premiumProvider.premiumSubscriptionList.data!.length,
                        itemBuilder: (context, index){
                          return  InkWell(
                            onTap: ()async{
                              print('working');
                              print(authProvider.userTokenAfterLoginIn);
                              await premiumProvider.premiumSubscriptionBuy(premiumProvider.premiumSubscriptionList.data![index].id.toString(), authProvider.userTokenAfterLoginIn);
                              if(premiumProvider.formalStatus.success == true){
                                CustomToast.toastShower(premiumProvider.formalStatus.message!, Colors.green);
                              }else{
                                CustomToast.toastShower(premiumProvider.formalStatus.message!, Colors.red);
                              }
                              //
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height/40,
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: width/10,
                                      right: width/10
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: width/20,
                                        right: width/20,
                                        top: width/30,
                                        bottom: width/30
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: CustomColor.greenMainColor
                                        ),
                                        borderRadius: BorderRadius.circular(width/20)
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              premiumProvider.premiumSubscriptionList.data![index].name!,
                                              //"Annual",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.sp
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(width/60),
                                              decoration: BoxDecoration(
                                                  color: CustomColor.clipColor,
                                                  borderRadius: BorderRadius.circular(width/50)
                                              ),
                                              child: Text(
                                                  "Best Value"
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                            height: height/140
                                        ),
                                        Text(
                                            "First ${premiumProvider.premiumSubscriptionList.data![index].freeDays} days free. Then \$${premiumProvider.premiumSubscriptionList.data![index].price}/Month"
                                          //"First 12 days free. Then \$200/Month"
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                          height: height/30
                      ),
                      LoginSignUpButton(
                          width: width,
                          height: height,
                          buttonName: "Continue"
                      ),
                      SizedBox(
                          height: height/20
                      ),
                      Padding(
                        padding:  EdgeInsets.only(
                            left: width/15,
                            right: width/15
                        ),
                        child: Text(
                          "Lorem ipsum dolor sit amet. consectetur the to pretium adipiscing elit. Sed maecenas nunc",
                          style: TextStyle(
                              fontSize: 16.sp
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        )
        : Container();
      }
    );
  }
}
