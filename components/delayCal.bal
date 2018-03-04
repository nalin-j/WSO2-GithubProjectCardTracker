package components;

function delay (json inp) (int output) {
    Time CurentTime = currentTime();
    int year1 = CurentTime.year();
    int month1 = CurentTime.month();
    int day1 = CurentTime.day();
    Time LastUpdate = parse(inp.toString(), "yyyy-MM-dd'T'HH:mm:ss'Z'");
    int year2 = LastUpdate.year();
    int month2 = LastUpdate.month();
    int day2 = LastUpdate.day();

    month1 = (month1 + 9) % 12;
    year1 = year1 - month1 / 10;

    month2 = (month2 + 9) % 12;
    year2 = year2 - month2 / 10;

    int count1 = (365 * year1 + year1 / 4 - year1 / 100 + year1 / 400 + (month1 * 306 + 5) / 10 + (day1 - 1));
    int count2 = (365 * year2 + year2 / 4 - year2 / 100 + year2 / 400 + (month2 * 306 + 5) / 10 + (day2 - 1));
    return (count1 - count2);
}