function showModalMessage(message, callback) {

    $('#alertModalMessage').text(message);
    $('#alertModal').modal('show');

    $('#alertModalConfirm').off('click').on('click', function () {
        if (typeof callback === 'function') {
            callback();
        } else {
            $('#alertModal').modal('hide');
        }
    });
}