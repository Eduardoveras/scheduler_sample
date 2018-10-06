



$( "#submitButton" ).click(function() {
    let MonFrom = $('#MonFrom').val();
    let MonTo = $('#MonTo').val();
    let TueFrom = $('#TueFrom').val();
    let TueTo = $('#TueTo').val();
    let WedFrom = $('#WedFrom').val();
    let WedTo = $('#WedTo').val();
    let ThuFrom = $('#ThuFrom').val();
    let ThuTo = $('#ThuTo').val();
    let FriFrom = $('#FriFrom').val();
    let FriTo = $('#FriTo').val();
    let SatFrom = $('#SatFrom').val();
    let SatTo = $('#SatTo').val();
    let SunFrom = $('#SunFrom').val();
    let SunTo = $('#SunTo').val();

    let Mon24= $('#Mon24').is(':checked')
    let Tue24 = $('#Tue24').is(':checked')
    let Wed24 = $('#Wed24').is(':checked')
    let Thu24 = $('#Thu24').is(':checked')
    let Fri24 = $('#Fri24').is(':checked')
    let Sat24 = $('#Sat24').is(':checked')
    let Sun24 = $('#Sun24').is(':checked')



axios.post('/schedule_weeks',
    { "schedule_week": {
            "schedule_days_attributes": [
                { "range_begin": MonFrom , "range_end": MonTo, "available_24_hours":Mon24 },
                { "range_begin": TueFrom , "range_end": TueTo, "available_24_hours":Tue24 },
                { "range_begin": WedFrom , "range_end": WedTo, "available_24_hours":Wed24 },
                { "range_begin": ThuFrom , "range_end": ThuTo, "available_24_hours":Thu24 },
                { "range_begin": FriFrom , "range_end": FriTo, "available_24_hours":Fri24 },
                { "range_begin": SatFrom , "range_end": SatTo, "available_24_hours":Sat24 },
                { "range_begin": SunFrom , "range_end": SunTo, "available_24_hours":Sun24 },
            ]
        }}
)
    .then(function (response) {
        console.log(response);
        output(response.data);
    })
    .catch(function (error) {
        console.log(error);
    });



});

function output(inp) {
    document.body.appendChild(document.createElement('pre')).innerHTML = JSON.stringify(inp, undefined, 4);
}

