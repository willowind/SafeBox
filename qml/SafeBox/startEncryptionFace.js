function initDigitButtun() {
    for(var i = 1 ; i <= 10 ; i++)
    {
        digitModel.append({
                              "digit": i % 10});
    }

    digitModel.append({
                          "digit": "*"});
    digitModel.append({
                          "digit": "#"});
}
