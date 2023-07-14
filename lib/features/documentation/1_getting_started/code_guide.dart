const codeGuidePath = "/getting-started/code-guide";
const codeGuideHtml = """
<h1><span style="font-family: Georgia, serif;">Code Guide</span></h1>
<p><span style="font-family: Georgia, serif; font-size: 18px;">Some rules that will help in writing better code :&nbsp;</span></p>
<ol>
    <li><span style="font-family: Georgia, serif; font-size: 18px;">Always write documentation for your code, create a new documentHeading of your feature, and create sub heading to write documentation for the feature you&apos;re working on.&nbsp;</span></li>
    <li><span style="font-family: Georgia, serif; font-size: 18px;">When you commit your code make sure to have Zero (0) Linter warning/problems in code.&nbsp;</span></li>
    <li><span style="font-family: Georgia, serif; font-size: 18px;">Short and sweet code instead of lengthy code. Each file should have minimum possible code, 150 lines or less approx. &nbsp;</span></li>
    <li><span style="font-family: Georgia, serif; font-size: 18px;">Always use stateless widget, only change with consumer when you need data in entire file. &nbsp;Otherwise use Consumer widget of riverpod to get ref in UI.&nbsp;</span></li>
    <li><span style="font-family: Georgia, serif; font-size: 18px;">Function that does only 1 thing. Don&apos;t make longer function, keep it short and sweet.</span></li>
    <li><span style="font-family: Georgia, serif; font-size: 18px;">Please be extra careful while naming things, as it will be difficult for other developers to understand your code if name is bad. (Only Good names just like flash coders. 😎)</span></li>
    <li><span style="font-family: Georgia, serif; font-size: 18px;">Don&apos;t use var in code, always use types. As code without types can be difficult to debug.&nbsp;</span><span style="font-family: Georgia, serif; font-size: 18px;"></span><br><br><br><span style="font-size: 20px;">Note: We&apos;ll keep on updating this based on our learning so keep yourself up to date with new and best practices of flutter.&nbsp;</span><br><br><span style="font-size: 20px;">Thank you.&nbsp;</span><br><br></li>
</ol>
""";
