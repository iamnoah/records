if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});

		$('select.many-to-one').grailsAutocomplete();

		$('.datePicker').find('.dateEntry').datepicker({
			onClose: function(str,date) {
				var picker = $(this).closest('.datePicker');
				picker.find('[name$="_day"] option[value="'+date.selectedDay+'"]').attr('selected','selected');
				picker.find('[name$="_month"] option[value="'+(date.selectedMonth + 1)+'"]').attr('selected','selected');
				picker.find('[name$="_year"] option[value="'+date.selectedYear +'"]').attr('selected','selected');
			}
		});
	})(jQuery);

}
