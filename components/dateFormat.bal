package components;

function DateFormat (json inp) (string) {
    int day;
    int month;
    int year;
    Time created = parse(inp.toString(), "yyyy-MM-dd'T'HH:mm:ss'Z'");
    year, month, day = created.getDate();
    return ("Date: " + year + ":" + month + ":" + day);
}