
$(document).ready(function () {
    $('.get-district').on('change', function (e) {
        e.preventDefault();
        var btn = $(this);
        var id = $(this).data('id');
        $.ajax({
            url: '/House/GetAreaJson',
            data: { id: id },
            dataType: 'json',
            type: 'POST',

        }).done(function (result) {
            console.log(result);
        });
    });
});