enum TaskRecycleType {
  start,
  pause,
  arrive,
  complete,
  none,
}

/// [ChatModel] in [GetxChatController]
enum LoadState { success, error, loading }

enum StepType { phone, code, password }

enum ProductType { productForYou, bestSelling, newProducts, none }

enum TabTypes { current, past }

enum BookType { none, New, Done, CANCELD, Rejected, Expired }

enum CardStatus { active, deActive, cancel }

enum TicketType { guest, employee }

enum LoginType { client, employee, driver }

enum QRCodeType { reservation, card }

enum ReadType { privacy, terms }

enum NotificationType {
  reservation_reject,
  reservation_confirm,
  card_charge,
  add_point,
  general,
  card_balance_credit,
  order
}

enum ItemInfoType { contactAgent, sendLocation }

enum ContactType { contact, contactUS }

enum InterestType { moreInterest, interest }

enum AlarmType { reminder, medicine, appointment }

enum ReminderType { medicine, reminder, appointment }

enum FamilyType { SeeAll , MySon ,Mum, Dad , MyDauther, Husband  }

enum MedicalType {
  HeartDisease,
  BrainDisease,
  EarDisease,
  StomachDisease,
  LungDisease,
  KidneyDisease,
  LiverDisease,
  SkinDisease,
  EyeDisease,
  GynecologyDisease,
  BoneDisease,
  BloodDisease,
  DentalDisease,
  MentalHealth,
  Diabetes,
  BloodPressure,
  ThyroidDisease,
  Cancer,
  ImmuneDisorder,
  InfectiousDisease,
  Allergy,
  ReproductiveDisease,
  NeurologicalDisorder,
  RespiratoryDisease,
  DigestiveDisease,
  UrinaryDisease,
  EndocrineDisorder,
  MuscularDisorder,
  PillDisease,
}

enum SelectSomeone { A , B , C}

enum ProgressType { Daily, Weekly, Monthly } 

enum PeriodType { Day60 , Day90 , Other}

enum CalculationTypes { bmi,pregnancyTracker,periodCalculator,diabetesCalculator,ibsSymptomAssessment}

enum Gender { male,female}
