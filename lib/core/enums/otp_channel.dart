enum OtpChannel {
  sms , whatsapp ;
  String get text =>switch(this){
    sms => "رسالة هاتفية",
   whatsapp => "واتساب"
  };
}