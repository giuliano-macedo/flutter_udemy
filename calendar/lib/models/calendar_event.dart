import "package:intl/intl.dart";
enum CalendarType{
	notImportant,
	important,
	emergencial
}
class CalendarEvent {
	String name;
	DateTime date;
	CalendarType type;
	CalendarEvent({this.name,this.date,this.type});

	get dateStr{
		return DateFormat.yMd().format(date);
	}
}