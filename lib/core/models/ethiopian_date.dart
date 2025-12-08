class EthiopianDate {
    final int year;
    final int month;
    final int day;

    EthiopianDate({
        required this.year,
        required this.month,
        required this.day,
    });

    bool get isLeapYear() {
        // Ethiopian leap year occurs every 4 years
        // Year of Luke(Lukas) is a leap year.
        return (year + 5500) % 4 == 3; 
    }

    
}