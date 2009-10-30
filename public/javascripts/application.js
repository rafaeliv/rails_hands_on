var HTMLAsyncRequestOptions = {
	onFailure: function(xhr){ alert('kk');},
	onSuccess: function(responseTree){ 
		$('content').setProperty('html',responseTree);
		enableAsyncForms();
		enableFocus();
	}
}

var enableAsyncForms = function(){
	$$('form.async').each(function(form){
		var submit = form.getElement('input[type=submit]');
		form.set('send', HTMLAsyncRequestOptions);
		submit.addEvent('click', function(){
			this.getParent('form').send();
		});
	});
};


window.addEvent('domready',function(){

	enableAsyncForms();

	var search = $('search');

		// Our instance for the element with id "demo-word"
		new Autocompleter.Request.JSON(search, '/contacts.json', {
			'indicatorClass': 'autocompleter-loading',
			'ajaxOptions': {
				method: 'get'
			}
		});

	
});


