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
});