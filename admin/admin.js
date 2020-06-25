$(document).on('click', '.edit-category-line', function (e) {
    var line = $(e.currentTarget).closest('.data-row');
    var text = line.find('.category-title-cell').text();
    line.find('.category-title-cell').html('<input type="text" name="title" value="' + text +'">');
    line.find('.category-icon-cell').html('<input type="file" name="icon">');
    $(e.currentTarget).removeClass('edit-category-line').addClass('save-line').text('Сохранить');
});

$(document).on('click', '.edit-country-line', function (e) {
    var line = $(e.currentTarget).closest('.data-row');
    var text = line.find('.country-title-cell').text();
    line.find('.country-title-cell').html('<input type="text" name="title" value="' + text +'">');
    $(e.currentTarget).removeClass('edit-country-line').addClass('save-line').text('Сохранить');
});
$(document).on('click', '.edit-region-line', function (e) {
    var line = $(e.currentTarget).closest('.data-row');
    var title = line.find('.region-title-cell').text();
    line.find('.region-title-cell').html('<input type="text" name="title" value="' + title +'">');
    var country_title = line.find('.region-country-cell').text();
    line.find('.region-country-cell').empty();
    var select = $('.region-country-cell select:last').clone();
    select.find('option').each(function () {
        if ($(this).text() == country_title) {
            $(this).attr('selected', 'selected');
        } else {
            $(this).removeAttr('selected');
        }
    });
    line.find('.region-country-cell').append(select);
    $(e.currentTarget).removeClass('edit-region-line').addClass('save-line').text('Сохранить');
});

$(document).on('change', '.city-country-cell select[name=country_id]', function (e) {
    var country_id = $(e.currentTarget).val();
    var line = $(e.currentTarget).closest('.data-row');
    line.find('.city-region-cell select').empty();
    for (var i in countries[country_id]) {
        line.find('.city-region-cell select').append('<option value="' + i + '">' + countries[country_id][i] + '</option>');
    }
});
$(document).on('click', '.edit-city-line', function (e) {
    var line = $(e.currentTarget).closest('.data-row');
    var title = line.find('.city-title-cell').text();
    line.find('.city-title-cell').html('<input type="text" name="title" value="' + title +'">');

    var country_title = line.find('.city-country-cell').text();
    var country_id = 0;
    line.find('.city-country-cell').empty();
    var select = $('.city-country-cell select:last').clone();
    select.find('option').each(function () {
        if ($(this).text() == country_title) {
            $(this).attr('selected', 'selected');
            country_id = $(this).val();
        } else {
            $(this).removeAttr('selected');
        }
    });
    line.find('.city-country-cell').append(select);

    var region_title = line.find('.city-region-cell').text();
    line.find('.city-region-cell').empty();
    line.find('.city-region-cell').append('<select name="region_id"></select>');
    for (var i in countries[country_id]) {
        line.find('.city-region-cell select').append('<option value="' + i + '">' + countries[country_id][i] + '</option>');
        if (countries[country_id][i] == region_title) {
            line.find('.city-region-cell select option:last').attr('selected', 'selected');
        }
    }

    $(e.currentTarget).removeClass('edit-city-line').addClass('save-line').text('Сохранить');
});
$(document).on('click', '.edit-forum-section-line', function (e) {
    var line = $(e.currentTarget).closest('.data-row');
    var text = line.find('.forum-section-title-cell').text();
    line.find('.forum-section-title-cell').html('<input type="text" name="title" maxlength="100" value="' + text +'">');
    text = line.find('.forum-section-description-cell').text();
    line.find('.forum-section-description-cell').html('<textarea name="description" maxlength="255">' + text +'</textarea>');
    $(e.currentTarget).removeClass('edit-forum-section-line').addClass('save-line').text('Сохранить');
});
$(document).on('click', '.edit-forum-group-line', function (e) {
    var line = $(e.currentTarget).closest('.data-row');
    var text = line.find('.forum-group-title-cell').text();
    line.find('.forum-group-title-cell').html('<input type="text" name="title" maxlength="50" value="' + text +'">');
    $(e.currentTarget).removeClass('edit-forum-group-line').addClass('save-line').text('Сохранить');
});
$(document).on('click', '.edit-forum-branch-line', function (e) {
    var line = $(e.currentTarget).closest('.data-row');
    var title = line.find('.forum-branch-title-cell').text();
    line.find('.forum-branch-title-cell').html('<input type="text" name="title" value="' + title +'">');
    var title = line.find('.forum-branch-section-cell').text();
    line.find('.forum-branch-section-cell').empty();
    var select = $('.forum-branch-section-cell select:last').clone();
    select.find('option').each(function () {
        if ($(this).text() == title) {
            $(this).attr('selected', 'selected');
        } else {
            $(this).removeAttr('selected');
        }
    });
    line.find('.forum-branch-section-cell').append(select);
    line.find('.forum-branch-icon-cell').html('<input type="file" name="icon">');
    $(e.currentTarget).removeClass('edit-forum-branch-line').addClass('save-line').text('Сохранить');
});
$(document).on('click', '.save-line', function (e) {
    var form = $(e.currentTarget).closest('form');
    form.submit();
});
$(document).ready(function () {
    $('#log-status').change(function () {
        window.location.href = 'index.php?method=log&type=' +  $('#log-status').val();
    });
    $('#user-add-group').click(function () {
        var form = $('#user-add-group').closest('form');
        var href = form.attr('action') + '&action=addgroup&id=' + form.find('input[name=id]').val() + '&gid=' + $('#add-group').val();
        window.location.href = href;
    });
    $('#block-user').click(function () {
        if ($('#block-user').prop('checked')) {
            $('input[name="block"]').show();
        } else {
            $('input[name="block"]').val('');
            $('input[name="block"]').hide();
        }
    });
    $('.log-message-cell').tooltipster({theme: 'tooltipster-shadow'});
    $('.user-money-cell').tooltipster({theme: 'tooltipster-shadow'});
    $('.show-tooltip').tooltipster({theme: 'tooltipster-shadow'});
});