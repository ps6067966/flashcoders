import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class WhizzBrainPrivacyScreen extends ConsumerStatefulWidget {
  const WhizzBrainPrivacyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WhizzBrainPrivacyScreenState();
}

class _WhizzBrainPrivacyScreenState
    extends ConsumerState<WhizzBrainPrivacyScreen> {
  final String privacyPolicy = """<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>Privacy Policy</title>
    <style>
        body {
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            padding: 1em;
        }
    </style>
</head>

<body>
    <p style="text-align: center;"><strong>Privacy Policy for Whizz Brain app</strong><br><br></p>
    <p>Disclaimer: &nbsp;<span style="text-align: justify;color: rgb(0, 0, 0);font-size: 15px;">Our app (<strong>Whizz Brain</strong>)&nbsp;</span><strong><span style="text-align: justify;color: rgb(0, 0, 0);font-size: 15px;border: 0px;">doesn&apos;t represent any government entity</span></strong><span style="text-align: justify;color: rgb(0, 0, 0);font-size: 15px;">&nbsp;and all the content is created by teachers of Whizz Brain.</span><br><br><b><span style="text-align: justify;color: rgb(0, 0, 0);font-size: 15px;">Flash Coders</span></b> built the Whizz Brain app as a Commercial app. This SERVICE is provided by <b style='color: rgb(0, 0, 0); font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'><span style="text-align: justify; color: rgb(0, 0, 0); font-size: 15px;">Flash Coders</span></b> and is intended for use as is.</p>
    <p>This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.</p>
    <p>If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.</p>
    <p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Whizz Brain unless otherwise defined in this Privacy Policy.</p>
    <p><strong>Information Collection and Use</strong></p>
    <p>For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Name, Email. The information that I request will be retained on your device and is not collected by me in any way.</p>
    <div>
        <p>The app does use third-party services that may collect information used to identify you.</p>
        <p>Link to the privacy policy of third-party service providers used by the app.</p>
        <ul>
            <li><a href="https://www.google.com/policies/privacy/" target="_blank" rel="noopener noreferrer">Google Play Services</a></li>
        </ul>
    </div>
    <p><strong>Log Data</strong></p>
    <p>I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (&ldquo;IP&rdquo;) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.</p>
    <p><strong>Cookies</strong></p>
    <p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&apos;s internal memory.</p>
    <p>This Service does not use these &ldquo;cookies&rdquo; explicitly. However, the app may use third-party code and libraries that use &ldquo;cookies&rdquo; to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>
    <p><strong>Service Providers</strong></p>
    <p>I may employ third-party companies and individuals due to the following reasons:</p>
    <ul>
        <li>To facilitate our Service.</li>
        <li>To provide the Service on our behalf.</li>
        <li>To perform Service-related services; or</li>
        <li>To assist us in analyzing how our Service is used.</li>
    </ul>
    <p>I want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>
    <p><strong>Security</strong></p>
    <p>I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.</p>
    <p><strong>Links to Other Sites</strong></p>
    <p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>
    <p><strong>Children&rsquo;s Privacy</strong></p>
    <div>
        <p>These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions.</p>
    </div>
    <!---->
    <p><strong>Changes to This Privacy Policy</strong></p>
    <p>I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.</p>
    <p>This policy is effective as of 2023-11-07</p>
    <p><strong>Contact Us</strong></p>
    <p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact me at <a href="mailto:pratap.singh.shekhawat@gmail.com" style="text-align: start;color: inherit;font-size: 15px;border: 0px;">pratap.singh.shekhawat@gmail.com</a></p>
</body>

</html>
      """;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                HtmlWidget(
                  privacyPolicy,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
