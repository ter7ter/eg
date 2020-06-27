function create_company_page() {
    $('select[name=currencyId]').change(function () {
        var selected = $('select[name=currencyId] option:selected');
        var rate = selected.attr('data-rate');
        var name = selected.attr('data-name');
        var maxAmount = Math.floor($('#user-money').text()*rate);
        $('#create-company-form .currency-rate').text(rate + ' ' + name);
        $('#create-company-form .currency-sum').text(maxAmount + ' ' + name);
        $('input[name=money]').prop('min', Math.ceil(minAmount * rate));
        $('input[name=money]').prop('max', maxAmount);
        $('input[name=money]').val(maxAmount);
    });
    $('select[name=currencyId]').change();
}

function create_unit_page() {
    $('#unit-select-country').change(function () {
        $.getJSON('/get_regions&json=1&id=' + $('#unit-select-country').val(), function (response) {
            if (response.status == 'ok') {
                $('#unit-select-city').empty();
                for (var i in response.data.regions) {
                    $('#unit-select-region').append('<option value="'+response.data.regions[i].id+'">'+response.data.regions[i].title+'</option>')
                }
            } else {
                window.alert('Ошибка: ' + response.error);
            }
        })
    });
    $('#unit-select-region').change(function () {
        $.getJSON('/get_cities&json=1&id=' + $('#unit-select-region').val(), function (response) {
            if (response.status == 'ok') {
                $('#unit-select-city').empty();
                for (var i in response.data.cities) {
                    $('#unit-select-city').append('<option value="'+response.data.cities[i].id+'">'+response.data.cities[i].title+'</option>')
                }
            } else {
                window.alert('Ошибка: ' + response.error);
            }
        })
    });
    $('input[name=title]').change(function () {
        $(this).attr('data-changed', 1);
    });
    $('#unit-select-type').change(function () {
        if ($('input[name=title]').attr('data-changed') == '0') {
            $('input[name=title]').val($('#unit-select-type :selected').text());
        }
    });
}

function unit_page() {
    $('.do-add-supply').click(function () {
        var td = $(this).closest('td');
        var line = $(this).closest('tr');
        $.get('/add_supply', function (data) {
            td.append('<tr><td colspan="4">'+data+'</td></tr>');
        });
    });
    $('.category-item').click(function () {
        $.post('/add_supply', {'step': 2, 'category_id': $(this).attr('data-id') }, function (data) {
            td.append('<tr><td colspan="4">'+data+'</td></tr>');
        });
    });
}

$(document).on('click', '.delete-confirm', function (e) {
    if (!window.confirm('Вы уверены что хотите удалить?')) {
        e.preventDefault();
        return false;
    }
});
$(document).on('click', '.confirm-message', function (e) {
    e.preventDefault();
    var text = $(e.currentTarget).attr('data-confirm');
    if (window.confirm(text)) {
        window.location.href = $(e.currentTarget).attr('href') + '&confirm=1';
    }
    return false;
});
$(document).on('submit', '.confirm-form', function (e) {
    var text = $(e.currentTarget).attr('data-confirm');
    if (window.confirm(text)) {
        return true;
    } else {
        e.preventDefault();
        return false;
    }
});
$(document).ready(function (e) {
    $('.show-tooltip').tooltip();
    if ($('#create-company-form').length) {
        create_company_page();
    }
    if ($('#create-unit-form').length) {
        create_unit_page();
    }
    if ($('#unit-form').length) {
        unit_page();
    }
});