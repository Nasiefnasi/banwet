import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/style/const.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
              size: 15.sp,
            )),
        title: Text("Terms & Condition", style: header15),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: SingleChildScrollView(
          child: Html(
            data: """
              <body>
                <p>Welcome to Smart Build!</p>
                <p>These terms and conditions outline the rules and regulations for the use of Smart Build.</p>
                <p>By using this app we assume you accept these terms and conditions. Do not continue to use Smart Build if you do not agree to take all of the terms and conditions stated on this page.</p>

                <!-- ... (other paragraphs) ... -->

                <h3>License</h3>
                <p>Unless otherwise stated, Smart Build and/or its licensors own the intellectual property rights for all material on Smart Build. All intellectual property rights are reserved. You may access this from Smart Build for your own personal use subjected to restrictions set in these terms and conditions.</p>
                <ul>
                  <li>Republish material from Smart Build</li>
                  <li>Sell, rent or sub-license material from Smart Build</li>
                  <li>Reproduce, duplicate or copy material from Smart Build</li>
                  <li>Redistribute content from Smart Build</li>
                </ul>
                <p>This Agreement shall begin on the date hereof.</p>

                <!-- ... (other paragraphs) ... -->

                <h3>Hyperlinking to our App</h3>
                <p>The following organizations may link to our App without prior written approval:</p>
                <ul>
                  <li>Government agencies;</li>
                  <li>Search engines;</li>
                  <li>News organizations;</li>
                  <!-- ... (other list items) ... -->
                </ul>

                <!-- ... (other paragraphs) ... -->

                <h3>iFrames</h3>
                <p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our App.</p>

                <!-- ... (other paragraphs) ... -->

                <h3>Content Liability</h3>
                <p>We shall not be held responsible for any content that appears on your App. You agree to protect and defend us against all claims that are rising on our App. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of any third party rights.</p>

                <!-- ... (other paragraphs) ... -->

                <h3>Your Privacy</h3>
                <p>Please read Privacy Policy.</p>

                <!-- ... (other paragraphs) ... -->

                <h3>Reservation of Rights</h3>
                <p>We reserve the right to request that you remove all links or any particular link to our App. You agree to immediately remove all links to our App upon request. We also reserve the right to amend these terms and conditions and its linking policy at any time. By continuously linking to our App, you agree to be bound to and follow these linking terms and conditions.</p>

                <!-- ... (other paragraphs) ... -->

                <h3>Removal of links from our App</h3>
                <p>If you find any link on our App that is offensive for any reason, you are free to contact and inform us at any moment. We will consider requests to remove links but we are not obligated to do so or to respond to you directly.</p>

                <!-- ... (other paragraphs) ... -->

                <p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>

                <!-- ... (other paragraphs) ... -->

                <h3>Disclaimer</h3>
                <p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our App and the use of this website.</p>
                <ul>
                  <li>limit or exclude our or your liability for death or personal injury;</li>
                  <li>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</li>
                  <!-- ... (other list items) ... -->
                </ul>
                <p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>
                <p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>
              
              </body>
            """,
          ),
        ),
      ),
    );
  }
}
