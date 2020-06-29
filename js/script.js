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
    function open_select_buider() {
        $.post('/select_builder', {'city_id': $('#unit-select-city').val(), 'unit_type': $('#unit-select-type').val()}, function (data) {
            $('#builder-window').html(data);
        });
    }

    $('#unit-select-country').change(function () {
        $.getJSON('/get_regions&json=1&id=' + $('#unit-select-country').val(), function (response) {
            if (response.status == 'ok') {
                $('#unit-select-city').empty();
                for (var i in response.data.regions) {
                    $('#unit-select-region').append('<option value="'+response.data.regions[i].id+'">'+response.data.regions[i].title+'</option>')
                }
                $('#unit-select-region').change();
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
                $('#unit-select-city').change();
            } else {
                window.alert('Ошибка: ' + response.error);
            }
        })
    });
    $('#unit-select-city').change(function () {
        open_select_buider();
    });
    $('input[name=title]').change(function () {
        $(this).attr('data-changed', 1);
    });
    $('#unit-select-type').change(function () {
        if ($('input[name=title]').attr('data-changed') == '0') {
            $('input[name=title]').val($('#unit-select-type :selected').text());
        }
        open_select_buider();
    });
    open_select_buider();
}

function unit_page() {
    $(document).on('click', '.do-add-supply-product', function (e) {
        $.post('/add_supply', {'unit_id': unit_id},function (data) {
            $('#dialog-window').html(data);
            $('#dialog-window').show();
        });
    });
    $(document).on('click', '.category-item', function (e) {
        $.post('/add_supply', {'step': 2, 'category_id': $(e.currentTarget).attr('data-id') }, function (data) {
            $('#dialog-window').html(data);
            $('#dialog-window').show();
        });
    });
    $(document).on('click', '.product-type-item', function (e) {
        $.post('/add_supply', {'step': 3, 'type_id': $(e.currentTarget).attr('data-id'), 'unit_id': unit_id }, function (data) {
            $('#dialog-window').html(data);
            $('#dialog-window').show();
        });
    });
    $(document).on('click', '.do-add-supply', function (e) {
        $.post('/add_supply', {'step': 3, 'type_id': $(e.currentTarget).attr('data-id'), 'unit_id': unit_id }, function (data) {
            $('#dialog-window').html(data);
            $('#dialog-window').show();
        });
    });
    $(document).on('click', '.select-supplier', function (e) {
        var amount = parseInt($(e.currentTarget).closest('tr').find('.select-supply-count').val());
        if (amount < 1) {
            window.alert('Введите количество');
        }
        var vars = {'step': 4,
            'type_id': $(e.currentTarget).closest('.add-supply-form').attr('data-type-id'),
            'unit_id': unit_id,
            'supplier_unit': $(e.currentTarget).closest('tr').attr('data-id'),
            'amount': amount
        };
        $.post('/add_supply&json=1', vars, function (data) {
            var response = $.parseJSON(data);
            if (response.status == 'ok') {
                window.location.reload();
            } else {
                window.alert('Ошибка: ' + response.error);
            }
        });
    });
    $(document).on('click', '.do-unload', function (e) {
        var amount;
        if ($(e.currentTarget).closest('tr').find('.select-supply-count').length) {
            amount = parseInt($(e.currentTarget).closest('tr').find('.select-supply-count').val());
        } else {
            amount = parseInt($('.select-supply-count').val());
        }
        if (amount < 1) {
            window.alert('Введите количество');
        }
        $.post('/storage_unload',
            {'step': 1, 'type_id': $(e.currentTarget).attr('data-type-id'), 'unit_id': unit_id, 'amount': amount },
            function (data) {
            $('#dialog-window').html(data);
            $('#dialog-window').show();
        });
    });
    $(document).on('click', '.select-unit', function (e) {
        var vars = {'step': 2,
            'type_id': $(e.currentTarget).closest('.add-supply-form').attr('data-type-id'),
            'unit_id': unit_id,
            'storage_unit': $(e.currentTarget).attr('data-id'),
            'amount': $(e.currentTarget).closest('.add-supply-form').attr('data-amount'),
        };
        $.post('/storage_unload&json=1', vars, function (data) {
            response = $.parseJSON(data);
            if (response.status == 'ok') {
                window.location.reload();
            } else {
                window.alert('Ошибка: ' + response.error);
            }
        });
    });
    $(document).on('click', function (e) {
        if ($(e.target).closest('#dialog-window').length == 0) {
            $('#dialog-window').hide();
        }
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